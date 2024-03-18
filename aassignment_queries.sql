-- GROUP BY ... HAVING
SELECT job, COUNT(*) AS num_tenants
FROM Tenants
GROUP BY job
HAVING num_tenants > 2;
/* It groups tenants by their job titles and counts the number of tenants for each job category.
The HAVING clause filters the results to include only those job categories with more than two tenants. */

-- Set operation (UNION, INTERSECT, EXCEPT):
--UNION
SELECT name FROM Landlords
UNION
SELECT name FROM Tenants;
/* This query retrieves the names of individuals who are either landlords or tenants.
It returns a list of all unique names from both tables. */


-- INTERSECT
SELECT name
FROM Landlords
INTERSECT
SELECT name
FROM Tenants;
/* This query retrieves the names of individuals who are both landlords and tenants. */

-- EXCEPT
SELECT name
FROM Landlords
EXCEPT
SELECT name
FROM Tenants;
/* This query retrieves the names of individuals who are landlords but not tenants.
It returns a list of names belonging to individuals who are landlords but are not listed as tenants in the database.*/

-- Nested query or correlation
SELECT name, rent
FROM Properties
WHERE rent > (
    SELECT AVG(rent) 
    FROM Properties
);
/* This query retrieves the names and rents of properties where the rent is higher than the average rent of all properties. */

-- Aggregation (MAX, AVG, SUM, COUNT)
SELECT MAX(rent) AS max_rent, MIN(rent) AS min_rent, AVG(rent) AS avg_rent, SUM(rent) AS total_rent FROM Properties;
/* This query retrieves the maximum, minimum, average, and total rent of all properties. */

-- Query over multiple tables (JOIN)
SELECT Tenants.name, Properties.paddress
FROM Tenants
JOIN Contracts ON Tenants.cid = Contracts.cid
JOIN Properties ON Contracts.paddress = Properties.paddress;
/* This query retrieves the names of tenants along with the addresses of properties they are renting,
 using information from the Contracts table to link tenants to properties. */

-- LIKE (string matching)
SELECT postcode
FROM Properties
WHERE postcode LIKE '2333%';
/* This query retrieves the postcodes of properties that are located in Leiden Bio Science Park */