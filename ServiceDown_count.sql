select service_name, component_name,count(*) 
from alert_history 
where alert_definition_id in (42,151,52) and alert_state='CRITICAL' and  To_timestamp(alert_timestamp/1000) > CURRENT_DATE - 7 
GROUP BY service_name,component_name;
