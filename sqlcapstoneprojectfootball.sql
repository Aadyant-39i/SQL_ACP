-- 1. CREATE AND POPULATE MANAGER TABLE (Current 2026/27 Season with Clubs)
CREATE TABLE IF NOT EXISTS Manager(
    manager_id TEXT PRIMARY KEY,
    name TEXT,
    club TEXT,
    city TEXT,
    trophies_won TEXT
);

INSERT OR IGNORE INTO Manager(manager_id, name, club, city, trophies_won)
VALUES
    ("101", "Luis Enrique", "Paris Saint-Germain", "Paris", "13"),
    ("102", "Vincent Kompany", "FC Bayern Munich", "Munich", "3"),
    ("103", "Hansi Flick", "FC Barcelona", "Barcelona", "12"),
    ("104", "Jose Mourinho", "Real Madrid", "Madrid", "26"),
    ("105", "Enzo Maresca", "Manchester City", "Manchester", "4"),
    ("106", "Mikel Arteta", "Arsenal", "London", "4");

SELECT * FROM Manager;

-- 2. CREATE AND POPULATE FOOTBALLER TABLE (Current 2026/27 Squads with Clubs)
CREATE TABLE IF NOT EXISTS Footballer(
    player_id TEXT,
    player_name TEXT PRIMARY KEY,
    club TEXT,
    city TEXT,
    jersey_no TEXT,
    manager_id TEXT
);

INSERT OR IGNORE INTO Footballer(player_id, player_name, club, city, jersey_no, manager_id)
VALUES
    ("201", "Ousmane Dembele", "Paris Saint-Germain", "Paris", "10", "101"),
    ("202", "Khvicha Kvaratskhelia", "Paris Saint-Germain", "Paris", "7", "101"),
    ("203", "Harry Kane", "FC Bayern Munich", "Munich", "9", "102"),
    ("204", "Jamal Musiala", "FC Bayern Munich", "Munich", "10", "102"),
    ("205", "Lamine Yamal", "FC Barcelona", "Barcelona", "10", "103"),
    ("206", "Kylian Mbappe", "Real Madrid", "Madrid", "10", "104"),
    ("207", "Erling Haaland", "Manchester City", "Manchester", "9", "105"),
    ("208", "Bukayo Saka", "Arsenal", "London", "", "106");

SELECT * FROM Footballer;

-- 3. CREATE AND POPULATE FIXTURE TABLE (Current November 2026 Dates)
CREATE TABLE IF NOT EXISTS Fixture(
    match_no TEXT PRIMARY KEY,
    attendance TEXT,
    match_date TEXT,
    player_id TEXT,
    manager_id TEXT
);

INSERT OR IGNORE INTO Fixture(match_no, attendance, match_date, player_id, manager_id)
VALUES
    ("9001", "85000", "2026-10-25", "205", "104"),
    ("9002", "75000", "2026-11-08", "203", "101"),
    ("9003", "48000", "2026-11-15", "201", "102"),
    ("9004", "78000", "2026-11-01", "206", "105"),
    ("9005", "60000", "2026-11-11", "208", "103"),
    ("9006", "53000", "2026-10-18", "207", "106");

SELECT * FROM Fixture;

-- 4. MANIPULATION, FILTERING & SORTING QUERIES
-- Update Bukayo Saka's missing jersey number
UPDATE Footballer
SET jersey_no = "7"
WHERE player_id = "208";

-- Delete a lower-attendance match record
DELETE FROM Fixture
WHERE match_no = "9003";

-- Filter matches with attendance over 55000 and sort highest to lowest
SELECT * FROM Fixture
WHERE CAST(attendance AS INTEGER) > 55000
ORDER BY CAST(attendance AS INTEGER) DESC;

-- 5. JOIN QUERIES
-- Match footballers and managers based in the same city
SELECT Footballer.player_name, Footballer.club, Manager.name, Manager.city
FROM Footballer
JOIN Manager ON Footballer.city = Manager.city;

-- Show each footballer alongside their current manager and club
SELECT Footballer.player_name, Footballer.club, Manager.name
FROM Footballer
JOIN Manager ON Footballer.manager_id = Manager.manager_id;

-- Show fixtures where the footballer and manager are from different cities
SELECT Fixture.match_no, Footballer.player_name, Footballer.club, Fixture.player_id, Fixture.manager_id
FROM Fixture
JOIN Footballer ON Fixture.player_id = Footballer.player_id
JOIN Manager ON Fixture.manager_id = Manager.manager_id
WHERE Footballer.city <> Manager.city;
SELECT * FROM Fixture;
