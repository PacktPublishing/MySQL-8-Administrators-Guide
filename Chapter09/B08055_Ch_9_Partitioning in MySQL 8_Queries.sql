-- sample table with partition example
CREATE TABLE tp (tp_id INT, amt DECIMAL(5,2), trx_date DATE)
    ENGINE=INNODB
    PARTITION BY HASH ( MONTH (trx_date) )
    PARTITIONS 4;

-- sample table without partition for example
CREATE TABLE employee (
    employee_id INT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hired_date DATE NOT NULL DEFAULT '1990-01-01',
    termination_date DATE NOT NULL DEFAULT '9999-12-31',
    job_code INT NOT NULL,
    store_id INT NOT NULL
);

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE employee (
    employee_id INT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hired_date DATE NOT NULL DEFAULT '1990-01-01',
    termination_date DATE NOT NULL DEFAULT '9999-12-31',
    job_code INT NOT NULL,
    store_id INT NOT NULL
)
PARTITION BY RANGE (store_id) (
    PARTITION p0 VALUES LESS THAN (6),
    PARTITION p1 VALUES LESS THAN (11),
    PARTITION p2 VALUES LESS THAN (16),
    PARTITION p3 VALUES LESS THAN (21),
    PARTITION p4 VALUES LESS THAN (26)
);

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE employee (
    employee_id INT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hired_date DATE NOT NULL DEFAULT '1990-01-01',
    termination_date DATE NOT NULL DEFAULT '9999-12-31',
    job_code INT NOT NULL,
    store_id INT NOT NULL
)
PARTITION BY RANGE (job_code) (
    PARTITION p0 VALUES LESS THAN (1000),
    PARTITION p1 VALUES LESS THAN (10000),
    PARTITION p2 VALUES LESS THAN (100000)
);

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE employee (
    employee_id INT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hired_date DATE NOT NULL DEFAULT '1990-01-01',
    termination_date DATE NOT NULL DEFAULT '9999-12-31',
    job_code INT NOT NULL,
    store_id INT NOT NULL
)
PARTITION BY RANGE (hired_date) (
    PARTITION p0 VALUES LESS THAN (1996),
    PARTITION p1 VALUES LESS THAN (2001),
    PARTITION p2 VALUES LESS THAN (2006),
    PARTITION p3 VALUES LESS THAN MAXVALUE
);

--sample table as example and executing drop table employee; required if the table with same name already exists.
CREATE TABLE employee (
    employee_id INT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hired_date DATE NOT NULL DEFAULT '1990-01-01',
    termination_date DATE NOT NULL DEFAULT '9999-12-31',
    job_code INT NOT NULL,
    store_id INT NOT NULL
);


--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE employee (
    employee_id INT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hired_date DATE NOT NULL DEFAULT '1990-01-01',
    termination_date DATE NOT NULL DEFAULT '9999-12-31',
    job_code INT NOT NULL,
    store_id INT NOT NULL
)
PARTITION BY LIST (store_id) (
    PARTITION pNorth VALUES IN (1,2,11,12,21,22),
    PARTITION pSouth VALUES IN (3,4,13,14,23,24),
    PARTITION pEast VALUES IN (5,6,15,16,25),
    PARTITION pWest VALUES IN (7,8,17,18),
    PARTITION pCentral VALUES IN (9,10,19,20)
);


--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE tpl (
    cl1 INT,
    cl2 INT
)
PARTITION BY LIST (cl1) (
    PARTITION p0 VALUES IN (1,3,4,5),
    PARTITION p1 VALUES IN (2,6,7,8)
);
-- insert statement that will give error - Table has no partition for value 9.
INSERT INTO tpl VALUES (9,5) ;
-- insert statement that will ignore the error and perform insertion with valid data
INSERT IGNORE INTO tpl VALUES (1,2), (3,4), (5,6), (7,8), (9,11);

-- PARTITION syntax reference
/*
CREATE TABLE table_name
PARTITION BY RANGE COLUMNS (column_list) (
    PARTITION partition_name VALUES LESS THAN (value_list) [,
    PARTITION partition_name VALUES LESS THAN (value_list) ] [,
...]
)
column_list:
    column_name[, column_name] [, ...]
value_list :
    value[, value][, ...]
*/


--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE trc (
    p INT,
    q INT,
    r CHAR(3),
    s INT
)
PARTITION BY RANGE COLUMNS (p,s,r) (
    PARTITION p0 VALUES LESS THAN (5,10,'ppp'),
    PARTITION p1 VALUES LESS THAN (10,20,'sss'),
    PARTITION p2 VALUES LESS THAN (15,30,'rrr'),
    PARTITION p3 VALUES LESS THAN (MAXVALUE,MAXVALUE,MAXVALUE)
);

-- insert statement for adding partition data.
INSERT INTO trc VALUES (5,9,'aaa',2) , (5,10,'bbb',4) , (5,12,'ccc',6) ;

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE customer_z (
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    street_1 VARCHAR(35),
    street_2 VARCHAR(35),
    city VARCHAR(15),
    renewal DATE
)
PARTITION BY LIST COLUMNS (city) (
    PARTITION pZone_1 VALUES IN ('Ahmedabad', 'Surat', 'Mumbai'),
    PARTITION pZone_2 VALUES IN ('Delhi', 'Gurgaon', 'Punjab'),
    PARTITION pZone_3 VALUES IN ('Kolkata', 'Mizoram', 'Hyderabad'),
    PARTITION pZone_4 VALUES IN ('Bangalore', 'Chennai', 'Kochi')

);


--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE employee (
    employee_id INT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hired_date DATE NOT NULL DEFAULT '1990-01-01',
    termination_date DATE NOT NULL DEFAULT '9999-12-31',
    job_code INT NOT NULL,
    store_id INT NOT NULL
)
PARTITION BY HASH (store_id)
PARTITIONS 4;

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE employee (
    employee_id INT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hired_date DATE NOT NULL DEFAULT '1990-01-01',
    termination_date DATE NOT NULL DEFAULT '9999-12-31',
    job_code INT NOT NULL,
    store_id INT NOT NULL
)
PARTITION BY LINEAR HASH ( YEAR(hired_date))
PARTITIONS 4;

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
--Key column is automatically selected as primary key column.
CREATE TABLE tk1 (
    tk1_id INT NOT NULL PRIMARY KEY,
    note VARCHAR(50)
)
PARTITION BY KEY ()
PARTITIONS 2;

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE tk2 (
    cl1 INT NOT NULL,
    cl2 CHAR(10),
    cl3 DATE
)
PARTITION BY LINEAR KEY (cl1)
PARTITIONS 3;

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE trs (trs_id INT, sold DATE)
PARTITION BY RANGE ( YEAR(sold) )
    SUBPARTITION BY HASH ( TO_DAYS(sold) )
    SUBPARTITIONS 2 (
        PARTITION p0 VALUES LESS THAN (1991),
        PARTITION p1 VALUES LESS THAN (2001),
        PARTITION p2 VALUES LESS THAN MAXVALUE
);

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
SET @@SQL_MODE = '';
CREATE TABLE employee (
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 first_name VARCHAR(25) NOT NULL,
 last_name VARCHAR(25) NOT NULL,
 store_id INT NOT NULL,
 department_id INT NOT NULL
) 
 PARTITION BY RANGE(id) (
 PARTITION p0 VALUES LESS THAN (5),
 PARTITION p1 VALUES LESS THAN (10),
 PARTITION p2 VALUES LESS THAN (15),
 PARTITION p3 VALUES LESS THAN MAXVALUE
);
--inserting records for sample data
INSERT INTO employee VALUES
 ('', 'Chintan', 'Mehta', 3, 2), ('', 'Bhumil', 'Raval', 1, 2),
 ('', 'Subhash', 'Shah', 3, 4), ('', 'Siva', 'Stark', 2, 4),
 ('', 'Chintan', 'Gajjar', 1, 1), ('', 'Mansi', 'Panchal', 2, 3),
 ('', 'Hetal', 'Oza', 2, 1), ('', 'Parag', 'Patel', 3, 1),
 ('', 'Pooja', 'Shah', 1, 3), ('', 'Samir', 'Bhatt', 2, 4),
 ('', 'Pritesh', 'Shah', 1, 4), ('', 'Jaymin', 'Patel', 3, 2),
 ('', 'Ruchek', 'Shah', 1, 2), ('', 'Chandni', 'Patel', 3, 3),
 ('', 'Mittal', 'Patel', 2, 3), ('', 'Shailesh', 'Patel', 2, 2),
 ('', 'Krutika', 'Dave', 3, 3), ('', 'Dinesh', 'Patel', 3, 2);
-- drop partition to check specific partition data is removed along with drop partition.
ALTER TABLE employee DROP PARTITION p2;

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE client (
    client_id INT,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    signed DATE
)
PARTITION BY HASH (MONTH (signed))
PARTITIONS 12;
--ALTER TABLE statement for reference only.
ALTER TABLE client COALESCE PARTITION 8 ;

--ALTER TABLE statement for reference only.
ALTER TABLE trp REBUILD  PARTITION p0, p1, p2;

--ALTER TABLE statement for reference.
ALTER TABLE top OPTIMIZE PARTITION p0, p1, p2;

--ALTER TABLE statement for reference.
ALTER TABLE tap ANALYZE  PARTITION p1, p2;

--ALTER TABLE statement for reference.
ALTER TABLE trp REPAIR PARTITION p3;

--ALTER TABLE statement for reference.
ALTER TABLE tcp CHECK PARTITION p0;

--SHOW CREATE TABLE for reference and replace employee with any table_name to get details.
SHOW CREATE TABLE employee ;

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE tp1 (
    first_name VARCHAR (30) NOT NULL,
    last_name VARCHAR (30) NOT NULL,
    zone_code TINYINT UNSIGNED NOT NULL,
    doj DATE NOT NULL
)
PARTITION BY RANGE (zone_code) (
    PARTITION p0 VALUES LESS THAN (65),
    PARTITION p1 VALUES LESS THAN (129),
    PARTITION p2 VALUES LESS THAN (193),
    PARTITION p3 VALUES LESS THAN MAXVALUE
);
-- SELECT statement to retrieve zone specific data.
SELECT first_name, last_name , doj from tp1 where zone_code > 126 AND zone_code < 131;

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE tp3 (
 first_name VARCHAR (30) NOT NULL,
 last_name VARCHAR (30) NOT NULL,
 zone_code TINYINT UNSIGNED NOT NULL,
 description VARCHAR (250),
 doj DATE NOT NULL
)
PARTITION BY LIST(zone_code) (
 PARTITION p0 VALUES IN (1, 3),
 PARTITION p1 VALUES IN (2, 5, 8),
 PARTITION p2 VALUES IN (4, 9),
 PARTITION p3 VALUES IN (6, 7, 10)
);


-- PARTITION syntax reference
/*
PARTITION (partition_names)
partition_names :
    partition_name, ...
*/


--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
SET @@SQL_MODE = '';
CREATE TABLE employee (
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 first_name VARCHAR(25) NOT NULL,
 last_name VARCHAR(25) NOT NULL,
 store_id INT NOT NULL,
 department_id INT NOT NULL
) 
 PARTITION BY RANGE(id) (
 PARTITION p0 VALUES LESS THAN (5),
 PARTITION p1 VALUES LESS THAN (10),
 PARTITION p2 VALUES LESS THAN (15),
 PARTITION p3 VALUES LESS THAN MAXVALUE
);
INSERT INTO employee VALUES
 ('', 'Chintan', 'Mehta', 3, 2), ('', 'Bhumil', 'Raval', 1, 2),
 ('', 'Subhash', 'Shah', 3, 4), ('', 'Siva', 'Stark', 2, 4),
 ('', 'Chintan', 'Gajjar', 1, 1), ('', 'Mansi', 'Panchal', 2, 3),
 ('', 'Hetal', 'Oza', 2, 1), ('', 'Parag', 'Patel', 3, 1),
 ('', 'Pooja', 'Shah', 1, 3), ('', 'Samir', 'Bhatt', 2, 4),
 ('', 'Pritesh', 'Shah', 1, 4), ('', 'Jaymin', 'Patel', 3, 2),
 ('', 'Ruchek', 'Shah', 1, 2), ('', 'Chandni', 'Patel', 3, 3),
 ('', 'Mittal', 'Patel', 2, 3), ('', 'Shailesh', 'Patel', 2, 2),
 ('', 'Krutika', 'Dave', 3, 3), ('', 'Dinesh', 'Patel', 3, 2);
SELECT * FROM employee PARTITION (p1);


--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
--sample table to result in error for primary key not included in partition expression.
CREATE TABLE tk1 (
    cl1 INT NOT NULL,
    cl2 DATE NOT NULL,
    cl3 INT NOT NULL,
    cl4 INT NOT NULL,
    UNIQUE KEY (cl1, cl2)
)
PARTITION BY HASH(cl3)
PARTITIONS 4;

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
--sample table to result in error for primary key not included in partition expression.
CREATE TABLE tk2 (
    cl1 INT NOT NULL,
    cl2 DATE NOT NULL,
    cl3 INT NOT NULL,
    cl4 INT NOT NULL,
    UNIQUE KEY (cl1),
    UNIQUE KEY (cl3)
)
PARTITION BY HASH(cl1 + cl3)
PARTITIONS 4;


--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE tk1 (
 cl1 INT NOT NULL,
 cl2 DATE NOT NULL,
 cl3 INT NOT NULL,
 cl4 INT NOT NULL,
 UNIQUE KEY (cl1, cl2, cl3)
)
PARTITION BY HASH(cl3)
PARTITIONS 4;

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE tk2 (
 cl1 INT NOT NULL,
 cl2 DATE NOT NULL,
 cl3 INT NOT NULL,
 cl4 INT NOT NULL,
 UNIQUE KEY (cl1, cl3)
)
PARTITION BY HASH(cl1 + cl3)
PARTITIONS 4;


CREATE TABLE tk4 (
 cl1 INT NOT NULL,
 cl2 INT NOT NULL,
 cl3 INT NOT NULL,
 cl4 INT NOT NULL,
 UNIQUE KEY (cl1, cl3),
 UNIQUE KEY (cl2, cl4)
);


--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE tk5 (
 cl1 INT NOT NULL,
 cl2 DATE NOT NULL,
 cl3 INT NOT NULL,
 cl4 INT NOT NULL,
 PRIMARY KEY(cl1, cl2)
)
PARTITION BY HASH(cl3)
PARTITIONS 4;

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
--sample table to result in error for primary key not included in partition expression.
CREATE TABLE tk6 (
 cl1 INT NOT NULL,
 cl2 DATE NOT NULL,
 cl3 INT NOT NULL,
 cl4 INT NOT NULL,
 PRIMARY KEY(cl1, cl3),
 UNIQUE KEY(cl2)
)
PARTITION BY HASH( YEAR(cl2) )
PARTITIONS 4;

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE tk7 (
 cl1 INT NOT NULL,
 cl2 DATE NOT NULL,
 cl3 INT NOT NULL,
 cl4 INT NOT NULL,
 PRIMARY KEY(cl1, cl2)
)
PARTITION BY HASH(cl1 + YEAR(cl2))
PARTITIONS 4;

--sample table with partition and executing drop table table_name; statement might be required if the table with same name already exists.
CREATE TABLE tk8 (
 cl1 INT NOT NULL,
 cl2 DATE NOT NULL,
 cl3 INT NOT NULL,
 cl4 INT NOT NULL,
 PRIMARY KEY(cl1, cl2, cl4),
 UNIQUE KEY(cl2, cl1)
)
PARTITION BY HASH(cl1 + YEAR(cl2))
PARTITIONS 4;
