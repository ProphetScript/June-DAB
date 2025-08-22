
--Aliasing Table Exploratory
SELECT McCullough as Mc


--Verifying number of Rows per Column Exploratory
Select
	count(Job_Title),
	count(Job_category),
	count(Job_Description),
	count(Salary_Minimun_),
	count(Salary_Maxium),
	count(Rating),
	count(Company_Name),
	count(Location_Town),
	count(Location_State),
	count(Headquarters),
	count("Size"),
	count(Type_of_ownership),
	count(Industry),
	count(Sector),
	count(Revenue),
	count(python),
	count(excel),
	count(hadoop),
	count(spark),
	count(aws),
	count(tableau),
	count(big_data)
from McCullough
--All rows present

--Deleting extraneous Columns Exploratory
ALTER TABLE McCullough DROP COLUMN Column24; 
ALTER TABLE McCullough DROP COLUMN Column25;
ALTER TABLE McCullough DROP COLUMN Column26;

--Basic Query 1 Business
--Be below query gives insight into job satisfaction or company rating on average by sector giving insight into job satisfaction or potential company performance by sector Business
SELECT 
	mc.Sector, 
	AVG(Rating) 
from McCullough mc 
group by mc.Sector
order by AVG(Rating) DESC 

--Basic Query 2 Business
--This query gives us insight as to what sector is the most popular or in demand within each state from which one could discern what sector they would like to seek a career in based off of region
--The table is arranged from descending order in regards to job openings That is available per state. Theoretically this shows the field that is in the most demand. Business
Select 
	Location_State,
	Count(Sector) As SectorCount,
	Sector
From McCullough
group by 
	Location_State, 
	Sector 
Order by 
	Location_State Asc;
	Count(Sector) Desc
	
	
--Basic Query 3 Business
	--This query gives us insight as to what sector is the most popular in each type of company whether it's private public government or nonprofit. This could give actionable insight as to what to expect when pursuing a particular industry.
	--Type of ownership is arranged from ascending to descending order showing the highest amount of job openings per sector first.
	SELECT
	type_of_ownership,
	Count(Sector) AS SectorCount,
	Sector
FROM
	McCullough
GROUP BY
	type_of_ownership,
	Sector
ORDER BY
	type_of_ownership ASC,
	Count(Sector) DESC;

--Advanced Query 1 Business
--Gives insight into Each job listings being ranked in 5 echelons 
SELECT
    Job_Title,
    Salary_Maxium,
    NTILE(5) OVER (ORDER BY Salary_Maxium) AS SalaryBandRank
FROM
    McCullough;

--Advanced Query 2 Business
SELECT
    Industry,
    Sector,
    (Sum(Salary_Maxium)/COUNT(Salary_Maxium)) as SalaryAverage
FROM
    McCullough
GROUP BY
    Industry, Sector


--Advanced Query 3 Business
SELECT
    Location_State,
    MIN(Salary_Minimun_) AS MinSalary,
    MAX(Salary_Maxium) AS MaxSalary
FROM
    McCullough
GROUP BY
    Location_State
