CREATE database clinic;

-- Create patients table.
CREATE TABLE patients
(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth DATE,
    PRIMARY KEY (id)
)

-- Create medical_histories table.
CREATE TABLE medical_histories
(
    id INT GENERATED ALWAYS AS IDENTITY,
    admited_at timestamp,
    patient_id INT,
    status VARCHAR(100),
    PRIMARY KEY (id)
)

-- Create invoice table.
CREATE TABLE invoices
(
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL(10, 2),
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT,
    PRIMARY KEY (id)
)

-- Create invoice_items table.
CREATE TABLE invoice_items
(
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL(10, 2),
    quantity INT,
    total_price DECIMAL(10, 2),
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY (id)
)

-- Create treatment table. 
CREATE TABLE treatments
(
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(255),
    name VARCHAR(100),
    PRIMARY KEY (id)
)
