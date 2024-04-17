-- migrate:up

insert into tour_data.agency(name, address, phone_number, rating) values
('Anex Tour', 'Краснодарский край, Анапа, улица Астраханская, 99', '+79181900110', 4.7),
('Self Travel', 'Краснодарский край, Сочи, улица Московская, 3, кв 3, 3 этаж', '+79189077773', 5.0),
('Дорогами Добра', 'Республика Адыгея, Тахтамукайский район, пгт. Яблоновский, улица Гагарина, 190/3', '+79181279997', 5.0),
('Соллинс-Тур', 'Краснодарский край, Новороссийск, проспект Дзержинского, 156Б, 406 офис, 4 этаж', '+79892455535', 5),
('Остров сокровищ', 'Краснодарский край, Тимашевск, улица Мельничная, 28/7', '+79184411145', null);

insert into tour_data.tour(name, description) values
('Классический Стамбул', 'Откройте для себя крупнейший город жаркой Турции! Здесь вы увидите главные мечети Стамбула, посетите Ипподром и насладитесь турецким гостеприимством.'),
('Стамбул - город мечты', 'Туры в один из самых красивых городов мира — солнечный Стамбул. В программе экскурсии по старой части города, знакомство с новыми шедеврами инженерной мысли. В Стамбуле встречаются восток и запад, древность и современные технологии, традиции и прогрессивный взгляд на город будущего.'),
('В сердце Петербурга', 'Петербург — масштабный центр исторической и культурной жизни России. Познакомьтесь с городом-музеем или посетите его вновь: каждая поездка дарит новые впечатления и воспоминания. Вы увидите и роскошные дворцы, и шикарные загородные резиденции, и таинственные улочки Петербурга.'),
('Crowne Plaza Dubai Deira 5*', 'Уютный и комфортный отель с высоким уровнем обслуживания, расположен в оживленном районе. В отеле есть все необходимое для спокойного отдыха или деловой поездки.'),
('Patong Princess Hotel 3*', 'Современный отель в нескольких минутах от пляжа Патонг, около торгового центра Джангцейлон. Размещение в комфортабельных номерах, оформленных в классическом стиле, хороший уровень обслуживания, небольшой набор услуг.'),
('Академическая 3*', 'Отель расположен в 4 км от центра города, в 3 км от Музея янтаря и Росгартенских ворот. В числе услуг — бесплатный Wi-Fi, парковка, круглосуточная стойка регистрации, ежедневная уборка номеров, детская площадка. Прогулка до магазинов и кафе займет 5 минут.'),
('Однодневный тур в Азишскую пещеру', '- остановка в Белореченске;\n- смотровая площадка с видом на Кавказский хребет;\n- посещение Азишской пещеры (стоимость входных билетов входит в стоимость);\n- питание (входит в стоимость экскурсионной программы);\n- Казачий камень (экскурсовод расскажет легенду про этот камень);\n- водопады Руфабго;\n- возвращение домой.'),
('Двухдневный тур «Мержаново - Ростов - парк Лога»', 'Первый день:\n\n1. Выезд в 6:00 (остановки на заправочных станциях).\n2. Прибытие в хутор Ростовской области Мержаново в 10:00 (Маяк, декорация к фильму «Смотритель маяка»)\nЧем интересна локация?\nТерритория данного объекта – множество точек для красивейших фото, которые также подарят яркие впечатления от красивейших видов.\nИмеющиеся беседки – прекрасное место для завтрака с видом на Азовское море.\nПросьба для группы – взять с собой еду для завтрака, термосы с чаем.\nСопровождающий группы поможет сделать интересные снимки, в том числе и индивидуальные.\n3. Выезд в Ростов-на-Дону будет зависеть от погодных условий и пожеланий группы. Дорога по времени составит до 1 часа (при отсутствии «пробок»). По приезду предполагается прогулка по набережной реки Дона, ул. Большая Садовая.\nПитание – посещение столовой (в стоимость тура не включено).\n4. В 18:00 – начало экскурсии «Мистический Ростов». Длительность – 3 часа, тема – таинственные истории зданий города, рассказ о легендах и призраках, живущих в Ростове.\n5. В 21:45 – заселение в хостел на ночлег.\n\nВторой день:\n\n1. Выход в город в 9:00, завтрак.\n2. Выезд в 10:00 в парк «Лога», прогулка по парку (не предусматривает стоимость доп услуг, аттракционов, развлекательных платных программ).\n3. В 16:00 выезд. Прибытие – в 20:30 (остановки на заправочных станциях).'),
('Греция из Краснодара', 'Дорогие друзья! Этой весной все обязательно летим в Грецию! Цены просто волшебные🔥\n\n✈️Летим из Краснодара\n\n📍О.Крит\n✅9 ночей\n🍴Завтраки\n💸Отели 3* от 18850/чел\n💸Отели 4* от 25450/чел\n💸Отели 5* от 37700/чел');
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

insert into tour_data.agency_to_tour (agency_id, tour_id) values
((select id from tour_data.agency where name='Anex Tour'), (select id from tour_data.tour where name='Классический Стамбул')),
((select id from tour_data.agency where name='Anex Tour'), (select id from tour_data.tour where name='Стамбул - город мечты')),
((select id from tour_data.agency where name='Anex Tour'), (select id from tour_data.tour where name='В сердце Петербурга')),
((select id from tour_data.agency where name='Self Travel'), (select id from tour_data.tour where name='Crowne Plaza Dubai Deira 5*')),
((select id from tour_data.agency where name='Self Travel'), (select id from tour_data.tour where name='Patong Princess Hotel 3*')),
((select id from tour_data.agency where name='Self Travel'), (select id from tour_data.tour where name='Академическая 3*')),
((select id from tour_data.agency where name='Дорогами Добра'), (select id from tour_data.tour where name='Однодневный тур в Азишскую пещеру')),
((select id from tour_data.agency where name='Дорогами Добра'), (select id from tour_data.tour where name='Двухдневный тур «Мержаново - Ростов - парк Лога»')),
((select id from tour_data.agency where name='Дорогами Добра'), (select id from tour_data.tour where name='В сердце Петербурга')),
((select id from tour_data.agency where name='Соллинс-Тур'), (select id from tour_data.tour where name='Греция из Краснодара'));

insert into tour_data.tour_to_city (tour_id, city_id) values
((select id from tour_data.tour where name='Классический Стамбул'), (select id from tour_data.city where name='Стамбул')),
((select id from tour_data.tour where name='Стамбул - город мечты'), (select id from tour_data.city where name='Стамбул')),
((select id from tour_data.tour where name='В сердце Петербурга'), (select id from tour_data.city where name='Санкт-Петербург')),
((select id from tour_data.tour where name='Crowne Plaza Dubai Deira 5*'), (select id from tour_data.city where name='Дубай')),
((select id from tour_data.tour where name='Patong Princess Hotel 3*'), (select id from tour_data.city where name='Пхукет')),
((select id from tour_data.tour where name='Академическая 3*'), (select id from tour_data.city where name='Калининград')),
((select id from tour_data.tour where name='Однодневный тур в Азишскую пещеру'), (select id from tour_data.city where name='Лагонаки')),
((select id from tour_data.tour where name='Двухдневный тур «Мержаново - Ростов - парк Лога»'), (select id from tour_data.city where name='Мержаново')),
((select id from tour_data.tour where name='Двухдневный тур «Мержаново - Ростов - парк Лога»'), (select id from tour_data.city where name='Ростов-на-Дону')),
((select id from tour_data.tour where name='Греция из Краснодара'), (select id from tour_data.city where name='о. Крит'));

-- migrate:down