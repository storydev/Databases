package db

import c "core:c/libc"

when ODIN_OS == "windows" { foreign import sqlite "lib/sqlite3.lib" }

SQLITE3 :: rawptr
sqlite3_int64 :: i64
ExecuteCallback :: proc "c" (a : rawptr, b : c.int, c : ^[^]u8, d : ^[^]u8) -> c.int

/*
 * Result Codes
 */

SQLITE_OK         :: 0
SQLITE_ERROR      :: 1
SQLITE_INTERNAL   :: 2
SQLITE_PERM       :: 3
SQLITE_ABORT      :: 4
SQLITE_BUSY       :: 5
SQLITE_LOCKED     :: 6
SQLITE_NOMEM      :: 7
SQLITE_READONLY   :: 8
SQLITE_INTERRUPT  :: 9
SQLITE_IOERR      :: 10
SQLITE_CORRUPT    :: 11
SQLITE_NOTFOUND   :: 12
SQLITE_FULL       :: 13
SQLITE_CANTOPEN   :: 14
SQLITE_PROTOCOL   :: 15
SQLITE_EMPTY      :: 16
SQLITE_SCHEMA     :: 17
SQLITE_TOOBIG     :: 18
SQLITE_CONSTRAINT :: 19
SQLITE_MISMATCH   :: 20
SQLITE_MISUSE     :: 21
SQLITE_NOLFS      :: 22
SQLITE_AUTH       :: 23
SQLITE_FORMAT     :: 24
SQLITE_RANGE      :: 25
SQLITE_NOTADB     :: 26
SQLITE_NOTICE     :: 27
SQLITE_WARNING    :: 28
SQLITE_ROW        :: 100
SQLITE_DONE       :: 101

/* Extended Error Codes */
SQLITE_ERROR_MISSING_COLLSEQ   :: (SQLITE_ERROR | (1<<8))
SQLITE_ERROR_RETRY             :: (SQLITE_ERROR | (2<<8))
SQLITE_ERROR_SNAPSHOT          :: (SQLITE_ERROR | (3<<8))
SQLITE_IOERR_READ              :: (SQLITE_IOERR | (1<<8))
SQLITE_IOERR_SHORT_READ        :: (SQLITE_IOERR | (2<<8))
SQLITE_IOERR_WRITE             :: (SQLITE_IOERR | (3<<8))
SQLITE_IOERR_FSYNC             :: (SQLITE_IOERR | (4<<8))
SQLITE_IOERR_DIR_FSYNC         :: (SQLITE_IOERR | (5<<8))
SQLITE_IOERR_TRUNCATE          :: (SQLITE_IOERR | (6<<8))
SQLITE_IOERR_FSTAT             :: (SQLITE_IOERR | (7<<8))
SQLITE_IOERR_UNLOCK            :: (SQLITE_IOERR | (8<<8))
SQLITE_IOERR_RDLOCK            :: (SQLITE_IOERR | (9<<8))
SQLITE_IOERR_DELETE            :: (SQLITE_IOERR | (10<<8))
SQLITE_IOERR_BLOCKED           :: (SQLITE_IOERR | (11<<8))
SQLITE_IOERR_NOMEM             :: (SQLITE_IOERR | (12<<8))
SQLITE_IOERR_ACCESS            :: (SQLITE_IOERR | (13<<8))
SQLITE_IOERR_CHECKRESERVEDLOCK :: (SQLITE_IOERR | (14<<8))
SQLITE_IOERR_LOCK              :: (SQLITE_IOERR | (15<<8))
SQLITE_IOERR_CLOSE             :: (SQLITE_IOERR | (16<<8))
SQLITE_IOERR_DIR_CLOSE         :: (SQLITE_IOERR | (17<<8))
SQLITE_IOERR_SHMOPEN           :: (SQLITE_IOERR | (18<<8))
SQLITE_IOERR_SHMSIZE           :: (SQLITE_IOERR | (19<<8))
SQLITE_IOERR_SHMLOCK           :: (SQLITE_IOERR | (20<<8))
SQLITE_IOERR_SHMMAP            :: (SQLITE_IOERR | (21<<8))
SQLITE_IOERR_SEEK              :: (SQLITE_IOERR | (22<<8))
SQLITE_IOERR_DELETE_NOENT      :: (SQLITE_IOERR | (23<<8))
SQLITE_IOERR_MMAP              :: (SQLITE_IOERR | (24<<8))
SQLITE_IOERR_GETTEMPPATH       :: (SQLITE_IOERR | (25<<8))
SQLITE_IOERR_CONVPATH          :: (SQLITE_IOERR | (26<<8))
SQLITE_IOERR_VNODE             :: (SQLITE_IOERR | (27<<8))
SQLITE_IOERR_AUTH              :: (SQLITE_IOERR | (28<<8))
SQLITE_IOERR_BEGIN_ATOMIC      :: (SQLITE_IOERR | (29<<8))
SQLITE_IOERR_COMMIT_ATOMIC     :: (SQLITE_IOERR | (30<<8))
SQLITE_IOERR_ROLLBACK_ATOMIC   :: (SQLITE_IOERR | (31<<8))
SQLITE_IOERR_DATA              :: (SQLITE_IOERR | (32<<8))
SQLITE_IOERR_CORRUPTFS         :: (SQLITE_IOERR | (33<<8))
SQLITE_LOCKED_SHAREDCACHE      :: (SQLITE_LOCKED |  (1<<8))
SQLITE_LOCKED_VTAB             :: (SQLITE_LOCKED |  (2<<8))
SQLITE_BUSY_RECOVERY           :: (SQLITE_BUSY   |  (1<<8))
SQLITE_BUSY_SNAPSHOT           :: (SQLITE_BUSY   |  (2<<8))
SQLITE_BUSY_TIMEOUT            :: (SQLITE_BUSY   |  (3<<8))
SQLITE_CANTOPEN_NOTEMPDIR      :: (SQLITE_CANTOPEN | (1<<8))
SQLITE_CANTOPEN_ISDIR          :: (SQLITE_CANTOPEN | (2<<8))
SQLITE_CANTOPEN_FULLPATH       :: (SQLITE_CANTOPEN | (3<<8))
SQLITE_CANTOPEN_CONVPATH       :: (SQLITE_CANTOPEN | (4<<8))
SQLITE_CANTOPEN_DIRTYWAL       :: (SQLITE_CANTOPEN | (5<<8))
SQLITE_CANTOPEN_SYMLINK        :: (SQLITE_CANTOPEN | (6<<8))
SQLITE_CORRUPT_VTAB            :: (SQLITE_CORRUPT | (1<<8))
SQLITE_CORRUPT_SEQUENCE        :: (SQLITE_CORRUPT | (2<<8))
SQLITE_CORRUPT_INDEX           :: (SQLITE_CORRUPT | (3<<8))
SQLITE_READONLY_RECOVERY       :: (SQLITE_READONLY | (1<<8))
SQLITE_READONLY_CANTLOCK       :: (SQLITE_READONLY | (2<<8))
SQLITE_READONLY_ROLLBACK       :: (SQLITE_READONLY | (3<<8))
SQLITE_READONLY_DBMOVED        :: (SQLITE_READONLY | (4<<8))
SQLITE_READONLY_CANTINIT       :: (SQLITE_READONLY | (5<<8))
SQLITE_READONLY_DIRECTORY      :: (SQLITE_READONLY | (6<<8))
SQLITE_ABORT_ROLLBACK          :: (SQLITE_ABORT | (2<<8))
SQLITE_CONSTRAINT_CHECK        :: (SQLITE_CONSTRAINT | (1<<8))
SQLITE_CONSTRAINT_COMMITHOOK   :: (SQLITE_CONSTRAINT | (2<<8))
SQLITE_CONSTRAINT_FOREIGNKEY   :: (SQLITE_CONSTRAINT | (3<<8))
SQLITE_CONSTRAINT_FUNCTION     :: (SQLITE_CONSTRAINT | (4<<8))
SQLITE_CONSTRAINT_NOTNULL      :: (SQLITE_CONSTRAINT | (5<<8))
SQLITE_CONSTRAINT_PRIMARYKEY   :: (SQLITE_CONSTRAINT | (6<<8))
SQLITE_CONSTRAINT_TRIGGER      :: (SQLITE_CONSTRAINT | (7<<8))
SQLITE_CONSTRAINT_UNIQUE       :: (SQLITE_CONSTRAINT | (8<<8))
SQLITE_CONSTRAINT_VTAB         :: (SQLITE_CONSTRAINT | (9<<8))
SQLITE_CONSTRAINT_ROWID        :: (SQLITE_CONSTRAINT |(10<<8))
SQLITE_CONSTRAINT_PINNED       :: (SQLITE_CONSTRAINT |(11<<8))
SQLITE_CONSTRAINT_DATATYPE     :: (SQLITE_CONSTRAINT |(12<<8))
SQLITE_NOTICE_RECOVER_WAL      ::  (SQLITE_NOTICE | (1<<8))
SQLITE_NOTICE_RECOVER_ROLLBACK :: (SQLITE_NOTICE | (2<<8))
SQLITE_WARNING_AUTOINDEX       :: (SQLITE_WARNING | (1<<8))
SQLITE_AUTH_USER               :: (SQLITE_AUTH | (1<<8))
SQLITE_OK_LOAD_PERMANENTLY     :: (SQLITE_OK | (1<<8))
SQLITE_OK_SYMLINK              :: (SQLITE_OK | (2<<8))

/* Flags For File Open Operations */
SQLITE_OPEN_READONLY           :: 0x00000001
SQLITE_OPEN_READWRITE          :: 0x00000002
SQLITE_OPEN_CREATE             :: 0x00000004
SQLITE_OPEN_DELETEONCLOSE      :: 0x00000008
SQLITE_OPEN_EXCLUSIVE          :: 0x00000010
SQLITE_OPEN_AUTOPROXY          :: 0x00000020
SQLITE_OPEN_URI                :: 0x00000040
SQLITE_OPEN_MEMORY             :: 0x00000080
SQLITE_OPEN_MAIN_DB            :: 0x00000100
SQLITE_OPEN_TEMP_DB            :: 0x00000200
SQLITE_OPEN_TRANSIENT_DB       :: 0x00000400
SQLITE_OPEN_MAIN_JOURNAL       :: 0x00000800
SQLITE_OPEN_TEMP_JOURNAL       :: 0x00001000
SQLITE_OPEN_SUBJOURNAL         :: 0x00002000
SQLITE_OPEN_SUPER_JOURNAL      :: 0x00004000
SQLITE_OPEN_NOMUTEX            :: 0x00008000
SQLITE_OPEN_FULLMUTEX          :: 0x00010000
SQLITE_OPEN_SHAREDCACHE        :: 0x00020000
SQLITE_OPEN_PRIVATECACHE       :: 0x00040000
SQLITE_OPEN_WAL                :: 0x00080000
SQLITE_OPEN_NOFOLLOW           :: 0x01000000
SQLITE_OPEN_EXRESCODE          :: 0x02000000
SQLITE_OPEN_MASTER_JOURNAL     :: 0x00004000

/* Device Characteristics */

SQLITE_IOCAP_ATOMIC            :: 0x00000001
SQLITE_IOCAP_ATOMIC512         :: 0x00000002
SQLITE_IOCAP_ATOMIC1K          :: 0x00000004
SQLITE_IOCAP_ATOMIC2K          :: 0x00000008
SQLITE_IOCAP_ATOMIC4K          :: 0x00000010
SQLITE_IOCAP_ATOMIC8K          :: 0x00000020
SQLITE_IOCAP_ATOMIC16K         :: 0x00000040
SQLITE_IOCAP_ATOMIC32K         :: 0x00000080
SQLITE_IOCAP_ATOMIC64K         :: 0x00000100
SQLITE_IOCAP_SAFE_APPEND       :: 0x00000200
SQLITE_IOCAP_SEQUENTIAL        :: 0x00000400
SQLITE_IOCAP_UNDELETABLE_WHEN_OPEN :: 0x00000800
SQLITE_IOCAP_POWERSAFE_OVERWRITE :: 0x00001000
SQLITE_IOCAP_IMMUTABLE         :: 0x00002000
SQLITE_IOCAP_BATCH_ATOMIC      :: 0x00004000

/* File Locking Levels */
SQLITE_LOCK_NONE      :: 0
SQLITE_LOCK_SHARED    :: 1
SQLITE_LOCK_RESERVED  :: 2
SQLITE_LOCK_PENDING   :: 3
SQLITE_LOCK_EXCLUSIVE :: 4

/* Synchronization Type Flags */
SQLITE_SYNC_NORMAL    :: 0x00002
SQLITE_SYNC_FULL      :: 0x00003
SQLITE_SYNC_DATAONLY  :: 0x00010

/* Authorizer Return Codes */
SQLITE_DENY :: 1
SQLITE_IGNORE :: 2



@(default_calling_convention="c", link_prefix="sqlite3_")
foreign sqlite {
    libversion        :: proc() -> cstring ---
    sourceid          :: proc() -> cstring ---
    libversion_number :: proc() -> c.int ---

    compileoption_used :: proc(zOptName : cstring) -> c.int ---
    compileoption_get  :: proc(N : c.int) -> cstring ---

    threadsafe :: proc() -> c.int ---

    close    :: proc(obj : SQLITE3) -> c.int ---
    close_v2 :: proc(obj : SQLITE3) -> c.int ---

    exec :: proc(obj : SQLITE3, sql : cstring, callback : ExecuteCallback, arg : rawptr, errmsg : ^cstring) -> c.int ---

    initialize :: proc() -> c.int ---
    shutdown   :: proc() -> c.int ---
    os_init    :: proc() -> c.int ---
    os_end     :: proc() -> c.int ---

    extended_result_codes :: proc(obj : SQLITE3, onoff : c.int) -> c.int ---
    last_insert_rowid     :: proc(obj : SQLITE3) -> sqlite3_int64 ---
    set_last_insert_rowid :: proc(obj : SQLITE3, value : sqlite3_int64) ---
    changes               :: proc(obj : SQLITE3) -> c.int ---
    changes64             :: proc(obj : SQLITE3) -> sqlite3_int64 ---
    total_changes         :: proc(obj : SQLITE3) -> c.int ---
    total_changes64       :: proc(obj : SQLITE3) -> sqlite3_int64 ---
    interrupt             :: proc(obj : SQLITE3) ---
    complete              :: proc(sql : cstring) -> c.int ---
    complete16            :: proc(sql : rawptr) -> c.int ---
    busy_handler          :: proc(obj : SQLITE3, callback : proc(data : rawptr, count : c.int) -> c.int, other : rawptr) -> c.int ---
    busy_timeout          :: proc(obj : SQLITE3, ms : c.int) -> c.int ---
    get_table             :: proc(obj : SQLITE3, zSql : cstring, pazResult : ^^[^]u8, pnRow : ^c.int, pnColumn : ^c.int, pzErrmsg : ^[^]u8) -> c.int ---
    free_table            :: proc(result : ^[^]u8) ---
    randomness            :: proc(N : c.int, P : rawptr) ---
    set_authorizer        :: proc(obj : SQLITE3, xAuth : proc(ptrdata : rawptr, a : c.int, a_str : cstring, b_str : cstring, c_cstr : cstring, d_str : cstring) -> c.int, pUserData : rawptr) -> c.int ---


}