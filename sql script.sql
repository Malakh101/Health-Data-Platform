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

CREATE TABLE Encounters (
    Id VARCHAR(50) PRIMARY KEY,
    PatientId VARCHAR(50) NOT NULL,
    ProviderId VARCHAR(50) NOT NULL,
    OrganizationId VARCHAR(50) NOT NULL,
    PayerId VARCHAR(50) NULL,
    StartDate DATETIME,
    EndDate DATETIME,
    EncounterClass VARCHAR(100),
    Code VARCHAR(50),
    Description VARCHAR(255),
    Base_Encounter_Cost DECIMAL(18,2),
    Total_Claim_Cost DECIMAL(18,2),
    Payer_Coverage DECIMAL(18,2),

    CONSTRAINT FK_Encounters_Patient
        FOREIGN KEY (PatientId)
        REFERENCES Patients(Id),

    CONSTRAINT FK_Encounters_Provider
        FOREIGN KEY (ProviderId)
        REFERENCES Providers(Id),

    CONSTRAINT FK_Encounters_Organization
        FOREIGN KEY (OrganizationId)
        REFERENCES Organizations(Id),

    CONSTRAINT FK_Encounters_Payer
        FOREIGN KEY (PayerId)
        REFERENCES Payers(Id)
);


CREATE TABLE Conditions (
    Id INT IDENTITY PRIMARY KEY,
    PatientId VARCHAR(50) NOT NULL,
    EncounterId VARCHAR(50) NOT NULL,
    Code VARCHAR(50),
    Description VARCHAR(255),
    StartDate DATETIME,
    EndDate DATETIME,

    CONSTRAINT FK_Conditions_Patient
        FOREIGN KEY (PatientId)
        REFERENCES Patients(Id),

    CONSTRAINT FK_Conditions_Encounter
        FOREIGN KEY (EncounterId)
        REFERENCES Encounters(Id)
);


CREATE TABLE Procedures (
    Id INT IDENTITY PRIMARY KEY,
    PatientId VARCHAR(50) NOT NULL,
    EncounterId VARCHAR(50) NOT NULL,
    Code VARCHAR(50),
    Description VARCHAR(255),
    Base_Cost DECIMAL(18,2),

    CONSTRAINT FK_Procedures_Patient
        FOREIGN KEY (PatientId)
        REFERENCES Patients(Id),

    CONSTRAINT FK_Procedures_Encounter
        FOREIGN KEY (EncounterId)
        REFERENCES Encounters(Id)
);


CREATE TABLE Medications (
    Id INT IDENTITY PRIMARY KEY,
    PatientId VARCHAR(50) NOT NULL,
    EncounterId VARCHAR(50) NOT NULL,
    Code VARCHAR(50),
    Description VARCHAR(255),
    Base_Cost DECIMAL(18,2),
    TotalCost DECIMAL(18,2),

    CONSTRAINT FK_Medications_Patient
        FOREIGN KEY (PatientId)
        REFERENCES Patients(Id),

    CONSTRAINT FK_Medications_Encounter
        FOREIGN KEY (EncounterId)
        REFERENCES Encounters(Id)
);

CREATE TABLE Observations (
    Id INT IDENTITY PRIMARY KEY,
    PatientId VARCHAR(50) NOT NULL,
    EncounterId VARCHAR(50) NOT NULL,
    Category VARCHAR(100),
    Code VARCHAR(50),
    Description VARCHAR(255),
    Value VARCHAR(100),
    Units VARCHAR(50),
    ObservationDate DATETIME,

    CONSTRAINT FK_Observations_Patient
        FOREIGN KEY (PatientId)
        REFERENCES Patients(Id),

    CONSTRAINT FK_Observations_Encounter
        FOREIGN KEY (EncounterId)
        REFERENCES Encounters(Id)
);


CREATE TABLE Claims (
    Id VARCHAR(50) PRIMARY KEY,
    PatientId VARCHAR(50) NOT NULL,
    ProviderId VARCHAR(50) NOT NULL,
    EncounterId VARCHAR(50) NOT NULL,
    PrimaryPayerId VARCHAR(50),
    ServiceDate DATETIME,
    ClaimStatus VARCHAR(50),
    TotalAmount DECIMAL(18,2),

    CONSTRAINT FK_Claims_Patient
        FOREIGN KEY (PatientId)
        REFERENCES Patients(Id),

    CONSTRAINT FK_Claims_Provider
        FOREIGN KEY (ProviderId)
        REFERENCES Providers(Id),

    CONSTRAINT FK_Claims_Encounter
        FOREIGN KEY (EncounterId)
        REFERENCES Encounters(Id),

    CONSTRAINT FK_Claims_Payer
        FOREIGN KEY (PrimaryPayerId)
        REFERENCES Payers(Id)
);

CREATE TABLE Allergies (
    Id INT IDENTITY PRIMARY KEY,
    PatientId VARCHAR(50) NOT NULL,
    EncounterId VARCHAR(50) NULL,
    Code VARCHAR(50),
    Description VARCHAR(255),
    AllergyType VARCHAR(100),
    Category VARCHAR(100),
    Reaction VARCHAR(255),
    Severity VARCHAR(50),
    StartDate DATETIME,
    EndDate DATETIME,

    CONSTRAINT FK_Allergies_Patient
        FOREIGN KEY (PatientId)
        REFERENCES Patients(Id),

    CONSTRAINT FK_Allergies_Encounter
        FOREIGN KEY (EncounterId)
        REFERENCES Encounters(Id)
);

CREATE TABLE Careplans (
    Id INT IDENTITY PRIMARY KEY,
    PatientId VARCHAR(50) NOT NULL,
    EncounterId VARCHAR(50) NULL,
    Code VARCHAR(50),
    Description VARCHAR(255),
    StartDate DATETIME,
    EndDate DATETIME,
    Status VARCHAR(50),

    CONSTRAINT FK_Careplans_Patient
        FOREIGN KEY (PatientId)
        REFERENCES Patients(Id),

    CONSTRAINT FK_Careplans_Encounter
        FOREIGN KEY (EncounterId)
        REFERENCES Encounters(Id)
);


CREATE TABLE Immunizations (
    Id INT IDENTITY PRIMARY KEY,
    PatientId VARCHAR(50) NOT NULL,
    EncounterId VARCHAR(50) NULL,
    Code VARCHAR(50),
    Description VARCHAR(255),
    ImmunizationDate DATETIME,
    Cost DECIMAL(18,2),

    CONSTRAINT FK_Immunizations_Patient
        FOREIGN KEY (PatientId)
        REFERENCES Patients(Id),

    CONSTRAINT FK_Immunizations_Encounter
        FOREIGN KEY (EncounterId)
        REFERENCES Encounters(Id)
);


CREATE TABLE Devices (
    Id INT IDENTITY PRIMARY KEY,
    PatientId VARCHAR(50) NOT NULL,
    EncounterId VARCHAR(50) NULL,
    Code VARCHAR(50),
    Description VARCHAR(255),
    StartDate DATETIME,
    EndDate DATETIME,
    UDI VARCHAR(100),

    CONSTRAINT FK_Devices_Patient
        FOREIGN KEY (PatientId)
        REFERENCES Patients(Id),

    CONSTRAINT FK_Devices_Encounter
        FOREIGN KEY (EncounterId)
        REFERENCES Encounters(Id)
);

CREATE TABLE Supplies (
    Id INT IDENTITY PRIMARY KEY,
    EncounterId VARCHAR(50) NOT NULL,
    Code VARCHAR(50),
    Description VARCHAR(255),
    Quantity INT,
    Cost DECIMAL(18,2),

    CONSTRAINT FK_Supplies_Encounter
        FOREIGN KEY (EncounterId)
        REFERENCES Encounters(Id)
);

CREATE TABLE ClaimTransactions (
    Id INT IDENTITY PRIMARY KEY,
    ClaimId VARCHAR(50) NOT NULL,
    TransactionDate DATETIME,
    Amount DECIMAL(18,2),
    TransactionType VARCHAR(100),

    CONSTRAINT FK_ClaimTransactions_Claim
        FOREIGN KEY (ClaimId)
        REFERENCES Claims(Id)
);

CREATE TABLE PayerTransitions (
    Id INT IDENTITY PRIMARY KEY,
    PatientId VARCHAR(50) NOT NULL,
    PayerId VARCHAR(50) NOT NULL,
    StartDate DATETIME,
    EndDate DATETIME,

    CONSTRAINT FK_PayerTransitions_Patient
        FOREIGN KEY (PatientId)
        REFERENCES Patients(Id),

    CONSTRAINT FK_PayerTransitions_Payer
        FOREIGN KEY (PayerId)
        REFERENCES Payers(Id)
);
