from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def index():
    poop="poop"
    return render_template("index.tpl")

if __name__ == "__main__":
    app.run(debug=True)
