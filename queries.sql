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

SELECT COUNT (animal_name) FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vets_id WHERE vets_id = (SELECT id FROM vets WHERE vet_name = 'Stephanie Mendez');
SELECT vet_name, species.name FROM vets FULL OUTER JOIN specializations ON vets.id = specializations.vets_id FULL OUTER JOIN species ON species.id = specializations.species_id;
SELECT animal_name, visits.visit_date FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vets_id WHERE vet_name = 'Stephanie Mendez' AND (visits.visit_date > '03-31-2020'::date AND visits.visit_date < '08-31-2020'::date);
SELECT animal_name, COUNT (*) AS visits FROM animals JOIN visits ON animals.id = visits.animal_id GROUP BY animal_name HAVING COUNT (*) = (SELECT MAX (visits) FROM (SELECT animal_name, COUNT (*) AS visits FROM animals JOIN visits ON animals.id = visits.animal_id GROUP BY animal_name) animals);
SELECT animal_name, visits.visit_date FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vets_id WHERE vet_name = 'Maisy Smith' ORDER BY visits.visit_date LIMIT 1;
SELECT animal_name, date_of_birth, escape_attempts, neutered, weight_kg, vet_name, age, date_of_graduation, visit_date FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vets_id ORDER BY visits.visit_date DESC LIMIT 1;
SELECT vet_name, COUNT (*) AS atendance FROM vets JOIN visits ON vets.id = visits.vets_id JOIN specializations ON vets.id = specializations.vets_id WHERE specializations.species_id is NULL GROUP BY vet_name;
SELECT COUNT (*), species.name FROM animals JOIN species ON animals.species_id = species.id JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vets_id WHERE vets.vet_name = 'Maisy Smith' GROUP BY species.name LIMIT 1;

SELECT COUNT(*) FROM visits where animal_id = 4;
SELECT * FROM visits where vets_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';