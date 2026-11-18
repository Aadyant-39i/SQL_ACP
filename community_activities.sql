CREATE TABLE IF NOT EXISTS Activities (
    name TEXT,
    category TEXT,
    day TEXT,
    participants INTEGER,
    fee REAL,
    room TEXT
);

INSERT INTO Activities (name, category, day, participants, fee, room) VALUES
    ('Morning Yoga', 'Fitness', 'Monday', 25, 10.0, 'Hall A'),
    ('Watercolor Painting', 'Arts', 'Tuesday', 12, 15.0, 'Studio 1'),
    ('Zumba Dance', 'Fitness', 'Wednesday', 30, 12.0, 'Hall A'),
    ('Pottery Workshop', 'Arts', 'Thursday', 10, 25.0, 'Studio 2'),
    ('Coding for Kids', 'Education', 'Saturday', 18, 20.0, 'Lab 1'),
    ('Community Book Club', 'Education', 'Sunday', 15, 0.0, ''),
    ('Senior Aerobics', 'Fitness', 'Friday', 22, 5.0, 'Hall B'),
    ('Weekend Chess Club', 'Games', 'Saturday', 16, 8.0, 'Hall B'),
    ('Salsa Night', 'Dance', 'Friday', 28, 15.0, 'Hall A'),
    ('Guitar Basics', 'Music', 'Wednesday', 9, 18.0, '');

SELECT * FROM Activities;
SELECT DISTINCT category FROM Activities;
SELECT * FROM Activities WHERE category = 'Fitness';
SELECT * FROM Activities WHERE participants >= 20;
SELECT * FROM Activities WHERE category = 'Arts' AND day IN ('Tuesday', 'Thursday');
SELECT * FROM Activities WHERE name LIKE '%Club%';
SELECT * FROM Activities WHERE day IN ('Friday', 'Saturday', 'Sunday');
SELECT * FROM Activities WHERE room = '' OR room IS NULL;
SELECT * FROM Activities ORDER BY fee DESC LIMIT 3;
SELECT category, COUNT(*) AS total_activities, SUM(participants) AS total_participants, ROUND(AVG(fee), 2) AS avg_fee FROM Activities GROUP BY category;
SELECT category, SUM(participants) AS total_participants FROM Activities GROUP BY category HAVING SUM(participants) > 25 ORDER BY total_participants DESC;
SELECT category, ROUND(AVG(fee), 2) AS avg_fee FROM Activities GROUP BY category HAVING AVG(fee) <= 15.0 ORDER BY avg_fee ASC;
