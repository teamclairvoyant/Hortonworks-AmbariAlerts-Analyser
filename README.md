# Hortonworks-Analyze-AmbariAlerts
Retrieve the history of Ambari alerts for a specific type and requirements .

Pre-requisites 
1. Ambari alerts should be configured for the needed services .
2. Collect the definition_id of all the required alerts from postgres ambari database , by quering alert_definition table :-
`ambari=> select definition_id,definition_name,component_name from alert_definition ;`






