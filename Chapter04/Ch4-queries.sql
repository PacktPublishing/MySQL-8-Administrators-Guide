-- Creates table employees with salary as an integer unsigned field.
CREATE TABLE employees (salary INTEGER(5) UNSIGNED);

-- Creates table employees with id field of type integer with display length 255.
CREATE TABLE employees (id INT(255));

-- Creates table documents with document_no field declared with ZEROFILL attribute.
CREATE TABLE documents (document_no INT(5) ZEROFILL);

-- Creates table taxes with tax_rate field of type DECIMAL.
CREATE TABLE taxes (tax_rate DECIMAL(3, 2));

-- Example to compare difference between FLOAT and DECIMAL
CREATE TABLE typed_numbers(id TINYINT, float_values FLOAT, decimal_values DECIMAL(3, 2));
INSERT INTO typed_numbers VALUES(1, 1.1, 1.1), (2, 1.1, 1.1), (3, 1.1, 1.1);
SELECT * FROM typed_numbers;
SELECT SUM(float_values), SUM(decimal_values) FROM typed_numbers;

-- Example demonstrates that same value stored in two approximate data types are not considered equal.
CREATE TABLE temp(id INT, col1 DOUBLE, col2 DOUBLE);
INSERT INTO temp VALUES (1, 5.30, 2.30), (1, -3.00, 0.00), (2, 0.10, -10.00), (2, -15.20, 4.00), (2, 0.00, -7.10), (3, 0.00, 2.30), (3, 0.00, 0.00);
SELECT id, SUM(col1) as v1, SUM(col2) as v2 FROM temp GROUP BY id HAVING v1 <> v2;

-- Example demonstrates BIT data type declaration.
CREATE TABLE working_days (year INT, week INT, days BIT(7), PRIMARY KEY (year, week));

-- Example how bit values are stored in database table.
CREATE TABLE bit_values (val BIT(7));
INSERT INTO bit_values VALUES(b'1011');
INSERT INTO bit_values VALUES(b'110111');

-- Example how to store boolean values using BIT.
CREATE TABLE boolean_values (value BIT(1));
INSERT INTO boolean_values VALUES(b'0');
INSERT INTO boolean_values VALUES(b'1');

-- Example 2
CREATE TABLE boolean_values (value BIT);
INSERT INTO boolean_values VALUES(b'0');
INSERT INTO boolean_values VALUES(b'1');

-- Example demonstrates BIT literals are stored as binary strings.
SELECT b'1010110', CHARSET(b'1010110');
SELECT 0b1100100, CHARSET(0b1100100);


-- Example to use BIT field to represent day of a week
INSERT INTO working_days VALUES(2017, 4, 0111011);
SELECT year, week, days FROM working_days;

-- Example for binary value of a day of week
SELECT year, week, BIN(days) FROM working_days;

-- Example LPAD function
SELECT year, week, LPAD(BIN(days), 7, '0') FROM working_days;

-- Sets timezone to UTC
SET time_zone = '+00:00';

-- Example demonstrates DATETIME vs TIMESTAMP
CREATE TABLE datetime_temp(ts TIMESTAMP, dt DATETIME);
INSERT INTO datetime_temp VALUES(NOW(), NOW());
SELECT ts, dt FROM datetime_temp; 

-- Change different timezone and observe difference in DATETIME and TIMESTAMP values
SET time_zone = '+03:00';
SELECT ts, dt FROM datetime_temp;

-- Example DATETIME functions
SET @dt = NOW();
SELECT @dt;
SELECT DATE(@dt);
SELECT TIME(@dt);
SELECT HOUR(@dt), MINUTE(@dt), SECOND(@dt), DAY(@dt), WEEK(@dt), MONTH(@dt), QUARTER(@dt), YEAR(@dt);
SELECT CURRENT_TIME() AS 'CUR_TIME', ADDTIME(CURRENT_TIME(), 020000) AS 'ADDTIME', SUBTIME(CURRENT_TIME(), 020000) AS 'SUBTIME';

-- Example error for non-support YEAR(2) data type.
CREATE TABLE temp(year YEAR(2));
-- ERROR 1818 (HY000): Supports only YEAR or YEAR(4) column.

-- Example CHAR data type.
CREATE TABLE char_temp ( data CHAR(3) );
INSERT INTO char_temp(data) VALUES('abc'), (' a ');
SELECT data, LENGTH(data) FROM char_temp;

-- Example showing padding to match field length.
CREATE TABLE employees (emp_name CHAR(10));
INSERT INTO employees VALUES ('Jack');
SELECT emp_name = 'Jack', emp_name = 'Jack ' FROM employees;
SELECT emp_name LIKE 'Jack', emp_name LIKE 'Jack ' FROM employees;

-- BINARY field declaration
CREATE TABLE temp(data BINARY(3));
INSERT INTO temp(data) VALUES('a ');

-- Example BINARY padding to match width
CREATE TABLE bin_temp (data BINARY(3));
INSERT INTO bin_temp(data) VALUES('c');
SELECT data = 'c', data = 'c\0\0' from bin_temp;

-- Example ENUM data type
CREATE TABLE subjects (name VARCHAR(40), stream ENUM('arts', 'commerce', 'science'));
INSERT INTO subjects (name, stream) VALUES ('biology','science'), ('statistics','commerce'), ('history','arts');
SELECT name, stream FROM subjects WHERE stream = 'commerce';
UPDATE subjects SET stream = 'science' WHERE stream = 'commerce';
SELECT name, stream FROM subjects WHERE stream = 'science';

-- Example ENUM numeric value
SELECT stream+1 FROM subjects;

-- Example SET data type
CREATE TABLE temp(hobbies SET('Travel', 'Sports', 'Fine Dining', 'Dancing'));
INSERT INTO temp(hobbies) VALUES(9);

-- Example JSON data type
CREATE TABLE users(user_id INT UNSIGNED NOT NULL, preferences JSON NOT NULL);
INSERT INTO users(user_id, preferences) VALUES(1, '{"page_size": 10, "hobbies": {"sports": 1}}');
SELECT preferences FROM users;
INSERT INTO users(user_id, preferences) VALUES(2, JSON_OBJECT("page_size", 1, "network", JSON_ARRAY("GSM", "CDMA", "WIFI")));