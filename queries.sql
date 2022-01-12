SELECT * FROM animals WHERE animal_name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth >= '01-01-2016'::date AND date_of_birth <= '12-31-2019'::date;
SELECT * FROM animals WHERE neutered IN (true) AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE animal_name IN ('Agumon', 'Pikachu');
SELECT animal_name, escape_attempts FROM animals where weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IN (true);
SELECT * FROM animals WHERE animal_name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.3 AND 17.4; 
BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE animal_name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species is NULL;
COMMIT;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '01-01-2022';
SELECT * FROM animals;
SAVEPOINT ROWS9;
UPDATE animals
SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO ROWS9;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;
SELECT COUNT (*) FROM animals;
SELECT COUNT (*) FROM animals WHERE escape_attempts = 0;
SELECT AVG (weight_kg) FROM animals;
SELECT neutered, SUM (escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN (weight_kg), MAX (weight_kg) FROM animals GROUP BY species;
SELECT species, AVG (escape_attempts) FROM animals WHERE date_of_birth >= '01-01-1990'::date AND date_of_birth <= '12-31-2000'::date GROUP BY species;

SELECT animal_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animal_name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT animal_name, full_name FROM animals FULL OUTER JOIN owners ON animals.owner_id = owners.id;
SELECT name, COUNT(species_id) FROM species JOIN animals ON animals.species_id = species.id GROUP BY species.name;
SELECT animal_name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
SELECT full_name, animal_name, escape_attempts FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = 0;
SELECT full_name, COUNT (full_name) AS number_of_animals from owners JOIN animals ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY number_of_animals DESC LIMIT 1;