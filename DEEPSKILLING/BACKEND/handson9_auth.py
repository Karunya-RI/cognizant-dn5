from flask import Flask, request, jsonify
import jwt, datetime

app = Flask(__name__)
SECRET_KEY = "mysecret"

@app.route("/login", methods=["POST"])
def login():
    username = request.json.get("username")
    token = jwt.encode(
        {"user": username, "exp": datetime.datetime.utcnow() + datetime.timedelta(minutes=30)},
        SECRET_KEY,
        algorithm="HS256"
    )
    return jsonify({"token": token})

if __name__ == "__main__":
    app.run(debug=True)
