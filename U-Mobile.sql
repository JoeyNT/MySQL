CREATE SCHEMA IF NOT EXISTS U_Mobile;

USE U_Mobile;

CREATE TABLE Account
    (
     AccountNo 		INT   		NOT NULL, 
     Name 		VARCHAR(15)    NOT NULL,
    AccountSince 		INT,
    BillingStreet 		VARCHAR(15),
    BillingCity		VARCHAR(15),
    BillingState		VARCHAR(2),
    BillingZip		INT 		NOT NULL,

       CONSTRAINT Account_PK PRIMARY KEY (AccountNo),
   ); 

INSERT INTO Account (AccountNo, Name, AccountSince, BillingStreet, BillingCity, BillingState, BillingZip)
VALUES
(778294, ‘John Smith’, 2012,  ‘789 Oak St’, ‘Sonoma’, 12345),
(219912, ‘Allison Moore’, 2009, ‘456 Elm St’, ‘San Francisco’, 56789),
(673354, ‘Joe Taylor’, 2017, ‘123 Main St’, San Bruno, 98765);

CREATE TABLE Customer
    (
      CustomerID 	INT   NOT NULL,
      AccountNo    INT    NOT NULL
      Name 	VARCHAR(20), 
      Address	VARCHAR(50), 
      Email 	VARCHAR(20),

       CONSTRAINT Cust_PK PRIMARY KEY (CustomerID)
       CONSTRAINT Customer_FK FOREIGN KEY(AccountNo) REFERENCES Account(AccountNo)
   ); 

INSERT INTO Customer (CustomerID, Name, Address, Email, AccountNo)
VALUES 
(2356, ‘John Smith’, ‘123 Francisco Way’, ‘jsmith@gmail.com’,778294),
(4567, ‘Allison Moore’, ‘442 Charter Ln’, ‘amoore@yahoo.com’,219912),
(6859, ‘Joe Taylor’, ‘5539 Sadowa Ct’, ‘jtaylor@hotmail.com’,673354);
	  
CREATE TABLE Device
    (
      IMEI 	VARCHAR(15)  NOT NULL,
     CustomerID 	INT   NOT NULL,
     Manufacturer 	VARCHAR(15),
     eSIM 	VARCHAR(25), 
     SIM		VARCHAR(25),

       CONSTRAINT Device_PK PRIMARY KEY (IMEI),
       CONSTRAINT Device_FK FOREIGN KEY(CustomerID) REFERENCES Customer (CustomerID)
   );    

INSERT INTO Device (IMEI, CustomerID, Manufacturer, eSIM, SIM)
VALUES
(‘479503849411123’, 2356, ‘Apple’, ‘479503844657830’, NULL),
(‘129305786940322’, 4567, ‘Samsung’, NULL, ‘129305787810093’),
(‘745960385628591’, 6859, ‘Apple’, ‘745960385628591’, NULL),
('745960381122456', 2356, 'Motorola', NULL, '745960381122456'),
('129305783345196', 4567, 'LG', NULL, '129305783345196'),
('479503845748294', 6859, 'Samsung', '479503845748294', NULL);

CREATE TABLE eSimType
    (
      NPSIM 		VARCHAR(15)   NOT NULL, 
     RegisterOnline 	VARCHAR(1)	CHECK (RegisterOnline IN (‘Y’),

       CONSTRAINT Device_PK PRIMARY KEY (NPSIM),
       CONSTRAINT Device_FK FOREIGN KEY(NPSIM) REFERENCES Device (IMEI),
);

INSERT INTO eSimType (NPSIM, RegisterOnline)
VALUES
(‘479503849411123’, ’Y’),
('745960385628591', 'Y'),
('479503845748294', 'Y');

CREATE TABLE SimType
    (
     PSIM 		VARCHAR(15), 
     RegisterOnline 	VARCHAR(1)	CHECK (RegisterOnline IN (’N’),

       CONSTRAINT Device_PK PRIMARY KEY (PSIM),
       CONSTRAINT Device_FK FOREIGN KEY(PSIM) REFERENCES Device (IMEI),
    ); 

INSERT INTO SimType (PSIM,RegisterOnline)
VALUES
('129305786940322', 'N'),
( '745960381122456', 'N'),
('129305783345196', 'N');

CREATE TABLE Line
  (
    IMEI	 		VARCHAR(15)      NOT NULL,
    PlanID  		INT      NOT NULL, 
    LineActiveDate	DATE   NOT NULL, 

       CONSTRAINT Line_PK PRIMARY KEY (PlanID, IMEI),
       CONSTRAINT Line_FK FOREIGN KEY(PlanID) REFERENCES Plan (PlanID),
       CONSTRAINT Line_FK FOREIGN KEY(IMEI) REFERENCES Device (IMEI)
   ); 
INSERT INTO Line (IMEI, PlanID, LineActiveDate)
VALUES
('479503849411123', 472, '2012-03-12'),
('129305783345196', 003, '2012-02-04'),
('129305786940322', 003, '2009-10-06'),
('745960381122456', 278, '2020-08-19'),
('745960385628591', 278, '2017-06-27'),
('479503845748294', 278, '2018-05-12');

CREATE TABLE Plan
    (
     PlanID 		INT   NOT NULL, 
     AccountNo 		INT   NOT NULL,
     PlanType 		VARCHAR(15),
     PlanPrice 		DECIMAL(2), 
     PlanStartDate		DATE   NOT NULL

       CONSTRAINT Plan_PK PRIMARY KEY (PlanID),
       CONSTRAINT Plan_FK FOREIGN KEY(AccountNo) REFERENCES Account (AccountNo),
   ); 

INSERT INTO Plan (PlanID, AccountNo, PlanType, PlanPrice, PlanStartDate)
VALUES
(472, 778294, ‘Basic’, 79.99, 2012-03-12),
(003, 219912, ‘Extra’, 99.99, 2010-01-01),
(278, 673354, ‘Premium’, 119.99, 2017-09-01);

CREATE TABLE Invoice
    (
      InvoiceID 		INT   NOT NULL, 
     AccountNo 		INT   NOT NULL,
     BillingAmount 	DECIMAL(2),
     MinPaymentDue	DECIMAL(2), 
     TotalAccntBalance	DECIMAL(2), 

       CONSTRAINT Invoice_PK PRIMARY KEY (InvoiceID),
       CONSTRAINT Invoice_FK FOREIGN KEY(AccountNo) REFERENCES Account (AccountNo),
   ); 

INSERT INTO INVOICE(InvoiceID, AccountNo, BillingAmount, MinPaymentDue, TotalAccntBalance)
VALUES
(14780976 , 778294, 200.50 ,100,1000),
(47370448, 219912, 300.75, 300, 500),
(1859065,673354,500.75 ,250, 2000);







CREATE TABLE Payment
    (
      PaymentID 		INT   NOT NULL, 
      InvoiceID 		INT   NOT NULL,
      PaymentAmount 	DECIMAL(2),
      PaymentType		VARCHAR(10),  

       CONSTRAINT Payment_PK PRIMARY KEY (PaymentID),
       CONSTRAINT Payment_FK FOREIGN KEY(InvoiceID) REFERENCES Invoice (InvoiceID),
   ); 

INSERT INTO Payment(PaymentID, InvoiceID, PaymentAmount, PaymentType)
VALUES
(22861, 14780976, 150, 'CreditCard'),
(75925, 47370448, 175, 'MailCheck'),
(11107, 1859065, 250, 'PayPal');

CREATE TABLE AutoType
    (
     AutoPayID 		INT   NOT NULL, 
     CreditCardOnFile 	VARCHAR(50),

       CONSTRAINT Payment_PK PRIMARY KEY (AutoPayID),
       CONSTRAINT Payment_FK FOREIGN KEY(AutoPayID) REFERENCES Payment (PaymentID),
   ); 

INSERT INTO AutoType (AutoPayID, CreditCardOnFile)
VALUES
(22861, ‘2345-1029-8593-1938’),
(75925, ‘4756-1029-8478-9982’),
(11107, ‘6628-9984-1829-3744’);
