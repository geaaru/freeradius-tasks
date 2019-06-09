# Automations for FreeRadius services

## Mission

Supply a simple way to build and test a FreeRadius Environment through LXD technology
and through LXD images available from an LXD Simplestream Protocol Server (over HTTP).

LXD images are built with [Mottainai CD/CI](https://mottainaici.github.io/docs/) and
through [simplestreams-builder](https://github.com/MottainaiCI/simplestreams-builder) tool.

The LXD environment used require that all nodes MUST be reachable and that their name
can be resolved by DNS. In the same manner, the node that executes playbooks could
resolve their DNS. This is possible with a local configuration of `dnsmasq` server
with customization that domain used is resolved with the DNS server of the LXD network.

Example:

```
server=/geaaru.local/192.168.21.1
```

Currently, it's only supported *Mysql InnoDB Cluster* and the scenario doesn't expect
the use of FreeRadius Proxy as Frontend but directly Backend Freeradius eventually
under a VIP/Balancer (HA Proxy/Appliance/ipvs/etc.).

OS used:
  - [Sabayon](https://www.sabayon.org/): for FreeRadius nodes, Terminal nodes
    and for execute Playbooks. (It is used `geaaru` enman repository)
  - Oracle Linux: for MySQL and MySQL Router nodes.

MySQL Cluster is built with native authentication enable for permit connection from
old MySQL clients.

## Technologies

For image preparation is used [Mottainai](https://mottainaici.github.io/docs/) and details
are available [here](https://github.com/geaaru/freeradius-tasks/tree/master/mottainai/images).

For automation is used [Ansible](https://www.ansible.com/) and the detail are available
[here](https://github.com/geaaru/freeradius-tasks/tree/master/ansible).

For database initialization and for simplify management of the database upgrade it'is used
[dbrm](https://github.com/geaaru/database-release-manager).

## Use Cases

 * [Example1](https://github.com/geaaru/freeradius-tasks/tree/master/freeradius-config1)
