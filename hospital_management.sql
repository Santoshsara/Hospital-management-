

CREATE database HospitalManagement;
use HospitalManagement;

# patients
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other'),
    Address VARCHAR(255),
    Phone VARCHAR(15),
    MedicalHistory TEXT
);

# Doctors
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Phone VARCHAR(15),
    Department VARCHAR(50)
);

INSERT INTO Patients (Name, DOB, Gender, Address, Phone, MedicalHistory)
VALUES 
('John Doe', '1990-05-10', 'Male', '123 Main St', '1234567890', 'No allergies'),
('Jane Smith', '1985-03-25', 'Female', '456 Elm St', '0987654321', 'Diabetic');
INSERT INTO Patients (Name, DOB, Gender, Address, Phone, MedicalHistory)
VALUES
('John Doe', '1990-05-10', 'Male', '123 Main St', '1234567890', 'No allergies'),
('Jane Smith', '1985-03-25', 'Female', '456 Elm St', '0987654321', 'Diabetic'),
('Mike Johnson', '1978-11-15', 'Male', '789 Oak Ave', '1122334455', 'Hypertension'),
('Emma Brown', '2000-07-20', 'Female', '321 Pine Rd', '6677889900', 'Asthma'),
('Sophia Wilson', '1995-01-05', 'Female', '654 Birch Ln', '5566778899', 'Thyroid issues');


INSERT INTO Doctors (Name, Specialization, Phone, Department)
VALUES
('Dr. Alice Brown', 'Cardiology', '1112223333', 'Cardiology'),
('Dr. Bob Green', 'Orthopedics', '4445556666', 'Orthopedics');


select * from doctors;


SELECT * FROM Patients;
select * from doctors;

#appointmet table

CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Reason TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Reason)
VALUES 
(1, 1, '2024-12-01', '10:30:00', 'Routine check-up'),
(2, 2, '2024-12-02', '14:00:00', 'Back pain consultation');


	
#Billing table
CREATE TABLE Billing (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    AppointmentID INT,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    PaymentStatus ENUM('Paid', 'Pending'),
    BillingDate DATE NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);






#inventory table

CREATE TABLE Inventory (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    LastUpdated DATE NOT NULL
);
#Department table

CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT
);
# staff
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50),
    Phone VARCHAR(15),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Departments (Name, Description)
VALUES 
('Cardiology', 'Heart-related care'),
('Orthopedics', 'Bone and joint care'),
('Neurology', 'Brain and nervous system care');
INSERT INTO Departments (Name, Description)
VALUES
('Cardiology', 'Heart-related care'),
('Orthopedics', 'Bone and joint care'),
('Neurology', 'Brain and nervous system care'),
('Pediatrics', 'Child health care'),
('Dermatology', 'Skin-related care');
select * from departments;


INSERT INTO Inventory (ItemName, Quantity, UnitPrice, LastUpdated)
VALUES 
('Paracetamol', 500, 0.50, CURDATE()),
('Surgical Gloves', 2000, 0.10, CURDATE());


INSERT INTO Staff (Name, Role, Phone, DepartmentID)
VALUES
('Sarah Taylor', 'Nurse', '1234567890', 1),
('James Brown', 'Receptionist', '0987654321', 2),
('Lucy Martin', 'Lab Technician', '1122334455', 3),
('Mark White', 'Pharmacist', '6677889900', 4),
('Olivia Davis', 'Administrative Officer', '5566778899', 5);

INSERT INTO Inventory (ItemName, Quantity, UnitPrice, LastUpdated)
VALUES
('Paracetamol', 500, 0.50, CURDATE()),
('Surgical Gloves', 2000, 0.10, CURDATE()),
('Syringes', 1000, 0.75, CURDATE()),
('Antibiotics', 300, 1.50, CURDATE()),
('Bandages', 700, 0.25, CURDATE());

INSERT INTO Billing (PatientID, AppointmentID, TotalAmount, PaymentStatus, BillingDate)
VALUES
(1, 1, 200.00, 'Paid', '2024-12-01'),
(2, 2, 300.00, 'Pending', '2024-12-02'),
(3, 3, 250.00, 'Paid', '2024-12-03'),
(4, 4, 100.00, 'Paid', '2024-12-04'),
(5, 5, 150.00, 'Pending', '2024-12-05');

DESCRIBE Appointments;

ALTER TABLE Appointments
ADD COLUMN Status ENUM('Scheduled', 'Completed', 'Cancelled');


INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Reason, Status)
VALUES 
(5, 5, '2024-12-05', '13:00:00', 'Skin rash', 'Cancelled');

select * from appointments;

INSERT INTO Patients (Name, DOB, Gender, Address, Phone, MedicalHistory)
VALUES
('Patient1', '1980-01-01', 'Male', 'Address1', '1234567891', 'MedicalHistory1'),
('Patient2', '1985-02-02', 'Female', 'Address2', '1234567892', 'MedicalHistory2'),
('Patient3', '1990-03-03', 'Male', 'Address3', '1234567893', 'MedicalHistory3'),
('Patient4', '1995-04-04', 'Female', 'Address4', '1234567894', 'MedicalHistory4'),
-- Repeat the pattern with unique values
('Patient100', '2000-12-31', 'Male', 'Address100', '1234567999', 'MedicalHistory100');

select * from patients;

INSERT INTO Doctors (Name, Specialization, Phone, DepartmentID)
VALUES
('Doctor1', 'Specialization1', '9876543211', 1),
('Doctor2', 'Specialization2', '9876543212', 2),
('Doctor3', 'Specialization3', '9876543213', 3),
('Doctor4', 'Specialization4', '9876543214', 4),
-- Repeat the pattern with unique values
('Doctor100', 'Specialization100', '9876543299', 5);

INSERT INTO Departments (Name, Description)
VALUES
('Cardiology', 'Heart-related care'),
('Orthopedics', 'Bone and joint care'),
('Neurology', 'Brain and nervous system care'),
('Pediatrics', 'Child health care'),
('Dermatology', 'Skin-related care');
select * from departments;

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Reason, Status)
VALUES
(4, 4, '2024-12-04', '12:15:00', 'Annual check-up', 'Cancelled')
-- Repeat and vary PatientID, DoctorID, and statuses
(100, 5, '2024-12-31', '15:00:00', 'Final review', 'Scheduled');

INSERT INTO Billing (PatientID, AppointmentID, TotalAmount, PaymentStatus, BillingDate)
VALUES
(1, 1, 250.00, 'Paid', '2024-12-01'),
(2, 2, 350.00, 'Pending', '2024-12-02'),
(3, 3, 200.00, 'Paid', '2024-12-03'),
(4, 4, 150.00, 'Pending', '2024-12-04'),
-- Repeat and vary PatientID, AppointmentID, and amounts
(100, 100, 400.00, 'Paid', '2024-12-31');

SELECT AppointmentID FROM Appointments;
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Reason, Status)
VALUES (100, 5, '2024-12-31', '15:00:00', 'Final review', 'Scheduled');


INSERT INTO Billing (PatientID, AppointmentID, TotalAmount, PaymentStatus, BillingDate)
VALUES 
(1, 1, 250.00, 'Paid', '2024-12-01'),
(2, 2, 350.00, 'Pending', '2024-12-02'),
(3, 3, 200.00, 'Paid', '2024-12-03'),
(4, 4, 150.00, 'Pending', '2024-12-04'),
(100, 100, 400.00, 'Paid', '2024-12-31');

SELECT AppointmentID 
FROM Appointments 
WHERE AppointmentID NOT IN (SELECT AppointmentID FROM Billing);










