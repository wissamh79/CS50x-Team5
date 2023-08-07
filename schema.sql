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

CREATE TABLE IF NOT EXISTS singer (
id INTEGER PRIMARY KEY,
name TEXT NOT NULL,
photo TEXT,
birthday DATE
);

CREATE TABLE IF NOT EXISTS songs (
id INTEGER PRIMARY KEY,
title TEXT NOT NULL, 
release DATE,
length TEXT,
rating REAL,
poster TEXT,
is_featured BOOLEAN NOT NULL DEFAULT False
);

CREATE TABLE IF NOT EXISTS songs_singer (
id INTEGER PRIMARY KEY,
singer_id INTEGER,
songs_id INTEGER,
FOREIGN KEY (singer_id) REFERENCES singer(id) ON DELETE CASCADE,
FOREIGN KEY (songs_id) REFERENCES songs(id) ON DELETE CASCADE
);




CREATE TABLE IF NOT EXISTS songs_genres (
id INTEGER PRIMARY KEY,
genres_id INTEGER,
songs_id INTEGER,
FOREIGN KEY (genres_id) REFERENCES genres(id) ON DELETE CASCADE,
FOREIGN KEY (songs_id) REFERENCES songs(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS users_songs (
id INTEGER PRIMARY KEY,
user_id INTEGER,
songs_id INTEGER,
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
FOREIGN KEY (songs_id) REFERENCES songs(id) ON DELETE CASCADE
);

