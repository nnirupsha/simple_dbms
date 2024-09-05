-- Insert into Patients
INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender, Address, Phone, Email)
VALUES 
('John', 'Doe', '1990-05-15', 'Male', '123 Main St', '1234567890', 'john.doe@example.com'),
('Jane', 'Smith', '1985-11-23', 'Female', '456 Oak St', '0987654321', 'jane.smith@example.com');

-- Insert into Doctors
INSERT INTO Doctors (FirstName, LastName, Specialization, Phone, Email)
VALUES
('Dr. Emily', 'Brown', 'Cardiology', '1231231234', 'emily.brown@hospital.com'),
('Dr. James', 'Wilson', 'Neurology', '3213214321', 'james.wilson@hospital.com');

-- Insert into Appointments
INSERT INTO Appointments (Patient_ID, Doctor_ID, Appointment_Date, Appointment_Time, Status)
VALUES
(1, 1, '2024-09-10', '10:00:00', 'Scheduled'),
(2, 2, '2024-09-11', '11:00:00', 'Scheduled');

-- Insert into Treatments
INSERT INTO Treatments (Appointment_ID, Treatment_Details, Prescription)
VALUES
(1, 'Heart examination and blood tests.', 'Aspirin'),
(2, 'Neurological assessment and MRI.', 'Paracetamol');

-- Insert into Bills
INSERT INTO Bills (Patient_ID, Amount, Date, Status)
VALUES
(1, 200.00, '2024-09-10', 'Paid'),
(2, 350.00, '2024-09-11', 'Pending');
