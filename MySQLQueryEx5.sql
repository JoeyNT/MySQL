SELECT D.CustomerID, D.Manufacturer AS Brand, P.PlanType, P.PlanPrice, P.PlanID
FROM Device D
INNER JOIN Line L ON D.IMEI = L.IMEI
INNER JOIN Plan P ON L.PlanID = P.PlanID
WHERE P.PlanPrice > 80
