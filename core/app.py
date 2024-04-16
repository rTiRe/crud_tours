from flask import Flask, request

from constants import FLASK_PORT

app = Flask(__name__)
app.json.ensure_ascii = False

if __name__ == '__main__':
    app.run(port=FLASK_PORT)
