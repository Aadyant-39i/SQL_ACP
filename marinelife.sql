CREATE TABLE marine_observations (
    observation_id INT PRIMARY KEY,
    animal_group TEXT,
    species_name TEXT,
    estimated_weight_kg INT,
    depth_meters INT,
    observation_date TEXT
);

INSERT INTO marine_observations VALUES (1, 'Mammal', 'Humpback Whale', 30000, 150, '2026-11-01');
INSERT INTO marine_observations VALUES (2, 'Fish', 'Great White Shark', 1100, 45, '2026-11-02');
INSERT INTO marine_observations VALUES (3, 'Mammal', 'Bottlenose Dolphin', 300, 20, '2026-11-02');
INSERT INTO marine_observations VALUES (4, 'Reptile', 'Green Sea Turtle', 150, 12, '2026-11-03');
INSERT INTO marine_observations VALUES (5, 'Fish', 'Manta Ray', 1350, 80, '2026-11-03');

SELECT DISTINCT animal_group FROM marine_observations;

SELECT COUNT(*) FROM marine_observations;

SELECT animal_group, COUNT(*), SUM(estimated_weight_kg), AVG(depth_meters) 
FROM marine_observations 
GROUP BY animal_group;

SELECT animal_group, MAX(estimated_weight_kg), MIN(depth_meters) 
FROM marine_observations 
GROUP BY animal_group;

SELECT animal_group, COUNT(*) 
FROM marine_observations 
GROUP BY animal_group 
HAVING COUNT(*) > 1;

SELECT observation_date, SUM(estimated_weight_kg) 
FROM marine_observations 
GROUP BY observation_date;

SELECT animal_group, AVG(depth_meters) 
FROM marine_observations 
GROUP BY animal_group 
ORDER BY AVG(depth_meters) DESC;

SELECT animal_group, species_name, COUNT(*) 
FROM marine_observations 
GROUP BY animal_group, species_name;

