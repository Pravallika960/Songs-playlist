-- Createing the database
CREATE DATABASE MusicPlaylistDB;
-- Using the database
USE MusicPlaylistDB;
-- Create Artists table
CREATE TABLE Artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    country VARCHAR(50)
);
-- Creating Albums table
CREATE TABLE Albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist_id INT,
    release_year YEAR,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);
-- Creating Songs table
CREATE TABLE Songs (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    album_id INT,
    duration TIME,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);
-- Creating Playlists table
CREATE TABLE Playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);
-- Create Playlist_Songs table (junction table)
CREATE TABLE Playlist_Songs (
    playlist_id INT,
    song_id INT,
    PRIMARY KEY (playlist_id, song_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);



-- Inserting sample artists
INSERT INTO Artists (name, genre, country) VALUES
('SP.Balu', 'melody', 'India'),
('Chitra', 'melody', 'India'),
('Jungkook', 'kpop', 'Korean');

-- Inserting sample albums
INSERT INTO Albums (title, artist_id, release_year) VALUES
('Roja', 1, 1992),
('Sontham', 2, 2002),
('BTS', 3, 2022);

-- Inserting sample songs
INSERT INTO Songs (title, album_id, duration) VALUES
('Na chelirojave', 1, '00:04:56'),
('telusuna', 2, '00:04:36'),
('Dreamers', 3, '00:03:21');

-- Inserting sample playlists
INSERT INTO Playlists (name, description) VALUES
('My Favorite Songs', 'A collection of my all-time favorite songs.'),
('Sad songs', 'Relaxing music for a calm atmosphere.');

-- Adding songs to playlists
INSERT INTO Playlist_Songs (playlist_id, song_id) VALUES
(1, 3),  -- 'Dreamers' in 'My Favorite Songs'
(1, 2),  -- 'telusuna' in 'My Favorite Songs'
(2, 1);  -- 'Na chelirojave' in 'Sad songs';

-- For Geting  all songs in a specific playlist;

SELECT s.title, a.title AS album_title, ar.name AS artist_name
FROM Playlist_Songs ps
JOIN Songs s ON ps.song_id = s.song_id
JOIN Albums a ON s.album_id = a.album_id
JOIN Artists ar ON a.artist_id = ar.artist_id
WHERE ps.playlist_id = 1;  


-- Getiing all playlists:
SELECT * FROM Playlists;


-- For getting  all songs by a specific artist:
SELECT s.title
FROM Songs s
JOIN Albums a ON s.album_id = a.album_id
JOIN Artists ar ON a.artist_id = ar.artist_id
WHERE ar.name = 'Jungkook';
