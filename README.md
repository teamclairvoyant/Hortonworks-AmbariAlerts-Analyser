# Hortonworks-Analyze-AmbariAlerts
Retrieve the history of Ambari alerts for a specific type and requirements .

# Pre-requisites 
1. Ambari alerts should be configured for the needed services .
2. Collect the definition_id of all the required alerts from postgres ambari database , by quering alert_definition table :-
   ```a) psql ambari ambari [default pw is bigdata] ( Run it from ambari-server ) 
      b) ambari=> select definition_id,definition_name,component_name from alert_definition ;```

# Retrieve components down history and duration in last n Days 
1. Login to Ambari server .
2. Copy Fetch_ServiceDown_History.sql on ambari server .
3. Open the sql and edit the `AND alert_definition_id in` from the Pre-requisites steps .
4. Run the query as follows :-
   `su - postgres -c "psql  -d ambari  -f /var/lib/postgresql/Fetch_ServiceDown_History.sql"`







