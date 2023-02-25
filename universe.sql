create database universe;

\c universe;

create table galaxy(
  descript text,
  galaxy_id serial unique primary key,
  age_in_millions_of_years int not null,
  radius_in_light_year int not null,
  name varchar(30) unique
);

create table star(
  descript text,
  star_id serial unique primary key,
  galaxy_id serial, 
  age_in_millions_of_years int not null,
  radius numeric not null,
  name varchar(30) unique,
  foreign key(galaxy_id) references galaxy(galaxy_id)
);

create table planet(
  descript text,
  planet_id serial unique primary key,
  star_id serial,
  has_life boolean,
  is_spherical boolean,
  age_in_millions_of_years int not null,
  foreign key(star_id) references star(star_id),
  name varchar(30) unique
);

create table moon(
  descript text,
  moon_id serial unique primary key,
  planet_id serial,
  age_in_millions_of_years int not null,
  radius numeric,
  name varchar(30) unique,
  foreign key(planet_id) references planet(planet_id)
);

create table id_tables(
  id_tables_id serial primary key,
  galaxy_id serial unique,
  star_id serial,
  planet_id serial,
  moon_id serial,
  name varchar(30),
  foreign key(galaxy_id) references galaxy(galaxy_id),
  foreign key(star_id) references star(star_id),
  foreign key(planet_id) references planet(planet_id),
  foreign key(moon_id) references moon(moon_id)
);


insert into galaxy(age_in_millions_of_years, 
    radius_in_light_year, name)
    values(1, 1, 'a'),
    (1, 1, 'b'),
    (1, 1, 'c'),
    (1, 1, 'd'),
    (1, 1, 'e'),
    (1, 1, 'f');

insert into star(galaxy_id, age_in_millions_of_years, 
    radius, name)
    values(1, 1, 1, 'a'),
    (2, 1, 1, 'b'),
    (3, 1, 1, 'c'),
    (4, 1, 1, 'd'),
    (5, 1, 1, 'e'),
    (6, 1, 1, 'f');

insert into planet(star_id, age_in_millions_of_years, 
    has_life, name)
    values(1, 1, true, 'a'),
    (1, 1, true, 'b'),
    (2, 1, true, 'c'),
    (2, 1, true, 'd'),
    (3, 1, true, 'e'),
    (3, 1, true, 'f'),
    (4, 1, true, 'g'),
    (4, 1, true, 'h'),
    (5, 1, true, 'i'),
    (5, 1, true, 'j'),
    (6, 1, true, 'k'),
    (6, 1, true, 'l');

insert into moon(planet_id, age_in_millions_of_years, 
    radius, name)
    values(1, 1, 1, 'aa'),
    (1, 1, 1, 'ab'),
    (1, 1, 1, 'ac'),
    (1, 1, 1, 'ad'),
    (2, 1, 1, 'ba'),
    (2, 1, 1, 'bb'),
    (2, 1, 1, 'bc'),
    (2, 1, 1, 'bd'),
    (3, 1, 1, 'ca'),
    (3, 1, 1, 'cb'),
    (3, 1, 1, 'cc'),
    (3, 1, 1, 'cd'),
    (4, 1, 1, 'da'),
    (4, 1, 1, 'db'),
    (4, 1, 1, 'dc'),
    (4, 1, 1, 'dd'),
    (5, 1, 1, 'ea'),
    (5, 1, 1, 'eb'),
    (5, 1, 1, 'ec'),
    (5, 1, 1, 'ed');
    

insert into id_tables(galaxy_id, star_id, planet_id, moon_id)
    values(1, 1, 1, 1),
          (2, 1, 1, 2),
          (3, 1, 1, 3);
    

