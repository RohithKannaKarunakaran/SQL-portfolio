/*Used Car Agency Database Project

## Introduction

A manager of a used car agency would like to create a system to facilitate his work and assist all agents in the company. Currently, he uses spreadsheets to collect and save all the data about the cars in his agency. 
The idea is to create an online system to help him search for cars and various attributes. Your role is to design and implement the relational database for his agency.

## Data Description

The data already stored in the Excel file contains information about used cars that have been sold or not by the agency. The dataset includes as car.csv:

## Project Goal is to design and implement the database which can answer the following query:

**SQL Queries**:
     1. Which car models are sold more?
     2. Which dealer sells more cars, and what are their total sales?
     3. What is the average price for each car model?
     4. What is the newest car and the oldest car?
     5. Which is the best car related to price and low mileage?
     6. What is the total revenue from individual sales?

*/

--Create table 

CREATE TABLE dealer (
dealer_id INT , 
dealer_name VARCHAR(50),
PRIMARY KEY (dealer_ID)
);

CREATE TABLE CAR (
car_ID INT,
Name VARCHAR(50),
year INT,
selling_price INT,
mileage VARCHAR(50),
dealer_ID INT,
PRIMARY KEY (car_ID),
FOREIGN KEY (dealer_ID) REFERENCES dealer(dealer_ID)
);

CREATE TABLE sales (
car_ID INT,
dealer_ID INT,
selling_price INT,
seller_type VARCHAR(50),
FOREIGN KEY (dealer_ID) REFERENCES dealer(dealer_ID),
FOREIGN KEY (car_ID) REFERENCES CAR(car_ID),
);

#loaded csv file using mysql workbench

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
