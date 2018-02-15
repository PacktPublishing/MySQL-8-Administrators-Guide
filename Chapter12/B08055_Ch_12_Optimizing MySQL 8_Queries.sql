-- Following is the query to view available memory instruments in MySQL
SELECT * FROM performance_schema.setup_instruments WHERE NAME LIKE '%memory%';

-- Following is an example to limit results to InnoDB memory instruments
SELECT * FROM performance_schema.setup_instruments WHERE NAME LIKE '%memory/innodb%';

-- Following is an example to query memory instrument data in the memory_summary_global_by_event_name table in performance schema:
SELECT * FROM performance_schema.memory_summary_global_by_event_name WHERE EVENT_NAME LIKE 'memory/innodb/buf_buf_pool'\G;

-- Following is an example of querying sys schema to aggregate currently allocated memory by code area:
SELECT SUBSTRING_INDEX(event_name,'/',2) AS
 code_area, sys.format_bytes(SUM(current_alloc)) AS current_alloc
 FROM sys.x$memory_global_by_current_bytes
 GROUP BY SUBSTRING_INDEX(event_name,'/',2)
 ORDER BY SUM(current_alloc) DESC;

-- Following is an example command to find out server status variable values:
SHOW GLOBAL STATUS;

-- Following is an example of filtering the status variables:
SHOW STATUS LIKE '%Thread%';

-- Following is an example to find out speed of individual expressions
SELECT BENCHMARK(1000000, 1+1);



