





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
