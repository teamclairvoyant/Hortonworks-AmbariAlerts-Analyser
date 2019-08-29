-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at

-- http://www.apache.org/licenses/LICENSE-2.0
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

-- Copyright Clairvoyant 2019

select service_name, component_name,count(*) 
from alert_history 
where alert_definition_id in (42,151,52) and alert_state='CRITICAL' and  To_timestamp(alert_timestamp/1000) > CURRENT_DATE - 7 
GROUP BY service_name,component_name;
