#
# Author: Daniele Rondina, geaaur@sabayonlinux.org
# Project: Test Server
#

# Clients for flows:
clients all_nas {

{% for node in freeradius_clients %}
  client {{ node.split('.') | first }}_client {
    ipaddr = {{ node }}
    secret = "{{ freeradius_secret }}"
    virtual_server = test_server
  }

{% endfor %}

# Temporary
  client mytest {
    ipaddr = 192.168.21.1
    secret = "qwe123"
    virtual_server = test_server
  }

}

# vim: filetype=config
