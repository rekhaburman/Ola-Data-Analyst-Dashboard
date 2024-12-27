create database Ola;
Use Ola;
# Retrieve all successful bookings :
Create View Successful_Bookings As
SELECT * FROM ola.bookings
WHERE booking_Status = 'Success'
LIMIT 0, 1000;

Select * From Successful_Bookings;

# Find the average ride distance for each vehile type ...:

Create View ride_distance As
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance
FROM ola.bookings
GROUP BY Vehicle_Type
LIMIT 0, 1000;

SELECT * FROM ride_distance;

# get the total number of canceled rides by customers
CREATE OR REPLACE VIEW canceled_rides_by_customers AS
SELECT COUNT(*) AS Total_Canceled_Rides
FROM ola.bookings
WHERE Booking_Status = 'Canceled_By_Customers';

SELECT * FROM canceled_rides_by_customers;

# List the top 5 customer who booked the highest number of rides

SELECT 
    Customer_ID, COUNT(Booking_ID) AS Total_Rides
FROM
    ola.bookings
GROUP BY Customer_ID
ORDER BY Total_Rides DESC
LIMIT 5;

# get the number of ride canceled by drivers due to personal and car related issues.....

CREATE OR REPLACE VIEW  canceled_rides_by_Driver AS
SELECT count(*)
FROM ola.bookings
WHERE Canceled_Rides_By_Driver = 'personal & Car related issues';

#find the maximum and minimum driver rating for prime sedam booking :

CREATE VIEW MAX_MIN_Driver_Rating As
SELECT MAX(Driver_Ratings) AS max_rating,
MIN(Driver_Ratings) AS min_rating
FROM ola.bookings 
WHERE Vehicle_Type = 'Prime sedan';

# Retrieve all rides where payments was made using UPI..
SELECT *
FROM ola.bookings
WHERE Payment_Method = 'UPI';

# Find the average customer rating per vehicle type ..
SELECT Vehicle_Type,AVG(Customer_Rating) AS Average_Rating
FROM ola.bookings
GROUP BY Vehicle_Type;

# Calculate the total boookings value of ride completed successfully:

SELECT SUM(Booking_Value) AS Total_Value
FROM ola.bookings
WHERE Booking_Status = 'success';

# List all incomplete rides  along with reason 

SELECT Booking_ID,Incomplete_Rides_Reason
FROM ola.bookings
WHERE Incomplete_Rides = 'yes';






















