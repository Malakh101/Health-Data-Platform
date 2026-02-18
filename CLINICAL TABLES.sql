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
