SET password='{{ mysql_root_pwd }}' ;
SELECT 'Updated root password correctly!';
CREATE USER `{{ mysql_cluster_user }}` IDENTIFIED BY '{{ mysql_cluster_user_pwd }}' ;
GRANT ALL PRIVILEGES on *.* TO `{{ mysql_cluster_user }}`@'%' WITH GRANT OPTION ;
SELECT 'Create cluster admin user {{ mysql_cluster_user }} correctly!';
RESET master;
