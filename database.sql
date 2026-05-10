-- ============================================
-- Vehicle Rental Management System - Database
-- ============================================

DROP DATABASE IF EXISTS vehicle_rental_db;
CREATE DATABASE vehicle_rental_db;
USE vehicle_rental_db;

-- Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role ENUM('Admin', 'Agent') NOT NULL DEFAULT 'Agent',
    full_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, password, role, full_name) VALUES
('admin', 'admin123', 'Admin', 'System Administrator'),
('agent1', 'agent123', 'Agent', 'Rental Agent');

-- Vehicles Table
CREATE TABLE vehicles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_type ENUM('Car', 'Bike') NOT NULL,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    color VARCHAR(30),
    license_plate VARCHAR(20) NOT NULL UNIQUE,
    rent_per_day DOUBLE NOT NULL,
    status ENUM('Available', 'Rented', 'Maintenance') DEFAULT 'Available',
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO vehicles (vehicle_type, brand, model, year, color, license_plate, rent_per_day, status) VALUES
('Car', 'Toyota', 'Corolla', 2021, 'White', 'ABC-123', 3500, 'Available'),
('Car', 'Honda', 'Civic', 2022, 'Black', 'XYZ-456', 4000, 'Available'),
('Car', 'Suzuki', 'Alto', 2020, 'Silver', 'PQR-789', 2500, 'Available'),
('Bike', 'Honda', 'CD70', 2022, 'Red', 'BIK-001', 500, 'Available'),
('Bike', 'Yamaha', 'YBR125', 2021, 'Blue', 'BIK-002', 800, 'Available');

-- Customers Table
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    cnic VARCHAR(15) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    address TEXT,
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bookings Table
CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_days INT NOT NULL,
    rent_per_day DOUBLE NOT NULL,
    total_amount DOUBLE NOT NULL,
    fine_amount DOUBLE DEFAULT 0,
    status ENUM('Active', 'Completed', 'Cancelled') DEFAULT 'Active',
    return_date DATE,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
);

-- Payments Table
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    amount DOUBLE NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('Cash', 'Card', 'Online') DEFAULT 'Cash',
    notes TEXT,
    FOREIGN KEY (booking_id) REFERENCES bookings(id)
);

SHOW TABLES;
SELECT 'Database Ready!' AS Status;
