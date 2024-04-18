GET_TOURS="""with
tours_with_agencies as
(
	select 
		t.id,
		t.name,
		t.description,
		coalesce(jsonb_agg(jsonb_build_object(
			'id', a.id, 'name', a.name, 'address', a.address, 'phone_number', a.phone_number, 'rating', a.rating
		))
		filter (where a.id is not null), '[]'
		) as agencies
	from tour_data.tour t
	left join tour_data.agency_to_tour att on t.id = att.tour_id
	left join tour_data.agency a on a.id = att.agency_id
	group by t.id
),
tours_with_cities as
(
	select
		t.id,
		coalesce(jsonb_agg(jsonb_build_object(
			'id', c.id, 'name', c.name, 'country', c.country, 'lat', c.lat, 'lon', c.lon
		))
		filter (where c.id is not null), '[]'
		) as cities
	from tour_data.tour t
	left join tour_data.tour_to_city ttc on t.id = ttc.tour_id
	left join tour_data.city c on c.id = ttc.city_id
	group by t.id
)
select twa.id, name, description, agencies, cities
from tours_with_agencies twa
join tours_with_cities twc on twa.id = twc.id;
"""
GET_TOUR = """select id from tour_data.tour
where name={name} and description={description};"""
GET_TOUR_USING_ID = """select id from tour_data.tour
where id={id};"""
GET_AGENCY = """select id from tour_data.agency
where name={name} and address={address} and phone_number={phone_number};
"""
GET_TOUR_AGENCIES_IDS = """select agency_id from tour_data.agency_to_tour
where tour_id = {tour_id};
"""
GET_TOUR_CITIES_IDS = """select city_id from tour_data.tour_to_city
where tour_id = {tour_id};
"""
GET_CITY = """select id from tour_data.city
where name={name} and country={country};
"""
INSERT_TOUR = """insert into tour_data.tour 
(name, description) 
values 
({name}, {description})
returning id;
"""
INSERT_AGENCY_TO_TOUR = """insert into tour_data.agency_to_tour 
(agency_id, tour_id) 
values 
({agency_id}, {tour_id});
"""
INSERT_TOUR_TO_CITY = """insert into tour_data.tour_to_city 
(tour_id, city_id) 
values 
({tour_id}, {city_id});
"""
UPDATE_TOUR = """update tour_data.tour
set
name = {name},
description = {description}
where id = {id}
returning id;
"""
# Сначала удаляем старые связи, потому что их может стать меньше и к старым мы никак не обратимся
DELETE_AGENCY_TO_TOUR = """delete from tour_data.agency_to_tour
where tour_id = {tour_id};
"""
DELETE_TOUR_TO_CITY = """delete from tour_data.tour_to_city
where tour_id = {tour_id}
"""