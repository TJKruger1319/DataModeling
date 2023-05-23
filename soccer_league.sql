DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name TEXT,
    ranking INTEGER
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    player_name TEXT,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    goal_amount INTEGER,
    player_id INTEGER REFERENCES players
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    referee_name TEXT
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team_id_one INTEGER REFERENCES teams,
    team_id_two INTEGER REFERENCES teams,
    referee_id INTEGER REFERENCES referees
);

CREATE TABLE dates (
    season TEXT,
    starting_date TEXT,
    ending_date TEXT
);

INSERT INTO teams (team_name, ranking) VALUES
('team 1', 1),
('team 2', 2);

INSERT INTO players (player_name, team_id) VALUES
('First Player', 1),
('Second Player', 2);

INSERT INTO goals (goal_amount, player_id) VALUES
(1, 1),
(2, 2);

INSERT INTO referees (referee_name) VALUES
('Referee One'),
('Referee Two');

INSERT INTO matches (team_id_one, team_id_two, referee_id) VALUES
(1, 2, 1),
(2, 1, 2);

INSERT INTO dates (season, starting_date, ending_date) VALUES
('Summer', '6/1', '8/31'),
('Winter', '11/1', '1/31');