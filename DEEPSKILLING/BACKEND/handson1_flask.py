from flask import Flask  # type: ignore[reportMissingImports]
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, Flask Backend!"

if __name__ == "__main__":
    app.run(debug=True)
