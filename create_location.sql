CREATE TABLE IF NOT EXISTS location_table(
	tweetid   BIGINT,
	timestamp BIGINT(20),
	location GEOMETRY NOT NULL,
	FOREIGN KEY (tweetid) REFERENCES MobilityRecord(tweet_id),
	SPATIAL INDEX(location),
	INDEX(timestamp)
) ENGINE = MyISAM ;


