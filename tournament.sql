-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Connect to default data base
\c vagrant;

-- Recreate 'tournament' database
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament;

-- Create table 'players'
CREATE TABLE players(
 id serial PRIMARY KEY,
 name text
);

-- Create table 'metches'
CREATE TABLE matches(
 winner int references players (id),
 loser int  references players (id)
);
