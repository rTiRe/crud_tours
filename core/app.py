from flask import Flask, request

from constants import FLASK_PORT
import http_codes
import db_queries
from utils import get_connection

app = Flask(__name__)
app.json.ensure_ascii = False

connection = get_connection()

@app.get('/')
def index_page() -> tuple[str, int]:
    return '<p>Welcome on tour crud index page</p>', http_codes.OK   


@app.get('/tours')
def get_tours() -> tuple[str, int]:
    with connection.cursor() as cursor:
        cursor.execute(db_queries.GET_TOURS)
        tours = cursor.fetchall()
    return tours, http_codes.OK

if __name__ == '__main__':
    app.run(port=FLASK_PORT)
