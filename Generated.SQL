/*
Created: 3/18/2013
Modified: 3/18/2013
Model: Logical model
Database: Oracle 11g Release 2
*/

-- Create tables section -------------------------------------------------

-- Table Patient

CREATE TABLE Patient(
  EmergencyContactLastName Varchar2(30 ),
  EmergencyContactFirstName Integer,
  EmergencyContactRelationship Varchar2(30 ),
  EmergencyPhone Varchar2(30 ),
  EmergencyContactAddress Varchar2(30 ),
  ContactDate Date,
  InsuranceCompany Varchar2(30 ),
  InsuranceNo Varchar2(30 ),
  PatientType Varchar2(30 )
        CONSTRAINT ValidValuesPatientType CHECK ((PatientType IN ('Outpatient','Resident'))),
  PatientId Number NOT NULL,
  PhysicianIdAdmit Number NOT NULL,
  PhysicianIdRefer Number NOT NULL,
  BedId Number NOT NULL,
  RoomId Number NOT NULL,
  FacilityId Number NOT NULL,
  PersonEmail Varchar2(30 ),
  PersonPhone Varchar2(30 ),
  PersonZip Varchar2(30 ),
  PersonState Varchar2(30 ),
  PersonCity Varchar2(30 ),
  PersonAddress Varchar2(30 ),
  PersonName Varchar2(30 ),
  PersonId Number,
  DateDischarged Date,
  DateAdmitted Date
)
/

-- Add keys for table Patient

ALTER TABLE Patient ADD CONSTRAINT Unique_Identifier2 PRIMARY KEY (PatientId,PhysicianIdAdmit,PhysicianIdRefer)
/

-- Table Physician

CREATE TABLE Physician(
  PersonId Number NOT NULL,
  PersonName Varchar2(30 ),
  PersonAddress Varchar2(30 ),
  PersonCity Varchar2(30 ),
  PersonState Varchar2(30 ),
  PersonZip Varchar2(30 ),
  PersonPhone Varchar2(30 ),
  PersonEmail Varchar2(30 ),
  DEA Number,
  Specialty Varchar2(30 ),
  PhysicianId Number NOT NULL
)
/

-- Add keys for table Physician

ALTER TABLE Physician ADD CONSTRAINT Unique_Identifier3 PRIMARY KEY (PhysicianId)
/

-- Table Employee

CREATE TABLE Employee(
  DateHired Date,
  Type Varchar2(30 )
        CONSTRAINT ValidValuesType CHECK ((Type IN ('NURSE','STAFF'))),
  EmployeeId Number NOT NULL,
  FacilityId Number NOT NULL,
  FK_EmployeeId Number NOT NULL,
  FK_FacilityId Number NOT NULL,
  PersonEmail Varchar2(30 ),
  PersonPhone Varchar2(30 ),
  PersonZip Varchar2(30 ),
  PersonState Varchar2(30 ),
  PersonCity Varchar2(30 ),
  PersonAddress Varchar2(30 ),
  PersonName Varchar2(30 ),
  PersonId Number,
  NurseType Varchar2(30 )
        CONSTRAINT ValidValuesNurseType CHECK ((NurseType IN ('REGISTERED','LICENSED'))),
  LicenseNo Number,
  Degree Varchar2(30 )
)
/

-- Add keys for table Employee

ALTER TABLE Employee ADD CONSTRAINT Unique_Identifier4 PRIMARY KEY (EmployeeId,FacilityId)
/

-- Table Visit

CREATE TABLE Visit(
  VisitId Number NOT NULL,
  VisitTime Date,
  VisitNote Clob,
  VisitDate Date,
  PatientId Number NOT NULL,
  PhysicianIdAdmit Number NOT NULL,
  PhysicianIdRefer Number NOT NULL
)
/

-- Add keys for table Visit

ALTER TABLE Visit ADD CONSTRAINT Unique_Identifier10 PRIMARY KEY (VisitId,PatientId,PhysicianIdAdmit,PhysicianIdRefer)
/

-- Table Bed

CREATE TABLE Bed(
  BedId Number NOT NULL,
  RoomId Number NOT NULL,
  FacilityId Number NOT NULL
)
/

-- Add keys for table Bed

ALTER TABLE Bed ADD CONSTRAINT Unique_Identifier11 PRIMARY KEY (BedId,RoomId,FacilityId)
/

-- Table Room

CREATE TABLE Room(
  RoomId Number NOT NULL,
  FacilityId Number NOT NULL
)
/

-- Add keys for table Room

ALTER TABLE Room ADD CONSTRAINT Unique_Identifier12 PRIMARY KEY (RoomId,FacilityId)
/

-- Table Facility

CREATE TABLE Facility(
  FacilityId Number NOT NULL,
  FacilityName Varchar2(30 )
)
/

-- Add keys for table Facility

ALTER TABLE Facility ADD CONSTRAINT Unique_Identifier14 PRIMARY KEY (FacilityId)
/

-- Table Schedule

CREATE TABLE Schedule(
  ScheduleId Number NOT NULL,
  StartingDate Date,
  EndingDate Date,
  FacilityId Number NOT NULL,
  PhysicianId Number NOT NULL
)
/

-- Add keys for table Schedule

ALTER TABLE Schedule ADD CONSTRAINT Unique_Identifier15 PRIMARY KEY (ScheduleId,FacilityId,PhysicianId)
/

-- Table VolServHistory

CREATE TABLE VolServHistory(
  StartingDate Date,
  EndingDate Date,
  ServiceHours Float(126),
  EmployeeId Number,
  PhysicianId Number NOT NULL,
  FacilityId Number,
  FacilityId1 Number NOT NULL,
  VolunteerId Number NOT NULL
)
/

-- Add keys for table VolServHistory

ALTER TABLE VolServHistory ADD CONSTRAINT Unique_Identifier17 PRIMARY KEY (PhysicianId,FacilityId1,VolunteerId)
/

-- Table BusinessUnit

CREATE TABLE BusinessUnit(
  BUId Number NOT NULL,
  BULocation Varchar2(30 ),
  BUType Varchar2(30 )
        CONSTRAINT ValidValuesBUType CHECK ((BUType IN ('Facility','Floor'))),
  FacilityId Number NOT NULL,
  CareCenterName Char(256 ),
  DiagnosisUnitName Char(256 )
)
/

-- Add keys for table BusinessUnit

ALTER TABLE BusinessUnit ADD CONSTRAINT Unique_Identifier19 PRIMARY KEY (FacilityId)
/

-- Table PhysicianDX

CREATE TABLE PhysicianDX(
  Date Date NOT NULL,
  Time Date,
  PhysicianId Number NOT NULL,
  PatientId Number NOT NULL,
  DiagnosisId Number NOT NULL,
  PhysicianIdAdmit Number NOT NULL,
  PhysicianIdRefer Number NOT NULL
)
/

-- Add keys for table PhysicianDX

ALTER TABLE PhysicianDX ADD CONSTRAINT Unique_Identifier20 PRIMARY KEY (PatientId,DiagnosisId,PhysicianIdAdmit,PhysicianIdRefer)
/

-- Table Diagnosis

CREATE TABLE Diagnosis(
  DiagnosisId Number NOT NULL,
  DiagnosisName Integer
)
/

-- Add keys for table Diagnosis

ALTER TABLE Diagnosis ADD CONSTRAINT Unique_Identifier21 PRIMARY KEY (DiagnosisId)
/

-- Table Order

CREATE TABLE Order(
  OrderId Number NOT NULL,
  OrderDate Date,
  OrderTime Date,
  PhysicianId Number NOT NULL,
  PatientId Number NOT NULL,
  PhysicianIdAdmit Number NOT NULL,
  PhysicianIdRefer Number NOT NULL,
  ItemNo Number NOT NULL
)
/

-- Add keys for table Order

ALTER TABLE Order ADD CONSTRAINT Unique_Identifier22 PRIMARY KEY (OrderId,PhysicianId,PatientId,PhysicianIdAdmit,PhysicianIdRefer,ItemNo)
/

-- Table Assessment

CREATE TABLE Assessment(
  AssessmentId Number NOT NULL,
  AssessmentDate Integer,
  AssessmentNote Clob,
  PatientWeight Float(126),
  PatientPulse Float(126),
  PatientTemperature Float(126),
  PatientId Number NOT NULL,
  PhysicianId Number NOT NULL,
  PhysicianIdRefer Number NOT NULL,
  EmployeeId Number NOT NULL,
  FacilityId Number NOT NULL
)
/

-- Add keys for table Assessment

ALTER TABLE Assessment ADD CONSTRAINT Unique_Identifier28 PRIMARY KEY (AssessmentId,PatientId,PhysicianId,PhysicianIdRefer,EmployeeId,FacilityId)
/

-- Table Treatment

CREATE TABLE Treatment(
  TreatmentId Number NOT NULL,
  TreatmentName Varchar2(30 ),
  FacilityId Number NOT NULL
)
/

-- Add keys for table Treatment

ALTER TABLE Treatment ADD CONSTRAINT Unique_Identifier29 PRIMARY KEY (TreatmentId,FacilityId)
/

-- Table BillingItem

CREATE TABLE BillingItem(
  StartingDate Date,
  EndingDate Date,
  Cost Float(126),
  ItemNo Number NOT NULL,
  RoomId Number NOT NULL,
  FacilityId Number NOT NULL,
  PatientId Number NOT NULL,
  PhysicianIdAdmit Number NOT NULL,
  PhysicianIdRefer Number NOT NULL
)
/

-- Add keys for table BillingItem

ALTER TABLE BillingItem ADD CONSTRAINT Unique_Identifier30 PRIMARY KEY (ItemNo,RoomId,FacilityId,PatientId,PhysicianIdAdmit,PhysicianIdRefer)
/

-- Table Item

CREATE TABLE Item(
  ItemNo Number NOT NULL,
  ItemDescription Clob,
  ItemCost Float(126)
)
/

-- Add keys for table Item

ALTER TABLE Item ADD CONSTRAINT Unique_Identifier31 PRIMARY KEY (ItemNo)
/

-- Table Vendor

CREATE TABLE Vendor(
  VendorId Number NOT NULL,
  VendorName Varchar2(30 )
)
/

-- Add keys for table Vendor

ALTER TABLE Vendor ADD CONSTRAINT Unique_Identifier32 PRIMARY KEY (VendorId)
/

-- Table ItemConsumption

CREATE TABLE ItemConsumption(
  ConsumeDate Date,
  ConsumeTime Date,
  ConsumeQuantity Number,
  ItemNo Number NOT NULL,
  PatientId Number NOT NULL,
  PhysicianIdAdmit Number NOT NULL,
  PhysicianIdRefer Number NOT NULL
)
/

-- Add keys for table ItemConsumption

ALTER TABLE ItemConsumption ADD CONSTRAINT Unique_Identifier33 PRIMARY KEY (ItemNo,PatientId,PhysicianIdAdmit,PhysicianIdRefer)
/

-- Table Volunteer

CREATE TABLE Volunteer(
  PersonId Number NOT NULL,
  PersonName Varchar2(30 ),
  PersonAddress Varchar2(30 ),
  PersonCity Varchar2(30 ),
  PersonState Varchar2(30 ),
  PersonZip Varchar2(30 ),
  PersonPhone Varchar2(30 ),
  PersonEmail Varchar2(30 ),
  Felony Char(1 ),
  FelonyExplaination Clob,
  Language Varchar2(30 ),
  Experience Clob,
  Interest Varchar2(30 ),
  Preference Varchar2(30 ),
  Skill Varchar2(30 ),
  VolunteerId Number NOT NULL
)
/

-- Add keys for table Volunteer

ALTER TABLE Volunteer ADD CONSTRAINT Unique_Identifier7 PRIMARY KEY (VolunteerId)
/

-- Table Relationship26

CREATE TABLE Relationship26(
  EmployeeId Number NOT NULL,
  FacilityId1 Number NOT NULL,
  FacilityId Number NOT NULL
)
/

-- Add keys for table Relationship26

ALTER TABLE Relationship26 ADD CONSTRAINT Key1 PRIMARY KEY (EmployeeId,FacilityId1,FacilityId)
/

-- Table Vendor_Item

CREATE TABLE Vendor_Item(
  VendorId Number NOT NULL,
  ItemNo Number NOT NULL
)
/

-- Table Order_Treatment

CREATE TABLE Order_Treatment(
  OrderId Number NOT NULL,
  PhysicianId Number NOT NULL,
  PatientId Number NOT NULL,
  PhysicianIdAdmit Number NOT NULL,
  PhysicianIdRefer Number NOT NULL,
  ItemNo Number NOT NULL,
  TreatmentId Number NOT NULL,
  FacilityId Number NOT NULL
)
/

-- Create relationships section ------------------------------------------------- 

ALTER TABLE Schedule ADD CONSTRAINT Relationship5 FOREIGN KEY (FacilityId) REFERENCES Facility (FacilityId)
/

ALTER TABLE VolServHistory ADD CONSTRAINT Relationship8 FOREIGN KEY (EmployeeId, FacilityId) REFERENCES Employee (EmployeeId, FacilityId)
/

ALTER TABLE VolServHistory ADD CONSTRAINT Relationship9 FOREIGN KEY (PhysicianId) REFERENCES Physician (PhysicianId)
/

ALTER TABLE Employee ADD CONSTRAINT Relationship10_1 FOREIGN KEY (FacilityId) REFERENCES BusinessUnit (FacilityId)
/

ALTER TABLE BusinessUnit ADD CONSTRAINT Relationship11 FOREIGN KEY (FacilityId) REFERENCES Facility (FacilityId)
/

ALTER TABLE VolServHistory ADD CONSTRAINT Relationship12 FOREIGN KEY (FacilityId1) REFERENCES BusinessUnit (FacilityId)
/

ALTER TABLE PhysicianDX ADD CONSTRAINT Relationship13 FOREIGN KEY (PhysicianId) REFERENCES Physician (PhysicianId)
/

ALTER TABLE PhysicianDX ADD CONSTRAINT Relationship14 FOREIGN KEY (PatientId, PhysicianIdAdmit, PhysicianIdRefer) REFERENCES Patient (PatientId, PhysicianIdAdmit, PhysicianIdRefer)
/

ALTER TABLE PhysicianDX ADD CONSTRAINT Relationship15 FOREIGN KEY (DiagnosisId) REFERENCES Diagnosis (DiagnosisId)
/

ALTER TABLE Order ADD CONSTRAINT Relationship16 FOREIGN KEY (PhysicianId) REFERENCES Physician (PhysicianId)
/

ALTER TABLE Patient ADD CONSTRAINT Admit FOREIGN KEY (PhysicianIdAdmit) REFERENCES Physician (PhysicianId)
/

ALTER TABLE Patient ADD CONSTRAINT Refer FOREIGN KEY (PhysicianIdRefer) REFERENCES Physician (PhysicianId)
/

ALTER TABLE Employee ADD CONSTRAINT Relationship24_1 FOREIGN KEY (FK_EmployeeId, FK_FacilityId) REFERENCES Employee (EmployeeId, FacilityId)
/

ALTER TABLE Relationship26 ADD CONSTRAINT Relationship26_Nurse FOREIGN KEY (EmployeeId, FacilityId1) REFERENCES Employee (EmployeeId, FacilityId)
/

ALTER TABLE Relationship26 ADD CONSTRAINT Relationship26_CareCenter FOREIGN KEY (FacilityId) REFERENCES BusinessUnit (FacilityId)
/

ALTER TABLE Assessment ADD CONSTRAINT Relationship27 FOREIGN KEY (PatientId, PhysicianId, PhysicianIdRefer) REFERENCES Patient (PatientId, PhysicianIdAdmit, PhysicianIdRefer)
/

ALTER TABLE Order ADD CONSTRAINT Relationship28 FOREIGN KEY (PatientId, PhysicianIdAdmit, PhysicianIdRefer) REFERENCES Patient (PatientId, PhysicianIdAdmit, PhysicianIdRefer)
/

ALTER TABLE Room ADD CONSTRAINT Relationship29_1 FOREIGN KEY (FacilityId) REFERENCES BusinessUnit (FacilityId)
/

ALTER TABLE Bed ADD CONSTRAINT Relationship30 FOREIGN KEY (RoomId, FacilityId) REFERENCES Room (RoomId, FacilityId)
/

ALTER TABLE Patient ADD CONSTRAINT Relationship31_1 FOREIGN KEY (BedId, RoomId, FacilityId) REFERENCES Bed (BedId, RoomId, FacilityId)
/

ALTER TABLE Visit ADD CONSTRAINT Relationship32_1 FOREIGN KEY (PatientId, PhysicianIdAdmit, PhysicianIdRefer) REFERENCES Patient (PatientId, PhysicianIdAdmit, PhysicianIdRefer)
/

ALTER TABLE Treatment ADD CONSTRAINT Performs_1 FOREIGN KEY (FacilityId) REFERENCES BusinessUnit (FacilityId)
/

ALTER TABLE ItemConsumption ADD CONSTRAINT Relationship36 FOREIGN KEY (ItemNo) REFERENCES Item (ItemNo)
/

ALTER TABLE BillingItem ADD CONSTRAINT Relationship37 FOREIGN KEY (ItemNo) REFERENCES Item (ItemNo)
/

ALTER TABLE BillingItem ADD CONSTRAINT Relationship38 FOREIGN KEY (RoomId, FacilityId) REFERENCES Room (RoomId, FacilityId)
/

ALTER TABLE BillingItem ADD CONSTRAINT Relationship39 FOREIGN KEY (PatientId, PhysicianIdAdmit, PhysicianIdRefer) REFERENCES Patient (PatientId, PhysicianIdAdmit, PhysicianIdRefer)
/

ALTER TABLE Order ADD CONSTRAINT Relationship40 FOREIGN KEY (ItemNo) REFERENCES Item (ItemNo)
/

ALTER TABLE ItemConsumption ADD CONSTRAINT Relationship41 FOREIGN KEY (PatientId, PhysicianIdAdmit, PhysicianIdRefer) REFERENCES Patient (PatientId, PhysicianIdAdmit, PhysicianIdRefer)
/

ALTER TABLE Vendor_Item ADD CONSTRAINT Supplies_Vendor FOREIGN KEY (VendorId) REFERENCES Vendor (VendorId)
/

ALTER TABLE Vendor_Item ADD CONSTRAINT Supplies_Item FOREIGN KEY (ItemNo) REFERENCES Item (ItemNo)
/

ALTER TABLE Assessment ADD CONSTRAINT Relationship44_1 FOREIGN KEY (EmployeeId, FacilityId) REFERENCES Employee (EmployeeId, FacilityId)
/

ALTER TABLE Schedule ADD CONSTRAINT Relationship46 FOREIGN KEY (PhysicianId) REFERENCES Physician (PhysicianId)
/

ALTER TABLE Order_Treatment ADD CONSTRAINT Relationship47_Order FOREIGN KEY (OrderId, PhysicianId, PatientId, PhysicianIdAdmit, PhysicianIdRefer, ItemNo) REFERENCES Order (OrderId, PhysicianId, PatientId, PhysicianIdAdmit, PhysicianIdRefer, ItemNo)
/

ALTER TABLE Order_Treatment ADD CONSTRAINT Relationship47_Treatment FOREIGN KEY (TreatmentId, FacilityId) REFERENCES Treatment (TreatmentId, FacilityId)
/

ALTER TABLE VolServHistory ADD CONSTRAINT Relationship48 FOREIGN KEY (VolunteerId) REFERENCES Volunteer (VolunteerId)
/




