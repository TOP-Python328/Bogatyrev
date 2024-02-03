drop database if exists mus_library;
create database mus_library;
use mus_library;

create table performer(
performer_id int primary key auto_increment,
title varchar(50) not null
);

create table songs(
songs_id int primary key auto_increment,
title varchar(50) not null,
performer varchar(50) not null,
collections varchar(50) not null,
style varchar(30) not null,
duration varchar(20) not null
);

create table collections(
collections_id int primary key auto_increment,
title varchar(50) not null,
performer varchar(50) not null,
release_date date not null,
style varchar(30) not null,
publisher varchar(30) not null,
songs_id int,
FOREIGN KEY (songs_id) REFERENCES songs(songs_id)
);

create table styles(
styles_id int primary key auto_increment,
title varchar(50) not null,
collections_id int,
songs_id int,
FOREIGN KEY (collections_id) REFERENCES collections(collections_id),
FOREIGN KEY (songs_id) REFERENCES songs(songs_id)
);

create table publishers(
publishers_id int primary key auto_increment,
title varchar(50) not null,
country varchar(50) not null
);

create table PerfomerCollections(
performer_id int,
collections_id int,
primary key (performer_id, collections_id),
FOREIGN KEY (performer_id) REFERENCES performer(performer_id),
FOREIGN KEY (collections_id) REFERENCES collections(collections_id)
);

create table PublishersCollections(
publishers_id int,
collections_id int,
primary key (publishers_id, collections_id),
FOREIGN KEY (publishers_id) REFERENCES publishers(publishers_id),
FOREIGN KEY (collections_id) REFERENCES collections(collections_id)
);

create table PerfomerSongs(
performer_id int,
songs_id int,
primary key (performer_id, songs_id),
FOREIGN KEY (performer_id) REFERENCES performer(performer_id),
FOREIGN KEY (songs_id) REFERENCES songs(songs_id)
);