DROP TRIGGER IF EXISTS trg_id_change_trail;
DELIMITER $$    
CREATE TRIGGER `trg_id_change_trail` AFTER UPDATE ON person_identifier FOR EACH ROW
    BEGIN  
    DECLARE variable_name VARCHAR(40);	
	  IF NEW.modified_at > OLD.date_created AND OLD.identifier_type_id=12 AND 
		NEW.identifier_type_id=12 AND OLD.identifier != NEW.identifier THEN 
		    SET variable_name='STUDY ID';
			  END IF;
			  IF NEW.modified_at > OLD.date_created AND OLD.identifier_type_id=1 AND 
				NEW.identifier_type_id=1 AND OLD.identifier != NEW.identifier THEN 
					SET variable_name='CCC NUMBER'; 
					  END IF;
					    IF NEW.modified_at > OLD.date_created AND OLD.identifier_type_id=9 AND 
				          NEW.identifier_type_id=9 AND OLD.identifier != NEW.identifier THEN 
					       SET variable_name='ANC NUMBER'; 
						    END IF;
							  IF OLD.identifier != NEW.identifier AND variable_name != '' AND variable_name IS NOT NULL THEN
                                   INSERT INTO audit_trail (person_id, variable_name,old_value, new_value)
									VALUES (OLD.person_id, variable_name,OLD.identifier, NEW.identifier);
									END IF;
       END $$
DELIMITER ;
