create table audit_trail
(
 audit_entry_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 person_id INT NOT NULL,
 variable_name varchar(15),
 old_value varchar(15),
 new_value varchar(15),
 time_changed TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);