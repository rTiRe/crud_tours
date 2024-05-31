-- migrate:up
create extension if not exists pg_trgm;
create index tour_name_trgm_idx on tour_data.tour using gist(name gist_trgm_ops);
CREATE INDEX idx_agency_rating ON tour_data.agency USING btree(rating);
-- migrate:down