CREATE TABLE football_players (
    PLAYER_NO TEXT PRIMARY KEY, 
    PLAYER_NAME TEXT,
    AGE INTEGER,
    CURRENT_CLUB TEXT
);

INSERT INTO football_players (PLAYER_NO, PLAYER_NAME, AGE, CURRENT_CLUB) VALUES
("P1", "Enzo Fernandez", 25, "Chelsea"),
("P2", "Erling Haaland", 26, "Manchester City"),
("P3", "Kylian Mbappe", 27, "Real Madrid"),
("P4", "Lionel Messi", 39, "Inter Miami"),
("P5", "Cristiano Ronaldo", 41, "Al Nassr");

SELECT * FROM football_players;
