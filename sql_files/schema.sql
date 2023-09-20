/* Database schema to keep the structure of entire database. */

createdb vet_clinic
psql vet_clinic

CREATE TABLE animals (
    id INT not null,
    name varchar(100) not null,
    date_of_births DATE,
    escape_attempts INT,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY (id)
);

ALTER TABLE animals
ADD species varchar(100);

-- MULTIPLE TABLES
-- 
-- 
CREATE TABLE owners (
    id INT not null,
    full_name varchar(100) not null,
    age int not null,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id INT not null,
    name varchar (100) not null,
    PRIMARY KEY (id)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owner
FOREIGN KEY (owner_id)
REFERENCES owners(id);

