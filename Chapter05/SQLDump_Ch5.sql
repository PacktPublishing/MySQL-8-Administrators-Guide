-- EXECUTE before connecting to MySQL 8
mysqld --help
Mysqld –verbose --help


--After connecting to MySQL 8.
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;
SELECT * FROM mysql.component;
SELECT * FROM information_schema.PLUGINS;
SHOW PLUGINS;
CREATE ROLE hrdepatment;
grant all on hr_employee to hrdepatment;
show character set;
SHOW COLLATION WHERE Charset = 'ascii';
CREATE TABLE employee (
  firstname CHAR(10) CHARACTER SET latin1,
  lastname CHAR(10) CHARACTER SET ascii
);

INSERT INTO employee VALUES ('Mona',' Singh');
select concat(firstname,lastname) from employee;
SET lc_messages = 'fr_FR';
SET GLOBAL time_zone = timezone;
SET time_zone = timezone;
SET NAMES 'utf8';
SELECT @@lc_time_names;
SELECT DAYNAME('2010-01-01'), MONTHNAME('2010-01-01');
SELECT DATE_FORMAT('2010-01-01','%W %a %M %b');
SET lc_time_names = 'nl_NL';
SELECT @@lc_time_names;
SELECT DAYNAME('2010-01-01'), MONTHNAME('2010-01-01');
SELECT DATE_FORMAT('2010-01-01','%W %a %M %b');
SHOW CREATE TABLE mysql.general_log;
SHOW CREATE TABLE mysql.slow_log;
SET GLOBAL general_log = 'OFF';

SET GLOBAL binlog_format = 'STATEMENT';
SET SESSION binlog_format = 'STATEMENT';
SET GLOBAL general_log = 'OFF';
SET GLOBAL general_log = 'ON';