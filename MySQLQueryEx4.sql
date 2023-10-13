SELECT D.Manufacturer AS Brand, AVG (I.TotalAccntBalance) AS AverageBalance, AVG(I.MinPaymentDue) AS MinimumDue,
AVG(P.PaymentAmount) AveragePayment
FROM Customer C, Device D, Invoice I, Account A, Payment P
WHERE P.InvoiceID = I.InvoiceID AND I.AccountNo = A.AccountNo
AND A.AccountNo = C.AccountNo AND C.CustomerID = D.CustomerID
GROUP BY D.Manufacturer;
