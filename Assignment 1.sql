CREATE DATABASE IF NOT EXISTS yourname_20261001_pharmacy_system;
USE yourname_20261001_pharmacy_system;


DROP TABLE IF EXISTS medicines;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS categories;


CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);


CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    contact_phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE
);


CREATE TABLE medicines (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(150) NOT NULL,
    category_id INT,
    supplier_id INT,
    unit_price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

INSERT INTO categories (category_name, description) VALUES 
('Painkillers', 'Medicines used to relieve pain'),
('Antibiotics', 'Medicines used to treat bacterial infections'),
('Vitamins', 'Dietary supplements and vitamins');

INSERT INTO suppliers (supplier_name, contact_phone, email) VALUES 
('PharmaCorp', '0123456789', 'contact@pharmacorp.com'),
('MedSupply Co', '0987654321', 'info@medsupply.com');

INSERT INTO medicines (medicine_name, category_id, supplier_id, unit_price, stock_quantity) VALUES 
('Paracetamol 500mg', 1, 1, 250.00, 100),
('Amoxicillin 250mg', 2, 2, 450.00, 50),
('Vitamin C 1000mg', 3, 1, 150.00, 200);
USE yourname_20261001_pharmacy_system;

SELECT 
    m.medicine_id,
    m.medicine_name,
    c.category_name,
    s.supplier_name,
    m.unit_price,
    m.stock_quantity
FROM medicines m
JOIN categories c ON m.category_id = c.category_id
JOIN suppliers s ON m.supplier_id = s.supplier_id;

SELECT * FROM medicines 
WHERE stock_quantity < 100;

UPDATE medicines 
SET stock_quantity = stock_quantity + 20, unit_price = 260.00
WHERE medicine_id = 1;

SELECT 
    COUNT(*) AS total_medicines,
    AVG(unit_price) AS average_price,
    SUM(stock_quantity) AS total_stock
FROM medicines;

DELETE FROM medicines 
WHERE medicine_id = 3;

SELECT * FROM medicines;
