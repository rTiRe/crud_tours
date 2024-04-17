import psycopg2
from psycopg2.extras import RealDictCursor

from constants import HOST, PORT, USER, PASSWORD, DBNAME

def get_connection() -> psycopg2.connect:
    connection = psycopg2.connect(
        host = HOST,
        port = PORT,
        user = USER,
        password = PASSWORD,
        dbname = DBNAME,
        cursor_factory = RealDictCursor
    )
    connection.autocommit = True
    return connection