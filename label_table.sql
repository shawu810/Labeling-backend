#-- create the raw tweets table

#IF EXISTS TABLE raw_tweets;
#--Drop TABLE raw_tweets;
CREATE TABLE IF NOT EXISTS Label(
	label_id        INT AUTO_INCREMENT,
	labeler_id   	INT,
	record_id       BIGINT,
	labels          TEXT,
	FOREIGN KEY (record_id) REFERENCES MobilityRecord(tweet_id),
	PRIMARY KEY (label_id)
)ENGINE=InnoDB;
