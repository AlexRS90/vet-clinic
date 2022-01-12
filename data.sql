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