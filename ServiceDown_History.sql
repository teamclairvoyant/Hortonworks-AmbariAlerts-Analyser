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

SELECT q.component_name,
       q.host_name,
       q.prev_update_at downtime_start_time,
       q.alert_timestamp2 downtime_end_time,
       q.alert_timestamp2- q.prev_update_at downtime
FROM   (
                SELECT   component_name,
                         host_name,
                         To_timestamp(alert_timestamp/1000) alert_timestamp2 ,
                         alert_label,
                         alert_state,
                         Lag(To_timestamp(alert_timestamp/1000)) OVER( partition BY component_name,host_name ORDER BY To_timestamp(alert_timestamp/1000) ) AS prev_update_at
                FROM     ambari.alert_history
                WHERE    To_timestamp(alert_timestamp/1000) > CURRENT_DATE - 7
--Dev           AND alert_definition_id in (2,4,13,28,33,42,51,53,55,71,72,54,152,151,252,107,322,335,338)
--Prod	        AND alert_definition_id in (3, 13, 17, 35, 41, 68, 40, 42, 43, 56, 51, 55, 81,122, 19, 18, 20, 44,221,171, 54, 48,  1,275,278)
                ORDER BY component_name,host_name,alert_timestamp) q
                WHERE q.alert_state like '%OK%'
                and q.prev_update_at is not null
                ORDER BY q.component_name,q.host_name,q.alert_timestamp2;
