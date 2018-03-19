DROP TABLE rooms_songs;
DROP TABLE guests;
DROP TABLE rooms;
DROP TABLE songs;


CREATE TABLE rooms (
  id SERIAL8 PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  max_capacity INT NOT NULL,
  entrance_fee INT NOT NULL
);

CREATE TABLE songs (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  artist VARCHAR(255)
);

CREATE TABLE rooms_songs (
  id SERIAL8 ,
  room_id INT8 REFERENCES rooms(id) NOT NULL,
  song_id INT8 REFERENCES songs(id) NOT NULL
);

CREATE TABLE guests (
  id SERIAL8 NOT NULL,
  name VARCHAR(255) NOT NULL,
  wallet INT NOT NULL,
  favourite_song INT8 REFERENCES songs(id) NOT NULL,
  room_id INT8 REFERENCES rooms(id) NOT NULL
);

INSERT INTO rooms (name, max_capacity, entrance_fee) VALUES ('Indie Room', 10, 5);
INSERT INTO rooms (name, max_capacity, entrance_fee) VALUES ('Rock Room', 18, 5);
INSERT INTO rooms (name, max_capacity, entrance_fee) VALUES ('Jazz Room', 16, 5);

INSERT INTO songs (title, artist) VALUES ('On Hold', 'The XX');
INSERT INTO songs (title, artist) VALUES ('The Sparrow and the Wolf', 'James Vincent McMorrow');
INSERT INTO songs (title, artist) VALUES ('Re: Stacks', 'Bon Iver');
INSERT INTO songs (title, artist) VALUES ('Everything Now', 'Arcade Fire');
INSERT INTO songs (title, artist) VALUES ('Sentimental Mood', 'Duke Ellington');
INSERT INTO songs (title, artist) VALUES ('Take the A Train', 'Duke Ellington');
INSERT INTO songs (title, artist) VALUES ('Dirty Deeds', 'ACDC');
INSERT INTO songs (title, artist) VALUES ('Free Fallin', 'Tom Petty');
INSERT INTO songs (title, artist) VALUES ('Brown Sugar', 'The Rolling Stones');
INSERT INTO songs (title, artist) VALUES ('Orthodox Man', 'Blaenavon');

SELECT * FROM rooms;
SELECT * FROM songs

INSERT INTO rooms_songs (room_id, song_id) VALUES (1, 1);
INSERT INTO rooms_songs (room_id, song_id) VALUES (1, 2);
INSERT INTO rooms_songs (room_id, song_id) VALUES (1, 3);
INSERT INTO rooms_songs (room_id, song_id) VALUES (1, 4);
INSERT INTO rooms_songs (room_id, song_id) VALUES (3, 5);
INSERT INTO rooms_songs (room_id, song_id) VALUES (3, 6);
INSERT INTO rooms_songs (room_id, song_id) VALUES (2, 7);
INSERT INTO rooms_songs (room_id, song_id) VALUES (2, 8);
INSERT INTO rooms_songs (room_id, song_id) VALUES (3, 9);
INSERT INTO rooms_songs (room_id, song_id) VALUES (1, 10);


















--
