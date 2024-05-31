-- migrate:up
create extension if not exists pg_trgm;
create index tour_name_trgm_idx on tour_data.tour using gist(name gist_trgm_ops);
create index city_name_idx on tour_data.city using btree(name);
-- migrate:down