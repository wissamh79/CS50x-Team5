PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS genres (
id INTEGER PRIMARY KEY,
name TEXT NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS  users (
id INTEGER PRIMARY KEY,
name TEXT NOT NULL,
password TEXT NOT NULL,
phone TEXT,
email TEXT NOT NULL UNIQUE,
birthdate DATE,
gender TEXT,
photo TEXT,
is_admin BOOLEAN NOT NULL DEFAULT False
);

CREATE TABLE IF NOT EXISTS people (
id INTEGER PRIMARY KEY,
name TEXT NOT NULL,
photo TEXT
);

CREATE TABLE IF NOT EXISTS movies (
id INTEGER PRIMARY KEY,
title TEXT NOT NULL,
description TEXT,
release DATE,
length TEXT,
rating REAL,
poster TEXT,
trailer TEXT,
is_featured BOOLEAN NOT NULL DEFAULT False
);


CREATE TABLE IF NOT EXISTS shows (
id INTEGER PRIMARY KEY,
title TEXT NOT NULL,
description TEXT,
release DATE,
rating REAL,
poster TEXT,
trailer TEXT,
is_featured BOOLEAN NOT NULL DEFAULT False
);

CREATE TABLE IF NOT EXISTS seasons (
id INTEGER PRIMARY KEY,
name TEXT NOT NULL,
num_episodes INTEGER,
release DATE,
poster TEXT,
trailer TEXT,
show_id INTEGER,
FOREIGN KEY (show_id) REFERENCES shows(id)
);

CREATE TABLE IF NOT EXISTS episodes (
id INTEGER PRIMARY KEY,
title TEXT NOT NULL,
description TEXT,
release DATE,
length TEXT,
rating REAL,
trailer TEXT,
season_id INTEGER,
FOREIGN KEY (season_id) REFERENCES seasons(id)
ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS movies_actors (
id INTEGER PRIMARY KEY,
people_id INTEGER,
movie_id INTEGER,
FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE,
FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS movies_directors (
id INTEGER PRIMARY KEY,
people_id INTEGER,
movie_id INTEGER,
FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE,
FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS movies_genres (
id INTEGER PRIMARY KEY,
genre_id INTEGER,
movie_id INTEGER,
FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE,
FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS shows_actors (
id INTEGER PRIMARY KEY,
people_id INTEGER,
show_id INTEGER,
FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE,
FOREIGN KEY (show_id) REFERENCES shows(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS shows_directors (
id INTEGER PRIMARY KEY,
people_id INTEGER,
show_id INTEGER,
FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE,
FOREIGN KEY (show_id) REFERENCES shows(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS shows_genres (
id INTEGER PRIMARY KEY,
genre_id INTEGER,
show_id INTEGER,
FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE,
FOREIGN KEY (show_id) REFERENCES shows(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS users_movies (
id INTEGER PRIMARY KEY,
user_id INTEGER,
movie_id INTEGER,
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS users_shows (
id INTEGER PRIMARY KEY,
user_id INTEGER,
show_id INTEGER,
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
FOREIGN KEY (show_id) REFERENCES shows(id) ON DELETE CASCADE
);