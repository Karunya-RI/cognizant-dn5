import sqlite3
from flask import Flask, g

app = Flask(__name__)
DATABASE = "students.db"

def get_db():
    db = getattr(g, "_database", None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
    return db

@app.route("/students")
def students():
    cur = get_db().cursor()
    cur.execute("SELECT name FROM students")
    rows = cur.fetchall()
    return {"students": [row[0] for row in rows]}

if __name__ == "__main__":
    app.run(debug=True)
