# Hortonworks-Analyze-AmbariAlerts
Retrieve the history of Ambari alerts for a specific type and requirements .

# Pre-requisites 
1. Ambari alerts should be configured for the needed services .
2. Collect the definition_id of all the required alerts from postgres ambari database , by quering alert_definition table :-
      `a) psql ambari ambari [default pw is bigdata] ( Run it from ambari-server )`  
      `b) ambari=> select definition_id,definition_name,component_name from alert_definition ;`  

# Retrieve components down history and duration in last n Days 
1. Login to Ambari server .
2. Copy Fetch_ServiceDown_History.sql on ambari server .
3. Open the sql and edit the `AND alert_definition_id in` from the Pre-requisites steps .
4. Run the query as follows :-  
   `su - postgres -c "psql  -d ambari  -f <pathofsql>/Fetch_ServiceDown_History.sql"` > Results.csv
5. cat `Results.csv` to view the desired results .

# Example  
Fetch (datanode_process,hive_server_process) history of last 7 Days :-
Run the Fetch_ServiceDown_History.sql with `alert_definition_id in 42,151 )

```
root@ambari:~# cat Results.csv
component_name |         host_name          |  downtime_start_time   |   downtime_end_time    | downtime  
----------------+----------------------------+------------------------+------------------------+----------  
 DATANODE       | server1.org               | 2019-06-11 18:10:05+00 | 2019-06-11 19:21:38+00 | 01:11:33    
 DATANODE       | server2.org               | 2019-06-11 18:10:33+00 | 2019-06-11 19:21:50+00 | 01:11:17    
 DATANODE       | server3.org               | 2019-06-11 18:10:45+00 | 2019-06-11 19:21:47+00 | 01:11:02  
 HIVE_SERVER    | server2.org               | 2019-06-25 05:16:32+00 | 2019-06-25 05:17:30+00 | 00:00:58
```






