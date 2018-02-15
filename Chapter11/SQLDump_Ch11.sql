
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'user1_password';
GRANT ALL PRIVILEGES ON *.* TO 'user1'@'localhost' WITH GRANT OPTION;

CREATE USER ‘user2’@'%' IDENTIFIED BY 'user2_password';
GRANT ALL PRIVILEGES ON *.* TO ‘user2’@'%' WITH GRANT OPTION;

CREATE USER ‘adminuser’@'localhost' IDENTIFIED BY 'password';
GRANT RELOAD,PROCESS ON *.* TO ‘adminuser’@'localhost';

CREATE USER 'tempuser'@'localhost';

CREATE USER 'user4'@'host4.mycompany.com' IDENTIFIED BY 'password';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP ON db1.* TO 'user4'@'host4. mycompany.com';


DROP USER 'user1'@'localhost';

SET ROLE NONE; SELECT CURRENT_ROLE();

SET ROLE 'developer_read'; SELECT CURRENT_ROLE();

CREATE ROLE ‘developer_role';

DROP ROLE ‘developer_role';
GRANT ALL ON my_db.* TO 'developer_role';
GRANT 'developer_role' TO 'developer1'@'localhost';
CREATE USER 'user1';
CREATE ROLE 'role1';
GRANT SELECT ON mydb.* TO 'user1';
GRANT SELECT ON mydb.* TO 'role1';
CREATE USER 'user2';
CREATE ROLE 'role2';
GRANT 'user1', 'role1'TO 'user2';
GRANT 'user1', 'role1'TO 'role2';
REVOKE developer_role FROM user1;
REVOKE INSERT, UPDATE ON app_db.* FROM ‘role1’;
SET DEFAULT ROLE app_developer TO root@localhost;	
SELECT CURRENT_ROLE();
show grants for app_developer;
show grants for root@localhost;
SET PERSIST mandatory_roles = 'app_developer’;
ALTER USER 'testuser'@'localhost' PASSWORD EXPIRE;
SET PERSIST default_password_lifetime = 180;

CREATE USER 'testsha256user'@'localhost'
IDENTIFIED WITH sha256_password BY 'userpassword';
UNINSTALL PLUGIN mysql_no_login;
INSTALL PLUGIN CONNECTION_CONTROL SONAME 'connection_control.so';
INSTALL PLUGIN CONNECTION_CONTROL_FAILED_LOGIN_ATTEMPTS SONAME 'connection_control.so';
INSTALL PLUGIN validate_password SONAME 'validate_password.so';
INSTALL PLUGIN keyring_file SONAME ‘keyring_file.so’;