

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
