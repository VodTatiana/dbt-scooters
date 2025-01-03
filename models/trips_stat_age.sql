with count_cte as (
select date_part('year', t.started_at) - date_part('year', u.birth_date) as age
      ,cast(started_at as date) as date 
      , count(t.*) as trips
from scooters_raw.users u
join scooters_raw.trips t on u.id  = t.user_id 
group by 1,2
)
select
    age,
    avg(trips) as avg_trips
from
    count_cte
group by
    1
order by
    1