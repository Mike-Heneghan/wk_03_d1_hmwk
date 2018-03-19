DROP TABLE rooms_songs;
DROP TABLE guests;
DROP TABLE rooms;
DROP TABLE songs;


CREATE TABLE rooms (
  id SERIAL8 PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  max_capacity INT NOT NULL,
  entrance_fee INT NOT NULL,
);

CREATE TABLE songs (
  id SERIAL8 PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  max_capacity INT NOT NULL,
  entrance_fee INT NOT NULL,
  sum_entrance_fee INT NOT NULL
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

INSERT INTO rooms (name, max_capacity, entrance_fee) VALUES ("Indie Room", 10, 5)
INSERT INTO rooms (name, max_capacity, entrance_fee) VALUES ("Rock Room", 18, 5)
INSERT INTO rooms (name, max_capacity, entrance_fee) VALUES ("Jazz Room", 16, 5)

INSERT INTO songs
