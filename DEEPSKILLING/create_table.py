import sqlite3

# Connect to database (creates file if not exists)
conn = sqlite3.connect("company.db")
cursor = conn.cursor()

# Create Department table
cursor.execute("""
CREATE TABLE IF NOT EXISTS Department (
    dept_id INTEGER PRIMARY KEY,
    dept_name TEXT NOT NULL
)
""")

# Create Employee table
cursor.execute("""
CREATE TABLE IF NOT EXISTS Employee (
    emp_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    role TEXT,
    salary REAL,
    dept_id INTEGER,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
)
""")

print("Tables created successfully.")
conn.commit()
conn.close()
