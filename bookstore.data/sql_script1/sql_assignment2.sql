create table Bank_Branch1
(
Branch_Id int primary key identity,
Branch_Name varchar(40),
Branch_IFSC_CODE int,
Branch_Address varchar(40),
Branch_Manager varchar(40)
)


create table Bank_customer1
(
Bank_Customer_id int primary key identity,
Bank_Customer_Name varchar(40),
Bank_Customer_ACNO int,
Bank_Customer_Adress varchar(40),
Bank_Branch int foreign key REFERENCES Bank_Branch (Branch_Id)
)
select * from Bank_Branch1
select * from Bank_customer1


alter procedure Sp_one_data_insert1
(
@Branch_Name varchar(40),
@Branch_IFSC_CODE int,
@Branch_Address varchar(40),
@Branch_Manager varchar(40),

@Bank_Customer_Name varchar(40),
@Bank_Customer_ACNO int,
@Bank_Customer_Address varchar(40)
)
as
begin
insert into Bank_Branch1(Branch_Name,Branch_IFSC_CODE,Branch_Address,Branch_Manager) 
values(@Branch_Name,@Branch_IFSC_CODE,@Branch_Address,@Branch_Manager)
declare @id int
select @id=SCOPE_IDENTITY()
insert into Bank_customer1(Bank_Customer_Name,Bank_Customer_ACNO,Bank_Customer_Adress,Bank_Branch)
values (@Bank_Customer_Name,@Bank_Customer_ACNO,@Bank_Customer_Address,@id)
end
exec Sp_one_data_insert1 'sbi',123,'marathalli','gyana','umesh',123456,'odisha'


create procedure Spfetchalldata1
(
@id varchar(10)
)
as
begin
 if(isnull(@id,'') != '')
 begin
select b.Bank_Customer_Id,b.Bank_Customer_Name,b.Bank_Customer_ACNO,b.Bank_Customer_Adress,b1.Branch_Name,
b1.Branch_IFSC_CODE,b1.Branch_Address,b1.Branch_Manager 
from Bank_customer1 b join Bank_Branch1 b1
on b.Bank_Branch=b1.Branch_Id
and b.Bank_Customer_id=@id
end
else
begin 
select b.Bank_Customer_Id,b.Bank_Customer_Name,b.Bank_Customer_ACNO,b.Bank_Customer_Adress,b1.Branch_Name,
b1.Branch_IFSC_CODE,b1.Branch_Address,b1.Branch_Manager 
from Bank_customer1 b join Bank_Branch1 b1
on b.Bank_Branch=b1.Branch_Id
 end
end
exec Spfetchalldata1 ''