import MySQLdb
from random import randrange
import random

global db_connection, cursor, output_dump

def d2s(a):
    if a <10:
        return '0'+str(a)
    else:
        return str(a)

def next_day(timestamp):
    ms = [31,28,31,30,31,30,31,31,30,31,30,31]
    mss= [31,29,31,30,31,30,31,31,30,31,30,31]
    year = int(timestamp[0:4])
    month= int(timestamp[4:6])
    day  = int(timestamp[6:8])
    extra= '000000000'
    next_year = year
    next_month= month
    next_day  = day
    if year == 2012:
        d_ms = mss
    else :
        d_ms = ms
    if day >= d_ms[month-1]:
        next_day   = 1
        if month >= 12:
            next_year = year + 1
            next_month= 1
        else:
            next_month= month + 1
    else:
        next_day = day + 1
    return str(next_year)+d2s(next_month)+d2s(next_day)+extra

def make_p(lon,lat):
    return "GeomFromText('Point("+str(lon)+" "+str(lat)+")')"

def make_t(timestamp):
    timestamp = str(timestamp)
    year = timestamp[0:4]
    month= timestamp[4:6]
    day  = timestamp[6:8]
    hour = timestamp[8:10]
    minu = timestamp[10:12]
    secs = timestamp[12:14]
    return "TIMESTAMP '"+year+"-"+month+"-"+day+" "+hour+":"+minu+":"+secs+"'"



global connection, cursor

hostname = ""
user     = ""
passwd   = ""
db       = ""
connection = MySQLdb.connect(hostname, user, passwd,db)
cursor   = connection.cursor()


min_timestamp          = 20110302000000000
max_timestamp          = 20130731000000000
current_timestamp      = str(min_timestamp)
while int(current_timestamp) < max_timestamp:
    print current_timestamp
    lower_day = current_timestamp
    upper_day = next_day(lower_day)
    current_timestamp = upper_day
    query = "SELECT timestamp,lon,lat,tweet_id FROM raw_tweets WHERE timestamp >= " + lower_day + " AND " + "timestamp < " + upper_day + ";"
    try:
        cursor.execute(query)
    except Exception as e:
        print "ERROR: query-->" + query
        print e
        connection.commit()
        continue
    for one_result in cursor.fetchall():
        timestamp = one_result[0]
        lon       = one_result[1]
        lat       = one_result[2]
        tweetid   = one_result[3]
        loc       = make_p(lon,lat)
        query2    = "INSERT INTO location_table(tweetid,location,timestamp) VALUES ("+str(tweetid)+","+loc+","+str( timestamp) +");"
        try:
            cursor.execute(query2)
        except Exception as e:
            print e
            connection.commit()
            continue
    connection.commit()

