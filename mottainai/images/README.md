# Mottainai and Environment Images

For build Freeradius Test Environment we use LXD images available through an LXD Simplestreams Server
that could be managed through [Mottainai](https://mottainaici.github.io/docs/) with different namespaces.

In particular, there is a specific namespace for every "product" (or type of image) where will be
available the daily/weekly images of the product.

In addition, there is a namespace that exposes all files required by Simplestreams Protocol.

So, to prepare LXD's Simplestreams endpoint is needed built all products and then the simplestreams
files. This can be done with the execution of the pipeline:

```bash
$# mottainai-cli pipeline create --yaml lxd-pipeline.yaml
```

or with these atomic operations respectively with build-tree at the end:

```bash
$# mottainai-cli create task --yaml sabayon-freeradius/task.yaml
$# mottainai-cli create task --yaml mysql-server/task.yaml
$# mottainai-cli create task --yaml build-tree.yaml
```

For detail about how `simplestreams-builder` tool works see
the [documentation](https://github.com/MottainaiCI/simplestreams-builder).

At the end of the built process it's needed configure your remote node through `lxc`:

```bash
$# lxc remote add freeradius \
		https://your-node/public/namespaces/lxd-freeradius-images \
		--protocol simplestreams --accept-certificate
```

Available images will be then available for fetching:

```bash
$ lxc image list freeradius:
+---------------------------------+--------------+--------+-------------------------------------------------------+--------+----------+-------------------------------+
|              ALIAS              | FINGERPRINT  | PUBLIC |                      DESCRIPTION                      |  ARCH  |   SIZE   |          UPLOAD DATE          |
+---------------------------------+--------------+--------+-------------------------------------------------------+--------+----------+-------------------------------+
| freeadius/mysql-server (1 more) | 91583efff19b | yes    | Oracle Linux MySQL 8 Community amd64 (20190521_13:43) | x86_64 | 837.82MB | May 21, 2019 at 12:00am (UTC) |
+---------------------------------+--------------+--------+-------------------------------------------------------+--------+----------+-------------------------------+
| sabayon/freeradius (3 more)     | af7d04012089 | yes    | Sabayon FreeRadius v3.0.x amd64 (20190526_15:49)      | x86_64 | 812.74MB | May 26, 2019 at 12:00am (UTC) |
+---------------------------------+--------------+--------+-------------------------------------------------------+--------+----------+-------------------------------+

```
