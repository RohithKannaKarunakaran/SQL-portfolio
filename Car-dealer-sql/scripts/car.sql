--Create table and add keys

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
