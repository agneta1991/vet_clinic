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