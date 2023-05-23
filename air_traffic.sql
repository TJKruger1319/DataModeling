-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE person (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE city (
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL
);

CREATE TABLE country (
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  person_id INTEGER REFERENCES person
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_city_id INTEGER REFERENCES city,
  from_country_id INTEGER REFERENCES country,
  to_city_id INTEGER REFERENCES city,
  to_country INTEGER REFERENCES country
);



INSERT INTO person (first_name, last_name) VALUES
('Minecraft', 'Skeleton');

INSERT INTO city (city_name) VALUES
('Tokyo'),
('Seattle'),
('Paris'),
('Dubai');

INSERT INTO country (country_name) VALUES
('United States'),
('Japan'),
('France'),
('UAE');

INSERT INTO tickets
  (person_id, seat, departure, arrival, airline, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
  (1,  '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 1, 2, 2, 1),
  (1, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 2, 1, 2, 1),
  (1, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 3, 2, 3, 2),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 4, 1, 3, 1),
  (1, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 3, 1, 4, 2),
  (1, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 1, 2, 3, 4),
  (1, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 4, 3, 2, 1),
  (1, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 3, 4, 1, 2),
  (1, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 4, 4, 4, 4),
  (1, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 3, 3, 3, 3);