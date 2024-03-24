--create table for landlords
DROP TABLE IF EXISTS Landlords;
CREATE TABLE Landlords(
lssn INTEGER PRIMARY KEY, 
name TEXT NOT NULL, 
job TEXT, phone INTEGER, email TEXT NOT NULL);

INSERT INTO Landlords (lssn, name, job, phone, email) VALUES
(2984, 'Laura Smith', 'Engineer', 0694829475, 'laurasmith@email.com'),
(2985, 'Mark Johnson', 'Teacher', 0672829054, 'markjohnson@email.com'),
(2986, 'Sarah Brown', 'Nurse', 0656724003, 'sarahbrown@email.com'),
(2987, 'Michael Davis', 'Architect', 0638824067, 'michaeldavis@email.com'),
(2988, 'Emma Wilson', 'Lawyer', 0625824011, 'emmawilson@email.com'),
(2989, 'Daniel Moore', 'Chef', 0693824062, 'danielmoore@email.com'),
(2990, 'Olivia Taylor', 'Artist', 0681824033, 'oliviataylor@email.com'),
(2991, 'William Anderson', 'Writer', 0649824076, 'williamanderson@email.com'),
(8392, 'Sophia Thomas', 'Scientist', 0665824099, 'sophiathomas@email.com'),
(2993, 'Lucas Jackson', 'Musician', 0677824004, 'lucasjackson@email.com'),
(2564, 'Mia Martin', 'Photographer', 0653824065, 'miamartin@email.com'),
(1195, 'Benjamin Lee', 'Programmer', 0642824088, 'benjaminlee@email.com'),
(5666, 'Isabella Harris', 'Designer', 0631824077, 'isabellaharris@email.com'),
(7997, 'Ethan Clark', 'Accountant', 0629824066, 'ethanclark@email.com'),
(3575, 'Ava Lewis', 'Journalist', 0699824055, 'avalewis@email.com'),
(2999, 'Matthew Walker', 'Doctor', 0683824012, 'matthewwalker@email.com'),
(5425, 'Elizabeth Allen', 'Dentist', 0674824078, 'elizabethallen@email.com'),
(3001, 'Henry Young', 'Economist', 0663824089, 'henryyoung@email.com'),
(9658, 'Zoe Hernandez', 'Psychologist', 0658824056, 'zoehernandez@email.com'),
(5455, 'Jackson King', 'Biologist', 0644824047, 'jacksonking@email.com');

--create table for tenants
DROP TABLE IF EXISTS Tenants;
CREATE TABLE Tenants(
tssn INTEGER PRIMARY KEY, 
name TEXT NOT NULL, 
job TEXT, phone INTEGER, 
email TEXT NOT NULL, 
cid INTEGER,
FOREIGN KEY (cid)
REFERENCES Contracts(cid));

INSERT INTO Tenants (tssn, name, job, phone, email, cid) VALUES 
(948343,'John Doe','Student',068346234,'j.doe@email.com', 538),
(235786,'Mary Smith','Programmer',067892345,'mary.smith@email.com', 714),
(674821,'David Johnson','Student',065432789,'david.johnson@email.com', 269),
(389765,'Emily Brown','Student',068947123,'emily.brown@email.com', 785),
(546278,'Emma Wilson','Lawyer',064512378,'emmawilson@email.com', 413),
(123590,'Daniel Moore','Chef',067823456,'danielmoore@email.com', 626),
(789452,'Christopher Anderson','Student',062378945,'christopher.anderson@email.com', 821),
(982345,'Samantha Martinez','Student',069874512,'samantha.martinez@email.com', 472),
(456783,'James Thompson','Programmer',061234567,'james.thompson@email.com', 199),
(879234,'Amanda Davis','Student',068735624,'amanda.davis@email.com', 823),
(234568,'Robert Rodriguez','Teacher',065498712,'robert.rodriguez@email.com', 982),
(784512,'Olivia Garcia','Student',063472189,'olivia.garcia@email.com', 601),
(325478,'Daniel Hernandez','Programmer',064897321,'daniel.hernandez@email.com', 428),
(657894,'Isabella Lopez','Artist',067382945,'isabella.lopez@email.com', 695),
(347865,'William Martinez','Programmer',062345671,'william.martinez@email.com', 185),
(219873,'Ava Gonzalez','Student',069845231,'ava.gonzalez@email.com', 742),
(568912,'Sophia Perez','Student',068734512,'sophia.perez@email.com', 437),
(456789,'Alexander Wilson','Student',065493821,'alexander.wilson@email.com', 374),
(678945,'Mia Moore','Student',064235789,'mia.moore@email.com', 805),
(198273,'Jacob Jackson','Student',067894512,'jacob.jackson@email.com', 249);

--WEAK ENTITY SET
DROP TABLE IF EXISTS EmergencyContacts;
CREATE TABLE EmergencyContacts(
    ename TEXT NOT NULL,
    ephone INTEGER, 
    lssn INTEGER UNIQUE,
    PRIMARY KEY(ephone, lssn),
    FOREIGN KEY(lssn) REFERENCES Landlords(lssn) ON DELETE CASCADE);

INSERT INTO EmergencyContacts (ename, ephone, lssn) VALUES 
    ('John Doe', 1234567890, 2984),
    ('Mary Smith', 2345678901, 2985),
    ('David Johnson', 3456789012, 2986),
    ('Emily Brown', 4567890123, 2987),
    ('Emma Wilson', 5678901234, 2988),
    ('Daniel Moore', 6789012345, 2989),
    ('Christopher Anderson', 7890123456, 2990),
    ('Samantha Martinez', 8901234567, 2991),
    ('James Thompson', 9012345678, 8392),
    ('Amanda Davis', 1234567891, 2993);

--emails are set to not null because we need them for communication
--as well as names


--create table for housing agencies
DROP TABLE IF EXISTS HousingAgency;
    CREATE TABLE HousingAgency(
    a_name TEXT PRIMARY KEY,
    website TEXT,
    area TEXT);

INSERT INTO HousingAgency (a_name, website, area) VALUES 
('De Huurbaas', 'www.dehuurbaas.nl', 'Leiden Centrum'),
('Woning Wereld', 'www.woningwereld.nl', 'Leiden Zuid'),
('Huis Huren', 'www.huishuren.nl', 'Leiden Oost'),
('De Makelaar', 'www.demakelaar.nl', 'Leiden Noord'),
('Huur Expert', 'www.huurexpert.nl', 'Leiden Binnenstad'),
('PandPlaats', 'www.pandplaats.nl', 'Leiden Merenwijk'),
('Huur Winkel', 'www.huurwinkel.nl', 'Leiden Stevenshof'),
('Woon Expertise', 'www.woonexpertise.nl', 'Leiden Rijnsoever'),
('KamerGemak', 'www.kamergemak.nl', 'Leiden Groenoord'),
('HuisVinder', 'www.huisvinder.nl', 'Leiden Cronestein');


--create table with property attributes
DROP TABLE IF EXISTS Property_Manages;
CREATE TABLE Property_Manages(
paddress TEXT, postcode TEXT,
rent INTEGER, rooms INTEGER, 
is_furnished BOOLEAN,
PRIMARY KEY(paddress, postcode));



--use inheritance to create flats and houses (IS-A relationship with Property_Manages)




--IS A RELATIONSHIP
--flats have also a floor number and own kitchen

--houses have a garden and garage


DROP TABLE IF EXISTS Flats;
CREATE TABLE Flats(
paddress TEXT, postcode TEXT,
floor_number INTEGER, own_kitchen BOOLEAN,
PRIMARY KEY(paddress, postcode), 
FOREIGN KEY(paddress, postcode) 
REFERENCES Property_Manages(paddress, postcode)
ON DELETE CASCADE);

INSERT INTO Flats (paddress, postcode, floor_number, own_kitchen) VALUES 
('Steenstraat 10','2312 BW Leiden',3,1),
('Einsteinweg 20','2333 CC Leiden',2,0),
('Hooigracht 87','2312 KP Leiden',1,1),
('Kerkstraat 23','2301 AB Leiden',4,0),
('Winkelsteegseweg 12','2302 CD Leiden',2,1),
('Kloosterweg 76','2315 EF Leiden',3,1),
('Oude Singel 33','2314 GH Leiden',2,0),
('Beestenmarkt 44','2313 XY Leiden',5,1),
('Hogewoerd 21','2311 HC Leiden',1,0),
('Rapenburg 8','2311 EW Leiden',4,1),
('Herengracht 15','2312 LM Leiden',3,0),
('Breestraat 19','2311 CH Leiden',2,1),
('Molenstraat 5','2315 JK Leiden',1,0),
('Nieuwe Rijn 27','2312 JX Leiden',3,1),
('Hogewoerd 68','2311 HT Leiden',2,0),
('Langegracht 92','2312 VA Leiden',4,1),
('Rapenburg 72','2311 GJ Leiden',1,0),
('Zoeterwoudsesingel 36','2313 DW Leiden',3,1),
('Vrijheidslaan 65','2321 JR Leiden',1,1),
('Kort Rapenburg 2','2311 GC Leiden',2,1);



DROP TABLE IF EXISTS Houses;
CREATE TABLE Houses(
paddress TEXT, postcode TEXT,
garden BOOLEAN, garage BOOLEAN,
PRIMARY KEY(paddress, postcode),
FOREIGN KEY(paddress, postcode) 
REFERENCES Property_Manages(paddress, postcode)
ON DELETE CASCADE);

INSERT INTO Houses (paddress, postcode, garden, garage) VALUES 
('Gangetje 3','2311 ER Leiden',1,1),
('Zonneveldstraat 7','2313 VP Leiden',0,1),
('Dorpstraat 14','2316 AD Leiden',1,1),
('Jan van Goyenkade 29','2311 AD Leiden',1,0),
('Oosterkerkstraat 6','2313 RV Leiden',1,1),
('Botermarkt 22','2311 EN Leiden',0,1),
('Kolfmakersteeg 4','2312 TA Leiden',3,1),
('Hoge Woerd 40','2312 HJ Leiden',1,0),
('Vlietweg 9','2315 TM Leiden',1,1),
('Langebrug 11','2311 TG Leiden',0,1),
('Witte Singel 8','2311 BG Leiden',1,1),
('Kerkplein 5','2312 PK Leiden',1,0),
('Roodenburgerdistrict 14','2315 GE Leiden',1,1),
('Vestestraat 20','2312 SH Leiden',1,0),
('Rijn en Schiekade 36','2311 LM Leiden',0,1),
('Schelpenkade 16','2313 ZZ Leiden',1,0),
('Dorpsstraat 29','2317 BA Leiden',1,1),
('Pieterskerk-Choorsteeg 22','2311 XS Leiden',1,1),
('Gasthuissteeg 3','2312 AT Leiden',1,1),
('Breestraat 9','2311 AA Leiden',1,0);


--modify the property to model 1 to many
--relationship with landlords
ALTER TABLE Property_Manages
ADD COLUMN lssn INTEGER 
REFERENCES Landlords(lssn);


--SELF-JOIN with roles
--resident assistants and residents (for tenants)
--there is an RA for a certain group of tenants

DROP TABLE IF EXISTS Assists;
CREATE TABLE Assists(
resident_assistant_ssn INTEGER,
resident_ssn INTEGER, 
PRIMARY KEY(resident_assistant_ssn, resident_ssn),
FOREIGN KEY(resident_assistant_ssn) REFERENCES Tenants(tssn),
FOREIGN KEY(resident_ssn) REFERENCES Tenants(tssn));

INSERT INTO Assists (resident_assistant_ssn, resident_ssn) VALUES 
(948343, 235786),
(674821, 389765),
(546278, 123590),
(789452, 982345),
(456783, 879234),
(234568, 784512),
(325478, 657894),
(347865, 219873),
(568912, 456789),
(678945, 198273);

--AGGREGATION
--a landlord can have multiple tenants for once contract
--a housing agency can have 0 or more contracts so it
--is optional in the relationship

--KEY CONSTRAINT
--a tenant can have only one contract
--that is why we alter the table tenants instead of 
--adding tssn to Contracts

--TERNARY RELATIONSHIP
DROP TABLE IF EXISTS Contracts;
CREATE TABLE Contracts(
cid INTEGER PRIMARY KEY,
lssn INTEGER NOT NULL,
a_name TEXT,
FOREIGN KEY(lssn) REFERENCES Landlords(lssn),
FOREIGN KEY(a_name) REFERENCES HousingAgency(a_name));


--combined total participation and key constraint



--Property_Manages can be in one contract (different tenants
--living in one property have the same cid so no problem here)
ALTER TABLE Property_Manages
ADD COLUMN cid INTEGER
REFERENCES Contracts(cid);


INSERT INTO Property_Manages (paddress, postcode, rent, rooms, is_furnished, lssn, cid) VALUES 
('Steenstraat 35','2312 BT Leiden',845,2,1,1195,269),
('Hooigracht 78','2312 KP Leiden',800,1,1,2989,785),
('Oude Singel 33','2333 GH Leiden',710,1,1,2993,821),
('Beestenmarkt 44','2313 XY Leiden',1480,3,1,2987,742),
('Hogewoerd 21','2311 HC Leiden',690,1,1,2987,NULL),
('Dorpstraat 14','2333 AD Leiden',490,1,0,2988,NULL),
('Jan van Goyenkade 29','2311 AD Leiden',1520,3,1,8392,413),
('Oosterkerkstraat 6','2313 RV Leiden',670,1,1,2991,626),
('Kolfmakersteeg 4','2312 TA Leiden',1640,3,1,2993,821),
('Vrouwensteeg 8','2312 DM Leiden',720,1,1,2988,NULL),
('Bargelaan 25','2333 CT Leiden',1570,3,1,1195,472),
('Diefsteeg 17','2311 TW Leiden',680,1,1,2988,199),
('Oude Rijn 41','2312 HG Leiden',1530,3,1,2564,823),
('Vismarkt 10','2332 LJ Leiden',1490,3,1,2,982),
('Kerkstraat 7','2312 BH Leiden',900,2,1,7997,601),
('Nieuwstraat 14','2315 EA Leiden',1200,2,1,5666,428),
('Schelpenkade 9','2333 ZZ Leiden',1100,2,1,2999,695),
('Langegracht 5','2312 VA Leiden',980,2,1,3575,185),
('Molenstraat 12','2315 JK Leiden',920,2,1,5455,437),
('Achterom 8','2311 TV Leiden',1000,2,1,9658,374),
('Vestestraat 16','2312 SH Leiden',940,2,1,5425,805),
('Hoge Woerd 20','2312 HJ Leiden',950,2,1,3201,249);

INSERT INTO Contracts (cid, lssn, a_name) VALUES 
(538,3001,'De Huurbaas'),
(714,2564,'Woning Wereld'),
(269,1195,'Huis Huren'),
(785,2989,'De Makelaar'),
(413,8392,'Huur Expert'),
(626,2991,'PandPlaats'),
(821,2993,'Huur Winkel'),
(472,1195,'Woon Expertise'),
(199,2988,'KamerGemak'),
(823,2564,'HuisVinder'),
(982,3002,'De Huurdbaas'),
(601,7997,'Woning Wereld'),
(428,5666,'Huis Huren'),
(695,2999,'De Makelaar'),
(185,3575,'Huur Expert'),
(742,2987,'PandPlaats'),
(437,5455,'Huur Winkel'),
(374,9658,'Woon Expertise'),
(805,5425,'KamerGemak'),
(249,3201,'HuisVinder');

