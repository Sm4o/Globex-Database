-- What is the name of the product that was requested in the order with ID 149?
-- SELECT *
-- FROM [globex].[dbo].[Order]
-- LEFT JOIN [globex].[dbo].[Product] product
-- ON product.Id = [globex].[dbo].[Order].Product
-- WHERE [globex].[dbo].[Order].Id = 149

-- How many units of the product from the previous question were sold on the credit card with number 3535880159004410?
-- SELECT * FROM [dbo].[Sale] sale
-- WHERE Username = (
--     SELECT Username FROM [dbo].[User]
--     WHERE CardNumber = '3535880159004410'
-- )
-- AND sale.productId = 34

-- We've noticed an error in an upstream system. When updating an employee's manager the employees table hasn't been correctly updated. The ManagerId has been updated, but the ManagerFirstName and ManagerSurname have not. How many records does this impact?
-- SELECT empl.Id, empl.FirstName, empl.Surname, empl_man.ManagerFirstName, empl_man.[ManagerSurname] FROM [dbo].[Employee] empl
-- LEFT JOIN [dbo].[Employee] empl_man
-- ON empl.Id = empl_man.ManagerId
-- WHERE (
--     empl.FirstName != empl_man.ManagerFirstName 
--     OR empl.Surname != empl_man.ManagerSurname
-- )

-- What was the value of order 115?
-- SELECT Amount*SellingPrice AS SaleAmount FROM [dbo].[Order] [order]
-- LEFT JOIN [dbo].[Product] prod
-- ON prod.Id = [order].Product
-- WHERE [order].Id = 115

-- What is the value of the highest value order in the system?
-- SELECT MAX(Amount*SellingPrice) AS SaleAmount FROM [dbo].[Order] [order]
-- LEFT JOIN [dbo].[Product] prod
-- ON prod.Id = [order].Product

-- What was the value of the most expensive order placed in 2019?
-- SELECT MAX(Amount*SellingPrice) AS SaleAmount FROM [dbo].[Order] [order]
-- LEFT JOIN [dbo].[Product] prod
-- ON prod.Id = [order].Product
-- WHERE DATEPART(YEAR, [Date]) = 2019

    
-- What was the value of all orders placed in 2019?
-- SELECT SUM(Amount*SellingPrice) AS SaleAmount FROM [dbo].[Order] [order]
-- LEFT JOIN [dbo].[Product] prod
-- ON prod.Id = [order].Product
-- WHERE DATEPART(YEAR, [Date]) = 2019

-- What was the value of all orders placed in 2019 excluding the following: 'Voltaren','Loud Child', 'topiramate', 'Omeprazole'?
-- SELECT SUM(Amount*SellingPrice) AS SaleAmount FROM [dbo].[Order] [order]
-- LEFT JOIN [dbo].[Product] prod
-- ON prod.Id = [order].Product
-- WHERE DATEPART(YEAR, [Date]) = 2019
-- AND prod.Name NOT IN ('Voltaren','Loud Child', 'topiramate', 'Omeprazole')


-- (Optional) The finance director needs a month-by-month report of order values for 2020. Please write a query to produce total order values grouped by month name.
-- SELECT 
--     DATEPART(MONTH, [Date]) AS SaleMonth,
--     SUM(Amount*SellingPrice) AS SaleAmount 
-- FROM [dbo].[Order] [order]
-- LEFT JOIN [dbo].[Product] prod
-- ON prod.Id = [order].Product
-- WHERE DATEPART(YEAR, [Date]) = 2020
-- GROUP BY DATEPART(MONTH, [Date])

-- (Optional) Please adapt the above report so it prints the month names in Spanish.
-- SELECT 
--     FORMAT([Date], 'MMMM', 'es') AS SaleMonth,
--     SUM(Amount*SellingPrice) AS SaleAmount 
-- FROM [dbo].[Order] [order]
-- LEFT JOIN [dbo].[Product] prod
-- ON prod.Id = [order].Product
-- WHERE DATEPART(YEAR, [Date]) = 2020
-- GROUP BY DATEPART(MONTH, [Date]), FORMAT([Date], 'MMMM', 'es')
-- ORDER BY DATEPART(MONTH, [Date]) ASC 



-- (Optional) The report now needs to include every year - grouped and ordered by year and month.
-- SELECT 
--     DATEPART(YEAR, [Date]) AS SaleYear,
--     FORMAT([Date], 'MMMM', 'es') AS SaleMonth,
--     SUM(Amount*SellingPrice) AS SaleAmount 
-- FROM [dbo].[Order] [order]
-- LEFT JOIN [dbo].[Product] prod
-- ON prod.Id = [order].Product
-- GROUP BY FORMAT([Date], 'MMMM', 'es'), DATEPART(YEAR, [Date]), DATEPART(MONTH, [Date])
-- ORDER BY DATEPART(YEAR, [Date]) ASC, DATEPART(MONTH, [Date]) 

-- Write a query that produces a report of PayBands, the total monthly salary paid to everyone in each band and what percentage of the total monthly salary bill that is.
-- DECLARE @total_salary FLOAT
-- SELECT @total_salary = SUM(band.MonthlySalary)
-- FROM [dbo].PayBand band
-- RIGHT JOIN [dbo].[Employee] empl
-- ON empl.PayBand = band.Id
-- SELECT 
--     band.Id, 
--     SUM(band.MonthlySalary) AS PayBand,
--     SUM(band.MonthlySalary)/@total_salary*100 AS PctTotal
-- FROM [dbo].[PayBand] band
-- RIGHT JOIN [dbo].[Employee] empl
-- ON empl.PayBand = band.Id
-- GROUP BY band.Id
-- ORDER BY band.Id ASC
