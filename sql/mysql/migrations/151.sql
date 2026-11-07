ALTER TABLE ttrss_scheduled_tasks ADD COLUMN owner_uid integer DEFAULT NULL;
ALTER TABLE ttrss_scheduled_tasks ADD COLUMN last_cron_expression varchar(250);

UPDATE ttrss_scheduled_tasks SET last_cron_expression = '';

ALTER TABLE ttrss_scheduled_tasks MODIFY COLUMN last_cron_expression varchar(250) NOT NULL;

ALTER TABLE ttrss_scheduled_tasks ADD FOREIGN KEY (owner_uid) REFERENCES ttrss_users(id) ON DELETE CASCADE;
