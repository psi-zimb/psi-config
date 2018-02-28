INSERT INTO drug (concept_id, name, creator, date_created, uuid)
  VALUES ((SELECT concept_id FROM concept_name WHERE name = "Tenofovir + Lamivudine + Efavirenz" AND concept_name_type = 'FULLY_SPECIFIED' AND voided = 0), "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 600mg", (SELECT user_id FROM users WHERE username = "superman"), now(), uuid());
INSERT INTO drug (concept_id, name, creator, date_created, uuid)
  VALUES ((SELECT concept_id FROM concept_name WHERE name = "Tenofovir + Lamivudine + Efavirenz" AND concept_name_type = 'FULLY_SPECIFIED' AND voided = 0), "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 400mg", (SELECT user_id FROM users WHERE username = "superman"), now(), uuid());
INSERT INTO drug (concept_id, name, creator, date_created, uuid)
  VALUES ((SELECT concept_id FROM concept_name WHERE name = "Zidovudine + Lamivudine + Nevirapine" AND concept_name_type = 'FULLY_SPECIFIED' AND voided = 0), "Zidovudine (AZT) 300mg + Lamivudine (3TC) 150mg + Nevirapine (NVP) 200mg", (SELECT user_id FROM users WHERE username = "superman"), now(), uuid());
INSERT INTO drug (concept_id, name, creator, date_created, uuid)
  VALUES ((SELECT concept_id FROM concept_name WHERE name = "Zidovudine + Lamivudine + Nevirapine" AND concept_name_type = 'FULLY_SPECIFIED' AND voided = 0), "Zidovudine (AZT) 60mg + Lamivudine (3TC) 30mg + Nevirapine (NVP) 50mg", (SELECT user_id FROM users WHERE username = "superman"), now(), uuid());
INSERT INTO drug (concept_id, name, creator, date_created, uuid)
  VALUES ((SELECT concept_id FROM concept_name WHERE name = "Tenofovir + Lamivudine" AND concept_name_type = 'FULLY_SPECIFIED' AND voided = 0), "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg", (SELECT user_id FROM users WHERE username = "superman"), now(), uuid());
INSERT INTO drug (concept_id, name, creator, date_created, uuid)
  VALUES ((SELECT concept_id FROM concept_name WHERE name = "Tenofovir + Emtricitabine" AND concept_name_type = 'FULLY_SPECIFIED' AND voided = 0), "Tenofovir (TDF) 300mg + Emtricitabine 200mg", (SELECT user_id FROM users WHERE username = "superman"), now(), uuid());
INSERT INTO drug (concept_id, name, creator, date_created, uuid)
  VALUES ((SELECT concept_id FROM concept_name WHERE name = "Zidovudine + Lamivudine" AND concept_name_type = 'FULLY_SPECIFIED' AND voided = 0), "Zidovudine (AZT) 300mg + Lamivudine (3TC) 150mg", (SELECT user_id FROM users WHERE username = "superman"), now(), uuid());
INSERT INTO drug (concept_id, name, creator, date_created, uuid)
  VALUES ((SELECT concept_id FROM concept_name WHERE name = "Zidovudine + Lamivudine" AND concept_name_type = 'FULLY_SPECIFIED' AND voided = 0), "Zidovudine (AZT) 60mg + Lamivudine (3TC) 30mg", (SELECT user_id FROM users WHERE username = "superman"), now(), uuid());
INSERT INTO drug (concept_id, name, creator, date_created, uuid)
  VALUES ((SELECT concept_id FROM concept_name WHERE name = "Abacavir/Lamivudine" AND concept_name_type = 'FULLY_SPECIFIED' AND voided = 0), "Abacavir 600mg/Lamivudine 300mg", (SELECT user_id FROM users WHERE username = "superman"), now(), uuid());
INSERT INTO drug (concept_id, name, creator, date_created, uuid)
  VALUES ((SELECT concept_id FROM concept_name WHERE name = "Abacavir/Lamivudine" AND concept_name_type = 'FULLY_SPECIFIED' AND voided = 0), "Abacavir 60mg/Lamivudine 30mg", (SELECT user_id FROM users WHERE username = "superman"), now(), uuid());
INSERT INTO drug (concept_id, name, creator, date_created, uuid)
  VALUES ((SELECT concept_id FROM concept_name WHERE name = "Atazanavir/Rtv" AND concept_name_type = 'FULLY_SPECIFIED' AND voided = 0), "Atazanavir/Rtv 300/100 mg", (SELECT user_id FROM users WHERE username = "superman"), now(), uuid());
INSERT INTO drug (concept_id, name, creator, date_created, uuid)
  VALUES ((SELECT concept_id FROM concept_name WHERE name = "Lopinavir/Rtv" AND concept_name_type = 'FULLY_SPECIFIED' AND voided = 0), "Lopinavir/Rtv 80/20 mg/ml", (SELECT user_id FROM users WHERE username = "superman"), now(), uuid());
INSERT INTO drug (concept_id, name, creator, date_created, uuid)
  VALUES ((SELECT concept_id FROM concept_name WHERE name = "Lopinavir/Rtv" AND concept_name_type = 'FULLY_SPECIFIED' AND voided = 0), "Lopinavir/Rtv 100/25 mg", (SELECT user_id FROM users WHERE username = "superman"), now(), uuid());
INSERT INTO drug (concept_id, name, creator, date_created, uuid)
  VALUES ((SELECT concept_id FROM concept_name WHERE name = "Lopinavir/Rtv" AND concept_name_type = 'FULLY_SPECIFIED' AND voided = 0), "Lopinavir/Rtv 200/50 mg", (SELECT user_id FROM users WHERE username = "superman"), now(), uuid());
