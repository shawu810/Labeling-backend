analysis_diveristy:  
			several user cases on diversity of the locations a user visited
check_size.sql
			sql query to check the size of whole database
compute_user_stat.py
			Update statistics field in the user table. Acitive users only!!
				- location entropy
				- topk ratio
			Query result from databases
			Need TweetUser, MobilityRecord, raw_tweets tables
			-- RUN AFTER parsing_data.py
			-- RUN AFTER find_active_user.py
create_dict_table.sql --NEED UPDATE
			sql query to create the following tables 
				Dictionary
				wordOccurence
				Annotation
create_tables.sql
			sql query to create the following tables
				MobilityRecord
				UserStat --NOT USED
				MobilityRecord
find_active_user.py
			Find active users. Update the active field in the user table
			Query result from database
			Need TweetUser, MobilityRecord, raw_tweets tables
			-- RUN AFTER parsing_data.py
parsing_data.py
			Fill in the intital MobilityRecord and User tables
			Obtain data from raw Tweets file
			Need raw_tweets table
			Have function filling the raw_tweets table
			-- NO dependency
parsing_word_table.py
			Fill in the intitial dictionary and wordOccurence tables
			Obtain data from raw Tweets file
			-- NO dependency
raw_table.sql
			sql query to create the following tables
				raw_tweets
sample_tweets_from_active_user.py
			Sample a random tweet from an active user
Readme.txt
			You are reading me now.
