DROP TABLE users_tricks;
DROP TABLE proficancies;
DROP TABLE tricks;
DROP TABLE users_followers;
DROP TABLE boards;
DROP TABLE users;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) UNIQUE,
    password VARCHAR(255)
);

CREATE TABLE boards(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Follower style relationshp not friend relationship
CREATE TABLE users_followers(
    id SERIAL PRIMARY KEY,
    me int REFERENCES users(id) NOT NULL,
    following int REFERENCES users(id) NOT NULL
);

CREATE TABLE tricks(
    id SERIAL PRIMARY KEY,
    name VARCHAR(512),
    board int REFERENCES boards(id)
);

CREATE TABLE proficancies(
    id SERIAL PRIMARY KEY,
    proficieny_title VARCHAR(100) NOT NULL,
    proficieny_notes VARCHAR(1024) NOT NULL
); 

CREATE TABLE users_tricks(
    id SERIAL PRIMARY KEY,
    username INT REFERENCES users(id) NOT NULL,
    trick INT REFERENCES trickS(id) NOT NULL,
    proficieny INT REFERENCES proficancies(id) NOT NULL,
    notes VARCHAR(8192),
    UNIQUE (username, trick)
);