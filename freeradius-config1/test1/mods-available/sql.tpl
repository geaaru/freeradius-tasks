## Author: Daniele Rondina, geaaru@sabayonlinux.org

{% for node in mysql_router_nodes %}

sql sql{{ loop.index }} {

  driver = "rlm_sql_mysql"
  dialect = "mysql"

  login = "{{ mysql_freeradius_user }}"
  password = "{{ mysql_freeradius_pwd }}"
  radius_db = "{{ mysql_freeradius_database }}"

  server = "{{ node }}.{{ lxd_network_domain }}"
  port = 6446

  # Remove stale session if checkrad does not see a double login
  delete_stale_sessions = no

  # Radius Tables
  authcheck_table = "radcheck"
  authreply_table = "radreply"
  usergroup_table = "radusergroup"
  groupcheck_table = "radgroupcheck"
  groupreply_table = "radgroupreply"
  acct_table1 = "radacct"
  acct_table2 = "radacct"
  client_table = "nas"
  postauth_table = "radpostauth"

  #group_attribute = "SQL-Group"
  group_attribute = "${.:instance}-SQL-Group"

  # Configure connection pool
  pool {
    # Number of connections to start
    start = 5

    # Minimum number of connections to keep open
    min = 1

    # Maximum number of connections
    max = ${thread[pool].max_servers}

    # Spare connections to be left idle
    spare = 3

    # Number of uses before the connection is closed
    uses = 0

    # The lifetime (in seconds) of the connection
    lifetime = 60

    # idle timeout (in seconds).  A connection which is
    # unused for this length of time will be closed.
    idle_timeout = 10

    # The number of seconds to wait after the server tries
    # to open a connection, and fails.  During this time,
    # no new connections will be opened.
    retry_delay = 1
  }

  # read_clients = no

  # Read database-specific queries
  $INCLUDE ${modconfdir}/sql/main/${dialect}/queries.conf
}

{% endfor %}

# vim: filetype=conf
