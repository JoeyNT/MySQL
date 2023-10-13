SELECT C.CustomerID, C.Name, P.PlanPrice AS Price
FROM Customer C, Account A, Plan P
WHERE C.AccountNo = A.AccountNo AND A.AccountNo = P.AccountNo
AND P.PlanPrice > 90
ORDER BY P.PlanPrice
