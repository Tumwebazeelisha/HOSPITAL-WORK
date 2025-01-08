CREATE DATABASE Hospital;
SET foreign_key_checks = 1;
CREATE TABLE patient_data (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    contact_info VARCHAR(100),
    address VARCHAR(255)
);

CREATE TABLE visit_record (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    visit_date DATE,
    visit_reason VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES patient_data(patient_id)
);

CREATE TABLE treatment_record (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    visit_id INT,
    treatment_details TEXT,
    FOREIGN KEY (visit_id) REFERENCES visit_record(visit_id)
);

CREATE TABLE laboratory_tests (
    test_id INT PRIMARY KEY AUTO_INCREMENT,
    visit_id INT,
    test_name VARCHAR(50),
    test_results TEXT,
    FOREIGN KEY (visit_id) REFERENCES visit_record(visit_id)
);

CREATE TABLE user_role (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50),
    role_description TEXT
);

CREATE TABLE resource (
    resource_id INT PRIMARY KEY AUTO_INCREMENT,
    resource_name VARCHAR(50),
    quantity INT,
    last_updated DATE
);

CREATE TABLE supply_chain (
    supply_id INT PRIMARY KEY AUTO_INCREMENT,
    resource_id INT,
    supplier_name VARCHAR(100),
    contact_info VARCHAR(100),
    FOREIGN KEY (resource_id) REFERENCES resource(resource_id)
);


