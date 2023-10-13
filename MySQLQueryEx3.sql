SELECT PL.PlanType, AVG(P.PaymentAmount) AS AveragePayment, AVG(I.MinPaymentDue) AS AverageAmountDue
FROM Payment P, Invoice I, Account A, Plan PL
AND A.AccountNo = PL.AccountNo
GROUP BY(PL.PlanType);
