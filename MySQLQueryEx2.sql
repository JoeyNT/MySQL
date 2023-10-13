SELECT C.CustomerID, C.Name, A.AccountNo, L.LineActiveDate, P.PlanStartDate
FROM Customer C, Plan P, Account A, Line L
WHERE C.AccountNo = A.AccountNo
AND A.AccountNo = P.AccountNo
AND L.PlanID = P.PlanID
AND L.LineActiveDate = P.PlanStartDate
