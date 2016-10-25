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

-- Create view 'standings'
CREATE OR REPLACE VIEW standings AS
  SELECT p.id,
         p.name,
         count(mw.winner) AS wins,
         count(ml.loser) + count(mw.winner) AS matches
    FROM players AS p
      LEFT JOIN matches AS mw
      ON p.id = mw.winner
      LEFT JOIN matches AS ml
      ON p.id = ml.loser
    GROUP BY p.id
    ORDER BY wins DESC, matches ASC;
