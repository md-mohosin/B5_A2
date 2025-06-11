-- Active: 1748020759028@@127.0.0.1@5432@conservation_db
CREATE DATABASE conservation_db




-- RANGERS TABLE CREATE ********
CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    ranger_name VARCHAR(50),
    region VARCHAR(50)
)

INSERT INTO rangers (ranger_name, region) VALUES
('Abdul Karim', 'East Range'),
('Fatema Khatun', 'West Range'),
('John Gomes', 'South Zone'),
('Mizanur Rahman', 'Wildlife Core Area'),
('Rahima Akter', 'Buffer Zone'),
('Kamal Hossain', 'North Block'),
('Shirin Sultana', 'Deep Forest Area'),
('Raju Ahmed', 'Central Range'),
('Tania Begum', 'River Edge Zone'),
('Elias Mollah', 'Mangrove Belt');








-- SPECIES TABLE CREATE *********
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50),
    scientific_name VARCHAR(50),
    discovery_date VARCHAR(50),
    conservation_status VARCHAR(50)
)

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Royal Bengal Tiger', 'Panthera tigris tigris', '1758', 'Endangered'),
('Asian Elephant', 'Elephas maximus', '1758', 'Endangered'),
('Indian Peafowl', 'Pavo cristatus', '1758', 'Least Concern'),
('Ganges River Dolphin', 'Platanista gangetica', '1801', 'Endangered'),
('Saltwater Crocodile', 'Crocodylus porosus', '1807', 'Least Concern'),
('Indian Cobra', 'Naja naja', '1758', 'Least Concern'),
('Chital Deer', 'Axis axis', '1827', 'Least Concern'),
('Great Hornbill', 'Buceros bicornis', '1976', 'Vulnerable'),
('Asian Black Bear', 'Ursus thibetanus', '1923', 'Vulnerable'),
('Indian Star Tortoise', 'Geochelone elegans', '1802', 'Vulnerable');






-- SIGHTINGS TABLE CREATE *******
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    species_id INTEGER REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location VARCHAR(50),
    notes VARCHAR(100)
)

INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes) VALUES
(3, 3, '2025-06-01 08:15:00', 'West Range', 'Spotted near waterhole'),
(7, 1, '2025-06-02 06:45:00', 'East Range', 'Roaring sound heard'),
(1, 5, '2025-06-03 11:30:00', 'Buffer Pass', 'Resting under tree'),
(1, 3, '2025-06-04 09:20:00', 'Deep Forest Area', 'Herd of elephants observed'),
(3, 6, '2025-06-05 17:50:00', 'River Edge Zone',NULL),
(4, 4, '2025-06-06 07:00:00', 'Central Pass', 'One dolphin spotted'),
(2, 9, '2025-06-07 12:10:00', 'North Block', 'Feeding on leaves'),
(1, 7, '2025-06-08 14:35:00', 'South Zone', 'Running across open space'),
(8, 10, '2025-06-09 10:05:00', 'Mangrove Belt',NULL),
(5, 8, '2025-06-10 15:25:00', 'Wildlife Core', 'Bird flying low');
