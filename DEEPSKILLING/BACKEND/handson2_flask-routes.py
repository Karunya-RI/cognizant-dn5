try:
    from flask import Flask, render_template  # type: ignore[reportMissingImports]
except ImportError:
    raise ImportError("Flask is not installed. Install it with: pip install Flask")

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/about")
def about():
    return "About Page"

if __name__ == "__main__":
    app.run(debug=True)
