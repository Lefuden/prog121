-- skriv unik kunddata till tabellen kunder och se till att inga dubletter läggs in
INSERT INTO kunder(kunder.Kundnamn, kunder.KontaktPerson, kunder.Land)
SELECT DISTINCT nyorderdata.CompanyName, CONCAT(nyorderdata.FirstName, ' ', nyorderdata.LastName), nyorderdata.Country
FROM nyorderdata
WHERE NOT nyorderdata.CompanyName IN (SELECT kunder.Kundnamn FROM kunder)



-- lägg till unik orderdata till ordrar (orderID) och se till att sekundärnyckel kundID skrivs till rätt fält

INSERT INTO ordrar(ordrar.OrderID, ordrar.OrderDatum, ordrar.LevDatum, ordrar.KundID)
SELECT nyorderdata.OrderID, nyorderdata.OrderDate, nyorderdata.ShippedDate, kunder.KundID
FROM kunder INNER JOIN nyorderdata ON kunder.Kundnamn = nyorderdata.CompanyName
GROUP BY nyorderdata.OrderID
ORDER BY nyorderdata.OrderID



-- lägg till unik produktdata i tabellen produkter, se till att dubletter inte läggs till

INSERT INTO produkter(produkter.ProduktNamn, produkter.Pris, produkter.LagerSaldo)
SELECT DISTINCT nyorderdata.ProductName, nyorderdata.UnitPrice, nyorderdata.NumInStore
FROM nyorderdata
WHERE NOT nyorderdata.ProductName IN (SELECT produkter.ProduktNamn FROM produkter)



-- lägg till nya rader i tabellen orderrader och hämta värden till sekundärnycklarna orderID och produktID från tabellerna ordrar och produkter. beställtantal hämtas från importdata (nyorderdata) med hjälp av inner join. Kopplingar: ordrar -> nyorderdata -> produkter

INSERT INTO orderrader(orderrader.OrderID, orderrader.ProduktID, orderrader.BestalltAntal)
SELECT ordrar.OrderID, produkter.ProduktID, nyorderdata.Quantity
FROM ordrar INNER JOIN nyorderdata ON ordrar.OrderID = nyorderdata.OrderID
	INNER JOIN produkter ON produkter.ProduktNamn = nyorderdata.ProductName
	
	(){}
-- kolla dubletter i kundnamn
SELECT * FROM kunder
WHERE kunder.Kundnamn in (SELECT kunder.Kundnamn FROM kunder GROUP BY kunder.Kundnamn HAVING COUNT(kunder.KundID) > 1)


-- kolla totalsumma per land, filtrera för ett land
SELECT kunder.Land, kunder.Kundnamn, COUNT(ordrar.OrderID) AS 'antal ordrar', SUM(orderrader.BestalltAntal * produkter.Pris) AS 'totalt'
FROM kunder INNER JOIN ordrar ON kunder.KundID = ordrar.KundID
	INNER JOIN orderrader ON ordrar.OrderID = orderrader.OrderID
		INNER JOIN produkter ON orderrader.ProduktID = produkter.ProduktID
        
WHERE kunder.Land = 'Sweden'

GROUP BY kunder.Kundnamn