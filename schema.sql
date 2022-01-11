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