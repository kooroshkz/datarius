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
It returns a list of all unique names from both tables so we can say those are
our platform real live users. */


-- INTERSECT
SELECT name FROM Landlords
INTERSECT
SELECT name FROM Tenants;
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
SELECT paddress, rent
FROM Property_Manages
WHERE rent > (
    SELECT AVG(rent) 
    FROM Property_Manages
);
/* This query retrieves the address and rents of properties where the rent is higher than the average rent of all properties. */

-- Aggregation (MAX, AVG, SUM, COUNT)
SELECT MAX(rent) AS max_rent, MIN(rent) AS min_rent, AVG(rent) AS avg_rent, SUM(rent) AS total_rent FROM Property_Manages;
/* This query retrieves the maximum, minimum, average, and total rent of all properties. */

-- Query over multiple tables (JOIN)
SELECT Landlords.name, Property_Manages.paddress
FROM Landlords
JOIN Property_Manages ON Landlords.lssn = Property_Manages.lssn;
/* This command will retrieve the names of landlords
with addresses of thir properties where the lssn matches between the two tables. */

-- LIKE (string matching)
SELECT paddress, postcode
FROM Property_Manages
WHERE postcode LIKE '2333%';
/* This query retrieves the postcodes of properties that are located in Leiden Bio Science Park */