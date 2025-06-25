create database books_db;
use books_db;
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    price DECIMAL(6,2),
    stock INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    book_id INT,
    customer_id INT,
    rating INT,
    comment TEXT,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO authors (author_id, name) VALUES
(1, 'J.K. Rowling'),
(2, 'George R.R. Martin'),
(3, 'J.R.R. Tolkien'),
(4, 'Agatha Christie'),
(5, 'Stephen King'),
(6, 'Dan Brown'),
(7, 'Haruki Murakami');

INSERT INTO books (book_id, title, author_id, price, stock) VALUES
(1, 'Harry Potter and the Sorcerer\'s Stone', 1, 19.99, 50),
(2, 'A Game of Thrones', 2, 22.50, 30),
(3, 'The Hobbit', 3, 15.75, 40),
(4, 'Murder on the Orient Express', 4, 10.99, 20),
(5, 'The Shining', 5, 18.00, 35),
(6, 'The Da Vinci Code', 6, 25.00, 45),
(7, 'Norwegian Wood', 7, 17.50, 25),
(8, 'Harry Potter and the Chamber of Secrets', 1, 21.99, 25),
(9, 'The Winds of Winter', 2, 24.99, 15),
(10, 'IT', 5, 20.00, 18);

INSERT INTO customers (customer_id, name, email) VALUES
(1, 'Alice Johnson', 'alice@example.com'),
(2, 'Bob Smith', 'bob@example.com'),
(3, 'Charlie Brown', 'charlie@example.com'),
(4, 'Diana Prince', 'diana@example.com'),
(5, 'Edward Nigma', 'edward@example.com'),
(6, 'Fiona Glenanne', 'fiona@example.com'),
(7, 'George Bailey', 'george@example.com');

INSERT INTO orders (order_id, customer_id, order_date) VALUES
(1, 1, '2025-05-20'),
(2, 2, '2025-05-21'),
(3, 3, '2025-05-22'),
(4, 4, '2025-05-22'),
(5, 5, '2025-05-23'),
(6, 6, '2025-05-24'),
(7, 7, '2025-05-24');


INSERT INTO order_items (item_id, order_id, book_id, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 1),
(4, 3, 4, 1),
(5, 4, 5, 2),
(6, 5, 6, 1),
(7, 6, 7, 3),
(8, 6, 10, 1),
(9, 7, 9, 1),
(10, 7, 8, 1);


INSERT INTO reviews (review_id, book_id, customer_id, rating, comment) VALUES
(1, 1, 1, 5, 'Loved it! A magical journey.'),
(2, 2, 2, 4, 'Great start to the series.'),
(3, 3, 3, 5, 'A classic. Must read.'),
(4, 1, 2, 3, 'It was okay, a bit slow in parts.'),
(5, 4, 4, 4, 'Classic mystery, well done.'),
(6, 5, 5, 5, 'Spine-chilling and gripping.'),
(7, 6, 6, 4, 'Clever plot with fast pace.'),
(8, 7, 7, 3, 'Deep but a bit abstract.'),
(9, 10, 1, 2, 'Too long and complex for my taste.');

select b.title, a.name
from books b
inner join authors a on b.author_id = a.author_id;

select c.name, o.order_date
from customers c
right join orders o on o.customer_id = c.customer_id;

select c.customer_id, c.name, c.email, o.order_id, o.order_date
from customers c
 union orders o on o.customer_id = c.customer_id;
 
select upper(name) as UpperCaseCustomerName
from customers;

select * from order
where 
order_date < curdate() - interval 30 day;

select title,round(price) as Book_Price from books;

DELIMITER $$
CREATE PROCEDURE UserSpecifiedAmount(in min_price decimal(10,2))
begin
	select * from books
    where price > min_price;
END $$


call UserSpecifiedAmount(24.23);

create index idx_authorid on books(author_id);
show idx_authorid from books;

create view Bestseller as Select title,name, price from books
where stock > 20;

