CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Age INT,
    Gender ENUM('Male', 'Female', 'Other'),
    ContactNumber VARCHAR(15) UNIQUE,
    Address VARCHAR(100),
    EmergencyContactName VARCHAR(50),
    EmergencyContactNumber VARCHAR(15)
);

CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(50),
    ContactNumber VARCHAR(15) UNIQUE,
    Availability VARCHAR(50)
);

CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    Status ENUM('Scheduled', 'Completed', 'Cancelled'),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Prescriptions (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT,
    Medication VARCHAR(100),
    Dosage VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

CREATE TABLE MedicalHistories (
    HistoryID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    Condition VARCHAR(100),
    Treatment VARCHAR(100),
    DateRecorded DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Nurses (
    NurseID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactNumber VARCHAR(15) UNIQUE,
    Shift VARCHAR(20)
);

CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Bills (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    AppointmentID INT,
    Amount DECIMAL(10, 2),
    DueDate DATE,
    Status ENUM('Paid', 'Unpaid'),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

CREATE TABLE Tests (
    TestID INT AUTO_INCREMENT PRIMARY KEY,
    TestName VARCHAR(100),
    Price DECIMAL(10, 2)
);

CREATE TABLE TestResults (
    ResultID INT AUTO_INCREMENT PRIMARY KEY,
    TestID INT,
    AppointmentID INT,
    Result TEXT,
    DateConducted DATE,
    FOREIGN KEY (TestID) REFERENCES Tests(TestID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

