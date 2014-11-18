#DROP TABLE ;
#DROP TABLE ;

CREATE TABLE IF NOT EXISTS Dictionary(
	word_id BIGINT AUTO_INCREMENT,
	word    VARCHAR(255) UNIQUE,
	PRIMARY KEY (word_id)
);

CREATE TABLE IF NOT EXISTS wordOccurrence(
	timestamp BIGINT(20),
	word_id BIGINT,
	location GEOMETRY NOT NULL,
    FOREIGN KEY (word_id) REFERENCES Dictionary(word_id),
	SPATIAL INDEX(location)
) ENGINE = MyISAM ;

# ALTER TABLE wordOccurrence ADD INDEX (timestamp);
CREATE TABLE IF NOT EXISTS Annotation50(
	record_id BIGINT,
	word_id   BIGINT,
	score     DECIMAL(20,10),
	FOREIGN KEY (record_id) REFERENCES MobilityRecord(tweet_id),
	FOREIGN KEY (word_id) REFERENCES Dictionary(word_id)
) ENGINE = InnoDB;
