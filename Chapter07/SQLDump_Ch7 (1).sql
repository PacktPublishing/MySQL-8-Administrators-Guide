create table employee (id int(11) not null,name varchar(50));
CREATE INDEX emp_name_index ON employee (name) USING BTREE;
CREATE INDEX name_index ON employee(name) COMMENT 'MERGE_THRESHOLD=40'; 
DROP INDEX name_index ON employee;

CREATE TABLE geom_data (data GEOMETRY NOT NULL, SPATIAL INDEX(data));
CREATE TABLE person (personal_data TEXT, INDEX(personal_data (8)));

CREATE TABLE Employee (
id INT NOT NULL,
lastname varchar(50) not null,
firstname varchar(50) not null,
PRIMARY KEY (id),
INDEX name (lastname, firstname)
);

SELECT * FROM Employee WHERE lastname='Shah';
SELECT * FROM Employee WHERE lastname ='Shah' AND firstname ='Mona';
SELECT * FROM Employee WHERE lastname ='Shah' AND (firstname ='Michael' OR firstname ='Mona');
SELECT * FROM Employee WHERE lastname ='Shah' AND firstname >='M' AND firstname < 'N';

SELECT * FROM Employee WHERE firstname='Mona';
SELECT * FROM Employee WHERE lastname='Shah' OR firstname='Mona';

SET optimizer_switch = 'use_index_extensions=off';

CREATE TABLE table1 (
 c1 INT NOT NULL DEFAULT 0,
 c2 INT NOT NULL DEFAULT 0,
 d1 DATE DEFAULT NULL,
 PRIMARY KEY (c1, c2),
 INDEX key1 (d1)
) ENGINE = InnoDB;


INSERT INTO table1 VALUES
(1, 1, '1990-01-01'), (1, 2, '1991-01-01'),
(1, 3, '1992-01-01'), (1, 4, '1993-01-01'),
(1, 5, '1994-01-01'), (2, 1, '1990-01-01'),
(2, 2, '1991-01-01'), (2, 3, '1992-01-01'),
(2, 4, '1993-01-01'), (2, 5, '1994-01-01'),
(3, 1, '1990-01-01'), (3, 2, '1991-01-01'),
(3, 3, '1992-01-01'), (3, 4, '1993-01-01'),
(3, 5, '1994-01-01'), (4, 1, '1990-01-01'),
(4, 2, '1991-01-01'), (4, 3, '1992-01-01'),
(4, 4, '1993-01-01'), (4, 5, '1994-01-01'),
(5, 1, '1990-01-01'), (5, 2, '1991-01-01'),
(5, 3, '1992-01-01'), (5, 4, '1993-01-01'),
(5, 5, '1994-01-01');

SET optimizer_switch = 'use_index_extensions=off';

EXPLAIN SELECT COUNT(*) FROM table1 WHERE c1 = 3 AND d1 = '1992-01-01';

SET optimizer_switch = 'use_index_extensions=on';

EXPLAIN SELECT COUNT(*) FROM table1 WHERE c1 = 3 AND d1 = '1992-01-01';

CREATE TABLE t1 (c1 INT, c2 INT AS (c1 + 1) STORED, INDEX (c2));

SELECT * FROM t1 WHERE c1 + 1 > 100;

explain SELECT * FROM t1 WHERE c1 + 1 > 100;

drop table employee;

CREATE TABLE `employee` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `department_id` int(11),
 `salary` int(11),
 PRIMARY KEY (`id`)
 ) ENGINE=InnoDB;

CREATE INDEX idx1 ON employee (department_id) INVISIBLE;
ALTER TABLE employee ADD INDEX idx2 (salary) INVISIBLE;
ALTER TABLE employee ALTER INDEX idx1 VISIBLE;
ALTER TABLE employee ALTER INDEX idx1 INVISIBLE;
 
SELECT * FROM information_schema.statistics WHERE is_visible='NO';

SELECT INDEX_NAME, IS_VISIBLE FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db1' AND TABLE_NAME='employee';

SHOW INDEXES FROM employee;

CREATE TABLE table2 (
 field1 INT NOT NULL,
 field2 INT NOT NULL,
 UNIQUE idx1 (field1)
) ENGINE = InnoDB;

ALTER TABLE table2 ADD PRIMARY KEY (field2);

ALTER TABLE table2 ALTER INDEX idx1 INVISIBLE;

drop table t1;

CREATE TABLE t1 (
 a INT, b INT,
 INDEX idx1 (a ASC, b ASC),
 INDEX idx2 (a ASC, b DESC),
 INDEX idx3 (a DESC, b ASC),
 INDEX idx4 (a DESC, b DESC)
);

