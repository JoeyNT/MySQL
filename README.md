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

<h3 align="left">Connect with me:</h3>
<p align="left">
</p>

<h3 align="left">Languages and Tools:</h3>
