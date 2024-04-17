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