
-- To show list of Databases
mysqlshow;

--List down list of all table located under mysql DB
mysqlshow mysql;

-- To set new password for root user
ALTER USER 'root'@'localhost' IDENTIFIED BY 'newPassword';


-- Used for In-Palce upgradation to chage master key
ALTER INSTANCE ROTATE INNODB MASTER KEY;

--To set shut down paramters
SET GLOBAL innodb_fast_shutdown = 1; 

SET GLOBAL innodb_fast_shutdown = 0; 

-- After setting all parameters of upgradation execute this command
mysql_upgrade -u root -p;

-- Used to check Native Partioning
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE ENGINE NOT IN ('innodb', 'ndbcluster')
AND CREATE_OPTIONS LIKE '%partitioned%';

-- To chage storage engine
ALTER TABLE table_name ENGINE = INNODB;

--Remove partioning
ALTER TABLE table_name REMOVE PARTITIONING;

--Check foreign key constraint name doesn’t contains more than 64 characters
SELECT CONSTRAINT_SCHEMA, TABLE_NAME, CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
WHERE LENGTH(CONSTRAINT_NAME) > 64;


-- Requird to change tablespace in case of Downgrade
ALTER TABLE mysql.columns_priv TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.component TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.db TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.default_roles TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.engine_cost TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.func TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.general_log TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.global_grants TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.gtid_executed TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.help_category TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.help_keyword TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.help_relation TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.help_topic TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.innodb_index_stats TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.innodb_table_stats TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.plugin TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.procs_priv TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.proxies_priv TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.role_edges TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.server_cost TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.servers TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.slave_master_info TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.slave_relay_log_info TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.slave_worker_info TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.slow_log TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.tables_priv TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.time_zone TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.time_zone_leap_second TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.time_zone_name TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.time_zone_transition TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.time_zone_transition_type TABLESPACE=innodb_file_per_table; 
ALTER TABLE mysql.user TABLESPACE=innodb_file_per_table;

-- Change storage engine during Downgrading
ALTER TABLE mysql.columns_priv ENGINE='MyISAM' STATS_PERSISTENT=DEFAULT;

--Drop cloumn of the table, during downgrading
ALTER TABLE mysql.user drop Create_role_priv;
ALTER TABLE mysql.user drop Drop_role_priv;
