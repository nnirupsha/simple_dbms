-- Basic Queries

-- Select All Patients
SELECT * FROM Patients;

-- Select All Doctors
SELECT * FROM Doctors;

-- Find Appointments for a Specific Patient
SELECT Appointment_ID, Appointment_Date, Appointment_Time, Status
FROM Appointments
WHERE Patient_ID = 1;  -- Replace 1 with the specific Patient_ID

-- List All Upcoming Appointments for a Doctor
SELECT Appointment_ID, Appointment_Date, Appointment_Time, Status
FROM Appointments
WHERE Doctor_ID = 1  -- Replace 1 with the specific Doctor_ID
AND Appointment_Date >= CURDATE();  -- For Oracle, use SYSDATE instead of CURDATE()

-- Find Doctors by Specialization
SELECT FirstName, LastName, Specialization, Phone, Email
FROM Doctors
WHERE Specialization = 'Cardiology';  -- Replace with the desired specialization

-- Generate a Patient Bill with Details
SELECT Patients.FirstName, Patients.LastName, Bills.Amount, Bills.Date, Bills.Status
FROM Bills
JOIN Patients ON Bills.Patient_ID = Patients.Patient_ID
WHERE Bills.Patient_ID = 1;  -- Replace 1 with the specific Patient_ID

-- Find Appointments Between Specific Dates
SELECT Appointment_ID, Patient_ID, Doctor_ID, Appointment_Date, Appointment_Time, Status
FROM Appointments
WHERE Appointment_Date BETWEEN '2024-09-01' AND '2024-09-30';  -- Adjust the date range

-- Count the Number of Appointments for Each Doctor
SELECT Doctor_ID, COUNT(*) AS Total_Appointments
FROM Appointments
GROUP BY Doctor_ID;

-- List All Treatments for a Specific Appointment
SELECT Treatment_Details, Prescription
FROM Treatments
WHERE Appointment_ID = 1;  -- Replace 1 with the specific Appointment_ID

-- Calculate Total Income from Bills
SELECT SUM(Amount) AS Total_Income
FROM Bills
WHERE Status = 'Paid';

-- List All Patients Treated by a Specific Doctor
SELECT DISTINCT Patients.FirstName, Patients.LastName
FROM Patients
JOIN Appointments ON Patients.Patient_ID = Appointments.Patient_ID
WHERE Appointments.Doctor_ID = 1;  -- Replace 1 with the specific Doctor_ID

-- Find Overdue Bills
SELECT Bill_ID, Patient_ID, Amount, Date
FROM Bills
WHERE Status = 'Pending' OR Status = 'Unpaid';

-- Delete an Appointment
DELETE FROM Appointments
WHERE Appointment_ID = 1;  -- Replace 1 with the specific Appointment_ID


-- Advanced Queries

-- Find Doctors with No Upcoming Appointments
SELECT Doctors.FirstName, Doctors.LastName
FROM Doctors
LEFT JOIN Appointments ON Doctors.Doctor_ID = Appointments.Doctor_ID
WHERE Appointment_Date IS NULL OR Appointment_Date < CURDATE();  -- For Oracle, use SYSDATE instead of CURDATE()

-- Top 5 Doctors with the Most Appointments
SELECT Doctors.FirstName, Doctors.LastName, COUNT(Appointments.Appointment_ID) AS Total_Appointments
FROM Doctors
JOIN Appointments ON Doctors.Doctor_ID = Appointments.Doctor_ID
GROUP BY Doctors.Doctor_ID
ORDER BY Total_Appointments DESC
LIMIT 5;  -- For Oracle, remove LIMIT and use ROWNUM instead

-- Find All Appointments for a Given Month
SELECT Appointment_ID, Patient_ID, Doctor_ID, Appointment_Date, Appointment_Time, Status
FROM Appointments
WHERE MONTH(Appointment_Date) = 9 AND YEAR(Appointment_Date) = 2024;  -- For Oracle, use TO_CHAR for dates