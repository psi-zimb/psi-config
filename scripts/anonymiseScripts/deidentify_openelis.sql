-- This script will annonimize the patient date in clinlims DB.


TRUNCATE failed_events;

UPDATE person_address
SET value = concat('address1-', person_id)
FROM address_part
WHERE part_name = 'level1' AND person_address.address_part_id = address_part.id 
AND person_address.value IS NOT NULL;

-- This block with annonimize the patient's First, Middle and Last Name.

UPDATE person
SET first_name = concat('Annon-FN', ID), last_name = concat('Annon-LN', ID), middle_name = concat('Annon-MN', ID)
WHERE id IS NOT NULL;

UPDATE system_user
SET login_name = concat('user-', login_user.id)
FROM login_user
WHERE login_user.login_name = system_user.login_name AND system_user.login_name NOT IN ('admin');

UPDATE login_user
SET login_name = concat('user-', id)
WHERE login_name NOT IN ('admin');

-- Set every one's password as adminADMIN!
UPDATE login_user
SET password = 'n2OrWHXVm/BQsgd1YZJoCA==';

UPDATE system_user
SET login_name = concat('userwologin-', id)
WHERE login_name NOT IN (Select login_name from login_user);

UPDATE system_user
SET first_name = login_name,
	last_name = login_name



-- Instruction to run: "psql -Uclinlims -f /bahmni/deidentify_openelis.sql"

