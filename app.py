from flask import Flask, request
import psycopg2
from psycopg2.extras import RealDictCursor

from dotenv import load_dotenv
from os import environ

load_dotenv()

app = Flask(__name__)
app.json.ensure_ascii = False

consts = ['PG_HOST', 'PG_PORT', 'PG_USER', 'PG_PASSWORD', 'PG_DBNAME']
host, port, user, password, dbname = [environ.get(param) for param in consts]
port = int(port) if port and port.isdigit() else None
host = host if environ.get('DEBUG_MODE') == 'false' else 'localhost'
connection = psycopg2.connect(
    host = host,
    port = port,
    user = user,
    password = password,
    dbname = dbname,
    cursor_factory = RealDictCursor
)
connection.autocommit = True


if __name__ == '__main__':
    flask_port = environ.get('FLASK_PORT')
    app.run(port=flask_port)
