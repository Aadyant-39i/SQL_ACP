import sqlite3
import pandas as pd

conn = sqlite3.connect('formula1_grid.db')

conn.execute("DROP TABLE IF EXISTS F1_Driver;")

conn.execute("""
CREATE TABLE F1_Driver (
    Driver_Id INTEGER PRIMARY KEY,
    Driver_Name TEXT NOT NULL UNIQUE,
    Constructor_Name TEXT NOT NULL,
    Car_Number INTEGER,
    Is_World_Champion TEXT DEFAULT 'No'
);
""")
conn.commit()
print("Formula 1 table created successfully!")

conn.execute("INSERT INTO F1_Driver VALUES (1, 'Max Verstappen', 'Red Bull Racing', 1, 'Yes');")
conn.execute("INSERT INTO F1_Driver VALUES (2, 'Lewis Hamilton', 'Ferrari', 44, 'Yes');")
conn.execute("INSERT INTO F1_Driver VALUES (3, 'Charles Leclerc', 'Ferrari', 16, 'No');")
conn.execute("INSERT INTO F1_Driver VALUES (4, 'Lando Norris', 'McLaren', 4, 'No');")
conn.execute("INSERT INTO F1_Driver VALUES (5, 'Fernando Alonso', 'Aston Martin', 14, 'Yes');")

conn.execute("""
INSERT INTO F1_Driver (Driver_Id, Driver_Name, Constructor_Name) 
VALUES (6, 'Kimi Antonelli', 'Mercedes');
""")

conn.commit()
print("Rows inserted successfully!\n")

drivers = pd.read_sql("SELECT * FROM F1_Driver;", conn)
print(drivers)

print("\n--- Testing PRIMARY KEY ---")
try:
    conn.execute("INSERT INTO F1_Driver VALUES (1, 'George Russell', 'Mercedes', 63, 'No');")
    conn.commit()
except Exception as e:
    conn.rollback()
    print("Rejected:", e)
    print("Driver_Id 1 already belongs to Max Verstappen — PRIMARY KEY must be unique.")

print("\n--- Testing NOT NULL ---")
try:
    conn.execute("INSERT INTO F1_Driver VALUES (7, 'Oscar Piastri', NULL, 81, 'No');")
    conn.commit()
except Exception as e:
    conn.rollback()
    print("Rejected:", e)
    print("Constructor_Name is NOT NULL — every driver must belong to a team.")

print("\n--- Testing UNIQUE ---")
try:
    conn.execute("INSERT INTO F1_Driver VALUES (8, 'Max Verstappen', 'Mercedes', 33, 'Yes');")
    conn.commit()
except Exception as e:
    conn.rollback()
    print("Rejected:", e)
    print("Driver_Name is UNIQUE — 'Max Verstappen' is already on the grid.")

print("\n--- DEFAULT value check for Kimi Antonelli ---")
rookie = pd.read_sql("""
SELECT Driver_Name, Constructor_Name, Is_World_Champion 
FROM F1_Driver 
WHERE Driver_Name = 'Kimi Antonelli';
""", conn)
print(rookie)
print("Is_World_Champion was not given — DEFAULT 'No' was used automatically.")

print("\n--- NULL in the Car_Number column ---")
all_drivers = pd.read_sql("""
SELECT Driver_Name, Constructor_Name, Car_Number 
FROM F1_Driver;
""", conn)
print(all_drivers)

missing_number = pd.read_sql("""
SELECT Driver_Name 
FROM F1_Driver 
WHERE Car_Number IS NULL;
""", conn)
print("\nDrivers with no assigned car number:")
print(missing_number)

has_number = pd.read_sql("""
SELECT Driver_Name, Car_Number 
FROM F1_Driver 
WHERE Car_Number IS NOT NULL;
""", conn)
print("\nDrivers with assigned car numbers:")
print(has_number)

conn.close()
