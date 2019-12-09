Master 
* change postgresql.conf master
`nano /etc/postgresql/9.5/main/postgresql.conf`

```
listen_addresses = '*'
wal_level = hot_standby
wal_log_hints = on
max_wal_senders = 8             # max number of walsender processes
wal_keep_segments = 64
hot_standby = on
```
* change pg_hba.conf master
`nano /etc/postgresql/9.5/main/pg_hba.conf`

```
host all all {ip}/32 md5
host replication postgres {ip}}/32 md5
```
Master command
`pgbench -h localhost -p 5432 -U postgres -c 50 -j 2 -P 60 -T 600 test1`
CREATE TABLE weather2 ( city varchar(80), temp_lo int );
Slave command after remove `/var/lib/postgresql/9.5/main`
`pg_basebackup -P -R -X stream -c fast -h {ip_master} -U postgres -D ./main`

Slave 2 command after remove `/var/lib/postgresql/9.5/main`
`pg_basebackup -P -R -X stream -c fast -h {ip_master} -U postgres -D ./main`
Change `/var/lib/postgresql/9.5/main/recovery.conf`
```
recovery_target_timeline = 'latest'
recovery_min_apply_delay = 10min
```
After fail master this command
`/usr/lib/postgresql/9.5/bin/pg_ctl promote \ -D /var/lib/postgresql/9.5/main/`