SELECT 
	Sellers.Surname + ' ' + Sellers.Name AS 'Name',
	Quantity
FROM Sellers
INNER JOIN (
	SELECT 
		Sales.IDSell,
		SUM(Quantity) as Quantity
	FROM Sales
	WHERE Sales.Date BETWEEN '2020-10-01'  AND '2020-10-07'
	GROUP BY Sales.IDSell) AS sl
	ON sl.IDSell = Sellers.ID
ORDER BY 'Name'



SELECT DISTINCT
    p.Name 'Product Name',
    sell.Surname + ' ' + sell.Name AS 'Seller Name',
    FORMAT(Sealed.Quantity * 1.0 / ProdQuantity.Quantity * 100.0, 'N2') AS Quantity
FROM (
    SELECT 
        Sales.IDSell,
        Sales.IDProd,
        SUM(Quantity) as Quantity
    FROM Sales
    WHERE Sales.Date BETWEEN '2020-10-01'  AND '2020-10-07'
    GROUP BY Sales.IDSell, Sales.IDProd
) AS Sealed
INNER JOIN Products p
    ON p.ID = Sealed.IDProd
INNER JOIN (
    SELECT 
        s.IDProd,
        SUM(s.Quantity) AS Quantity
    FROM Sales s
    WHERE s.Date BETWEEN '2020-10-01'  AND '2020-10-07'
    GROUP BY s.IDProd
) AS ProdQuantity
    ON ProdQuantity.IDProd = p.ID
INNER JOIN Arrivals a
    ON a.IDProd = p.ID
    AND a.Date BETWEEN '2020-09-07'  AND '2020-10-07'
INNER JOIN Sellers sell
    ON Sealed.IDSell = sell.ID
ORDER BY 'Product Name', 'Seller Name'