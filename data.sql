INSERT INTO animals (id, animal_name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
(1, 'Agumon', '2020-02-03', 0, true, 10.23),
(2, 'Gabumon', '2018-11-15', 2, true, 8),
(3, 'Pikachu', '2021-01-07', 1, false, 15.04),
(4, 'Devimon', '2017-05-12', 5, true, 11),
(5, 'Charmander', '2020-02-08', 0, false, -11),
(6, 'Plantmon', '2022-11-15', 2, true, -5.7),
(7, 'Squirtle', '1993-04-02', 3, false, -12.13),
(8, 'Angemon', '2005-06-12', 1, true, -45),
(9, 'Boarmon', '2005-06-07', 7, true, 20.4),
(10, 'Blossom','1998-10-13', 3, true, 17);

INSERT INTO owners (full_name, age)
VALUES
('Sam Smith' , 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

BEGIN;
UPDATE animals
SET species_id = 2
WHERE animal_name LIKE '%mon';
UPDATE animals
SET species_id = 1
WHERE species_id is NULL;
COMMIT;

BEGIN;
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Agumon' AND owners.full_name = 'Sam Smith';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Pikachu' AND owners.full_name = 'Jennifer Orwell';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Gabumon' AND owners.full_name = 'Jennifer Orwell';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Devimon' AND owners.full_name = 'Bob';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Plantmon' AND owners.full_name = 'Bob';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Charmander' AND owners.full_name = 'Melody Pond';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Squirtle' AND owners.full_name = 'Melody Pond';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Blossom' AND owners.full_name = 'Melody Pond';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Angemon' AND owners.full_name = 'Dean Winchester';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Boarmon' AND owners.full_name = 'Dean Winchester';
COMMIT;

INSERT INTO vets (vet_name, age, date_of_graduation)
VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (species_id, vets_id)
VALUES
((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE vet_name = 'William Tatcher')),
((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE vet_name = 'Stephanie Mendez')),
((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE vet_name = 'Stephanie Mendez')),
((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE vet_name = 'Jack Harkness')),
(NULL, (SELECT id FROM vets WHERE vet_name = 'Maisy Smith'));

INSERT INTO visits (animal_id, vets_id, visit_date)
VALUES
((SELECT id FROM animals WHERE animal_name = 'Agumon'), (SELECT id FROM vets WHERE vet_name = 'William Tatcher'), '2020-05-24'),
((SELECT id FROM animals WHERE animal_name = 'Agumon'), (SELECT id FROM vets WHERE vet_name = 'Stephanie Mendez'), '2020-07-22'),
((SELECT id FROM animals WHERE animal_name = 'Gabumon'), (SELECT id FROM vets WHERE vet_name = 'Jack Harkness'), '2022-02-02'),
((SELECT id FROM animals WHERE animal_name = 'Pikachu'), (SELECT id FROM vets WHERE vet_name = 'Maisy Smith'), '2020-01-05'),
((SELECT id FROM animals WHERE animal_name = 'Pikachu'), (SELECT id FROM vets WHERE vet_name = 'Maisy Smith'), '2020-03-08'),
((SELECT id FROM animals WHERE animal_name = 'Pikachu'), (SELECT id FROM vets WHERE vet_name = 'Maisy Smith'), '2020-05-14'),
((SELECT id FROM animals WHERE animal_name = 'Devimon'), (SELECT id FROM vets WHERE vet_name = 'Stephanie Mendez'), '2021-05-04'),
((SELECT id FROM animals WHERE animal_name = 'Charmander'), (SELECT id FROM vets WHERE vet_name = 'Jack Harkness'), '2021-02-24'),
((SELECT id FROM animals WHERE animal_name = 'Plantmon'), (SELECT id FROM vets WHERE vet_name = 'Maisy Smith'), '2019-12-21'),
((SELECT id FROM animals WHERE animal_name = 'Plantmon'), (SELECT id FROM vets WHERE vet_name = 'William Tatcher'), '2020-08-10'),
((SELECT id FROM animals WHERE animal_name = 'Plantmon'), (SELECT id FROM vets WHERE vet_name = 'Maisy Smith'), '2021-04-07'),
((SELECT id FROM animals WHERE animal_name = 'Squirtle'), (SELECT id FROM vets WHERE vet_name = 'Stephanie Mendez'), '2019-09-29'),
((SELECT id FROM animals WHERE animal_name = 'Angemon'), (SELECT id FROM vets WHERE vet_name = 'Jack Harkness'), '2020-10-03'),
((SELECT id FROM animals WHERE animal_name = 'Angemon'), (SELECT id FROM vets WHERE vet_name = 'Jack Harkness'), '2020-11-04'),
((SELECT id FROM animals WHERE animal_name = 'Boarmon'), (SELECT id FROM vets WHERE vet_name = 'Maisy Smith'), '2019-01-24'),
((SELECT id FROM animals WHERE animal_name = 'Boarmon'), (SELECT id FROM vets WHERE vet_name = 'Maisy Smith'), '2019-05-15'),
((SELECT id FROM animals WHERE animal_name = 'Boarmon'), (SELECT id FROM vets WHERE vet_name = 'Maisy Smith'), '2020-02-27'),
((SELECT id FROM animals WHERE animal_name = 'Boarmon'), (SELECT id FROM vets WHERE vet_name = 'Maisy Smith'), '2020-08-03'),
((SELECT id FROM animals WHERE animal_name = 'Blossom'), (SELECT id FROM vets WHERE vet_name = 'Stephanie Mendez'), '2020-05-24'),
((SELECT id FROM animals WHERE animal_name = 'Blossom'), (SELECT id FROM vets WHERE vet_name = 'William Tatcher'), '2021-01-11');

INSERT INTO visits (animal_id, vetS_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT INTO owners (full_name, email) SELECT 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

INSERT INTO visits (animal_id, vetS_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT INTO owners (full_name, email) SELECT 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

INSERT INTO visits (animal_id, vetS_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT INTO owners (full_name, email) SELECT 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

INSERT INTO visits (animal_id, vetS_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT INTO owners (full_name, email) SELECT 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

