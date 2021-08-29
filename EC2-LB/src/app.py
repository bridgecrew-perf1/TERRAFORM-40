from flask import Flask, jsonify

app = Flask(__name__)


def health():
    return {"message": "pong"}


@app.route("/ping", methods=["GET"])
def ping():
    d = health()
    return jsonify(d)
