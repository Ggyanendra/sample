create database cosmonet
use cosmonet
create table Bank_Branch
(
Branch_Id int primary key,
Branch_Name varchar(40),
Branch_IFSC_CODE int,
Branch_Address varchar(40),
Branch_Manager varchar(40)
)

create table Bank_customer
(
Bank_Customer_id int primary key,
Bank_Customer_Name varchar(40),
Bank_Customer_ACNO int,
Bank_Customer_Adress varchar(40),
Bank_Branch int foreign key REFERENCES Bank_Branch (Branch_Id)
)
select * from Bank_Branch
select * from Bank_customer

create procedure Sp_Bank_Branch
(
@Branch_Id int,
@Branch_Name varchar(40),
@Branch_IFSC_CODE int,
@Branch_Address varchar(40),
@Branch_Manager varchar(40)
)
as
begin
insert into Bank_Branch (Branch_Id,Branch_Name,Branch_IFSC_CODE,Branch_Address,Branch_Manager) values(@Branch_Id,@Branch_Name,@Branch_IFSC_CODE,@Branch_Address,@Branch_Manager)
end
exec Sp_Bank_Branch 1,'SBI',0033,'MARATHALI','MOHAN'
exec Sp_Bank_Branch 2,'HDFC',0043,'BTM','UMESH'
exec Sp_Bank_Branch 3,'ICICI',0053,'SILK BOARD','BUBU'
exec Sp_Bank_Branch 4,'AXIS',0063,'KRPURAM','AQIB'
exec Sp_Bank_Branch 5,'INDIAN BANK',0073,'ELECTRONIC CITY','SUNIL'


create procedure sp_Bank_customer
(
@Bank_Customer_id int,
@Bank_Customer_Name varchar(40),
@Bank_Customer_ACNO int,
@Bank_Customer_Adress varchar(40),
@Bank_Branch int 
)
as
begin
 insert into Bank_customer (Bank_Customer_id,Bank_Customer_Name,Bank_Customer_ACNO,Bank_Customer_Adress,Bank_Branch) values (@Bank_Customer_id,@Bank_Customer_Name,@Bank_Customer_ACNO,@Bank_Customer_Adress,@Bank_Branch)
end

exec sp_Bank_customer 1,'GYANA',123456,'ODISHA',2
exec sp_Bank_customer 2,'GOVIND',123457,'HYDRABAD',3
exec sp_Bank_customer 3,'SWAPNALI',123458,'MUMBAI',1
exec sp_Bank_customer 4,'PAVAN',123459,'KARNATAK',4
exec sp_Bank_customer 5,'SOUMYA',123460,'KARNATAK',5


alter procedure Spfetchalldata
(
@id varchar(10)
)
as
begin
 if(isnull(@id,'') != '')
 begin
select b.Bank_Customer_Id,b.Bank_Customer_Name,b.Bank_Customer_ACNO,b.Bank_Customer_Adress,b1.Branch_Name,
b1.Branch_IFSC_CODE,b1.Branch_Address,b1.Branch_Manager 
from Bank_customer b join Bank_Branch b1
on b.Bank_Branch=b1.Branch_Id
and b.Bank_Customer_id=@id
end
else
begin 
select b.Bank_Customer_Id,b.Bank_Customer_Name,b.Bank_Customer_ACNO,b.Bank_Customer_Adress,b1.Branch_Name,
b1.Branch_IFSC_CODE,b1.Branch_Address,b1.Branch_Manager 
from Bank_customer b join Bank_Branch b1
on b.Bank_Branch=b1.Branch_Id
 end
end
exec Spfetchalldata ''