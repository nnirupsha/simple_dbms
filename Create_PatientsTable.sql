-- Create Patients Table
CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY AUTO_INCREMENT,  -- Use `SEQUENCE` and `TRIGGER` for Oracle auto-increment
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

-- Create Doctors Table
CREATE TABLE Doctors (
    Doctor_ID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialization VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

-- Create Appointments Table
CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_Date DATE,
    Appointment_Time TIME,
    Status VARCHAR(20),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

-- Create Treatments Table
CREATE TABLE Treatments (
    Treatment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Appointment_ID INT,
    Treatment_Details TEXT,
    Prescription VARCHAR(255),
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID)
);

-- Create Bills Table
CREATE TABLE Bills (
    Bill_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Amount DECIMAL(10, 2),
    Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);
