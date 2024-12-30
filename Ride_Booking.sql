create database ola;
use ola;

# 1. Retrive all successful bookings

create view successful_bookings as
select * from Bookings where Booking_Status='Success';

select * from successful_bookings;

# 2. Find the average ride distance for each vehicle type:

create view average_ride_distance_for_each_vehicle_type as
select Vehicle_Type,avg(Ride_Distance)
as avg_distance from Bookings
group by Vehicle_Type;

select * from average_ride_distance_for_each_vehicle_type;

# 3. Get the total number of cancelled rides by customers:

create view total_number_of_cancelled_rides_by_customers as
select count(*) from Bookings
where Booking_Status='Canceled by Customer';

select * from total_number_of_cancelled_rides_by_customers;


# 4. List the top 5 customers who booked the highest number of rides:

Create View Top_5_Customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM Bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

select * from Top_5_Customers;


# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

create view rides_cancelled_by_drivers as
select count(*) from Bookings
where Canceled_Rides_by_Driver='Personal & Car related issue';

select * from rides_cancelled_by_drivers;


# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

create view ratings_for_Prime_Sedan_bookings as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from Bookings
where Vehicle_Type='Prime Sedan';

select * from ratings_for_Prime_Sedan_bookings;


# 7. Retrieve all rides where payment was made using UPI:

create view payment_via_UPI as
select * from Bookings where Payment_Method='UPI';

select * from payment_via_UPI;

# 8. Find the average customer rating per vehicle type:

create view avg_customer_rating as
select Vehicle_Type,avg(Customer_Rating) as avg_cust_rating from Bookings group by Vehicle_Type;

select * from avg_customer_rating;

# 9. Calculate the total booking value of rides completed successfully:

create view booking_value as 
select sum(Booking_Value) as total_successful_booking_values from Bookings where Booking_Status='Success';

select * from booking_value;


# 10. List all incomplete rides along with the reason:

create view incomplete_rides_reasons as
select Booking_ID,Incomplete_Rides_Reason
from Bookings 
where Incomplete_Rides='Yes';

select * from incomplete_rides_reasons;