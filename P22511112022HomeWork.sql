--Company database-i yaradin(istənilən ad vəre bilərsiz db-ye).
Create Database CompanyP228
USE CompanyP228
--Employees table-i olsun. Employees  -in Name, SurName, Position, Salary Column-lari olsun. 
Create Table Employees (
Id int identity primary key,
Name nvarchar(100),
SurName nvarchar(100),
Position nvarchar(100),
Salary money
)
Insert Into  Employees Values 
('Irade','Feyzullayeva','VICE PRESIDENT',200000000000),
('Sema','Mailova','CEO',1900000000000),
('Madina','Novruzova','Direktor',1800000000000)

--Aşağıdakı query-ləri yazmalısınız:

--1.Ortalama maaşı çıxarmalısınız
Select AVG(Salary)  FROM Employees
--2.Ortalama maaşdan yuxarı maaş alan işçilərin ad soyadını və maaşını yazdırmalısız
Select NAME,SurName,Salary FROM Employees WHERE Salary > ( Select AVG(Salary) From Employees )
--3.Max, Min maaşları çıxarmalı
Select MIN(Salary) From Employees
Select Max(Salary) From Employees

------------------------------------------------

--Market adli Database yaradin

Create Database TechnoStore

Use TechnoStore
 
--Icinde Products Table-i yaradin.Product table-inda Id,Name,Price columnlari olsun

Create Table Products(
	Id int identity primary key,
	Name nvarchar(100) not null,
	Price decimal(16,3)
)


--Products table-na yeni bir Brand columnu elave edin

Alter Table Products Add Brand nvarchar(100)

--Products table-a value-lar insert edin (10-15 dene product datasi kifayetdir)

Insert Into Products Values
('14 Pro',3599,'Apple'),
('14 Pro Max',3999,'Apple'),
('S21 ',2999,'Samsung'),
('Poco M3',399,'Xiami'),
('Mate 20Pro',1599,'Huawei')




 
--Qiymeti Productlarin price-larinin average-den kicik olan Products datalarinin siyahisini getiren query yazin

Select * From Products Where Price < (Select AVG(Price) From Products)

--Qiymeti 10-dan yuxari olan Product datalarinin siyahisini getiren query yazin

Select * From Products Where Price >550

--Brand uzunlugu 5-den boyuk olan Productlarin siyahisini getiren query.Gelen datalarda Mehsulun adi ve Brand adi 1 columnda gorsensin ve Column adi ProductInfo olsun (dersdeki name ve surname-i fullname kimi gostermeye uygun)

Select (Name + Brand) ProductInfo From Products Where Len(Brand) > 5

----------------------------------------------------------------------

--Employees (Id,FullName,Salary,DepartmentId, Email) ve Departments(Id, Name) 
--table-lariniz olsun ve aralarinda one to many bir relation qurun.

-- - Employee Salary- 0 -dan kicik ola bilmez
-- - Employee FullName - NULL OLA BILMEZ ,  uzunlugu 3-den boyuk olmaldir
-- - Department Name - uzunlugu 2-den boyuk olamlidir, null ola bilmez
-- - Email Null Ola Bilmez Ve Tekrar Olunmasin

Create database CompaniesP228
Use CompaniesP228
Create table Departments
(
  Id int identity primary key,
  Name nvarchar(200) Constraint NN_Departments_Name Not Null
)
Create Table Employees
(
 Id int identity primary key,
 Fullname nvarchar(250),
 Salary decimal(20,2),
 Email nvarchar(300),
 DepartmentId int not null foreign key references Departments(Id)
)

Alter Table Employees Add Check(Salary>0)
Alter Table Employees Add Check(Len(Fullname)>3)


Alter table Departments Add check(len(Name)>2)
Alter table Employees Add unique(Email) 