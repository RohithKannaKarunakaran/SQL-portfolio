
# Database Schema Documentation

## **Overview**
This document provides the schema definition for a database designed to manage information about car dealers, their available cars, and sales transactions. The schema consists of three tables: `dealer`, `CAR`, and `sales`.

## **Tables**

### **1. Dealer Table**
The `dealer` table stores information about car dealers.

- **Table Name**: `dealer`
- **Columns**:
  - `dealer_id` (INT): The unique identifier for the dealer. This is the primary key.
  - `dealer_name` (VARCHAR(50)): The name of the dealer.
- **Primary Key**: `dealer_id`

### **2. CAR Table**
The `CAR` table stores information about cars available for sale.

- **Table Name**: `CAR`
- **Columns**:
  - `car_ID` (INT): The unique identifier for the car. This is the primary key.
  - `Name` (VARCHAR(50)): The name or model of the car.
  - `year` (INT): The manufacturing year of the car.
  - `selling_price` (INT): The selling price of the car.
  - `mileage` (VARCHAR(50)): The mileage of the car.
  - `dealer_ID` (INT): The unique identifier of the dealer selling the car. This is a foreign key referencing `dealer(dealer_id)`.
- **Primary Key**: `car_ID`
- **Foreign Key**: `dealer_ID` references `dealer(dealer_id)`

### **3. Sales Table**
The `sales` table records transactions of car sales.

- **Table Name**: `sales`
- **Columns**:
  - `car_ID` (INT): The unique identifier of the car being sold. This is a foreign key referencing `CAR(car_ID)`.
  - `dealer_ID` (INT): The unique identifier of the dealer selling the car. This is a foreign key referencing `dealer(dealer_id)`.
  - `selling_price` (INT): The selling price of the car in the transaction.
  - `seller_type` (VARCHAR(50)): The type of the seller (e.g., dealer, private).
- **Foreign Keys**:
  - `dealer_ID` references `dealer(dealer_id)`
  - `car_ID` references `CAR(car_ID)`

## **Relationships**

### **One-to-Many Relationship**
- One dealer can have multiple cars. This relationship is represented by the foreign key `dealer_ID` in the `CAR` table referencing `dealer(dealer_id)`.
- One dealer can have multiple sales. This relationship is represented by the foreign key `dealer_ID` in the `sales` table referencing `dealer(dealer_id)`.

### **One-to-One Relationship**
- One car can be involved in only one sales transaction. This is ensured by the `car_ID` foreign key in the `sales` table referencing `CAR(car_ID)`.

## **Constraints**

### **Primary Key Constraints**
- `dealer_id` in the `dealer` table
- `car_ID` in the `CAR` table

### **Foreign Key Constraints**
- `dealer_ID` in the `CAR` table referencing `dealer(dealer_id)`
- `dealer_ID` in the `sales` table referencing `dealer(dealer_id)`
- `car_ID` in the `sales` table referencing `CAR(car_ID)`

