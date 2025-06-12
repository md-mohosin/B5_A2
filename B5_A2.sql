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

SELECT * FROM rangers








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

SELECT * FROM species






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

SELECT * FROM sightings











--```````````````````````````````````````````````````problem~1
INSERT INTO rangers(ranger_name,region) VALUES('Derek Fox', 'Coastal Plains')








--```````````````````````````````````````````````````problem~2
SELECT count(DISTINCT species_id) FROM sightings








--```````````````````````````````````````````````````problem~3
SELECT * FROM sightings WHERE location LIKE '%Pass'








--```````````````````````````````````````````````````problem~4
SELECT ranger_name, count(sighting_id) FROM rangers INNER JOIN sightings ON rangers.ranger_id = sightings.ranger_id GROUP BY rangers.ranger_name









--```````````````````````````````````````````````````problem~5
SELECT common_name FROM species LEFT JOIN sightings ON species.species_id = sightings.species_id WHERE sightings.species_id is NULL









--```````````````````````````````````````````````````problem~6
SELECT common_name,sighting_time,ranger_name FROM sightings JOIN species ON sightings.species_id  = species.species_id JOIN rangers on sightings.ranger_id = rangers.ranger_id
ORDER BY sightings.sighting_time DESC LIMIT 2;










--```````````````````````````````````````````````````problem~7
UPDATE species SET conservation_status = 'Historic' WHERE CAST (discovery_date AS INTEGER) <1800










--```````````````````````````````````````````````````problem~8
SELECT count(sighting_id),
CASE 
  WHEN extract(HOUR FROM sighting_time) < 12 THEN 'Morning'
  WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 and 17 THEN 'Afternoon'
  else 'evening'
END as time_of_day FROM sightings GROUP BY time_of_day;









--```````````````````````````````````````````````````problem~9
DELETE FROM rangers WHERE ranger_id NOT IN(SELECT DISTINCT ranger_id FROM sightings)
