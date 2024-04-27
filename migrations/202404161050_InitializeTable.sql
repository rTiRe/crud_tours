-- migrate:up

create extension if not exists "uuid-ossp";

create schema if not exists tour_data;

create table if not exists tour_data.agency
(
	id uuid primary key default uuid_generate_v4(),
	name text not null,
	address text not null,
	phone_number text not null,
	rating float,
	unique(name, address, phone_number)
);

create table if not exists tour_data.tour
(
	id uuid primary key default uuid_generate_v4(),
	name text not null,
	description text,
	unique(name, description)
);

create table if not exists tour_data.city
(
	id uuid primary key default uuid_generate_v4(),
	name text not null,
	country text not null,
	lat float,
	lon float,
	unique(name, country),
	unique(lat, lon)
);

create table if not exists tour_data.agency_to_tour
(
	agency_id uuid references tour_data.agency,
	tour_id uuid references tour_data.tour,
	primary key (agency_id, tour_id)
);

create table if not exists tour_data.tour_to_city
(
	tour_id uuid references tour_data.tour,
	city_id uuid references tour_data.city,
	primary key (tour_id, city_id)
);

-- migrate:down

drop table if exists tour_data.tour_to_city, tour_data.agency_to_tour, tour_data.city, tour_data.tour, tour_data.agency;