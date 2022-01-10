SELECT * FROM animals WHERE animal_name LIKE '%mon%';
SELECT * FROM animals WHERE date_of_bird >= '01-01-2016'::date AND date_of_bird <= '12-31-2019'::date;
SELECT * FROM animals WHERE neutered IN (true) AND escape_attempts < 3;
SELECT date_of_bird FROM animals WHERE animal_name IN ('Agumon', 'Pikachu');
SELECT animal_name, escape_attempts FROM animals where weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IN (true);
SELECT * FROM animals WHERE animal_name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.3 AND 17.4; 