cluster=dba.createCluster('{{ mysql_cluster_name }}',
  { memberSslMode: '{{ mysql_cluster_ssl_mode }}'});
print(cluster.status());
{% for node in mysql_nodes %}
{% if node != mysql_nodes[0] %}
cluster.addInstance('{{ mysql_cluster_user }}@{{ node }}.{{ lxd_network_domain }}:3306', {
  password: '{{ mysql_cluster_user_pwd }}'
});
{% endif %}
{% endfor %}
print(cluster.status());
