<h1 align="center"> MySQL Managing Enterprise Data ISYS 464</h1>

<h1 align="center">U-Mobile </h1>
<h3 align="center">Telecommunications (Phone Service Provider)</h3>

- Currently with phone services customers aren’t able to add a line without rigorous in-person identification verification. U-mobile allows for online identification verification of existing plans. Now existing members can now add members to their plan online if they have an e-SIM. 
- We chose this organization to allow ease for customers to add lines to existing phone plans without having to undergo long wait times and a service break

<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <h2>Entity-Attribute Chart</h2>
    <table>
        <tr>
            <th>Entity</th>
            <th>Attributes</th>
        </tr>
        <tr>
            <td>Customer</td>
            <td>CustomerID, Name, Address, Email, Phone</td>
        </tr>
        <tr>
            <td>Device</td>
            <td>IMEI, Manufacturer, SIMType (eSIM?, SIM?)</td>
        </tr>
        <tr>
            <td>Account</td>
            <td>AccountNo, Name, BillingAddress (Street, City, Zip, State), AccountSince</td>
        </tr>
        <tr>
            <td>Invoice</td>
            <td>InvoiceID, BillingAmount, MinPaymentDue, TotalAcctBalance</td>
        </tr>
        <tr>
            <td>Payment</td>
            <td>PaymentID, PaymentAmount, PaymentType (AutoPayment, ManualPayment)</td>
        </tr>
        <tr>
            <td>Line</td>
            <td>IMEI, LineActiveDate</td>
        </tr>
        <tr>
            <td>Plan</td>
            <td>PlanID, PlanType, PlanPrice, PlanStartDate</td>
        </tr>
    </table>
</body>
</html>

<h3 align="left">ENTITY & ATTRIBUTE DESCRIPTIONS</h3>
<h4 align="left">ENTITIES:
</h4>
<p align="left">Consumer: Any physical person requiring the service 

Device: Phone device or any device requiring a data connection

Account: Already Existing Lifetime account, directly connected to the consumer's main owner

Invoice: Payment request sent to the account owner 

Payment: The actual amount paid by the consumer (the actual transaction)

Line: Single data line per device

Plan: Collection of lines and type of promotion, or deal the consumer is locked into :
</p>
<h4 align="left">ATTRIBUTES:
</h4>
<p align="left">Customer<br> 
Customer: 13-digit Identification Number of Individual Person in System.<br> 
Phone Number: 10-Digit Number<br> 

Account<br>
Account ID: 8 Digit Identification of Account<br> 
IMEI: International Mobile Equipment Identity: ID of SIM in Device.<br> 
Billing Address: Address Invoices are sent to.<br> 
AccountSince: Account Creation Date<br> 

Invoice<br>
Billing Amount: Amount Added for Last Month onto the Account Balance<br> 
Account Balance: Total Amount Due on Account<br> 
Minimum Payment: Minimum Amount of Payment Amount due to keeping the Account Active.<br> 

Device<br>
IMEI: International Mobile Equipment Identity: ID of SIM in Device.<br> 
Manufacturer: Maker of the Phone(Apple, Samsung, LG, HTC, Nokia, etc..) <br> 

Payment<br>
PaymentID: 9 Digit Unique VARCHAR.<br> 
Payment Amount: Must be >= Minimum Amount on Invoice.<br> 

Line<br> 
Line ID: 7 VARCHAR that identifies the Line of a Cellular Connection.<br> 
LineActiveDate: Date Line was initially activated<br> 

Plan<br>
PlanID: Unique 13 VARCHAR that identifies an account plan.<br> 
PlanType: Type of Plan (Single or Family)<br> 
Plan Price: Monthly Cost of Plan<br> 
Plan Start: Date account enrolled into the plan<br> 
Plan Duration: Derived by subtracting the current date from Plan Start<br> 
</p>

<body>
    <h2>Business Rules</h2>
    <ol>
        <li>Each Customer must have at least one device.</li>
        <li>A device must belong to only one customer.</li>
        <li>Each device must have at least one line, but can also have many lines.</li>
        <li>Each line must have only one device.</li>
        <li>Each Plan must have many lines but must have at least one line.</li>
        <li>Each Line must have only one plan.</li>
        <li>Each Account must have only one plan.</li>
        <li>Each plan must have only one account.</li>
        <li>Each account must have many invoices.</li>
        <li>Each invoice must have only one account.</li>
        <li>Each invoice must have only one means of payment.</li>
        <li>Each Payment must have many invoices.</li>
        <li>A device may be an eSim device and have a physical SIM at the same time.</li>
        <li>A payment method may be an autopay method.</li>
    </ol>

<h2><a href="https://github.com/JoeyNT/MySQL/blob/main/Entry%20Relationship%20Diagram%20ERD%20.jpg">Entry Relationship Diagram</a></h2> 
<img src="https://github.com/JoeyNT/MySQL/blob/main/Entry%20Relationship%20Diagram%20ERD%20.jpg" >
<h2><a href="https://github.com/JoeyNT/MySQL/blob/main/Relation%20Model%203NF%20.jpg">Relation Model 3NF</a></h2>
<img src="https://github.com/JoeyNT/MySQL/blob/main/Relation%20Model%203NF%20.jpg" >
<h2><a href="https://github.com/JoeyNT/MySQL/blob/main/U-Mobile.sql">Tables Creation & Data Entry</a></h2> 

<p>You can access the SQL file by clicking the link below:</p>
<a href="https://github.com/JoeyNT/MySQL/blob/main/U-Mobile.sql" target="_blank">Download SQL File</a>
<h2>Examples of Data Retrieval (SELECT STATEMENT)</h2>
<ol><li><h4>Show CustomerID and customer names of customers who have plan prices above $90. Show the prices from lowest to highest.</h4></li>
<p> SELECT C.CustomerID, C.Name, P.PlanPrice AS Price <br>
FROM Customer C, Account A, Plan P<br>
WHERE C.AccountNo = A.AccountNo AND A.AccountNo = P.AccountNo<br>
AND P.PlanPrice > 90<br>
ORDER BY P.PlanPrice<br>
</p>
<img src="https://github.com/JoeyNT/MySQL/blob/main/Ex%201.jpg" ><br>
<br> You can access the SQL Query file Ex 1 by clicking the link below:</p>
<a href="https://github.com/JoeyNT/MySQL/blob/main/MySQLQueryEx1.sql" target="_blank">Download SQL File</a>

<li><h4>Show customer ID, AccountNo, and customer name for customer(s) who have the same dates for both the line activation and Plan start date.</h4></li>
<p> SELECT C.CustomerID, C.Name, A.AccountNo, L.LineActiveDate, P.PlanStartDate <br>
FROM Customer C, Plan P, Account A, Line L<br>
WHERE C.AccountNo = A.AccountNo<br>
AND A.AccountNo = P.AccountNo<br>
AND L.PlanID = P.PlanID<br>
AND L.LineActiveDate = P.PlanStartDate<br>
</p>
<img src="https://github.com/JoeyNT/MySQL/blob/main/Ex%202.jpg" ><br>


<li><h4>Display the Average Minimum Amount and Payment Amount for Each Account Type.</h4></li>
<p>USE U_Mobile; <br>
<br>
SELECT PL.PlanType, AVG(P.PaymentAmount) AS AveragePayment, AVG(I.MinPaymentDue) AS AverageAmountDue <br>
FROM Payment P, Invoice I, Account A, Plan PL<br>
AND A.AccountNo = PL.AccountNo<br>
GROUP BY(PL.PlanType);<br>
</p>
<img src="https://github.com/JoeyNT/MySQL/blob/main/Ex%203.jpg" ><br>

<li><h4>Display Customers with either Apple or Samsung, their Average: Account Balance, Minimum Payment, and PaymentDue</h4></li>

<p>SELECT D.Manufacturer AS Brand, AVG (I.TotalAccntBalance) AS AverageBalance, AVG(I.MinPaymentDue) AS MinimumDue,<br>
AVG(P.PaymentAmount) AveragePayment<br>
FROM Customer C, Device D, Invoice I, Account A, Payment P<br>
WHERE P.InvoiceID = I.InvoiceID AND I.AccountNo = A.AccountNo<br>
AND A.AccountNo = C.AccountNo AND C.CustomerID = D.CustomerID<br>
GROUP BY D.Manufacturer;<br>
</p>
<img src="https://github.com/JoeyNT/MySQL/blob/main/Ex%204.jpg" ><br>

<li><h4>Show the device manufacturer, plan ID, plan type, and plan prices for each plan that has a price above $80.</h4></li>

<p>SELECT D.CustomerID, D.Manufacturer AS Brand, P.PlanType, P.PlanPrice, P.PlanID<br>
FROM Device D<br>
INNER JOIN Line L ON D.IMEI = L.IMEI<br>
INNER JOIN Plan P ON L.PlanID = P.PlanID<br>
WHERE P.PlanPrice > 80<br>
</p>
<img src="https://github.com/JoeyNT/MySQL/blob/main/Ex%205.jpg" ><br>
</ol>

<h2>CONCLUSION</h2>
<p> In summary, the project "U-Mobile Telecommunications" focuses on improving the customer experience within a phone service provider by allowing online identification verification for existing plans. This enhancement enables existing members to add new members to their plan online, provided they have an e-SIM.<br>

The project includes an Entity-Attribute Chart, describing the essential entities and their associated attributes. It outlines the key aspects of the system, including customers, devices, accounts, invoices, payments, lines, and plans, along with their respective attributes.<br>

The Entity and Attribute Descriptions provide an in-depth understanding of the data model and its components. Entities are defined, including consumers, devices, accounts, invoices, payments, lines, and plans, each with its unique identifiers and associated attributes.<br>

The project outlines a set of business rules, ensuring the integrity and consistency of the system. These rules cover relationships between customers, devices, lines, plans, accounts, invoices, payments, and more, providing a comprehensive framework for the system's operations.<br>

The project also presents an Entry Relationship Diagram, showcasing the data relationships in the system.<br>

It concludes with SQL examples, demonstrating how to retrieve specific data from the database. These examples illustrate SQL queries for finding customers with specific criteria, calculating averages for account types, and more.<br>

Additionally, the SQL file for this project can be accessed by clicking on the provided link, allowing users to download the SQL file for further reference.<br>

The project aims to streamline customer processes and enhance the efficiency of a telecommunications service provider through well-defined data modeling and structured SQL queries.
</p>
