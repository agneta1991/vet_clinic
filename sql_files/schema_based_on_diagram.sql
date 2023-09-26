CREATE database clinic;

-- Create patients table.
CREATE TABLE patients
(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth DATE,
    PRIMARY KEY (id)
);

-- Create medical_histories table.
CREATE TABLE medical_histories
(
    id INT GENERATED ALWAYS AS IDENTITY,
    admited_at timestamp,
    patient_id INT,
    status VARCHAR(100),
    CONSTRAINT fk_patient
        FOREIGN KEY (patient_id)
        REFERENCES patients(id),
    PRIMARY KEY (id)
);

-- Create invoice table.
CREATE TABLE invoices
(
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL(10, 2),
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT,
    CONSTRAINT fk_medical_history
        FOREIGN KEY (medical_history_id)
        REFERENCES medical_histories(id),
    PRIMARY KEY (id)
);

-- Create treatment table. 
CREATE TABLE treatments
(
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(255),
    name VARCHAR(100),
    PRIMARY KEY (id)
);

-- Create invoice_items table.
CREATE TABLE invoice_items
(
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL(10, 2),
    quantity INT,
    total_price DECIMAL(10, 2),
    invoice_id INT,
    treatment_id INT,
    CONSTRAINT fk_invoice
        FOREIGN KEY (invoice_id)
        REFERENCES invoices(id),
    CONSTRAINT fk_treatment
        FOREIGN KEY (treatment_id)
        REFERENCES treatments(id),
    PRIMARY KEY (id)
);

-- Create relationship
CREATE TABLE medical_history_treatment (
    medical_history_id INT,
    treatment_id INT,
    PRIMARY KEY (medical_history_id,treatment_id),
    CONSTRAINT fk_medical_history
        FOREIGN KEY (medical_history_id)
        REFERENCES medical_histories(id),
    CONSTRAINT fk_treatments
        FOREIGN KEY (treatment_id)
        REFERENCES treatments(id)
);
