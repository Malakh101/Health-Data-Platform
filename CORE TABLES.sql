CREATE TABLE Patients (
    Id VARCHAR(50) PRIMARY KEY,
    BirthDate DATE NULL,
    DeathDate DATE NULL,
    Gender VARCHAR(20) NULL,
    Race VARCHAR(50) NULL,
    Ethnicity VARCHAR(50) NULL,
    City VARCHAR(100) NULL,
    State VARCHAR(50) NULL,
    Healthcare_Expenses DECIMAL(18,2) NULL,
    Healthcare_Coverage DECIMAL(18,2) NULL
);

CREATE TABLE Organizations (
    Id VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    Zip VARCHAR(20),
    Phone VARCHAR(50),
    Revenue DECIMAL(18,2),
    Utilization INT
);


CREATE TABLE Providers (
    Id VARCHAR(50) PRIMARY KEY,
    OrganizationId VARCHAR(50) NOT NULL,
    Name VARCHAR(255),
    Gender VARCHAR(20),
    Specialty VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(50),
    Utilization INT,
    CONSTRAINT FK_Providers_Organization
        FOREIGN KEY (OrganizationId)
        REFERENCES Organizations(Id)
);


CREATE TABLE Payers (
    Id VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(255),
    Phone VARCHAR(50),
    Revenue DECIMAL(18,2),
    Amount_Covered DECIMAL(18,2),
    Amount_Uncovered DECIMAL(18,2)
);