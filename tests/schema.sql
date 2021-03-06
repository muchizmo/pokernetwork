--
-- Copyright (C) 2004, 2005, 2006 Mekensleep <licensing@mekensleep.com>
--                                24 rue vieille du temple, 75004 Paris
--
-- This software's license gives you freedom; you can copy, convey,
-- propagate, redistribute and/or modify this program under the terms of
-- the GNU Affero General Public License (AGPL) as published by the Free
-- Software Foundation, either version 3 of the License, or (at your
-- option) any later version of the AGPL.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero
-- General Public License for more details.
--
-- You should have received a copy of the GNU Affero General Public License
-- along with this program in a file in the toplevel directory called
-- "AGPLv3".  If not, see <http://www.gnu.org/licenses/>.
--
-- Authors:
--  Loic Dachary <loic@dachary.org>
drop table if exists users;

create table users (
	serial int unsigned not null auto_increment,
	name varchar(32),
	email varchar(128),
	skin_url varchar(32) default "default",
	skin_outfit text,
        skin_image blob,
        skin_image_type varchar(32),
	password varchar(32),
	privilege int default 1,

	play_money int default 1000000,
        custom_money int default 0,
	point_money int default 5000,

	rating int default 1000,
	future_rating float default 1000,
	games_count int default 0,
	
	primary key (serial),
        unique key name_idx (name),
        unique key email_idx (email)
);

drop table if exists users_private;

create table users_private (
	serial int unsigned not null,
	addr_street varchar(255) default "",
	addr_zip varchar(64) default "",
	addr_town varchar(64) default "",
	addr_state varchar(128) default "",
	addr_country varchar(64) default "",
	phone varchar(64) default "",
        verified char default 'n',
        verified_time int default 0,

	primary key (serial)
);

drop table if exists user2table;

create table user2table (
	user_serial int unsigned not null,
	table_serial int unsigned not null,
	money int default 0 not null,
	bet int default 0 not null,
  custom_money char default 'n',

	primary key (user_serial,table_serial)
);

drop table if exists hands;

create table hands (
	serial int unsigned not null auto_increment,
	name varchar(32),
	description text not null,

	primary key (serial)
);

drop table if exists user2hand;

create table user2hand (
	user_serial int not null,
	hand_serial int not null,

	primary key (user_serial, hand_serial)
);

drop table if exists tourneys_schedule;

create table tourneys_schedule (
	serial int unsigned not null auto_increment,
  name varchar(32),
  description_short varchar(64),
  description_long text,
  players_quota int default 10,
  variant varchar(32),
  betting_structure varchar(32),
  seats_per_game int default 10,
  custom_money char default 'n',
  buy_in int,
  rake int,
  sit_n_go char default 'y',
  breaks_interval int default 60,
  rebuy_delay int default 0,
  add_on int default 0,
  add_on_delay int default 60,
  start_time int default 0,

  register_time int default 0,
  respawn char default 'n',
  respawn_interval int default 0,

	primary key (serial)
);

--
-- Holdem sit and go
--
INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'sitngo2', 'Sit and Go 2 players, Holdem', 'Sit and Go 2 players', '2', 'holdem', 'level-15-30-no-limit', '2', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'sitngo3', 'Sit and Go 3 players, Holdem', 'Sit and Go 3 players', '3', 'holdem', 'level-15-30-no-limit', '3', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'sitngo4', 'Sit and Go 4 players, Holdem', 'Sit and Go 4 players', '4', 'holdem', 'level-15-30-no-limit', '4', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'sitngo5', 'Sit and Go 5 players, Holdem', 'Sit and Go 5 players', '5', 'holdem', 'level-15-30-no-limit', '5', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'sitngo6', 'Sit and Go 6 players, Holdem', 'Sit and Go 6 players', '6', 'holdem', 'level-15-30-no-limit', '6', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'sitngo7', 'Sit and Go 7 players, Holdem', 'Sit and Go 7 players', '7', 'holdem', 'level-15-30-no-limit', '7', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'sitngo8', 'Sit and Go 8 players, Holdem', 'Sit and Go 8 players', '8', 'holdem', 'level-15-30-no-limit', '8', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'sitngo9', 'Sit and Go 9 players, Holdem', 'Sit and Go 9 players', '9', 'holdem', 'level-15-30-no-limit', '9', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'sitngo10', 'Sit and Go single table, Holdem', 'Sit and Go single table', '10', 'holdem', 'level-15-30-no-limit', '10', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'sitngo20', 'Sit and Go 2 tables, Holdem', 'Sit and Go 2 tables', '20', 'holdem', 'level-15-30-no-limit', '10', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'sitngo30', 'Sit and Go 3 tables, Holdem', 'Sit and Go 3 tables', '30', 'holdem', 'level-15-30-no-limit', '10', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'sitngo50', 'Sit and Go 5 tables, Holdem', 'Sit and Go 5 tables', '50', 'holdem', 'level-15-30-no-limit', '10', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );
--
-- Omaha sit and go
--
INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'Ositngo2', 'Sit and Go 2 players, Omaha', 'Sit and Go 2 players', '2', 'omaha', 'level-15-30-no-limit', '2', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'Ositngo3', 'Sit and Go 3 players, Omaha', 'Sit and Go 3 players', '3', 'omaha', 'level-15-30-no-limit', '3', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'Ositngo4', 'Sit and Go 4 players, Omaha', 'Sit and Go 4 players', '4', 'omaha', 'level-15-30-no-limit', '4', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'Ositngo5', 'Sit and Go 5 players, Omaha', 'Sit and Go 5 players', '5', 'omaha', 'level-15-30-no-limit', '5', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'Ositngo6', 'Sit and Go 6 players, Omaha', 'Sit and Go 6 players', '6', 'omaha', 'level-15-30-no-limit', '6', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'Ositngo7', 'Sit and Go 7 players, Omaha', 'Sit and Go 7 players', '7', 'omaha', 'level-15-30-no-limit', '7', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'Ositngo8', 'Sit and Go 8 players, Omaha', 'Sit and Go 8 players', '8', 'omaha', 'level-15-30-no-limit', '8', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'Ositngo9', 'Sit and Go 9 players, Omaha', 'Sit and Go 9 players', '9', 'omaha', 'level-15-30-no-limit', '9', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'Ositngo10', 'Sit and Go single table, Omaha', 'Sit and Go single table', '10', 'omaha', 'level-15-30-no-limit', '10', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'Ositngo20', 'Sit and Go 2 tables, Omaha', 'Sit and Go 2 tables', '20', 'omaha', 'level-15-30-no-limit', '10', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'Ositngo30', 'Sit and Go 3 tables, Omaha', 'Sit and Go 3 tables', '30', 'omaha', 'level-15-30-no-limit', '10', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` ( `name`, `description_short` , `description_long` , `players_quota` , `variant` , `betting_structure` , `seats_per_game` , `custom_money` , `buy_in` , `rake` , `sit_n_go` , `start_time` , `register_time` , `respawn` , `respawn_interval` )
VALUES ( 'Ositngo50', 'Sit and Go 5 tables, Omaha', 'Sit and Go 5 tables', '50', 'omaha', 'level-15-30-no-limit', '10', 'n', '3000', '0', 'y', '0', '0', 'y', '0' );

INSERT INTO `tourneys_schedule` (`serial`, `name`, `description_short`, `description_long`, `players_quota`, `variant`, `betting_structure`, `seats_per_game`, `custom_money`, `buy_in`, `rake`, `sit_n_go`, `breaks_interval`, `rebuy_delay`, `add_on`, `add_on_delay`, `start_time`, `register_time`, `respawn`, `respawn_interval`) VALUES ('', 'regular1', 'Holdem No Limit, 200 + 10', 'Holdem No Limit, 200 + 10', '1000', 'holdem', 'level-15-30-no-limit', '10', 'n', '200', '10', 'n', '60', '30', '1', '60', unix_timestamp(now() + interval 8 hour), unix_timestamp(now() + interval 7 hour), 'n', '0');
INSERT INTO `tourneys_schedule` (`serial`, `name`, `description_short`, `description_long`, `players_quota`, `variant`, `betting_structure`, `seats_per_game`, `custom_money`, `buy_in`, `rake`, `sit_n_go`, `breaks_interval`, `rebuy_delay`, `add_on`, `add_on_delay`, `start_time`, `register_time`, `respawn`, `respawn_interval`) VALUES ('', 'regular2', 'Holdem No Limit, 2000 + 100', 'Holdem No Limit, 2000 + 100', '1000', 'holdem', 'level-15-30-no-limit', '10', 'n', '2000', '100', 'n', '60', '30', '1', '60', unix_timestamp(now() + interval 9 hour), unix_timestamp(now() + interval 8 hour), 'n', '0');
INSERT INTO `tourneys_schedule` (`serial`, `name`, `description_short`, `description_long`, `players_quota`, `variant`, `betting_structure`, `seats_per_game`, `custom_money`, `buy_in`, `rake`, `sit_n_go`, `breaks_interval`, `rebuy_delay`, `add_on`, `add_on_delay`, `start_time`, `register_time`, `respawn`, `respawn_interval`) VALUES ('', 'regular1', 'Omaha No Limit, 200 + 10', 'Omaha No Limit, 200 + 10', '1000', 'omaha', 'level-15-30-no-limit', '10', 'n', '200', '10', 'n', '60', '30', '1', '60', unix_timestamp(now() + interval 10 hour), unix_timestamp(now() + interval 9 hour), 'n', '0');
INSERT INTO `tourneys_schedule` (`serial`, `name`, `description_short`, `description_long`, `players_quota`, `variant`, `betting_structure`, `seats_per_game`, `custom_money`, `buy_in`, `rake`, `sit_n_go`, `breaks_interval`, `rebuy_delay`, `add_on`, `add_on_delay`, `start_time`, `register_time`, `respawn`, `respawn_interval`) VALUES ('', 'regular2', 'Omaha No Limit, 2000 + 100', 'Omaha No Limit, 2000 + 100', '1000', 'omaha', 'level-15-30-no-limit', '10', 'n', '2000', '100', 'n', '60', '30', '1', '60', unix_timestamp(now() + interval 11 hour), unix_timestamp(now() + interval 10 hour), 'n', '0');
INSERT INTO `tourneys_schedule` (`serial`, `name`, `description_short`, `description_long`, `players_quota`, `variant`, `betting_structure`, `seats_per_game`, `custom_money`, `buy_in`, `rake`, `sit_n_go`, `breaks_interval`, `rebuy_delay`, `add_on`, `add_on_delay`, `start_time`, `register_time`, `respawn`, `respawn_interval`) VALUES ('', 'regular1', 'Omaha8 No Limit, 200 + 10', 'Omaha8 No Limit, 200 + 10', '1000', 'omaha8', 'level-15-30-no-limit', '10', 'n', '200', '10', 'n', '60', '30', '1', '60', unix_timestamp(now() + interval 12 hour), unix_timestamp(now() + interval 11 hour), 'n', '0');
INSERT INTO `tourneys_schedule` (`serial`, `name`, `description_short`, `description_long`, `players_quota`, `variant`, `betting_structure`, `seats_per_game`, `custom_money`, `buy_in`, `rake`, `sit_n_go`, `breaks_interval`, `rebuy_delay`, `add_on`, `add_on_delay`, `start_time`, `register_time`, `respawn`, `respawn_interval`) VALUES ('', 'regular2', 'Omaha8 No Limit, 2000 + 100', 'Omaha8 No Limit, 2000 + 100', '1000', 'omaha8', 'level-15-30-no-limit', '10', 'n', '2000', '100', 'n', '60', '30', '1', '60', unix_timestamp(now() + interval 13 hour), unix_timestamp(now() + interval 12 hour), 'n', '0');

drop table if exists tourneys;

create table tourneys (
      	serial int unsigned not null auto_increment,
  name varchar(32),
  description_short varchar(64),
  description_long text,
  players_quota int default 10,
  variant varchar(32),
  betting_structure varchar(32),
  seats_per_game int default 10,
  custom_money char default 'n',
  buy_in int,
  rake int,
  sit_n_go char default 'y',
  breaks_interval int default 60,
  rebuy_delay int default 0,
  add_on int default 0,
  add_on_delay int default 60,
  start_time int default 0,

  finish_time int default 0,
  state varchar(32) default "registering",
  schedule_serial int,
  add_on_count int default 0,
  rebuy_count int default 0,

	primary key (serial)
);

drop table if exists user2tourney;

create table user2tourney (
	user_serial int not null,
	tourney_serial int not null,
  table_serial int,
  rank int default -1,

	primary key (user_serial, tourney_serial)
);

--
-- Default users
--
INSERT INTO users (serial, name, privilege) VALUES (1, ' rake ', 0);

INSERT INTO users (serial, name, password, privilege) VALUES (2, 'admin', 'REPLACE', 2);
INSERT INTO users_private (serial) VALUES (2);

INSERT INTO users (serial, name, password, privilege) VALUES (3, 'admin_web', 'REPLACE', 1);
INSERT INTO users_private (serial) VALUES (3);

drop table if exists users_transactions;
--
-- Transactions between users
--
create table users_transactions (
	from_serial int unsigned not null,
	to_serial int unsigned not null,
        created int default 0,
        amount int default 0,
        custom_money char default 'n',
        status char default 'n',
        status_time int default 0,
        notes text,

        primary key (from_serial,to_serial)
);

drop table if exists users_wins;
--
-- How much a user wins/loses to another player in one hand
--
create table users_wins (
        from_serial int unsigned not null,
	to_serial int unsigned not null,
	hand_serial int unsigned not null,
        created timestamp not null,
        amount int default 0,
        custom_money char default 'n',

        primary key (from_serial,to_serial,hand_serial)
);

