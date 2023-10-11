# MySQL

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

<h2><a href="https://github.com/JoeyNT/MySQL/blob/main/Entry%20Relationship%20Diagram%20ERD%20.pdf">Entry Relationship Diagram</a></h2>
<h2><a href="https://github.com/JoeyNT/MySQL/blob/main/Relation%20Model%203NF%20.pdf">Relation Model 3NF</a></h2>
