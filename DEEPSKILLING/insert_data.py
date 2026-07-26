import sqlite3

conn = sqlite3.connect("company.db")
cursor = conn.cursor()

# Insert sample departments
cursor.executemany("INSERT INTO Department (dept_name) VALUES (?)",
                   [("IT",), ("HR",), ("Finance",)])

# Insert sample employees
cursor.executemany("INSERT INTO Employee (name, role, salary, dept_id) VALUES (?, ?, ?, ?)", [
    ("Alice", "Developer", 60000, 1),
    ("Bob", "Tester", 45000, 1),
    ("Charlie", "HR Manager", 55000, 2),
    ("Diana", "Accountant", 50000, 3)
])

print("Data inserted successfully.")
conn.commit()
conn.close()
