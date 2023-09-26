CREATE database clinic;

-- Create patients table.
CREATE TABLE patients
(
    id INT GENERATED ALWAYS AS IDENTITY,
    name text,
    date_of_birth date,
    PRIMARY KEY (id)
)

-- Create medical_histories table.
CREATE TABLE medical_histories
(
    id INT GENERATED ALWAYS AS IDENTITY,
    admited_at timestamp with time zone,
    patient_id INT,
    status text,
    PRIMARY KEY (id)
)

-- Create invoice table.
CREATE TABLE invoices
(
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount numeric,
    generated_at timestamp with time zone,
    payed_at timestamp with time zone,
    medical_history_id INT,
    PRIMARY KEY (id)
)

-- Create invoice_items table.
CREATE TABLE invoice_items
(
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price numeric,
    quantity INT,
    total_price numeric,
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY (id)
)

-- Create treatment table. 
CREATE TABLE treatments
(
    id INT GENERATED ALWAYS AS IDENTITY,
    type,
    name,
    PRIMARY KEY (id)
)
