from flask import Flask, request
from psycopg2.sql import SQL, Literal
from psycopg2.extras import RealDictRow

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


def _check_fields(json: dict, fields: dict[str, int]) -> tuple[str, int] | None:
    if not set(json.keys()).issubset(fields.keys()):
        fields_names = ', '.join(fields.keys())
        return f'{json} не содержит все необходимые поля: {fields_names}', http_codes.BAD_REQUEST
    for field, length in fields.items():
        field_val = json.get(field, None)
        if length > 0 and len(field_val) > length:
            return (
                f'Длина {field} в {json} не может быть больше {length} символов!',
                http_codes.BAD_REQUEST,
            )
        if length != -1 and not field_val:
            return f'{field} в {json} должно иметь значение!', http_codes.BAD_REQUEST


def _get_field_id(query) -> str | bool:
    with connection.cursor() as cursor:
        cursor.execute(query)
        field_id = cursor.fetchone()
        if isinstance(field_id, RealDictRow):
            return field_id.get('id')
        return False

def _append_field_id(json: dict, query: SQL, fields_ids: list) -> tuple[str, int] | None:
    field_id = _get_field_id(query)
    if not field_id:
        return f'{json} не существует!', http_codes.BAD_REQUEST
    fields_ids.append(field_id)


def _get_fields_ids(fields: list[dict], needed_fields: dict[str, int], raw_query: SQL) -> list[str]:
    fields_ids = []
    for field in fields:
        check_result = _check_fields(field, needed_fields)
        if check_result:
            return check_result
        for key in needed_fields.keys():
            needed_fields[key] = Literal(field[key])
        query = SQL(raw_query).format(**needed_fields)
        append_status = _append_field_id(field, query, fields_ids)
        if append_status:
            return append_status
    return fields_ids

def _insert_fields_to_tour(raw_query: str, 
            field_dict: dict[str, Literal], 
            fields_ids: list, 
            tour_id: str
        ) -> None:
    if len(field_dict) != 1:
        raise ValueError(f'field_dict: {field_dict} должен содеражть только 1 ключ!')
    for field_id in fields_ids:
        for key in field_dict.keys():
            field_dict[key] = Literal(field_id)
        field_to_tour = SQL(raw_query).format(
            **field_dict, 
            tour_id=Literal(tour_id)
        )
        with connection.cursor() as cursor:
            cursor.execute(field_to_tour)


@app.post('/tours/create')
def create_tour() -> tuple[str, int]:
    body: dict = request.json
    check_result = _check_fields(body, {'name': 255, 'description': -1, 'agencies': 0, 'cities': 0})
    if check_result:
        return check_result
    name = body['name']
    description = body.get('description', None)
    query = SQL(db_queries.GET_TOUR).format(name=Literal(name), description=Literal(description))
    if _get_field_id(query):
        return f'Тур {name}: {description} уже существует', http_codes.BAD_REQUEST
    agencies = body['agencies']
    cities = body['cities']
    agencies_fields = {'name': 255, 'address': 512, 'phone_number': 12}
    agencies_ids = _get_fields_ids(agencies, agencies_fields, db_queries.GET_AGENCY)
    if isinstance(agencies_ids, tuple):
        return agencies_ids
    cities_fields = {'name': 255, 'country': 255}
    cities_ids = _get_fields_ids(cities, cities_fields, db_queries.GET_CITY)
    if isinstance(cities_ids, tuple):
        return cities_ids
    tour = SQL(db_queries.INSERT_TOUR).format(name=Literal(name), description=Literal(description))
    with connection.cursor() as cursor:
        cursor.execute(tour)
        tour_id = cursor.fetchone().get('id')
    _insert_fields_to_tour(
        db_queries.INSERT_AGENCY_TO_TOUR,
        {'agency_id': None},
        agencies_ids,
        tour_id
    )
    _insert_fields_to_tour(
        db_queries.INSERT_TOUR_TO_CITY,
        {'city_id': None},
        cities_ids,
        tour_id
    )
    return tour_id, http_codes.OK


@app.post('tours/update')
def update_tour() -> tuple[str, int]:
    body = request.json
    check_result = _check_fields(body, {'id': 36, 'name': 255, 'description': -1, 'agencies': 0, 'cities': 0})
    if check_result:
        return check_result
    id = body['id']
    name = body['name']
    description = body.get('description', None)
    query = SQL(db_queries.GET_TOUR_USING_ID).format(id=Literal(id))
    if not _get_field_id(query):
        return f'Тур {id} не существует', http_codes.BAD_REQUEST
    agencies = body['agencies']
    cities = body['cities']
    agencies_fields = {'name': 255, 'address': 512, 'phone_number': 12}
    agencies_ids = _get_fields_ids(agencies, agencies_fields, db_queries.GET_AGENCY)
    if isinstance(agencies_ids, tuple):
        return agencies_ids
    cities_fields = {'name': 255, 'country': 255}
    cities_ids = _get_fields_ids(cities, cities_fields, db_queries.GET_CITY)
    if isinstance(cities_ids, tuple):
        return cities_ids


if __name__ == '__main__':
    app.run(port=FLASK_PORT)
