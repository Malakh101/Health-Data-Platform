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