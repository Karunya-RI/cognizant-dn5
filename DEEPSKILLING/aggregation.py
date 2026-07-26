import sqlite3

conn = sqlite3.connect("company.db")
cursor = conn.cursor()

# Average salary per department
print("Average salary per department:")
for row in cursor.execute("""
SELECT d.dept_name, AVG(e.salary)
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
"""):
    print(row)

# Count employees per department
print("\nEmployee count per department:")
for row in cursor.execute("""
SELECT d.dept_name, COUNT(e.emp_id)
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
"""):
    print(row)

conn.close()
