-- GROUP BY ... HAVING
SELECT job, COUNT(*) AS num_tenants
FROM Tenants
GROUP BY job
HAVING num_tenants > 2;
/* It groups tenants by their job titles and counts the number of tenants for each job category.
The HAVING clause filters the results to include only those job categories with more than two tenants. */

-- Set operation (UNION, INTERSECT, EXCEPT):
SELECT lssn, name
FROM Landlords
WHERE lssn IN (
SELECT lssn FROM Property_Manages
WHERE postcode LIKE '%Leiden%')
UNION
SELECT tssn, name
FROM Tenants
WHERE cid IN (
SELECT cid FROM Contracts
WHERE postcode LIKE '%Leiden%');
/* Select the landlords who own properties in Leiden and tenants who live in Leiden */

-- Nested query or correlation
SELECT paddress, rent
FROM Property_Manages
WHERE rent > (
    SELECT AVG(rent) 
    FROM Property_Manages
);
/* This query retrieves the address and rents of properties where the rent is higher than the average rent of all properties. */

-- Aggregation (MAX, AVG, SUM, COUNT)
SELECT 
    MAX(rent) AS max_rent,
    MIN(rent) AS min_rent,
    AVG(rent) AS avg_rent,
    SUM(rent) AS total_rent 
FROM Property_Manages;
/* This query retrieves the maximum, minimum, average, and total rent of all properties. */

-- Query over multiple tables (JOIN)
SELECT Landlords.name, Property_Manages.paddress
FROM Landlords
JOIN Property_Manages ON Landlords.lssn = Property_Manages.lssn;
/* This command will retrieve the names of landlords
with addresses of thir properties where the lssn matches between the two tables. */

-- LIKE (string matching)
SELECT lssn, name
FROM Landlords
WHERE lssn IN (
SELECT lssn FROM EmergencyContacts E
WHERE E.ename LIKE 'E%');
/* Select lssn and name of landlords who have an emergency contact that has a name that starts with E. */


-- First challenging query
SELECT l.name, AVG(pm.rent) AS average_rent
FROM Landlords l
JOIN Property_Manages pm ON l.lssn = pm.lssn
GROUP BY l.name;
/*This query will help identify the landlords who manages properties with the highest average rent,
which can help us find lucrative property management opportunities.*/

-- Second challenging query
SELECT tssn, name
FROM Tenants
WHERE cid IN 
(SELECT cid FROM Property_Manages
WHERE (paddress, postcode) IN 
(SELECT paddress, postcode 
FROM Flats
WHERE own_kitchen = TRUE));
/* Select ssn and names of tenants who live in flats with their own kitchen. */
