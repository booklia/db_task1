DROP TABLE IF EXISTS customers CASCADE;
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR,
  gender VARCHAR,
  DOB DATE,
  job_title VARCHAR,
  job_industry VARCHAR,
  wealth_segment VARCHAR,
  deceased_indicator VARCHAR,
  owns_car VARCHAR,
  address VARCHAR,
  postcode INT,
  state VARCHAR,
  country VARCHAR,
  property_valuation INT
);

DROP TABLE IF EXISTS products CASCADE;
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  brand VARCHAR,
  product_line VARCHAR,
  product_class VARCHAR,
  product_size VARCHAR,
  list_price NUMERIC,
  standard_cost NUMERIC
);

DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (
  transaction_id INT PRIMARY KEY,
  product_id INT,
  customer_id INT,
  transaction_date DATE,
  online_order BOOL,
  order_status VARCHAR
);

ALTER TABLE transactions ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE transactions ADD FOREIGN KEY (product_id) REFERENCES products(product_id);

INSERT INTO customers(customer_id, first_name, last_name, gender, DOB, job_title, job_industry, wealth_segment, deceased_indicator, owns_car, address, postcode, state, country, property_valuation)
VALUES 
  (402, 'Berne', 'Donegan', 'Male', '1977-06-03', 'Desktop Support Technician', 'Retail', 'Affluent Customer', 'N', 'No', '07 New Castle Circle', 2646, 'NSW', 'Australia', 1),
  (787, 'Norma', 'Batrim', 'Female', '1996-12-15', NULL, 'Retail', 'Affluent Customer', 'N', 'Yes', '79 Arkansas Drive', 3008, 'VIC', 'Australia', 10),
  (1305, 'Averil', 'Gentiry', 'Male', '1970-03-01', 'Executive Secretary', 'Financial Services', 'High Net Worth', 'N', 'Yes', '515 Bunting Point', 4115, 'QLD', 'Australia', 8),
  (1542, 'Sanders', 'Fernyhough', 'Male', '1978-07-27', 'Food Chemist', 'Health', 'Mass Customer', 'N', 'Yes', '2 Eastwood Street', 2153, 'NSW', 'Australia', 10),
  (2339, 'Damien', 'Haddeston', 'Male', '1958-12-28', 'Web Designer II', 'Property', 'Affluent Customer', 'N', 'Yes', '533 Ramsey Center', 4507, 'QLD', 'Australia', 5),
  (2459, 'Jeanna', 'Naulls', 'Female', '1986-01-10', 'Quality Engineer', 'Manufacturing', 'High Net Worth', 'N', 'No', '22 Hayes Center', 3156, 'VIC', 'Australia', 10),
  (2950, 'Kristos', 'Anthony', 'Male', '1955-01-11', 'Software Engineer I', 'Financial Services', 'Mass Customer', 'N', 'Yes', '3 New Castle Terrace', 3032, 'VIC', 'Australia', 8),
  (3120, 'Lauree', 'O''Donnell', 'Female', '1979-02-04', 'Clinical Specialist', 'Health', 'Mass Customer', 'N', 'Yes', '32 Elmside Point', 2560, 'NSW', 'Australia', 6),
  (3135, 'Titus', 'Worsall', 'Male', '1962-01-14', 'Staff Scientist', 'Financial Services', 'Mass Customer', 'N', 'No', '24712 Hazelcrest Lane', 3024, 'VIC', 'Australia', 7),
  (3262, 'Maynord', 'L''Episcopi', 'Male', '1959-10-14', 'Product Engineer', 'Entertainment', 'Mass Customer', 'N', 'No', '3 Myrtle Pass', 2095, 'NSW', 'Australia', 12);

INSERT INTO products(product_id, brand, product_line, product_class, product_size, list_price, standard_cost)
VALUES 
  (2, 'Solex', 'Standard', 'medium', 'medium', 71.49, 53.62),
  (3, 'Trek Bicycles', 'Standard', 'medium', 'large', 2091.47, 388.92),
  (37, 'OHM Cycles', 'Standard', 'low', 'medium', 1793.43, 248.82),
  (88, 'Norco Bicycles', 'Standard', 'medium', 'medium', 1198.46, 381.10),
  (78, 'Giant Bicycles', 'Standard', 'medium', 'large', 1765.30, 709.48),
  (25, 'Giant Bicycles', 'Road', 'medium', 'medium', 1538.99, 829.65),
  (22, 'WeareA2B', 'Standard', 'medium', 'medium', 60.34, 45.26),
  (15, 'WeareA2B', 'Standard', 'medium', 'medium', 1292.84, 13.44),
  (67, 'Solex', 'Standard', 'medium', 'large', 1071.23, 380.74),
  (12, 'WeareA2B', 'Standard', 'medium', 'medium', 1231.15, 161.60);

INSERT INTO transactions(transaction_id, customer_id, transaction_date, online_order, order_status, product_id)
VALUES 
  (1, 2950, '2017-02-25', False, 'Approved', 2),
  (2, 3120, '2017-05-21', True, 'Approved', 3),
  (3, 402, '2017-10-16', False, 'Approved', 37),
  (4, 3135, '2017-08-31', False, 'Approved', 88),
  (5, 787, '2017-10-01', True, 'Approved', 78),
  (6, 2339, '2017-03-08', True, 'Approved', 25),
  (7, 1542, '2017-04-21', True, 'Approved', 22),
  (8, 2459, '2017-07-15', False, 'Approved', 15),
  (9, 1305, '2017-08-10', False, 'Approved', 67),
  (10, 3262, '2017-08-30', True, 'Approved', 12);