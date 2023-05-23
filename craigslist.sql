DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    region_name TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT,
    prefered_region_id INTEGER REFERENCES region
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT,
    user_id INTEGER REFERENCES users,
    location_area TEXT,
    region_id INTEGER
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    category_name TEXT,
    post_id INTEGER REFERENCES post
);

INSERT INTO region (region_name) VALUES
('Region one'),
('Region two');

INSERT INTO users (username, prefered_region_id) VALUES
('user one', 1),
('user two', 2);

INSERT INTO post (title, user_id, location_area, region_id) VALUES
('My first post', 1, 'United States', 1),
('My second post', 1, 'United States', 2);

INSERT INTO category (category_name, post_id) VALUES
('First category', 1),
('Second category', 2);