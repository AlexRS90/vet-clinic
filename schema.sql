CREATE TABLE animals (
  id INT,
  animal_name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg FLOAT,
  PRIMARY KEY (id)
);

ALTER TABLE animals
ADD species VARCHAR(20);

CREATE TABLE owners (
  id SERIAL,
  full_name VARCHAR(100),
  age INT,
  PRIMARY KEY (id)
);

CREATE TABLE species (
  id SERIAL,
  name VARCHAR (20),
  PRIMARY KEY (id)
);

CREATE SEQUENCE animal_id
OWNED BY animals.id;

ALTER TABLE animals
ALTER COLUMN id SET DEFAULT nextval('animal_id');

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners (id);

ALTER TABLE animals
ADD species_id INT;

ALTER TABLE animals
ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species (id);

CREATE TABLE vets (
  id SERIAL,
  vet_name VARCHAR(100),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY (id)
);

CREATE TABLE specializations (
  species_id INT,
  vets_id INT,
  CONSTRAINT speciesFK FOREIGN KEY (species_id)
  REFERENCES species(id),
  CONSTRAINT vetsFK FOREIGN KEY (vets_id)
  REFERENCES vets(id)
);

CREATE TABLE visits (
  animal_id INT,
  vets_id INT,
  visit_date DATE,
  CONSTRAINT animalFK FOREIGN KEY (animal_id)
  REFERENCES animals(id),
  CONSTRAINT vetsFK FOREIGN KEY (vets_id)
  REFERENCES vets(id)
);

ALTER TABLE owners 
ADD COLUMN email VARCHAR(120);

CREATE INDEX visits_asc ON visits (animal_id ASC);

CREATE INDEX vet_id_asc ON visits (vet_id ASC);

CREATE INDEX owners_index_ASC ON owners(email ASC);