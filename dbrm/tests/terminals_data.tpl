{% for node in pam_radiusd_nodes %}
SELECT "Load NAS {{ node }}";
INSERT INTO nas (nasname, shortname, type, server, description)
  VALUES ('{{ node }}', '{{ node }}', 'terminal', '{{ node }}.{{ lxd_network_domain }}',
          'PAM service of the host {{ node }}.{{ lxd_network_domain }}');
{% endfor %}

SELECT "Create credential for user test";

INSERT INTO radcheck (username, attribute, op, value)
  VALUES ('test', 'Cleartext-Password', ':=', 'qwerty');

INSERT INTO radcheck (username, attribute, op, value)
  VALUES ('geaaru', 'Auth-Type', ':=', 'Accept');

