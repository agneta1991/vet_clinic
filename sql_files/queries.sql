/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_births >= '2016-01-01' AND date_of_births <= '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_births FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- TRANSACIONS

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
COMMIT;

BEGIN;
UPDATE animals SET species = 'pokemon'
WHERE species IS NULL OR species = '';
UPDATE animals SET species = 'digimon';
WHERE name LIKE '%mon';
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;


BEGIN;
DELETE FROM animals
WHERE date_of_births > '2022-01-01';
SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO sp1;
UPDATE animals SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

-- QUEIES 
-- How many animals are there?
SELECT COUNT(*)
FROM animals;

-- 2.How many animals have never tried to escape?
SELECT COUNT(*)
FROM animals
WHERE escape_attempts = 0;

-- 3.What is the average weight of animals?
SELECT AVG(weight_kg)
FROM animals;

-- 4.Who escapes the most, neutered or not neutered animals?
SELECT 'Neutered' AS Neutered_Status, SUM(escape_attempts) AS Total_Escape_Attempts
FROM animals
WHERE neutered = true
UNION ALL
SELECT 'Not Neutered' AS Neutered_Status, SUM(escape_attempts) AS Total_Escape_Attempts
FROM animals
WHERE neutered = false;

-- 5.What is the minimum and maximum weight of each type of animal?
SELECT 'pokemon' AS species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
WHERE species = 'pokemon'
UNION ALL
SELECT 'digimon' AS species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
WHERE species = 'digimon';

-- 6.What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) AS Average_Escape_Attempts
FROM animals
WHERE date_of_births > '1990-01-01' AND date_of_births < '2000-12-31';
GROUP BY species;
