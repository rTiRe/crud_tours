from dotenv import load_dotenv
from os import getenv

load_dotenv()

pg_fields = ['PG_HOST', 'PG_PORT', 'PG_USER', 'PG_PASSWORD', 'PG_DBNAME']

HOST, PORT, USER, PASSWORD, DBNAME = [getenv(param) for param in pg_fields]
PORT = int(PORT) if PORT and PORT.isdigit() else None
host = HOST if getenv('DEBUG_MODE') == 'false' else 'localhost'

FLASK_PORT = getenv('FLASK_PORT')