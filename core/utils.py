import psycopg2
from psycopg2.extras import RealDictCursor
from psycopg2.extensions import connection

from constants import HOST, PORT, USER, PASSWORD, DBNAME

def get_connection() -> connection:
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