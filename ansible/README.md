# Ansible Roles for FreeRadius's Automation and Test Suites

## Mission

Supply a simple way to build and test a FreeRadius Environment through LXD technology
through LXD images available from an LXD Simplestream Protocol Server (over HTTP).

The LXD environment used require that all nodes MUST be reachable and that their name
can be resolved by DNS. In the same manner, the node that executes playbooks could
resolve their DNS. This is possible with a local configuration of `dnsmasq` server
with customization that domain used is resolved with the DNS server of the LXD network.

LXD images are built with [Mottainai CD/CI](https://mottainaici.github.io/docs/) and
through [simplestreams-builder](https://github.com/MottainaiCI/simplestreams-builder) tool.

Example:

```
server=/geaaru.local/192.168.21.1
```

Currently, it's only supported *Mysql InnoDB Cluster* and the scenario doesn't expect
the use of FreeRadius Proxy as Frontend.

OS used:
  - [Sabayon](https://www.sabayon.org/): for FreeRadius nodes, Terminal nodes
    and for execute Playbooks. (It is used `geaaru` enman repository)
  - Oracle Linux: for MySQL and MySQL Router nodes.

MySQL Cluster is built with native authentication enable for permit connection from
old MySQL clients.

## Playbooks

There are three major playbooks:

  * *build.yaml*: this playbook is used to prepare the work environment and build the
    needed containers.

  * *stop.yml*: this playbook is used to stop/destroy the work environment

  * *prepare_test.yml*: this playbook is used for initializing of the Freeradius Database
    with all data needed for testing.

All playbook are based to configuration options supply through `localhost` variables.

I used only localhost because through LXD you could configure a remote LXD Server directly
and use it from localhost through LXD REST API.


Correct installation of the [dbrm](http://geaaru.github.io/database-release-manager/mariadb.html)
module is required on the node that execute playbooks.

### Configuration

Hereinafter the list of configuration options:

| Parameter | Example | Description |
|-----------|---------|-------------|
| lxd_target_server | local | Identify the LXD instance to use. |
| ephemeral_container | yes | If use ephemeral container or not |
| freeradius_lxd_profiles | - | Supply the list of LXD profiles to use for FreeRadius nodes |
| freeradius_nodes | - | List of nodes Freeradius that we want create on Environment. From 1 to N. |
| freeradius_clients | - | List of NAS Client to configure on FreeRadius nodes. |
| freeradius_secret | - | Radius secret to use. Now it's supported only one secret for all clients. |
| pam_radiusd_nodes | - | List of nodes to configure with `pam_radiusd` for test terminal access with Radius AAA |
| pam_radiusd_opts | debug try_first_pass | Options to define on Pam configuration files. |
| pam_radiusd_timeout | 6 | Radius timeout to configure for Pam authentication |
| mysql_nodes | - | List of MySQL InnoDB Server to create. From 1 to N. |
| mysql_router_nodes | - | List of MySQL Router nodes to create. From 1 to N. |
| mysql_lxd_profiles | - | List of LXD profiles used for MySQL and MySQL Router nodes. |
| lxd_network_domain | geaaru.local | Domain configured on LXD network. |
| lxd_image_server | - | LXD Simplestream Server where fetch images |
| freeradius_lxd-image | sabayon/freeradius | The LXD image to use for FreeRadius nodes. |
| mysql_server_lxd_image | freeradius/mysql-server | The LXD image to use for MySQL nodes. |
| staging_dir | /tmp/freeradius-tasks/ | Staging directory where create files pushed to nodes. |
| mysql_root_pwd | - | MySQL root password configured in every nodes. |
| mysql_cluster_user | clusteradmin | Mysql user to use for Cluster |
| mysql_cluster_user_pwd | - | Cluster Admin user password |
| mysql_cluster_name | freeradiusCluster | Name of the MySQL Cluster |
| mysql_cluster_ssl_mode | REQUIRED | Option to use for SSL mode of the MySQL Cluster |
| mysql_freeradius_database | freeradius | Name of the database used by FreeRadius nodes. |
| mysql_freeradius_user | freeradius | Database user of the FreeRadius database. |
| mysql_use_native_password | True | Enable native password authentication on MySQL Cluster. For Gentoo/Sabayon is required currently. |
| freeradius_config_dir | ../freeradius_config1 | Directory with FreeRadius configuration to install in every FreeRadius node. |
| freeradius_opts | -Xx | (optional) Additional options to configure on FreeRadius nodes for radiusd. |
| freeradius_instance_name | test1 | Name of the FreeRadius instance to use. |
| dbrm_config_dir | ../dbrm | Directory of dbrm to use for database operations. |
| dbrm_path | /usr/bin/dbrm | Path where found *dbrm* tool. |

#### Examples

Configure three MySQL InnoDB Server for the Cluster:

```yaml
# Define list of nodes of the MySQL Cluster and their name
mysql_nodes:
  - mysql1
  - mysql2
  - mysql3
```

Configure only one MySQL Router:

```yaml
# Define list of nodes of the MySQL Router
mysql_router_nodes:
  - mrouter1
```

Configure two FreeRadius nodes:

```yaml
# Define list of nodes of Freeradius and their name
freeradius_nodes:
  - radius1
  - radius2
```

From LXD what you see after *build.yml* playbook:

```bash
$# lxc list
+-----------------------+---------+-----------------------+-----------------------------------------------+------------+-----------+
|         NAME          |  STATE  |         IPV4          |                     IPV6                      |    TYPE    | SNAPSHOTS |
+-----------------------+---------+-----------------------+-----------------------------------------------+------------+-----------+
| mrouter1              | RUNNING | 192.168.21.233 (eth0) | fd42:9147:ad1a:bc0b:216:3eff:fecb:db08 (eth0) | EPHEMERAL  |           |
+-----------------------+---------+-----------------------+-----------------------------------------------+------------+-----------+
| mysql1                | RUNNING | 192.168.21.229 (eth0) | fd42:9147:ad1a:bc0b:216:3eff:fe39:270e (eth0) | EPHEMERAL  |           |
+-----------------------+---------+-----------------------+-----------------------------------------------+------------+-----------+
| mysql2                | RUNNING | 192.168.21.82 (eth0)  | fd42:9147:ad1a:bc0b:216:3eff:fe4f:8769 (eth0) | EPHEMERAL  |           |
+-----------------------+---------+-----------------------+-----------------------------------------------+------------+-----------+
| mysql3                | RUNNING | 192.168.21.225 (eth0) | fd42:9147:ad1a:bc0b:216:3eff:fe9d:59ce (eth0) | EPHEMERAL  |           |
+-----------------------+---------+-----------------------+-----------------------------------------------+------------+-----------+
| radius1               | RUNNING | 192.168.21.29 (eth0)  | fd42:9147:ad1a:bc0b:216:3eff:fe75:190d (eth0) | EPHEMERAL  |           |
+-----------------------+---------+-----------------------+-----------------------------------------------+------------+-----------+
| radius2               | RUNNING | 192.168.21.145 (eth0) | fd42:9147:ad1a:bc0b:216:3eff:fe84:67c1 (eth0) | EPHEMERAL  |           |
+-----------------------+---------+-----------------------+-----------------------------------------------+------------+-----------+
| terminal-radius1      | RUNNING | 192.168.21.60 (eth0)  | fd42:9147:ad1a:bc0b:216:3eff:fe2b:2d0f (eth0) | EPHEMERAL  |           |
+-----------------------+---------+-----------------------+-----------------------------------------------+------------+-----------+
```

## Build Environment

For build Environment:

```bash
$# ANSIBLE_STDOUT_CALLBACK=debug ansible-playbook build.yml
```

or for to exclude MySQL Cluster build and Terminal Nodes:

```bash
$# ANSIBLE_STDOUT_CALLBACK=debug ansible-playbook build.yml --skip-tags initialize_freeradius_db,build_mysql_nodes,build_terminal_nodes
```

## Initialize FreeRadius database with tests data and execute test suites

```bash
$# ANSIBLE_STDOUT_CALLBACK=debug ansible-playbook prepare_test.yml
$# # Run tests
$# ANSIBLE_STDOUT_CALLBACK=debug ansible-playbook execute_test.yml
```

## Destroy/Stop Environment

For destroy environment.

```bash
$# ANSIBLE_STDOUT_CALLBACK=debug ansible-playbook stop.yml
```

