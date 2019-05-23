CREATE DATABASE {{ mysql_freeradius_database }};
SELECT "Created Database {{ mysql_freeradius_database }} correctly";
CREATE USER `{{ mysql_freeradius_user }}`
IDENTIFIED {% if mysql_use_native_password == True %} WITH mysql_native_password {% endif %}
BY '{{ mysql_freeradius_pwd}}' ;
GRANT ALL PRIVILEGES on {{ mysql_freeradius_database }}.* TO `{{ mysql_freeradius_user }}`@'%' WITH GRANT OPTION;
SELECT "Create user {{ mysql_freeradius_user }} correctly!";
