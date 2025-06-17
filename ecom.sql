CREATE DATABASE Ecomm;
USE Ecomm;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    registration_date DATE
);

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


-- Insert Customers
INSERT INTO Customers VALUES
(1, 'Alice', 'alice@example.com', 'New York', '2023-01-10'),
(2, 'Bob', 'bob@example.com', 'Los Angeles', '2023-02-15');

INSERT INTO Customers VALUES
(3, 'AAli', 'aali@example.com', 'Los Angeles', '2023-02-15');

INSERT INTO Customers VALUES
(4, 'Alai', 'alai@example.com', 'Los Angeles', '2023-02-15');

INSERT INTO Customers (customer_id, email, city, registration_date) VALUES
(5,'alai@example.com', 'Los Angeles', '2023-02-15');

-- Insert Products
INSERT INTO Products VALUES
(1, 'Smartphone', 'Electronics', 500.00, 50),
(2, 'Laptop', 'Electronics', 1200.00, 30),
(3, 'Shoes', 'Footwear', 80.00, 100);

INSERT INTO Products VALUES (4, 'Keyboard', 'Electronics', 500.00, 50);

-- Insert Orders
INSERT INTO Orders VALUES
(1, 1, '2023-03-01', 580.00),
(2, 2, '2023-03-05', 1280.00);

INSERT INTO Orders VALUES
(1, 2, '2023-03-01', 1200.00);



INSERT INTO Orders VALUES
(5, 1, '2023-03-01', 580.00);

INSERT INTO Orders VALUES
(6, 1, '2023-03-01', 1300.00);

-- Insert Order_Items
INSERT INTO Order_Items VALUES
(1, 1, 1, 1, 500.00),
(2, 1, 3, 1, 80.00),
(3, 2, 2, 1, 1200.00),
(4, 2, 3, 1, 80.00);

INSERT INTO Order_Items VALUES (5, 1, 2, 3, 2800);
INSERT INTO Order_Items VALUES (7, 6, 2, 3, 2800);

INSERT INTO Order_Items VALUES
(5, 1, 3, 1, 80.00);