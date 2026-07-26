import sqlite3

# Connect to the database file (creates if not exists)
conn = sqlite3.connect("company.db")
cursor = conn.cursor()

# Create tables if not already created
cursor.execute("""
CREATE TABLE IF NOT EXISTS Department (
    dept_id INTEGER PRIMARY KEY,
    dept_name TEXT NOT NULL
)
""")

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

# Insert sample data
cursor.executemany("INSERT INTO Department (dept_name) VALUES (?)",
                   [("IT",), ("HR",), ("Finance",)])

cursor.executemany("INSERT INTO Employee (name, role, salary, dept_id) VALUES (?, ?, ?, ?)", [
    ("Alice", "Developer", 60000, 1),
    ("Bob", "Tester", 45000, 1),
    ("Charlie", "HR Manager", 55000, 2),
    ("Diana", "Accountant", 50000, 3)
])

# Run queries
print("All Employees:")
for row in cursor.execute("SELECT * FROM Employee"):
    print(row)

print("\nEmployees with salary > 50000:")
for row in cursor.execute("SELECT name, role FROM Employee WHERE salary > 50000"):
    print(row)

print("\nAverage salary per department:")
for row in cursor.execute("""
SELECT d.dept_name, AVG(e.salary)
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
"""):
    print(row)

# Update and delete
cursor.execute("UPDATE Employee SET salary = salary + 5000 WHERE role = 'Developer'")
cursor.execute("DELETE FROM Employee WHERE name = 'Bob'")

print("\nAfter update and delete:")
for row in cursor.execute("SELECT * FROM Employee"):
    print(row)

conn.commit()
conn.close()
