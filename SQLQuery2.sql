select * 
from HumanResources.Employee;

-- Restriction
select *
from HumanResources.Employee
where Gender = 'M';

select BusinessEntityID, JobTitle , BirthDate
from HumanResources.Employee
where Gender='M' and MaritalStatus='M';

-- gender = m or Jobtitle='Stocker'
select *
from HumanResources.Employee
where Gender='M' or JobTitle='Stocker';

select *
from HumanResources.Employee
where VacationHours>=50 and VacationHours<=80;

-- between operator
select  *
from HumanResources.Employee
where VacationHours between 50 and 80;

-- Tool designer and stocker
select *
from HumanResources.Employee
where JobTitle ='Tool Designer' or JobTitle='Stocker' or 
JobTitle='Design Engineer';

select *
from HumanResources.Employee
where JobTitle in ('Tool Designer','Design Engineer','Stocker');

select *
from Sales.SalesOrderHeader
where PurchaseOrderNumber is not null;

-- Jobtitle begins with S
select *
from HumanResources.Employee
where JobTitle like 'S%';

-- Jobtitle ends with ion
select *
from HumanResources.Employee
where JobTitle like '%ion';

--Jobtitle containing cru(any position)
select *
from HumanResources.Employee
where JobTitle like '%cru%';

--Jobtitle begins with R ends with R
select *
from HumanResources.Employee
where JobTitle like 'R%' and JobTitle like '%r';

----- alternate
select *
from HumanResources.Employee
where JobTitle like 'R%r';

-- jobtitle first letter S , fifth letter k (2,3,4 and 6th onwards are missing)
select *
from HumanResources.Employee
where JobTitle like 'S___k%';

-- Jobtitle first letter begins with M - P
select *
from HumanResources.Employee
where JobTitle  like '[M-P]%';

--customize column headings - using alias name
select BusinessEntityID 'Employee Id', 
Gender, 
JobTitle as 'Designation',
'Leave taken'=VacationHours 
from HumanResources.Employee;


-- eliminate duplicate values
-- only unique jobtitles
select distinct JobTitle
from HumanResources.Employee;

--order by clause (In Ascending order) 
select BusinessEntityID, JobTitle,VacationHours 
from HumanResources.Employee
where VacationHours>=50 and VacationHours<=70
order by VacationHours;

--position number
select BusinessEntityID, JobTitle,VacationHours 
from HumanResources.Employee
where VacationHours>=50 and VacationHours<=70
order by 3;

--alias name
select BusinessEntityID, JobTitle,VacationHours 'vh'
from HumanResources.Employee
where VacationHours>=50 and VacationHours<=70
order by vh

-- Finctions
-- calculated columns - dervied columns

select sum(VacationHours) 'Total' , max(VacationHours) 'Maximum',
min(VacationHours) 'Minimum', count(*) '# of Records',
AVG(VacationHours) 'Average'
from HumanResources.Employee;

-- first three records
select top 3 *
from HumanResources.Employee;

-- top 3 highest vacation hours
select top 3 *
from HumanResources.Employee
order by VacationHours desc;

--top 3 highest rate value
select  top 3 *
from HumanResources.EmployeePayHistory
order by Rate desc;

-- including the same value as of last 6th value 
select  top 6 with ties  * 
from HumanResources.EmployeePayHistory
order by Rate desc;

select * 
from HumanResources.Employee
where JobTitle ='Tool Designer' and JobTitle='Design Engineer';


-- list operator  in   not in
select * 
from HumanResources.Employee
where JobTitle in ('Tool Designer','Design Engineer', 'Marketing Assistant',
'Marketing Manager')
order by JobTitle;

-- string based functions

select upper(left(JobTitle,1)) + 
lower(SUBSTRING(JobTitle,2,len(JobTitle))), 
JobTitle
from HumanResources.Employee;

select 'Pallavi'+Space(2)+'Malge';

--Retrieving records from a particular position
-- OFFset works only with order by clause
Select *
from HumanResources.Employee
order by BusinessEntityID
OFFset 15 Rows
Fetch Next 5 Rows only;

-- system date n time
select getdate();

-- Format  EmployeeId   Joining 
--HireDate Values in this format--- Feburary,2003
select BusinessEntityID,HireDate
from HumanResources.Employee;

Select BusinessEntityID,BirthDate,Gender,HireDate,
MONTH(HireDate), DATENAME(mm,HireDate) ,YEAR(HireDate)
from HumanResources.Employee;

Select  BusinessEntityID as EmployeeID,  
DATENAME(mm, Hiredate) + ','+CONVERT(varchar, Year(HireDate)) as Joining 
from HumanResources.Employee; 

Select BusinessEntityID,BirthDate,Gender,HireDate,
Concat(DATENAME(mm,HireDate),',',YEAR(HireDate))
from HumanResources.Employee;

select DB_ID('AdventureWorks2012')
select OBJECT_ID('HumanResources.Employee')
select HOST_ID();

select BusinessEntityID, HireDate , DATEDIFF(yy,HireDate,getdate()) 
'# of years'
from HumanResources.Employee;

select Rate, ROUND(Rate,2) 'Round',
Floor(Rate) 'smallest integer',
CEILING(Rate) 'Largest integer' 
from HumanResources.EmployeePayHistory;

--group by field.
select JobTitle, count(JobTitle)
from HumanResources.Employee
group by JobTitle;

select JobTitle, count(JobTitle)
from HumanResources.Employee
group by JobTitle;


select  PayFrequency , Sum(Rate)
from HumanResources.EmployeePayHistory
group by PayFrequency;

select  PayFrequency , Sum(Rate)				
from HumanResources.EmployeePayHistory			
where Rate>10							
group by PayFrequency;	














