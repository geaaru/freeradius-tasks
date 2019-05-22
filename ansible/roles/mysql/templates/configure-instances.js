{% for node in mysql_nodes %}
dba.configureInstance('{{ mysql_cluster_user }}@{{ node }}.{{ lxd_network_domain }}:3306', {
  password: '{{ mysql_cluster_user_pwd }}',
  clusterAdmin: '{{ mysql_cluster_user }}',
  clusterAdminPassword: '{{ mysql_cluster_user_pwd}}',
  interactive: false
});
{% endfor %}
