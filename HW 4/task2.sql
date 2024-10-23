-- task2.sql

-- Insert 'Fluffy' event
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

-- Insert 'Hammy' into petPet
INSERT INTO petPet (petname, owner, species, gender, birth, death)
VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL);

-- Insert 'Hammy' event
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

-- Update Fluffy's kittens event
UPDATE petEvent
SET remark = '5 kittens, 2 male, 3 female'
WHERE petname = 'Fluffy' AND eventdate = '1995-05-15';

-- Insert Claws' broken rib event
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Claws', '1997-08-03', 'vet', 'broken rib');

-- Update Puffball's death date
UPDATE petPet
SET death = '2020-09-01'
WHERE petname = 'Puffball';

-- Remove Harold's dog (Buffy) due to GDPR
DELETE FROM petPet
WHERE petname = 'Buffy';
