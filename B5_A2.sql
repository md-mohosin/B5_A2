-- Active: 1748020759028@@127.0.0.1@5432@conservation_db
CREATE DATABASE conservation_db



-- RANGERS TABLE CREATE
CREATE Table rangers (
    ranger_id UNIQUE SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(50)
)





-- SPECIES TABLE CREATE
CREATE TABLE species (
    species_id UNIQUE SERIAL PRIMARY KEY,
    common_name VARCHAR(50),
    scientific_name VARCHAR(50),
    discovery_date VARCHAR(50),
    conservation_status VARCHAR(50)
)






CREATE TABLE sightings (
    sighting_id UNIQUE SERIAL PRIMARY KEY,
    ranger_id REFERENCES rangers(ranger_id),
    species_id REFERENCES species(species_id),
    sighting_time datetime,
    location VARCHAR(50),
    notes VARCHAR(100)
)