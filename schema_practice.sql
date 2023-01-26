DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    unit TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    room_number INT NOT NULL
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctors,
    patient_id INT REFERENCES patients,
    date DATE
);

CREATE TABLE diseases (
    id PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY, 
    visit_id INT REFERENCES visits,
    disease_id INT REFERENCES diseases,
    notes TEXT
);

---------------------------------------------------

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL, 
    region_id INT REFERENCES regions, 
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT, 
    location TEXT,
    user_id INT REFERENCES users,
    category_id INT REFERENCES categories,
    region_id INT REFERENCES regions
);

--------------------------------------------------

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY 
    name TEXT,
    city TEXT,
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE, 
    end_date DATE,
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    curent_team_id INT REFERENCES teams,
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INT REFERENCES teams,
    away_team_id INT REFERENCES teams, 
    location TEXT,
    kickoff TIMESTAMP,
    season_id INT REFERENCES season,
    umpire_id INT REFERENCES referees,
    asistant_ref_id INT REFERENCES referees,
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players,
    match_id INT REFERENCES matches,
);

CREATE TABLE lineups (
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players,
    match_id INT REFERENCES matches,
    team_id INT REFERENCES teams
);
