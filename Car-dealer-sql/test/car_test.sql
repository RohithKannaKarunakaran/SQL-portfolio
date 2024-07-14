/*
**SQL Queries**:
     1. Which car models are sold more?
     2. Which dealer sells more cars, and what are their total sales?
     3. What is the average price for each car model?
     4. What is the newest car and the oldest car?
     5. Which is the best car related to price and low mileage?
     6. What is the total revenue from individual sales?
*/

# Answers to the question 
--1. Which car models are sold more?

SELECT Name, COUNT(Name) AS Numbers_sold 
FROM CAR
GROUP BY Name;

--2. Which dealer sells more cars, and what are their total sales?

SELECT d.dealer_name, COUNT(s.car_ID) AS cars_sold, SUM(s.selling_price) AS Total_sales
From sales s
JOIN dealer d ON d.dealer_ID = s.dealer_ID
GROUP BY s.dealer_ID
ORDER BY d.dealer_ID;

--3. What is the average price for each car model?

SELECT Name, AVG(selling_price) AS AVG_Model_price
FROM CAR
GROUP BY Name 
ORDER BY Name;

--4. What is the newest car and the oldest car?

# NEW CAR QUERY
SELECT Name, year
FROM CAR
ORDER BY year DESC;

# OLD CAR QUERY
SELECT Name, year
FROM CAR
ORDER BY year ASC;

--5. Which is the best car related to price and low mileage?

SELECT Name, year, selling_price, mileage
FROM CAR 
ORDER BY selling_price ASC, mileage DESC
LIMIT 1;

--6. What is the total revenue from individual sales?

SELECT seller_type, SUM(selling_price)
FROM sales
WHERE seller_type = 'individual';




--------------END----------------
