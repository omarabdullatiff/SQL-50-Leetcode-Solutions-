# Write your MySQL query statement below

with lag_CTE as (
    SELECT  id ,temperature , recordDate ,
lag(temperature , 1) over(order by recordDate ) as previous_temp ,
lag(recordDate , 1) over(order by recordDate ) as previous_date 

from Weather 
)

select id from lag_CTE where temperature > previous_temp and 
recordDate = adddate(previous_date , interval 1 day  )
;