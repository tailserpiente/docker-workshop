select count(1) from public.yellow_taxi_trips_2;
 

select * from public.taxi_zone_lookup; 

--3
select count(1) from public.homework1_taxi where trip_distance<=1 
and lpep_pickup_datetime >='2025-11-01' and lpep_pickup_datetime <'2025-12-01'

--4
select lpep_pickup_datetime, trip_distance
from public.homework1_taxi where trip_distance<100 
order by  trip_distance desc 

--5 
select sum(total_amount), z."Zone"  from homework1_taxi a 
join taxi_zone_lookup z on a."PULocationID"=z."LocationID"
where lpep_pickup_datetime >='2025-11-18' and lpep_pickup_datetime <'2025-11-19'
group by z."Zone"
order by 1 desc 


--6
 select a."tip_amount",   z."Zone", zdo."Zone"  from homework1_taxi a 
join taxi_zone_lookup z on a."PULocationID"=z."LocationID"
join taxi_zone_lookup zdo on a."DOLocationID"=zdo."LocationID"
where lpep_pickup_datetime >='2025-11-01' and lpep_pickup_datetime <'2025-12-01'
and z."Zone"   ='East Harlem North' 
order by 1 desc 

 --7 

