import sqlite3

conn = sqlite3.connect("company.db")
cursor = conn.cursor()

# Select all employees
print("All Employees:")
for row in cursor.execute("SELECT * FROM Employee"):
    print(row)

# Employees with salary > 50k
print("\nEmployees with salary > 50000:")
for row in cursor.execute("SELECT name, role FROM Employee WHERE salary > 50000"):
    print(row)

# Join Employee with Department
print("\nEmployees with Department:")
for row in cursor.execute("""
SELECT e.name, e.role, d.dept_name
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
"""):
    print(row)

conn.close()
