-- migrate:up

insert into tour_data.agency(name, address, phone_number, rating) values
('Anex Tour', 'Краснодарский край, Анапа, улица Астраханская, 99', '+79181900110', 4.7),
('Self Travel', 'Краснодарский край, Сочи, улица Московская, 3, кв 3, 3 этаж', '+79189077773', 5.0),
('Дорогами Добра', 'Республика Адыгея, Тахтамукайский район, пгт. Яблоновский, улица Гагарина, 190/3', '+79181279997', 5.0),
('Соллинс-Тур', 'Краснодарский край, Новороссийск, проспект Дзержинского, 156Б, 406 офис, 4 этаж', '+79892455535', 5),
('Остров сокровищ', 'Краснодарский край, Тимашевск, улица Мельничная, 28/7', '+79184411145', null);

INSERT INTO tour_data.tour (name, description)
SELECT
    concat(tours_names[1 + floor((random() * array_length(tours_names, 1)))::int], md5(random()::text)),
    md5(random()::text)
from generate_series(1, 100000)
        cross join
    (select '{Супер,Мега,Лучший,Фантастический,Горы,Равнины,Пещеры,АААААААА,Грузия,США}'
        ::text[] as tours_names) as tdata;
/* Остров Скровищ */
/* NaN */

insert into tour_data.city(name, country, lat, lon) values
('Стамбул', 'Турция', 41.015137, 28.979530),
('Санкт-Петербург', 'Россия', 59.9342802, 30.3350986),
('Дубай', 'ОАЭ', 25.276987, 55.296249),
('Пхукет', 'Таиланд', 7.878978, 98.398392),
('Калининград', 'Россия', 54.715424, 20.509207),
('Лагонаки', 'Россия', 44.07663, 40.01104),
('Мержаново', 'Россия', 47.290467, 39.144322),
('Ростов-на-Дону' , 'Россия', 47.2248606, 39.7022858),
('о. Крит', 'Греция', 35.417416, 24.530005);

INSERT INTO tour_data.agency_to_tour (agency_id, tour_id)
SELECT
    (SELECT a.id FROM tour_data.agency a ORDER BY random() LIMIT 1) as agency_id,
    t.id as tour_id
FROM tour_data.tour t;

INSERT INTO tour_data.tour_to_city (tour_id, city_id)
SELECT t.id AS tour_id, 
    (SELECT c.id FROM tour_data.city c ORDER BY random() LIMIT 1) AS city_id
FROM tour_data.tour t;
-- migrate:down