#DROP TABLE MobilityRecord;
#DROP TABLE TweetUser;

CREATE TABLE IF NOT EXISTS UserStat(
	user_id BIGINT,
	PRIMARY KEY (user_id),
	FOREIGN KEY (user_id) REFERENCES TweetUser(user_id)
);


#-- create the user table
#IF EXISTS TABLE TweetUser;
#	DROP  TABLE TweetUser;
CREATE TABLE IF NOT EXISTS TweetUser(
	user_id BIGINT,
	active BINARY,
	number_of_tweets INT,
	location_entropy DECIMAL(20,10),
	top1_percent     DECIMAL(20,10),
	top2_percent     DECIMAL(20,10),
	PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS MobilityRecord(
	user_id BIGINT NOT NULL,
	tweet_id BIGINT NOT NULL,
	isEvent  BINARY,
	PRIMARY KEY (tweet_id),
	FOREIGN KEY (tweet_id) REFERENCES raw_tweets(tweet_id),
	FOREIGN KEY (user_id) REFERENCES TweetUser(user_id)
);
