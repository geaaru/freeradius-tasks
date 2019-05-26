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
