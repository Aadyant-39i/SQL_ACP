
CREATE TABLE Hero(
    hero_id TEXT PRIMARY KEY,
    hero_name TEXT,
    universe TEXT,
    city TEXT,
    power_type TEXT,
    missions_completed INTEGER,
    power_level REAL
);

INSERT INTO Hero(hero_id, hero_name, universe, city, power_type, missions_completed, power_level)
VALUES
    ('101', 'Spider-Man', 'Marvel', 'New York', 'Agility', 45, 88.5),
    ('102', 'Iron Man', 'Marvel', 'New York', 'Tech', 62, 94.0),
    ('103', 'Thor', 'Marvel', 'New Asgard', 'Elemental', 80, 98.5),
    ('104', 'Black Panther', 'Marvel', 'Wakanda', 'Agility', 50, 91.0),
    ('105', 'Doctor Strange', 'Marvel', 'New York', 'Magic', 38, 96.0),
    ('106', 'Batman', 'DC', 'Gotham', 'Tech', 75, 90.0),
    ('107', 'Superman', 'DC', 'Metropolis', 'Strength', 92, 99.5),
    ('108', 'Wonder Woman', 'DC', 'Themyscira', 'Strength', 68, 96.5),
    ('109', 'The Flash', 'DC', 'Central City', 'Speed', 54, 93.0),
    ('110', 'Green Lantern', 'DC', 'Coast City', 'Energy', 49, 92.0);

SELECT * FROM Hero;

SELECT DISTINCT universe FROM Hero;
SELECT DISTINCT power_type FROM Hero;

SELECT hero_name, universe, city
FROM Hero
WHERE hero_name LIKE '%Man%';

SELECT hero_name, city, power_type
FROM Hero
WHERE city LIKE '%City%';

SELECT hero_name, universe, power_level
FROM Hero
WHERE hero_name LIKE '%S%';

SELECT DISTINCT city
FROM Hero
WHERE power_level > 92.0
ORDER BY city ASC;

SELECT hero_name, power_type, missions_completed, power_level
FROM Hero
WHERE universe = 'Marvel' AND missions_completed > 40
ORDER BY missions_completed DESC;

SELECT universe,
       COUNT(hero_id) AS total_heroes,
       SUM(missions_completed) AS total_missions,
       ROUND(AVG(power_level), 1) AS avg_power_level
FROM Hero
GROUP BY universe
ORDER BY total_missions DESC;

SELECT power_type, SUM(missions_completed) AS total_missions
FROM Hero
GROUP BY power_type
HAVING SUM(missions_completed) >= 100
ORDER BY total_missions DESC;
