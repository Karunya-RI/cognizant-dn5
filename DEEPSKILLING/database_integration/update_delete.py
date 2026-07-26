import sqlite3

conn = sqlite3.connect("company.db")
cursor = conn.cursor()

# Update salary
cursor.execute("UPDATE Employee SET salary = salary + 5000 WHERE role = 'Developer'")

# Delete an employee
cursor.execute("DELETE FROM Employee WHERE name = 'Bob'")

print("Update and delete executed.")
conn.commit()
conn.close()
