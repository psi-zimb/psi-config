mysql -u root openmrs -ppassword -e 'update prep_oi_counter set next_seq_value=1 where seq_type is not null'
