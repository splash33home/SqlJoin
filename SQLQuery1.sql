--Write a SQL procedure to get a average of salary of employee from EMP_Table on the basis of the working hour
--and show it on a web page in a tabular form sorted on the basis of Average salary High to low.


--Solutions:

Create two table one table has Employee name,ID as primary key,Gender,DOB,Role,Basic_salary,phone_num,Email
 table two has Extra working hour+extra salary ..add Final salary.

 create table EmployeeBasic
 (
 EmpID int identity(1,1) primary key,
 EmpName varchar(100),
 EmpGender char,
 EmpAge tinyint,
 EmpDOB date,
 EmpRole varchar(50),
 Salary int,
 Phonenum varchar(50),
 Email varchar(50)
 )
 create procedure spinsertEmployeeBasic
 (
 @EmpName varchar(100),
 @EmpGender char,
 @EmpAge tinyint,
 @EmpDOB date,
 @EmpRole varchar(50),
 @Salary int,
 @Phonenum varchar(50),
 @Email varchar(50)
 )
 as
 begin 
 insert into EmployeeBasic(
 EmpName ,
 EmpGender ,
 EmpAge ,
 EmpDOB ,
 EmpRole ,
 Salary ,
 Phonenum ,
 Email)
 values(
 @EmpName ,
 @EmpGender ,
 @EmpAge ,
 @EmpDOB ,
 @EmpRole ,
 @Salary ,
 @Phonenum ,
 @Email )
 End

 ----
--pass the values inside the table
Exec spinsertEmployeeBasic  @EmpName ='lakshmikala',
 @EmpGender='F' ,
 @EmpAge=36,
 @EmpDOB ='1984-06-24',
 @EmpRole ='developer',
 @Salary =35000,
 @Phonenum ='9148719143',
 @Email='vimalaxmi1@gmail.com'
 
 Exec spinsertEmployeeBasic  @EmpName ='Vimaldass',
 @EmpGender='M' ,
 @EmpAge=36,
 @EmpDOB ='1977-04-22',
 @EmpRole ='ProgramManager',
 @Salary =95000,
 @Phonenum ='9845680870',
 @Email='vimal-dass@hotmail.com' 

 Exec spinsertEmployeeBasic  @EmpName ='Diksha',
 @EmpGender='F' ,
 @EmpAge=26,
 @EmpDOB ='1995-06-22',
 @EmpRole ='web developer',
 @Salary =33000,
 @Phonenum ='9148712505',
 @Email='diksha-dass@gmail.com' 

 Exec spinsertEmployeeBasic  @EmpName ='kevin',
 @EmpGender='M' ,
 @EmpAge=22,
 @EmpDOB ='1991-01-13',
 @EmpRole ='Tester',
 @Salary =45000,
 @Phonenum ='9142341430',
 @Email='kevin.dass@gmail.com' 

 Exec spinsertEmployeeBasic  @EmpName ='Jeyavarthini',
 @EmpGender='F' ,
 @EmpAge=40,
 @EmpDOB ='1981-06-24',
 @EmpRole ='lead developer',
 @Salary =55000,
 @Phonenum ='91487191000',
 @Email='Jeyavarthini@gmail.com' 



select * from EmployeeBasic
 select * from Extrawork

--create table using foreign key
create table Extrawork
(
ExtraEmpId int foreign key references EmployeeBasic(EmpID),
Extrahour tinyint,
Salaryperhour tinyint,
)
----change column datatype
alter table ExtraWork
alter column Salaryperhour int
--------Alter procedure by changing column datatype
alter procedure spinsertExtrawork
(
@ExtraEmpId int,
@Extrahour tinyint,
@Salaryperhour int
)
as
begin 
insert into Extrawork(ExtraEmpId ,Extrahour ,Salaryperhour)
values(@ExtraEmpId,@Extrahour,@Salaryperhour)
end

Exec  spinsertExtrawork @ExtraEmpId=1,@Extrahour=40,@Salaryperhour=3000
Exec  spinsertExtrawork @ExtraEmpId=2,@Extrahour=60,@Salaryperhour=4000
Exec  spinsertExtrawork @ExtraEmpId=4,@Extrahour=40,@Salaryperhour=2000


 

--join two tables and combine values list all values along with whole salary part

select EmpName ,
 EmpGender ,
 EmpAge ,
 EmpDOB ,
 EmpRole ,
 Salary ,
 Phonenum ,
 Email,ExtraEmpId ,Extrahour ,Salaryperhour, (Extrahour * Salaryperhour) as ExtraSalary,(Extrahour * Salaryperhour) +Salary as Final_salary  from EmployeeBasic  inner join Extrawork
 on Extrawork.ExtraEmpId=EmployeeBasic.EmpID
