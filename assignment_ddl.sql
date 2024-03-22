--TODO
--add example entries using copilot/gpt/github dataset

--enable system to fill tables with csv datas
.mode csv

--create table for landlords
DROP TABLE IF EXISTS Landlords;
CREATE TABLE Landlords(
lssn INTEGER PRIMARY KEY, 
name TEXT NOT NULL, 
job TEXT, phone INTEGER, email TEXT NOT NULL);

.import datasets/Landlords.csv Landlords

--create table for tenants
DROP TABLE IF EXISTS Tenants;
CREATE TABLE Tenants(
tssn INTEGER PRIMARY KEY, 
name TEXT NOT NULL, 
job TEXT, phone INTEGER, email TEXT NOT NULL);

.import datasets/Tenants.csv Tenants

--WEAK ENTITY SET
DROP TABLE IF EXISTS EmergencyContacts;
CREATE TABLE EmergencyContacts(
    ename TEXT NOT NULL,
    ephone INTEGER, 
    lssn INTEGER UNIQUE,
    PRIMARY KEY(ephone, lssn),
    FOREIGN KEY(lssn) REFERENCES Landlords(lssn) ON DELETE CASCADE);

--emails are set to not null because we need them for communication
--as well as names


--create table for housing agencies
DROP TABLE IF EXISTS HousingAgency;
    CREATE TABLE HousingAgency(
    a_name TEXT PRIMARY KEY,
    website TEXT,
    area TEXT);

.import datasets/HousingAgency.csv HousingAgency

--create table with property attributes
DROP TABLE IF EXISTS Property_Manages;
CREATE TABLE Property_Manages(
paddress TEXT, postcode TEXT,
rent INTEGER, rooms INTEGER, 
is_furnished BOOLEAN,
PRIMARY KEY(paddress, postcode));



--use inheritance to create flats and houses (IS-A relationship with Property_Manages)

--(COMMENT TO TEAM) I also added the floor attribute to distingish it from
--houses


--IS A RELATIONSHIP
--flats have also a floor number and own kitchen

--houses have a garden and garage
--TODO explanation or different implementation needed
-- for cover and non-overlap
--see assignment description for details


DROP TABLE IF EXISTS Flats;
CREATE TABLE Flats(
paddress TEXT, postcode TEXT,
floor_number INTEGER, own_kitchen BOOLEAN,
PRIMARY KEY(paddress, postcode), 
FOREIGN KEY(paddress, postcode) 
REFERENCES Property_Manages(paddress, postcode)
ON DELETE CASCADE);

.import datasets/Flats.csv Flats


DROP TABLE IF EXISTS Houses;
CREATE TABLE Houses(
paddress TEXT, postcode TEXT,
garden BOOLEAN, garage BOOLEAN,
PRIMARY KEY(paddress, postcode),
FOREIGN KEY(paddress, postcode) 
REFERENCES Property_Manages(paddress, postcode)
ON DELETE CASCADE);

.import datasets/Houses.csv Houses

--now we model relationships form the ER Diagram


--WEAK ENTITY SET
--landlords manage Property_Manages


--modify the property to model 1 to many
--relationship with landlords
ALTER TABLE Property_Manages
ADD COLUMN lssn INTEGER;




--SELF-JOIN with roles
--resident assistants and residents (for tenants)
--there is an RA for a certain group of tenants
--TODO comment needed
DROP TABLE IF EXISTS Assists;
CREATE TABLE Assists(
resident_assistant_ssn INTEGER,
resident_ssn INTEGER, 
PRIMARY KEY(resident_assistant_ssn, resident_ssn),
FOREIGN KEY(resident_assistant_ssn) REFERENCES Tenants(tssn),
FOREIGN KEY(resident_ssn) REFERENCES Tenants(tssn));


--AGGREGATION
--a landlord can have multiple tenants for once contract
--a housing agency can have 0 or more contracts so it
--is optional in the relationship

--KEY CONSTRAINT
--a tenant can have only one contract
--that is why we alter the table tenants instead of 
--adding tssn to Contracts

--TODO explanation needed why its a total participation
--and key constraint instead of just a key constraint

DROP TABLE IF EXISTS Contracts;
CREATE TABLE Contracts(
cid INTEGER PRIMARY KEY,
lssn INTEGER NOT NULL,
a_name TEXT,
FOREIGN KEY(lssn) REFERENCES Landlords(lssn),
FOREIGN KEY(a_name) REFERENCES HousingAgency(a_name));


--combined total participation and key constraint
ALTER TABLE Tenants
ADD COLUMN cid INTEGER
REFERENCES Contracts(cid);


--Property_Manages can be in one contract (different tenants
--living in one property have the same cid so no problem here)
ALTER TABLE Property_Manages
ADD COLUMN cid INTEGER
REFERENCES Contracts(cid);


.import datasets/Property_Manages.csv Property_Manages
.import datasets/Contracts.csv Contracts

--bonus things
--TERNARY RELATIONSHIP
--TODO (optional)