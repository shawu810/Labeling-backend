#-- create the raw tweets table

#IF EXISTS TABLE raw_tweets;
#--Drop TABLE raw_tweets;
CREATE TABLE IF NOT EXISTS raw_tweets(
	tweet_id BIGINT NOT NULL,
	timestamp BIGINT,
	user_id BIGINT,
	profile_location varchar(255),
	lat DOUBLE,
	lon DOUBLE,
	content TEXT,
	PRIMARY KEY (tweet_id)
);
