DROP TABLE IF EXISTS users, tournaments, players, tournament_users, tournament_type, tournament_match, tournament_messages, whispers;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

create TABLE tournaments (
	tournament_id SERIAL NOT NULL,
	participants int NOT NULL,
	winner varchar(50),
	admin_user int NOT NULL,
	tournament_status varchar(30) NOT NULL,
	tournament_type int NOT NULL,
	tournament_name varchar (75),
	CONSTRAINT PK_tournament PRIMARY KEY (tournament_id)


);

CREATE TABLE tournament_messages (
	tournament_message_id SERIAL NOT NULL,
	admin_user int NOT NULL,
	tournament_id int NOT NULL,
	sender_username varchar(100) NOT NULL,
	match_description varchar(500) NOT NULL,
	winner varchar(100),
	unread boolean NOT NULL,
	CONSTRAINT PK_tournament_message PRIMARY KEY (tournament_message_id)
);

create TABLE players (
	player_id SERIAL NOT NULL,
	wins int NOT NULL,
	losses int NOT NULL,
	user_id int NOT NULL,
	username varchar (50) NOT NULL,

	CONSTRAINT PK_player PRIMARY KEY (player_id)

);

create TABLE tournament_users (
	tournament_id int NOT NULL,
	player_id int NOT NULL,
	isOut boolean NOT NULL,
	seed int

);

create TABLE tournament_type (
	tournament_type_id int NOT NULL,
	tournament_type_name varchar(100),
	tournament_avatar varchar(500),

	CONSTRAINT PK_tournament_type_id PRIMARY KEY (tournament_type_id)
);

create TABLE tournament_match (
	match_id SERIAL NOT NULL,
	round int,
	winner int,
	tournament_id int NOT NULL,
	player_id int,
	away_player_id int,
	player_username varchar(50),
	away_player_username varchar(50),

	CONSTRAINT PK_match_id PRIMARY KEY (match_id)
);

CREATE TABLE whispers (
	whisper_id SERIAL NOT NULL,
	to_player_id int,
	player_id int,
	whisper_message varchar(500),
	isRead boolean,

	CONSTRAINT PK_whisper_id PRIMARY KEY (whisper_id)
);

	ALTER TABLE tournaments ADD CONSTRAINT FK_admin_user FOREIGN KEY (admin_user) REFERENCES users(user_id);
	ALTER TABLE tournaments ADD CONSTRAINT FK_tournament_type FOREIGN KEY (tournament_type) REFERENCES tournament_type(tournament_type_id);
	ALTER TABLE players ADD CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id);
	ALTER TABLE tournament_users ADD CONSTRAINT FK_tournament_id FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id);
	ALTER TABLE tournament_users ADD CONSTRAINT FK_player_id FOREIGN KEY (player_id) REFERENCES players(player_id);
	ALTER TABLE players ADD CONSTRAINT FK_username FOREIGN KEY (username) REFERENCES users(username);
	ALTER TABLE tournament_match ADD CONSTRAINT FK_player_id FOREIGN KEY (player_id) REFERENCES players(player_id);
	ALTER TABLE tournament_match ADD CONSTRAINT FK_tournament_id FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id);
	ALTER TABLE tournament_messages ADD CONSTRAINT FK_tournament_id FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id);
	ALTER TABLE whispers ADD CONSTRAINT FK_player_id FOREIGN KEY (player_id) REFERENCES players(player_id);
	


INSERT INTO tournament_type (tournament_type_id, tournament_type_name, tournament_avatar) VALUES (0, 'Other', 'C:/Users/Student/workspace/java-finalcapstone-team0/vue/src/capstone-images/colosseum.svg');
INSERT INTO tournament_type (tournament_type_id, tournament_type_name, tournament_avatar) VALUES (1, 'Sports', 'C:/Users/Student/workspace/java-finalcapstone-team0/vue/src/capstone-images/soccerBall.svg');
INSERT INTO tournament_type (tournament_type_id, tournament_type_name, tournament_avatar) VALUES (2, 'Video Games', 'C:/Users/Student/workspace/java-finalcapstone-team0/vue/src/capstone-images/joystick-png.svg');
INSERT INTO tournament_type (tournament_type_id, tournament_type_name, tournament_avatar) VALUES (3, 'League of Legends', 'C:/Users/Student/workspace/java-finalcapstone-team0/vue/src/capstone-images/LOL.svg');
INSERT INTO tournament_type (tournament_type_id, tournament_type_name, tournament_avatar) VALUES (4, 'Cards', 'C:/Users/Student/workspace/java-finalcapstone-team0/vue/src/capstone-images/playingCards.svg');