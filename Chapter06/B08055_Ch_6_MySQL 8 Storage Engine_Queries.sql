--For reference only - Below statement is reference purpose only for installing custom plugin named MyExample along with shared library file MyExample.so.
mysql> INSTALL PLUGIN MyExample SONAME 'MyExample.so';

--For reference only - Below statement is reference purpose only for uninstalling custom plugin named MyExample.
mysql> UNINSTALL PLUGIN MyExample ;

--Below statement is to specify the storage engine to be used with CREATE TABLE statement.
mysql> CREATE TABLE table1 (i1 INT) ENGINE = INNODB;
mysql> CREATE TABLE table2 (i2 INT) ENGINE = CSV;
mysql> CREATE TABLE table3 (i3 INT) ENGINE = MEMORY;

--Below statement is to modify the storage engine with ALTER TABLE statement.
mysql> ALTER TABLE table3 ENGINE = InnoDB;

--Below statement is for updating default storage engine for current session.
mysql> SET default_storage_engine=MEMORY;

--Below statement is for retrieving list of InnoDB's INFORMATION_SCHEMA.
mysql> SHOW TABLES FROM INFORMATION_SCHEMA LIKE 'INNODB%';

--For reference only - handlerton code file example from the EXAMPLE Storage engine
handlerton example_hton= {
  "EXAMPLE", /* Name of the storage engine */
  SHOW_OPTION_YES, /* It should be displayed in options or not */
  "Example storage engine", /* Description of the storage engine */
  DB_TYPE_EXAMPLE_DB, /* Type of storage engine it should refer to */
  NULL, /* Initialize handlerton */
  0, /* slot  available */
  0, /* define savepoint size. */
  NULL, /* handle close_connection */
  NULL, /* handle savepoint */
  NULL, /* handle rollback to savepoint */
  NULL, /* handle release savepoint */
  NULL, /* handle commit */
  NULL, /* handle rollback */
  NULL, /* handle prepare */
  NULL, /* handle recover */
  NULL, /* handle commit_by_xid */
  NULL, /* handle rollback_by_xid */
  NULL, /* handle create_cursor_read_view */
  NULL, /* handle set_cursor_read_view */
  NULL, /* handle close_cursor_read_view */
  example_create_handler, /* Create a new handler instance */
  NULL, /* handle drop database */
  NULL, /* handle panic call */
  NULL, /* handle release temporary latches */
  NULL, /* Update relevant Statistics */
  NULL, /* Start Consistent Snapshot for reference */
  NULL, /* handle flush logs */
  NULL, /* handle show status */
  NULL, /* handle replication Report Sent to Binlog */
  HTON_CAN_RECREATE
};

--For reference only - Example from the CSV engine displaying instantiation method
static handler* tina_create_handler(TABLE *table);

--For reference only - Instantiation method for the MyISAM storage engine
static handler *myisam_create_handler(TABLE *table)
  {
    return new ha_myisam(table);
  }

--For reference only - Extensions in the form of a null-terminated string array is returned when the [custom-engine.html#custom-engine-api-reference-bas_ext bas_ext()] method is called.
const char **ha_tina::bas_ext() const
{
  return ha_tina_exts;
}

--For reference only - The storage engine must implement the [custom-engine.html#custom-engine-api-reference-create create()] method as shown below :
virtual int create(const char *name, TABLE *form, HA_CREATE_INFO *info)=0;

--For reference only - CREATE TABLE statement structure is defined in handler.h file as below :
typedef struct st_ha_create_information
{
    CHARSET_INFO *table_charset, *default_table_charset; /* charset in table */
    LEX_STRING connect_string; /* connection string */
    const char *comment,*password; /* storing comments and password values */
    const char *data_file_name, *index_file_name; /* data and index file names */
    const char *alias; /* value pointer for alias */
    ulonglong max_rows,min_rows;
    ulonglong auto_increment_value;
    ulong table_options;
    ulong avg_row_length;
    ulong raid_chunksize;
    ulong used_fields;
    SQL_LIST merge_list;
    enum db_type db_type; /* value for db_type */
    enum row_type row_type; /* value for row_type */
    uint null_bits; /* NULL bits specified at start of record */
    uint options; /* OR of HA_CREATE_ options specification */
    uint raid_type,raid_chunks; /* raid type and chunks info */
    uint merge_insert_method;
    uint extra_size; /* length of extra data segments */
    bool table_existed; /* 1 in create if table existed */
    bool frm_only; /* 1 if no ha_create_table() */
    bool varchar; /* 1 if table has a VARCHAR */
} HA_CREATE_INFO;

--For reference only - handler::open() method to open the table index and data files.
int open(const char *name, int mode, int test_if_locked);

--For reference only - The final options dictates if the handler should check for lock on the table before opening based on following options available
#define HA_OPEN_ABORT_IF_LOCKED 0 /* default */
#define HA_OPEN_WAIT_IF_LOCKED 1 /* wait if table is locked */
#define HA_OPEN_IGNORE_IF_LOCKED 2 /* ignore if locked */
#define HA_OPEN_TMP_TABLE 4 /* Table is a temp table */
#define HA_OPEN_DELAY_KEY_WRITE 8 /* Don't update index */
#define HA_OPEN_ABORT_IF_CRASHED 16
#define HA_OPEN_FOR_REPAIR 32 /* open even if crashed with repair */

--For reference only - The implementation of the methods is the first steps towards the creation of advanced storage engines and following shows the method calls made during a nine-row table scan of the CSV engine
ha_tina::store_lock
ha_tina::external_lock
ha_tina::info
ha_tina::rnd_init
ha_tina::extra - ENUM HA_EXTRA_CACHE Cache record in HA_rrnd()
ha_tina::rnd_next
ha_tina::rnd_next
ha_tina::rnd_next
ha_tina::rnd_next
ha_tina::rnd_next
ha_tina::rnd_next
ha_tina::rnd_next
ha_tina::rnd_next
ha_tina::rnd_next
ha_tina::extra - ENUM HA_EXTRA_NO_CACHE End caching of records (def)
ha_tina::external_lock
ha_tina::extra - ENUM HA_EXTRA_RESET Reset database to after open

--For reference only - Storage engines using the shared access methods are seen in the CSV engine. Other example engines must remove the same from the shared structure as displayed below :

int ha_tina::close(void)
 {
   DBUG_ENTER("ha_tina::close");
   DBUG_RETURN(free_share(share));
 }