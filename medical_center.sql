DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    doctor_name TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    patient_name TEXT
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    disease_name TEXT
);

CREATE TABLE hospital (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors,
    patient_id INTEGER REFERENCES patients,
    disease_id INTEGER REFERENCES diseases
);

INSERT INTO doctors (doctor_name) VALUES 
('Doctor Man'),
('Better doctor man');

INSERT INTO patients (patient_name) VALUES 
('Very sick man'),
('Lying about being sick woman');

INSERT INTO diseases (disease_name) VALUES 
('Flu'),
('Chicken Pox');

INSERT INTO hospital (doctor_id, patient_id, disease_id) VALUES 
(1,1,1),
(2,1,2),
(1,2,2);
