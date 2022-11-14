Create Database P228Join

use P228Join

Create Table Categories
(
	Id int identity primary key,
	Name nvarchar(255) not null unique
)

Insert Into Categories
Values
('Apple'),
('Samsung'),
('Nokia')

Create Table Products 
(
	Id int identity primary key,
	Name nvarchar(255) not null,
	Price money,
	CategoryId int foreign key References Categories(Id)
)

Insert Into Products
Values
('14',2599,1),
('14 Pro',2999,1),
('14 Max',3599,1),
('S4',699,2),
('S21',3999,2),
('N73',999,3),
('N95',1299,3)

Create Table Brand
(
	Id int identity primary key,
	Name nvarchar(255) not null unique
)

Insert Into Brand
Values
('Brand-1'),
('Brand-2'),
('Brand-3')


--Joins
--Inner Join (Join)
Select * From Products Inner Join Categories on Products.CategoryId = Categories.Id

Select p.Name 'Product Name',Price,c.Name 'Category Name' From Products p
Inner Join Categories c
on p.CategoryId = c.Id
Where Price > 1500

Select p.Name 'Product Name',Price,c.Name 'Category Name',b.Name 'Brand Name' From Products p
Join Categories c
on p.CategoryId = c.Id
Join Brand b
on p.Id = b.Id
Where Price > 1500

Select p.Name 'Product Name',Price,c.Name 'Category Name',b.Name 'Brand Name' From Products p
Join Categories c
on p.CategoryId = c.Id
Join Brand b
on c.Id = b.Id
Where Price > 1500

Select p.Name 'Product Name',Price, b.Name 'Brand Name' From Products p
Join Brand b
on p.Name = b.Name

--Left Outer Join (Left Join)
Select * From Categories Left Outer Join Products on Products.CategoryId = Categories.Id

Select * From Categories 
Left Join Products 
on Products.CategoryId = Categories.Id

--Rght Outer Join (Right Join)
Select * From Categories Right Outer Join Products on Products.CategoryId = Categories.Id

Select * From Categories 
Right Join Products 
on Products.CategoryId = Categories.Id

--Full Outer Join (Full Join)
Select * From Categories Full Outer Join Products on Products.CategoryId = Categories.Id

Select ISNULL(p.Name,'Ad Yoxdu') From Categories 
Full Join Products p
on p.CategoryId = Categories.Id

Alter Table Categories Add ParentId int Foreign Key References Categories(Id)

--Self Join
Select c1.Name  CategoryName, c2.Name ParentName From Categories c1
left join Categories c2
on c1.ParentId = c2.Id


use P228SqlConstraint

--Non Equal Join
Create Table GradeIntervals
(
	Id int identity primary key,
	Name nvarchar(255),
	Min int,
	Max int,
)

Select gi.Name,Count(*) From Students s
join GradeIntervals gi
on s.Grade Between gi.Min And gi.Max
Group By gi.Name Having COUNT(*) > 2

Create Table Sizes
(
	Id int identity primary key,
	Name nvarchar(255)
)

Create Table Products
(
	Id int identity primary key,
	Name nvarchar(255)
)

Select * From Products
cross join Sizes