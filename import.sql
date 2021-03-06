CREATE DATABASE ragnarok;
CREATE USER ragnarok@localhost IDENTIFIED BY 'ragnarok';
GRANT ALL PRIVILEGES ON ragnarok.* to ragnarok@localhost IDENTIFIED BY 'ragnarok';
flush privileges;
USE ragnarok;
source /var/lib/mysql/main.sql;
source /var/lib/mysql/logs.sql;
source /var/lib/mysql/item_db.sql;
source /var/lib/mysql/item_db2.sql;
source /var/lib/mysql/item_cash_db.sql;
source /var/lib/mysql/item_cash_db2.sql;
source /var/lib/mysql/mob_db.sql;
source /var/lib/mysql/mob_db2.sql;
source /var/lib/mysql/mob_db_re.sql;
source /var/lib/mysql/mob_skill_db.sql;
source /var/lib/mysql/mob_skill_db2.sql;
source /var/lib/mysql/mob_skill_db_re.sql;