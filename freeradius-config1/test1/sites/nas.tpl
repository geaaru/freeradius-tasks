#
# Author: Daniele Rondina, geaaur@sabayonlinux.org
# Project: Test Server
#

# Clients for flows:
clients all_nas {

{% for node in freeradius_clients %}
  client {{ node.node.split('.') | first }}_client {
{% if node.ipaddr | default(false) %}
    ipaddr = {{ node.ipaddr }}
{% else %}
    ipaddr = {{ node.node }}
{% endif %}
    secret = "{{ freeradius_secret }}"
    virtual_server = "{{ node.virtual_server }}"
  }
{% endfor %}

}

# vim: filetype=config
