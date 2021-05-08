CREATE DATABASE `myawr`  DEFAULT CHARACTER SET utf8;

create user 'superuser'@'localhost' identified by "111111";
create user 'myuser'@'localhost' identified by "111111";
create user 'myuser'@'%' identified by "111111";
    
grant all on *.* to 'superuser'@'localhost';
grant all on myawr.* to 'myuser'@'localhost';
grant all on myawr.* to 'myuser'@'%';

CREATE TABLE `myawr_cpu_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snap_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `cpu_user` float(10,2) DEFAULT NULL,
  `cpu_system` float(10,2) DEFAULT NULL,
  `cpu_idle` float(10,2) DEFAULT NULL,
  `cpu_iowait` float(10,2) DEFAULT NULL,
  `snap_time` datetime DEFAULT NULL,
  UNIQUE (`id`,`snap_time`),
  KEY `idx_myawr_cpu_info_snap_host_id` (`snap_id`,`host_id`),
  KEY `idx_myawr_cpu_info_snap_time` (`snap_time`),
  KEY `idx_myawr_cpu_info_host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22806 DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;


CREATE TABLE `myawr_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_name` varchar(50) NOT NULL,
  `ip_addr` varchar(50) NOT NULL,
  `port` int(11) NOT NULL DEFAULT '3306',
  `db_role` varchar(50) NOT NULL,
  `version` varchar(50) NOT NULL,
  `uptime` varchar(50) NOT NULL,
  `check_time` datetime DEFAULT NULL,
  `running_thread_threshold` int(11) DEFAULT NULL,
  `notify_emails` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


CREATE TABLE `myawr_innodb_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snap_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `Innodb_rows_inserted` float(26,2) DEFAULT NULL,
  `Innodb_rows_updated` float(26,2) DEFAULT NULL,
  `Innodb_rows_deleted` float(26,2) DEFAULT NULL,
  `Innodb_rows_read` float(26,2) DEFAULT NULL,
  `Innodb_buffer_pool_read_requests` float(26,2) DEFAULT NULL,
  `Innodb_buffer_pool_reads` float(26,2) DEFAULT NULL,
  `Innodb_buffer_pool_pages_data` float(26,2) DEFAULT NULL,
  `Innodb_buffer_pool_pages_free` float(26,2) DEFAULT NULL,
  `Innodb_buffer_pool_pages_dirty` float(26,2) DEFAULT NULL,
  `Innodb_buffer_pool_pages_flushed` float(26,2) DEFAULT NULL,
  `Innodb_data_reads` float(26,2) DEFAULT NULL,
  `Innodb_data_writes` float(26,2) DEFAULT NULL,
  `Innodb_data_read` float(26,2) DEFAULT NULL,
  `Innodb_data_written` float(26,2) DEFAULT NULL,
  `Innodb_os_log_fsyncs` float(26,2) DEFAULT NULL,
  `Innodb_os_log_written` float(26,2) DEFAULT NULL,
  `history_list` float(26,2) DEFAULT NULL,
  `log_bytes_written` float(26,2) DEFAULT NULL,
  `log_bytes_flushed` float(26,2) DEFAULT NULL,
  `last_checkpoint` float(26,2) DEFAULT NULL,
  `queries_inside` float(26,2) DEFAULT NULL,
  `queries_queued` float(26,2) DEFAULT NULL,
  `read_views` float(26,2) DEFAULT NULL,
  `innodb_open_files` float(26,2) DEFAULT NULL,
  `innodb_log_waits` float(26,2) DEFAULT NULL,
  `snap_time` datetime DEFAULT NULL,
  UNIQUE (`id`,`snap_time`),
  KEY `idx_myawr_innodb_info_snap_host_id` (`snap_id`,`host_id`),
  KEY `idx_myawr_innodb_info_snap_time` (`snap_time`),
  KEY `idx_myawr_innodb_info_host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22802 DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;


CREATE TABLE `myawr_io_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snap_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `rd_ios_s` float(10,2) DEFAULT NULL,
  `wr_ios_s` float(10,2) DEFAULT NULL,
  `rkbs` float(10,2) DEFAULT NULL,
  `wkbs` float(10,2) DEFAULT NULL,
  `queue` float(10,2) DEFAULT NULL,
  `wait` float(10,2) DEFAULT NULL,
  `svc_t` float(10,2) DEFAULT NULL,
  `busy` float(10,2) DEFAULT NULL,
  `snap_time` datetime DEFAULT NULL,
  UNIQUE (`id`,`snap_time`),
  KEY `idx_myawr_io_info_snap_time` (`snap_time`),
  KEY `idx_myawr_io_info_snap_host_id` (`snap_id`,`host_id`),
  KEY `idx_myawr_io_info_host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22806 DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;

CREATE TABLE `myawr_isam_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snap_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `key_buffer_size` float(26,2) DEFAULT NULL,
  `join_buffer_size` float(26,2) DEFAULT NULL,
  `sort_buffer_size` float(26,2) DEFAULT NULL,
  `Key_blocks_not_flushed` float(26,2) DEFAULT NULL,
  `Key_blocks_unused` float(26,2) DEFAULT NULL,
  `Key_blocks_used` float(26,2) DEFAULT NULL,
  `Key_read_requests` float(26,2) DEFAULT NULL,
  `Key_reads` float(26,2) DEFAULT NULL,
  `Key_write_requests` float(26,2) DEFAULT NULL,
  `Key_writes` float(26,2) DEFAULT NULL,
  `snap_time` datetime DEFAULT NULL,
   UNIQUE (`id`,`snap_time`),
  KEY `idx_myawr_isam_info_snap_time` (`snap_time`),
  KEY `idx_myawr_isam_info_snap_host_id` (`snap_id`,`host_id`),
  KEY `idx_myawr_isam_info_host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22802 DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;


CREATE TABLE `myawr_load_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snap_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `load1` float(10,2) DEFAULT NULL,
  `load5` float(10,2) DEFAULT NULL,
  `load15` float(10,2) DEFAULT NULL,
  `snap_time` datetime DEFAULT NULL,
   UNIQUE (`id`,`snap_time`),
  KEY `idx_myawr_load_info_snap_time` (`snap_time`),
  KEY `idx_myawr_load_info_snap_host_id` (`snap_id`,`host_id`),
  KEY `idx_myawr_load_info_host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22806 DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;



CREATE TABLE `myawr_mysql_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snap_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `query_cache_size` float(26,2) DEFAULT NULL,
  `thread_cache_size` float(26,2) DEFAULT NULL,
  `table_definition_cache` float(26,2) DEFAULT NULL,
  `max_connections` float(26,2) DEFAULT NULL,
  `table_open_cache` float(26,2) DEFAULT NULL,
  `slow_launch_time` float(26,2) DEFAULT NULL,
  `log_slow_queries` float(26,2) DEFAULT NULL,
  `max_heap_table_size` float(26,2) DEFAULT NULL,
  `tmp_table_size` float(26,2) DEFAULT NULL,
  `open_files_limit` float(26,2) DEFAULT NULL,
  `Max_used_connections` float(26,2) DEFAULT NULL,
  `Threads_connected` float(26,2) DEFAULT NULL,
  `Threads_cached` float(26,2) DEFAULT NULL,
  `Threads_created` float(26,2) DEFAULT NULL,
  `Threads_running` float(26,2) DEFAULT NULL,
  `Connections` float(26,2) DEFAULT NULL,
  `Questions` float(26,2) DEFAULT NULL,
  `Com_select` float(26,2) DEFAULT NULL,
  `Com_insert` float(26,2) DEFAULT NULL,
  `Com_update` float(26,2) DEFAULT NULL,
  `Com_delete` float(26,2) DEFAULT NULL,
  `Bytes_received` float(26,2) DEFAULT NULL,
  `Bytes_sent` float(26,2) DEFAULT NULL,
  `Qcache_hits` float(26,2) DEFAULT NULL,
  `Qcache_inserts` float(26,2) DEFAULT NULL,
  `Select_full_join` float(26,2) DEFAULT NULL,
  `Select_scan` float(26,2) DEFAULT NULL,
  `Slow_queries` float(26,2) DEFAULT NULL,
  `Com_commit` float(26,2) DEFAULT NULL,
  `Com_rollback` float(26,2) DEFAULT NULL,
  `Open_files` float(26,2) DEFAULT NULL,
  `Open_table_definitions` float(26,2) DEFAULT NULL,
  `Open_tables` float(26,2) DEFAULT NULL,
  `Opened_files` float(26,2) DEFAULT NULL,
  `Opened_table_definitions` float(26,2) DEFAULT NULL,
  `Opened_tables` float(26,2) DEFAULT NULL,
  `Created_tmp_disk_tables` float(26,2) DEFAULT NULL,
  `Created_tmp_files` float(26,2) DEFAULT NULL,
  `Created_tmp_tables` float(26,2) DEFAULT NULL,
  `Binlog_cache_disk_use` float(26,2) DEFAULT NULL,
  `Binlog_cache_use` float(26,2) DEFAULT NULL,
  `Aborted_clients` float(26,2) DEFAULT NULL,
  `Sort_merge_passes` float(26,2) DEFAULT NULL,
  `Sort_range` float(26,2) DEFAULT NULL,
  `Sort_rows` float(26,2) DEFAULT NULL,
  `Sort_scan` float(26,2) DEFAULT NULL,
  `Table_locks_immediate` float(26,2) DEFAULT NULL,
  `Table_locks_waited` float(26,2) DEFAULT NULL,
  `Handler_read_first` float(26,2) DEFAULT NULL,
  `Handler_read_key` float(26,2) DEFAULT NULL,
  `Handler_read_last` float(26,2) DEFAULT NULL,
  `Handler_read_next` float(26,2) DEFAULT NULL,
  `Handler_read_prev` float(26,2) DEFAULT NULL,
  `Handler_read_rnd` float(26,2) DEFAULT NULL,
  `Handler_read_rnd_next` float(26,2) DEFAULT NULL,
  `snap_time` datetime DEFAULT NULL,
   UNIQUE (`id`,`snap_time`),
  KEY `idx_myawr_mysql_info_snap_time` (`snap_time`),
  KEY `idx_myawr_mysql_info_snap_host_id` (`snap_id`,`host_id`),
  KEY `idx_myawr_mysql_info_host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22802 DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;





CREATE TABLE `myawr_snapshot_events_waits_summary_global_by_event_name` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snap_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `EVENT_NAME` varchar(128) NOT NULL,
  `COUNT_STAR` bigint(20) unsigned NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL,
  `snap_time` datetime DEFAULT NULL,
   UNIQUE (`id`,`snap_time`),
  KEY `idx_waits_summary_global_snap_time` (`snap_time`),
  KEY `idx_waits_summary_global_snap_host_id` (`snap_id`,`host_id`),
  KEY `idx_waits_summary_global_host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5058638 DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;


CREATE TABLE `myawr_snapshot_file_summary_by_event_name` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snap_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `EVENT_NAME` varchar(128) NOT NULL,
  `COUNT_READ` bigint(20) unsigned NOT NULL,
  `COUNT_WRITE` bigint(20) unsigned NOT NULL,
  `SUM_NUMBER_OF_BYTES_READ` bigint(20) unsigned NOT NULL,
  `SUM_NUMBER_OF_BYTES_WRITE` bigint(20) unsigned NOT NULL,
  `snap_time` datetime DEFAULT NULL,
   UNIQUE (`id`,`snap_time`),
  KEY `idx_file_summary_by_event_snap_time` (`snap_time`),
  KEY `idx_file_summary_by_event_snap_host_id` (`snap_id`,`host_id`),
  KEY `idx_file_summary_by_event_host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1022861 DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;


CREATE TABLE `myawr_snapshot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NOT NULL,
  `snap_time` datetime NOT NULL,
  `snap_id` int(11) DEFAULT NULL,
   UNIQUE (`id`,`snap_time`),
  KEY `idx_myawr_snapshot_snap_time` (`snap_time`),
  KEY `idx_myawr_snapshot_host_id` (`host_id`,`snap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22805 DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;


CREATE TABLE `myawr_swap_net_disk_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snap_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `swap_in` float(10,2) DEFAULT NULL,
  `swap_out` float(10,2) DEFAULT NULL,
  `net_recv` float(10,2) DEFAULT NULL,
  `net_send` float(10,2) DEFAULT NULL,
  `file_system` varchar(50) DEFAULT NULL,
  `total_mb` float(10,2) DEFAULT NULL,
  `used_mb` float(10,2) DEFAULT NULL,
  `used_pct` float(10,2) DEFAULT NULL,
  `mount_point` varchar(50) DEFAULT NULL,
  `snap_time` datetime DEFAULT NULL,
   UNIQUE (`id`,`snap_time`),
  KEY `idx_myawr_swap_net_info_snap_time` (`snap_time`),
  KEY `idx_myawr_swap_net_info_snap_host_id` (`snap_id`,`host_id`),
  KEY `idx_myawr_swap_net_info_host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22817 DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;


CREATE TABLE `myawr_query_review` (
  `checksum` bigint(20) unsigned NOT NULL,
  `fingerprint` text NOT NULL,
  `sample` longtext NOT NULL,
  `first_seen` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `reviewed_by` varchar(20) DEFAULT NULL,
  `reviewed_on` datetime DEFAULT NULL,
  `comments` text,
  `reviewed_status` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`checksum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `myawr_query_review_history` (
  `hostid_max` int(11) DEFAULT NULL,
  `db_max` varchar(64) DEFAULT NULL,
  `checksum` bigint(20) unsigned NOT NULL,
  `sample` text NOT NULL,
  `ts_min` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `ts_max` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `ts_cnt` float DEFAULT NULL,
  `Query_time_sum` float DEFAULT NULL,
  `Query_time_min` float DEFAULT NULL,
  `Query_time_max` float DEFAULT NULL,
  `Query_time_pct_95` float DEFAULT NULL,
  `Query_time_stddev` float DEFAULT NULL,
  `Query_time_median` float DEFAULT NULL,
  `Lock_time_sum` float DEFAULT NULL,
  `Lock_time_min` float DEFAULT NULL,
  `Lock_time_max` float DEFAULT NULL,
  `Lock_time_pct_95` float DEFAULT NULL,
  `Lock_time_stddev` float DEFAULT NULL,
  `Lock_time_median` float DEFAULT NULL,
  `Rows_sent_sum` float DEFAULT NULL,
  `Rows_sent_min` float DEFAULT NULL,
  `Rows_sent_max` float DEFAULT NULL,
  `Rows_sent_pct_95` float DEFAULT NULL,
  `Rows_sent_stddev` float DEFAULT NULL,
  `Rows_sent_median` float DEFAULT NULL,
  `Rows_examined_sum` float DEFAULT NULL,
  `Rows_examined_min` float DEFAULT NULL,
  `Rows_examined_max` float DEFAULT NULL,
  `Rows_examined_pct_95` float DEFAULT NULL,
  `Rows_examined_stddev` float DEFAULT NULL,
  `Rows_examined_median` float DEFAULT NULL,
  `Rows_affected_sum` float DEFAULT NULL,
  `Rows_affected_min` float DEFAULT NULL,
  `Rows_affected_max` float DEFAULT NULL,
  `Rows_affected_pct_95` float DEFAULT NULL,
  `Rows_affected_stddev` float DEFAULT NULL,
  `Rows_affected_median` float DEFAULT NULL,
  `Rows_read_sum` float DEFAULT NULL,
  `Rows_read_min` float DEFAULT NULL,
  `Rows_read_max` float DEFAULT NULL,
  `Rows_read_pct_95` float DEFAULT NULL,
  `Rows_read_stddev` float DEFAULT NULL,
  `Rows_read_median` float DEFAULT NULL,
  `Merge_passes_sum` float DEFAULT NULL,
  `Merge_passes_min` float DEFAULT NULL,
  `Merge_passes_max` float DEFAULT NULL,
  `Merge_passes_pct_95` float DEFAULT NULL,
  `Merge_passes_stddev` float DEFAULT NULL,
  `Merge_passes_median` float DEFAULT NULL,
  `InnoDB_IO_r_ops_min` float DEFAULT NULL,
  `InnoDB_IO_r_ops_max` float DEFAULT NULL,
  `InnoDB_IO_r_ops_pct_95` float DEFAULT NULL,
  `InnoDB_IO_r_ops_stddev` float DEFAULT NULL,
  `InnoDB_IO_r_ops_median` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_min` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_max` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_pct_95` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_stddev` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_median` float DEFAULT NULL,
  `InnoDB_IO_r_wait_min` float DEFAULT NULL,
  `InnoDB_IO_r_wait_max` float DEFAULT NULL,
  `InnoDB_IO_r_wait_pct_95` float DEFAULT NULL,
  `InnoDB_IO_r_wait_stddev` float DEFAULT NULL,
  `InnoDB_IO_r_wait_median` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_min` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_max` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_pct_95` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_stddev` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_median` float DEFAULT NULL,
  `InnoDB_queue_wait_min` float DEFAULT NULL,
  `InnoDB_queue_wait_max` float DEFAULT NULL,
  `InnoDB_queue_wait_pct_95` float DEFAULT NULL,
  `InnoDB_queue_wait_stddev` float DEFAULT NULL,
  `InnoDB_queue_wait_median` float DEFAULT NULL,
  `InnoDB_pages_distinct_min` float DEFAULT NULL,
  `InnoDB_pages_distinct_max` float DEFAULT NULL,
  `InnoDB_pages_distinct_pct_95` float DEFAULT NULL,
  `InnoDB_pages_distinct_stddev` float DEFAULT NULL,
  `InnoDB_pages_distinct_median` float DEFAULT NULL,
  `QC_Hit_cnt` float DEFAULT NULL,
  `QC_Hit_sum` float DEFAULT NULL,
  `Full_scan_cnt` float DEFAULT NULL,
  `Full_scan_sum` float DEFAULT NULL,
  `Full_join_cnt` float DEFAULT NULL,
  `Full_join_sum` float DEFAULT NULL,
  `Tmp_table_cnt` float DEFAULT NULL,
  `Tmp_table_sum` float DEFAULT NULL,
  `Tmp_table_on_disk_cnt` float DEFAULT NULL,
  `Tmp_table_on_disk_sum` float DEFAULT NULL,
  `Filesort_cnt` float DEFAULT NULL,
  `Filesort_sum` float DEFAULT NULL,
  `Filesort_on_disk_cnt` float DEFAULT NULL,
  `Filesort_on_disk_sum` float DEFAULT NULL,
  PRIMARY KEY (`checksum`,`ts_min`,`ts_max`),
  KEY `idx_myawr_query_review_history_host_id` (`hostid_max`,`ts_max`),
  KEY `idx_myawr_query_review_history_ts_max` (`ts_max`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(ts_max))
PARTITIONS 365;

CREATE  TABLE `myawr_innodb_locks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snap_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `lock_id` varchar(81) NOT NULL DEFAULT '',
  `lock_trx_id` varchar(18) NOT NULL DEFAULT '',
  `lock_mode` varchar(32) NOT NULL DEFAULT '',
  `lock_type` varchar(32) NOT NULL DEFAULT '',
  `lock_table` varchar(1024) NOT NULL DEFAULT '',
  `lock_index` varchar(1024) DEFAULT NULL,
  `lock_space` bigint(21) unsigned DEFAULT NULL,
  `lock_page` bigint(21) unsigned DEFAULT NULL,
  `lock_rec` bigint(21) unsigned DEFAULT NULL,
  `lock_data` varchar(8192) DEFAULT NULL,
  `snap_time` datetime DEFAULT NULL,
  UNIQUE (`id`,`snap_time`),
  KEY `idx_myawr_innodb_info_snap_host_id` (`snap_id`,`host_id`),
  KEY `idx_myawr_innodb_info_snap_time` (`snap_time`),
  KEY `idx_myawr_innodb_info_host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;


CREATE  TABLE `myawr_innodb_trx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snap_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `trx_id` varchar(18) NOT NULL DEFAULT '',
  `trx_state` varchar(13) NOT NULL DEFAULT '',
  `trx_started` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `trx_requested_lock_id` varchar(81) DEFAULT NULL,
  `trx_wait_started` datetime DEFAULT NULL,
  `trx_weight` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_mysql_thread_id` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_query` varchar(1024) DEFAULT NULL,
  `trx_operation_state` varchar(64) DEFAULT NULL,
  `trx_tables_in_use` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_tables_locked` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_lock_structs` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_lock_memory_bytes` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_rows_locked` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_rows_modified` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_concurrency_tickets` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_isolation_level` varchar(16) NOT NULL DEFAULT '',
  `trx_unique_checks` int(1) NOT NULL DEFAULT '0',
  `trx_foreign_key_checks` int(1) NOT NULL DEFAULT '0',
  `trx_last_foreign_key_error` varchar(256) DEFAULT NULL,
  `trx_adaptive_hash_latched` int(1) NOT NULL DEFAULT '0',
  `trx_adaptive_hash_timeout` bigint(21) unsigned NOT NULL DEFAULT '0',
  `snap_time` datetime DEFAULT NULL,
  UNIQUE (`id`,`snap_time`),
  KEY `idx_myawr_innodb_info_snap_host_id` (`snap_id`,`host_id`),
  KEY `idx_myawr_innodb_info_snap_time` (`snap_time`),
  KEY `idx_myawr_innodb_info_host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;

CREATE  TABLE `myawr_innodb_lock_waits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snap_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `requesting_trx_id` varchar(18) NOT NULL DEFAULT '',
  `requested_lock_id` varchar(81) NOT NULL DEFAULT '',
  `blocking_trx_id` varchar(18) NOT NULL DEFAULT '',
  `blocking_lock_id` varchar(81) NOT NULL DEFAULT '',
  `snap_time` datetime DEFAULT NULL,
  UNIQUE (`id`,`snap_time`),
  KEY `idx_myawr_innodb_info_snap_host_id` (`snap_id`,`host_id`),
  KEY `idx_myawr_innodb_info_snap_time` (`snap_time`),
  KEY `idx_myawr_innodb_info_host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;


CREATE  TABLE `myawr_active_session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snap_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `USER` varchar(16) NOT NULL DEFAULT '',
  `HOST` varchar(64) NOT NULL DEFAULT '',
  `DB` varchar(64) DEFAULT NULL,
  `COMMAND` varchar(16) NOT NULL DEFAULT '',
  `TIME` int(7) NOT NULL DEFAULT '0',
  `STATE` varchar(64) DEFAULT NULL,
  `INFO` longtext,
  `snap_time` datetime DEFAULT NULL,
  UNIQUE (`id`,`snap_time`),
  KEY `idx_myawr_innodb_info_snap_host_id` (`snap_id`,`host_id`),
  KEY `idx_myawr_innodb_info_snap_time` (`snap_time`),
  KEY `idx_myawr_innodb_info_host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;


CREATE TABLE `myawr_engine_innodb_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snap_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `row_status` varchar(4000) DEFAULT NULL,
  `snap_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  UNIQUE (`id`,`snap_time`),
  KEY `idx_myawr_innodb_info_snap_host_id` (`snap_id`,`host_id`),
  KEY `idx_myawr_innodb_info_snap_time` (`snap_time`),
  KEY `idx_myawr_innodb_info_host_id` (`host_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY HASH (to_days(snap_time))
PARTITIONS 365;

alter  TABLE `myawr_host` add ( `times_per_hour` int(11) DEFAULT 0);

alter  TABLE `myawr_host` modify `running_thread_threshold` int(11) DEFAULT 10000;
