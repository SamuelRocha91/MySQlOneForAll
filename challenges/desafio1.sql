DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plan(
    plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    plane_value DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.singer(
    singer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
    album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    singer_id INTEGER,
    year_launch YEAR,
    FOREIGN KEY (singer_id) REFERENCES singer (singer_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
    user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    age INT NOT NULL,
    plan_id INTEGER,
    date_assign DATE NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plan (plan_id)) engine = InnoDB;
    
    CREATE TABLE SpotifyClone.song(
    song_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    singer_id INTEGER,
    rate INT NOT NULL,
    album_id INTEGER,
    FOREIGN KEY (singer_id) REFERENCES singer (singer_id),
    FOREIGN KEY (album_id) REFERENCES album (album_id)
) engine = InnoDB;
    
CREATE TABLE SpotifyClone.historic(
    user_id INTEGER,
    song_id INTEGER,
    date_view DATETIME,
    CONSTRAINT PRIMARY KEY(user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (song_id) REFERENCES song (song_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.followers(
    user_id INTEGER,
    singer_id INTEGER,
    CONSTRAINT PRIMARY KEY(user_id, singer_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (singer_id) REFERENCES singer (singer_id)
) engine = InnoDB;
INSERT INTO SpotifyClone.plan (plan_id, name, plane_value)
VALUES
  (1, 'gratuito', 0),
  (2, 'familiar', 7.99),
  (3, 'universitário', 5.99),
  (4, 'pessoal', 6.99);
   INSERT INTO SpotifyClone.singer (singer_id, name)
VALUES
  (1, 'Beyoncé'),
  (2, 'Queen'),
  (3, 'Elis Regina'),
  (4, 'Baco Exu do Blues'),
  (5, 'Blind Guardian'),
  (6, 'Nina Simone');
  
    INSERT INTO SpotifyClone.album (album_id, name, singer_id, year_launch)
VALUES
  (1, 'Renaissance', 1, 2022),
  (2, 'Jazz', 2, 1978),
  (3, 'Hot Space', 2, 1982),
  (4, 'Falso Brilhante', 3, 1998),
  (5, 'Vento de Maio', 3, 2001),
  (6, 'QVVJFA?', 4, 2003),
  (7, 'Somewhere Far Beyond', 5, 2007),
  (8, 'I Put A Spell On You', 6, 2012);

INSERT INTO SpotifyClone.users (user_id, first_name, last_name, age, plan_id, date_assign)
VALUES
  (1, 'Barbara', 'Liskov', 82, 1, '2019-10-20'),
  (2, 'Robert', 'Cecil Martin', 58, 1, '2017-01-06'),
  (3, 'Ada', 'Lovelace', 37, 2, '2017-12-30'),
  (4, 'Martin', 'Fowler', 46, 2, '2017-01-17'),
  (5, 'Sandi', 'Metz', 58, 2, '2018-04-29'),
  (6, 'Paulo', 'Freire', 19, 3, '2018-02-14'),
  (7, 'Bell', 'Hooks', 26, 3, '2018-01-05'),
  (8, 'Christopher', 'Alexander', 85, 3, '2019-06-05'),
  (9, 'Judith', 'Butler', 45, 4, '2020-05-13'),
  (10, 'Jorge', 'Amado', 58, 4, '2017-02-17');
  
     INSERT INTO SpotifyClone.song (song_id, name, singer_id, rate, album_id)
VALUES
  (1, "BREAK MY SOUL", 1, 279, 1),
  (2, "VIRGO'S GROOVE", 1, 369, 1),
  (3, "ALIEN SUPERSTAR", 1, 116, 1),
  (4, "Don't Stop Me Now", 2, 203, 2),
  (5, "Under Pressure", 2, 152, 3),
  (6, "Como Nossos Pais", 3, 105, 4),
  (7, "O Medo de Amar é o Medo de Ser Livre", 3, 207, 5),
  (8, "Samba em Paris", 4, 267, 6),
  (9, "The Bard's Song", 5, 244, 7),
  (10, "Feeling Good", 6, 100, 8);


  INSERT INTO SpotifyClone.historic (user_id, song_id, date_view)
VALUES
  (1, 8, "2022-02-28 10:45:55"),
  (1, 2,  "2020-05-02 05:30:35"),
  (1, 10, "2020-03-06 11:22:33"),
  (2, 10, "2022-08-05 08:05:17"),
  (2, 7, "2020-01-02 07:40:33"),
  (3, 10, "2020-11-13 16:55:13"),
  (3, 2,  "2020-12-05 18:38:30"),
  (4, 8, "2021-08-15 17:10:10"),
  (5, 8, "2022-01-09 01:44:33"),
  (5, 5,  "2020-08-06 15:23:43"),
  (6, 7,  "2017-01-24 00:31:17"),
  (6, 1,  "2017-10-12 12:35:20"),
  (7, 4,  "2011-12-15 22:30:49"),
  (8, 4,  "2012-03-17 14:56:41"),
  (9, 9,  "2022-02-24 21:14:22"),
  (10, 3,  "2015-12-13 08:30:22");

INSERT INTO SpotifyClone.followers ( user_id, singer_id)
VALUES
  ( 1, 1),
  ( 1, 2),
  ( 1, 3),
  ( 2, 1),
  ( 2, 3),
  ( 3, 2),
  ( 4, 4),
  ( 5, 5),
  ( 5, 6),
  ( 6, 6),
  ( 6, 1),
  ( 7, 6),
  ( 9, 3),
  (10, 2);