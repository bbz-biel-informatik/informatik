CREATE TABLE teams (
  id serial PRIMARY KEY,
  name text
);

CREATE TABLE spieler (
  id serial PRIMARY KEY,
  name text,
  nummer integer,
  team_id integer REFERENCES teams(id)
);

CREATE TABLE spiele (
  id serial PRIMARY KEY,
  team1_id integer REFERENCES teams(id),
  team2_id integer REFERENCES teams(id),
  datum text 
);

CREATE TABLE strafen (
  id serial PRIMARY KEY,
  art text,
  minute integer,
  spiel_id integer REFERENCES spiele(id),
  spieler_id integer REFERENCES spieler(id)
);

CREATE TABLE tore (
  id serial PRIMARY KEY,
  minute integer,
  spiel_id integer REFERENCES spiele(id),
  spieler_id integer REFERENCES spieler(id)
);

INSERT INTO teams (name) VALUES ('FC Basel');
INSERT INTO teams (name) VALUES ('GC Zürich');
INSERT INTO teams (name) VALUES ('FC Lausanne-Sport');
INSERT INTO teams (name) VALUES ('FC Lugano');
INSERT INTO teams (name) VALUES ('FC Luzern');
INSERT INTO teams (name) VALUES ('FC Sion');
INSERT INTO teams (name) VALUES ('FC St. Gallen');
INSERT INTO teams (name) VALUES ('FC Thun');
INSERT INTO teams (name) VALUES ('BSC YB');
INSERT INTO teams (name) VALUES ('FC Zürich');

INSERT INTO spieler (name, nummer, team_id) VALUES ('Tomas Vaclik', 1, 1);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Michael Lang', 5, 1);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Blas Riveros', 25, 1);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Fabian Frei', 6, 1);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Marek Suchy', 17, 1);

INSERT INTO spieler (name, nummer, team_id) VALUES ('Heinz Lindner', 1, 2);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Milan Vilotic', 4, 2);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Cédric Zesiger', 22, 2);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Marko Basic', 8, 2);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Petar Pusic', 28, 2);

INSERT INTO spieler (name, nummer, team_id) VALUES ('Thomas Castella', 1, 3);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Kevin Martin', 22, 3);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Diego Berchtold', 35, 3);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Alain Rochat', 5, 3);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Noah Loosli', 24, 3);

INSERT INTO spieler (name, nummer, team_id) VALUES ('David Da Costa', 1, 4);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Alexander Muci', 13, 4);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Noam Baumann', 46, 4);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Steve Rouiller', 22, 4);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Jetmir Krasniqi', 27, 4);

INSERT INTO spieler (name, nummer, team_id) VALUES ('David Zibung', 1, 5);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Simon Enzler', 22, 5);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Lucas', 5, 5);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Christian Schneuwly', 19, 5);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Stefan Wolf', 23, 5);

INSERT INTO spieler (name, nummer, team_id) VALUES ('Anton Mitryushkin', 1, 6);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Yanick Hofer', 44, 6);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Ivan Lurati', 4, 6);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Federico Dimarco', 7, 6);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Freddy Mveng', 8, 6);

INSERT INTO spieler (name, nummer, team_id) VALUES ('Daniel Lopar', 1, 7);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Nico Krucker', 30, 7);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Alain Wiss', 6, 7);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Andreas Wittwer', 16, 7);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Stjepan Kukuruzovic', 7, 7);

INSERT INTO spieler (name, nummer, team_id) VALUES ('Guillaume Faivre', 1, 8);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Colin Trachsel', 3, 8);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Miguel Rodriguez', 4, 8);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Roy Gelmi', 14, 8);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Chris Kablan', 20, 8);

INSERT INTO spieler (name, nummer, team_id) VALUES ('Marco Wölfli', 1, 9);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Marco Bürki', 4, 9);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Miralem Sulejmani', 7, 9);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Pedro Teixeira', 27, 9);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Guillaume Hoarau', 99, 9);

INSERT INTO spieler (name, nummer, team_id) VALUES ('Andris Vanins', 1, 10);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Rasmus Thelander', 4, 10);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Izer Aliu', 21, 10);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Kevin Rüegg', 22, 10);
INSERT INTO spieler (name, nummer, team_id) VALUES ('Fbaian Rohner', 23, 10);

INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('22.7.2017', 3, 7);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('22.7.2017', 9, 1);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('23.7.2017', 2, 10);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('23.7.2017', 5, 4);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('23.7.2017', 8, 6);

INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('29.7.2017', 2, 9);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('30.7.2017', 1, 5);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('30.7.2017', 10, 8);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('30.7.2017', 3, 6);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('16.8.2017', 4, 7);

INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('5.8.2017', 4, 10);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('5.8.2017', 8, 1);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('5.8.2017', 5, 2);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('6.8.2017', 7, 6);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('6.8.2017', 9, 3);

INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('9.8.2017', 3, 4);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('9.8.2017', 7, 5);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('9.8.2017', 9, 8);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('10.8.2017', 1, 2);
INSERT INTO spiele (datum, team1_id, team2_id) VALUES ('10.8.2017', 10, 6);

INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (1, 34, 32);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (1, 45, 33);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (1, 56, 12);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (2, 24, 4);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (3, 5, 8);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (4, 76, 17);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (4, 78, 22);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (5, 11, 39);

INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (6, 46, 8);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (6, 43, 6);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (6, 19, 8);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (6, 17, 42);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (7, 21, 24);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (7, 70, 1);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (8, 40, 36);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (8, 82, 38);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (8, 53, 38);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (9, 9, 12);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (9, 46, 28);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (9, 45, 12);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (10, 45, 34);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (10, 56, 32);

INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (11, 52, 47);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (12, 79, 3);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (13, 5, 10);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (13, 40, 22);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (13, 35, 7);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (14, 53, 27);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (14, 49, 31);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (14, 88, 32);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (14, 9, 27);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (15, 12, 14);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (15, 80, 43);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (15, 52, 42);

INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (16, 52, 17);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (16, 73, 14);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (16, 2, 18);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (16, 79, 16);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (17, 35, 34);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (18, 48, 41);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (18, 25, 37);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (18, 4, 37);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (19, 34, 1);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (19, 57, 9);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (20, 52, 47);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (20, 5, 30);
INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (20, 6, 46);

