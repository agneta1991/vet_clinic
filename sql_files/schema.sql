CREATE TABLE animals (
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(50),
  date_of_birth date,
  escape_attempts INT,
  neutered boolean,
  weight_kg decimal(6, 2),
  PRIMARY KEY(id)
);
ALTER TABLE animals
ADD COLUMN species VARCHAR(50);

CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name varchar(100),
  age INT,
  PRIMARY KEY(id)
);

CREATE TABLE species (
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(50),
  PRIMARY KEY(id)
);

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

ALTER TABLE animals DROP COLUMN species;

CREATE TABLE vets (
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(100),
  age INT,
  date_of_graduation date,
  PRIMARY KEY(id)
);

CREATE TABLE specializations (
    vet_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
    visit_id SERIAL PRIMARY KEY,
    animal_id INT REFERENCES animals(id),
    vet_id INT REFERENCES vets(id),
    date_of_visit DATE,
    CONSTRAINT fk_animal
        FOREIGN KEY (animal_id)
        REFERENCES animals(id),
    CONSTRAINT fk_vet
        FOREIGN KEY (vet_id)
        REFERENCES vets(id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


CREATE INDEX index_animal_id ON visits(animal_id asc);
CREATE INDEX index_vet_id ON visits(vet_id asc);
CREATE INDEX index_email ON owners(email asc);

