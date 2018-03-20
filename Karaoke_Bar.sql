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
INSERT INTO songs (title, artist) VALUES ('Brown Sugar', 'The Rolling Stnes');
INSERT INTO songs (title, artist) VALUES ('Orthodox Man', 'Blaenavon');

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

INSERT INTO guests (name, wallet, favourite_song, room_id) VALUES ('Mike', 50, 2, 1);
INSERT INTO guests (name, wallet, favourite_song, room_id) VALUES ('Simon', 60, 1, 1);
INSERT INTO guests (name, wallet, favourite_song, room_id) VALUES ('Mariana', 100, 3, 3);
INSERT INTO guests (name, wallet, favourite_song, room_id) VALUES ('Claire', 20, 4, 3);
INSERT INTO guests (name, wallet, favourite_song, room_id) VALUES ('Rachel', 45, 5, 1);
INSERT INTO guests (name, wallet, favourite_song, room_id) VALUES ('Andrew', 16, 6, 3);
INSERT INTO guests (name, wallet, favourite_song, room_id) VALUES ('Keith', 89, 6, 1);
INSERT INTO guests (name, wallet, favourite_song, room_id) VALUES ('Richard', 576, 8, 2);
INSERT INTO guests (name, wallet, favourite_song, room_id) VALUES ('Ashleigh', 8, 7, 1);
INSERT INTO guests (name, wallet, favourite_song, room_id) VALUES ('George', 90, 10, 1);
INSERT INTO guests (name, wallet, favourite_song, room_id) VALUES ('Isobel', 34, 9, 2);
INSERT INTO guests (name, wallet, favourite_song, room_id) VALUES ('Ella', 56, 8, 1);

-- SELECT * FROM rooms;
-- SELECT * FROM songs;
-- SELECT * FROM rooms_songs;
-- SELECT * FROM guests;

-- Rock fans get 666 in wallets.
UPDATE guests SET wallet = 666 WHERE room_id = 2;
-- New fire regulations, all rooms limited to 12 max max_capacity.
UPDATE rooms SET max_capacity = 12 where max_capacity > 12;
-- Rectify typo in database.
UPDATE songs SET artist = 'The Rolling Stones' WHERE artist = 'The Rolling Stnes';

-- SELECT * FROM guests;
-- SELECT * FROM rooms;
-- SELECT * FROM songs;

-- Read only the artists from songs column.
SELECT artist FROM songs;
-- Read only room name for rooms with max capacity of 12.
SELECT name FROM rooms WHERE max_capacity = 12;
-- Read only name and wallet from guests for the fat cat karaoke bar owners.
SELECT name, wallet FROM guests;


-- SELECT * FROM rooms_songs JOIN songs USING (song_id);

SELECT rooms.name, songs.title FROM rooms, songs, rooms_songs WHERE rooms.id = rooms_songs.room_id AND songs.id = rooms_songs.song_id AND rooms.id = 3 LIMIT 5;





--
