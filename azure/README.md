# Azure Scalar DL Example
This example will deploy a simple Scalar DL environment in the Japaneast region with your Azure account. If you want to use another region or store the tfstate on Azure you need to update `backend.tf`, `examples.tfvars` and `remote.tf` of each module.

* This document is for internal use of Scalar DL Terraform modules for Azure. If you are interested in the modules please take a look at [here](https://github.com/scalar-labs/scalar-terraform/tree/master/modules/azure)

## Prerequisites
* Terraform >= 0.14.x
* Ansible >= 2.8.x
* Azure CLI
* ssh-agent with private key

## What is created
* An Azure VPC with Resource Group
* DNS Zone for internal host lookup
* 3 Scalar DL instances
* With Cassandra option (default):
  * 3 Cassandra instances
  * 1 Cassy instance
  * 1 Reaper instance
* With Cosmos DB option:
  * 1 Cosmos DB account
* 3 Envoy instances with a network load balancer (public)
* 1 Bastion instance with a public IP
* 1 Monitor instance

## How to deploy

### Configure an Azure credential

```console
$ az login
```

### Create network resources

First you need to choose what database you use as a backend. This example supports two options: Cassandra and Cosmos DB.

If you choose Cosmos DB, please update `azure/network/example.tfvars` before creating network resources.
This enables Cosmos DB endpoints in the subnets where Scalar DL will be deployed to.

```terraform
use_cosmosdb = true
```

Then, follow the steps below.

```console
$ cd azure/network

# Generate a test key-pair
$ ssh-keygen -b 2048 -t rsa -f ./example_key -q -N ""
$ chmod 400 example_key

# You need to pass the key to your ssh agent
# If needed start ssh-agent using: eval $(ssh-agent -s)
$ ssh-add example_key

# Optionally, you may want to create a file named `additional_public_keys` that contains multiple ssh public keys (one key per line) to allow other admins to access nodes created by the following `terraform apply`.
# the file should look like below
# cat azure/network/additional_public_keys
# ssh-rsa AAAAB3Nza..... admin1
# ssh-rsa...... admin2


# Create an environment
$ terraform init
$ terraform apply -var-file example.tfvars
```

### Create database resources

#### Cassandra

Before creating Cassandra resources with `terraform apply`, you probably need to configure for Cassy to manage backups of Cassandra data.

The first thing you need to do for Cassy is create a storage account in the same resource group as the network resource created in the previous section and create a blob type container in the storage account.

Then, update `example.tfvars` with the container URL as follows.

```
cassy = {
  storage_base_uri     = "https://yourstorageaccountname.blob.core.windows.net/your-container-name"
  storage_type         = "azure_blob"
}
```

If you don't need Cassy, you can disable it by setting its `resource_count` to zero.

```
cassy = {
  resource_count = 0
}
```

For more information on Cassy, please refer to [CassySetup](https://github.com/scalar-labs/scalar-terraform/blob/master/docs/CassySetup.md).

Now it's ready to run the terraform commands:

```console
$ cd azure/cassandra

$ terraform init
$ terraform apply -var-file example.tfvars
```

Please make sure to start all the Cassandra nodes since Cassandra doesn't start on the initial boot by default.

#### Cosmos DB

To create a Cosmos DB account on your Azure account, please run the following command. A Cosmos DB Account will be created in the resouce group created by the `network` module.

```console
$ cd azure/cosmosdb

$ terraform init
$ terraform apply
```

In the output of `terraform apply` command, you will see  `cosmosdb_account_endpoint` and `cosmosdb_account_primary_master_key`. Please take note of them since they are used to configure Scalar DL in the next section. 

### Create Scalar DL resources

Before running the terraform command to create Scalar DL resources, you need to prepare an environment file for the container configuration which will be loaded by `docker-compose`.
The default file name is `scalardl_container.env`. Please copy the example file to that name.

```console
$ cd azure/scalardl
$ cp example.scalardl_container.env scalardl_container.env
```

Then, update the contents of the file.

* Cassandra

    To use Cassandra, you can keep the contents as long as you use the default settings.

    ```
    SCALAR_DB_STORAGE=cassandra
    SCALAR_DB_CONTACT_POINTS=cassandra-lb.internal.scalar-labs.com
    SCALAR_DB_CONTACT_PORT=9042
    SCALAR_DB_USERNAME=cassandra
    SCALAR_DB_PASSWORD=cassandra
    ```

* Cosmos DB

    To use Cosmos DB, you should find the URL of the account endpoint and the master key in the output of the `cosmosdb` module. You can get them at any time by running `terraform output` in the `cosmosdb` directory. Please specify the endpoint URL as `SCALAR_DB_CONTACT_POINTS` and the master key as `SCALAR_DB_PASSWORD`.
    `SCALAR_DB_STORAGE` must be `cosmos`. `SCALAR_DB_CONTACT_PORT` and `SCALAR_DB_USERNAME` are not used for Cosmos DB, so you can leave them blank.

    ```
    SCALAR_DB_STORAGE=cosmos
    SCALAR_DB_CONTACT_POINTS=https://ym-test-0ezymxy-cosmosdb.documents.azure.com:443/
    SCALAR_DB_CONTACT_PORT=
    SCALAR_DB_USERNAME=
    SCALAR_DB_PASSWORD=2b7eqe50MjvFFVLIHWKg1AKOzZ1Eyzbx5DhiB33cySzwXYD1MZxF2PT1xyoqzkFKqLvbJ2FwyaaergJ1a0bwCw==
    ```

Now it's ready to run `terraform apply`.

```console
$ terraform init
$ terraform apply -var-file example.tfvars
```

### Create Monitor resources

```console
$ cd azure/monitor

$ terraform init
$ terraform apply -var-file example.tfvars
```

## Generate outputs
Terraform can output some useful information about your deployment such as a bastion public, internal ip addresses and ssh config that you can use to access instances. The ssh config assumes that the private key for an environment is added to your ssh agent.

### Network

```
$ terraform output
ssh_config = Host *
User centos
UserKnownHostsFile /dev/null
StrictHostKeyChecking no

Host bastion
HostName bastion-tei-azure-1rpvoeq.westus.cloudapp.azure.com
LocalForward 8000 monitor.internal.scalar-labs.com:80

Host *.internal.scalar-labs.com
ProxyCommand ssh -F ssh.cfg bastion -W %h:%p

bastion_ip = bastion-tei-azure-1rpvoeq.westus.cloudapp.azure.com
bastion_provision_id = 4163659894346351826
dns_zone_id = internal.scalar-labs.com
image_id = CentOS
internal_domain = internal.scalar-labs.com
location = West US
network_cidr = 10.42.0.0/16
network_id = /subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/tei-azure-1rpvoeq/providers/Microsoft.Network/virtualNetworks/tei-azure-1rpvoeq
network_name = tei-azure-1rpvoeq
private_key_path = /Users/tei/work/src/scalar/scalar-terraform-examples/azure/network/example_key
public_key_path = /Users/tei/work/src/scalar/scalar-terraform-examples/azure/network/example_key.pub
subnet_map = {
  "cassandra" = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/tei-azure-1rpvoeq/providers/Microsoft.Network/virtualNetworks/tei-azure-1rpvoeq/subnets/cassandra"
  "private" = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/tei-azure-1rpvoeq/providers/Microsoft.Network/virtualNetworks/tei-azure-1rpvoeq/subnets/private"
  "public" = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/tei-azure-1rpvoeq/providers/Microsoft.Network/virtualNetworks/tei-azure-1rpvoeq/subnets/public"
  "scalardl_blue" = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/tei-azure-1rpvoeq/providers/Microsoft.Network/virtualNetworks/tei-azure-1rpvoeq/subnets/scalardl_blue"
  "scalardl_green" = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/tei-azure-1rpvoeq/providers/Microsoft.Network/virtualNetworks/tei-azure-1rpvoeq/subnets/scalardl_green"
}
user_name = centos
```

### Cassandra

```
$ terraform output
cassandra_resource_count = 3
```

### Scalar DL

```
$ terraform output
scalardl_blue_resource_count = 3
scalardl_green_resource_count = 0
scalardl_replication_factor = 3
```

### Monitor
Note: No outputs.

## How to access instances

```console
# SSH with ssh-agent
$ ssh -A centos@13.231.179.116

# Generate SSH config to make it easy to access backend resources
$ terraform output "ssh_config" > ssh.cfg
$ ssh -F ssh.cfg cassandra-1.internal.scalar-labs.com
$ ssh -F ssh.cfg cassandra-2.internal.scalar-labs.com
$ ssh -F ssh.cfg cassandra-3.internal.scalar-labs.com

$ ssh -F ssh.cfg scalar-blue-1.internal.scalar-labs.com
$ ssh -F ssh.cfg scalar-blue-2.internal.scalar-labs.com
$ ssh -F ssh.cfg scalar-blue-3.internal.scalar-labs.com

$ ssh -F ssh.cfg cassy-1.internal.scalar-labs.com
$ ssh -F ssh.cfg reaper-1.internal.scalar-labs.com

$ ssh -F ssh.cfg envoy-1.internal.scalar-labs.com
$ ssh -F ssh.cfg envoy-2.internal.scalar-labs.com
$ ssh -F ssh.cfg envoy-3.internal.scalar-labs.com

$ ssh -F ssh.cfg monitor-1.internal.scalar-labs.com
```

## How to destroy

```console
# Make sure to do this after used !!!
$ terraform destroy --var-file example.tfvars
```

Note: Don't forget to `terraform destroy` to the environment you created after used.

Please check out [Scalar DL Getting Started](https://scalardl.readthedocs.io/en/latest/getting-started/) to understand how to interact with the environment.
