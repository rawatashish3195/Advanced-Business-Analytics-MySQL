INSERT INTO customers (customer_name, email, city, signup_date) VALUES
('Rahul Sharma', 'rahul@gmail.com', 'Delhi', '2023-01-10'),
('Anita Verma', 'anita@gmail.com', 'Mumbai', '2023-02-15'),
('Suresh Kumar', 'suresh@gmail.com', 'Bangalore', '2023-03-20'),
('Neha Singh', 'neha@gmail.com', 'Delhi', '2023-04-05'),
('Aman Gupta', 'aman@gmail.com', 'Pune', '2023-05-18');

INSERT INTO categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Grocery');

INSERT INTO products (product_name, category_id, price) VALUES
('Smartphone', 1, 15000),
('Laptop', 1, 55000),
('T-Shirt', 2, 800),
('Jeans', 2, 2000),
('Rice 5kg', 3, 600);

INSERT INTO branches (branch_name, city) VALUES
('Delhi Central', 'Delhi'),
('Mumbai Central', 'Mumbai'),
('Bangalore Hub', 'Bangalore');

INSERT INTO departments (department_name) VALUES
('Sales'),
('Finance'),
('Operations');

INSERT INTO employees (employee_name, department_id, branch_id, salary, hire_date) VALUES
('Amit Kumar', 1, 1, 45000, '2022-06-15'),
('Priya Sharma', 1, 2, 48000, '2021-09-10'),
('Rohit Mehta', 2, 1, 55000, '2020-03-20'),
('Sneha Patel', 3, 3, 40000, '2022-01-05');

INSERT INTO orders (customer_id, branch_id, order_date, order_status) VALUES
(1, 1, '2024-01-10', 'Delivered'),
(2, 2, '2024-01-12', 'Delivered'),
(3, 3, '2024-02-05', 'Shipped'),
(4, 1, '2024-02-20', 'Placed'),
(5, 2, '2024-03-01', 'Cancelled');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 15000),
(1, 3, 2, 800),
(2, 2, 1, 55000),
(3, 5, 3, 600),
(4, 4, 1, 2000);

INSERT INTO payments (order_id, payment_date, payment_method, payment_status, amount) VALUES
(1, '2024-01-11', 'UPI', 'Success', 16600),
(2, '2024-01-13', 'Card', 'Success', 55000),
(3, '2024-02-06', 'Cash', 'Success', 1800),
(5, '2024-03-02', 'UPI', 'Refunded', 0);
