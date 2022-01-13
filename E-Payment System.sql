  CREATE DATABASE E_Payment_System;
  use E_Payment_System;


create table Account_Type
  (
  Account_Type_Code int  primary key,
 Account_Type_Description VARCHAR(10) NOT NULL CHECK (Account_Type_Description IN('Current', 'Special'))
  );
  select * from  Account_Type;
  insert into  Account_Type values (12344,'Current')



create table Customer
  (
  Customer_ID int  primary key,
  Customer_Name varchar(50) not null,
  Customer_Address varchar(50) not null default 'Nepal',
  Customer_Phone varchar(10) not null unique,
  Customer_DOB datetime
  );
  insert into  Customer values (13744,'Current','','9819892773',2055-09-11);



create table Network_provider
  (
  Network_provider_ID int  primary key,
  Network_provider_Name varchar(50) not null,
  Network_provider_Phone varchar(10) not null unique,
  );
  insert into  Network_provider values (144,'Namaste','98198923');


  create table Account
  (
  Account_ID int  primary key,
  Account_Type_Code int not null,
  Account_Name varchar(20) not null,
  Phone_Number varchar(20),
  Current_Balance float(10) not null,
  FOREIGN KEY (Account_Type_Code) REFERENCES Account_Type(Account_Type_Code)
  );
  insert into  Account values (1484,12344,'Bishal',982262626,98198.09);


   create table Cell_phone
  (
  Phone_Number int  primary key,
  Customer_ID int not null,
  Network_provider_ID int not null,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  FOREIGN KEY (Network_provider_ID) REFERENCES Network_provider(Network_provider_ID)
  );
  insert into  Cell_phone values (982262626,13744,144);


  create table Transactions_Type
  (
  Transactions_Type_Code int  primary key,
  Transactions_Type_Description VARCHAR(10) NOT NULL CHECK (Transactions_Type_Description IN('Refund', 'Payment','Adjustment'))
  );
  insert into  Transactions_Type values (982,'Refund');




  create table Retail_Outlets
  (
  Retail_Outlets_ID int  primary key,
  Retail_Outlets_Code int  unique,
  Retail_Outlets_Name varchar(50) not null,
  Retail_Outlets_Description varchar(255) not null
  );
  insert into  Retail_Outlets values (92,23,'ABC','ABC is a type a....');


  create table Payment_Method
  ( 
Payment_Method_Code int  primary key,
Payment_Method_Name varchar(50) not null,
Payment_Method_Description varchar(255) not null
  );
  insert into  Payment_Method values (192,'XYZ','XYZ is a type a....');



    create table Transactions
  (
  Transactions_ID int  primary key,
  Payment_Method_Code int not null,
  Retail_Outlets_ID int not null,
  Phone_Number int  not null,
  Transactions_Type_Code int not null,
  FOREIGN KEY (Payment_Method_Code) REFERENCES Payment_Method(Payment_Method_Code),
  FOREIGN KEY (Retail_Outlets_ID) REFERENCES Retail_Outlets(Retail_Outlets_ID),
  FOREIGN KEY (Phone_Number) REFERENCES Cell_phone(Phone_Number),
  FOREIGN KEY (Transactions_Type_Code) REFERENCES Transactions_Type(Transactions_Type_Code)
  );
  insert into  Transactions values (2345,192,92,982262626,982);