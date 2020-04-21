-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName as "Product Name", c.CategoryName as Category
FROM [Product] as p
JOIN [Category] as c 
    ON p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT  o.ID as "Order ID", s.CompanyName as "Company Name"
FROM [Order] as o
JOIN [Shipper] as s
	ON o.ShipVia = s.Id
    WHERE o.OrderDate < "2012-08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName as "Product Name", o.Quantity as "Quantity"
FROM [OrderDetail] as o
JOIN [Product] as p
    ON o.Productid = p.Id
    WHERE o.OrderId = 10251 ORDER BY p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id as "Order ID", c.CompanyName as "Company Name", e.LastName as "Employee Last Name"
    FROM [Orders] as o
    JOIN [Customer] as c
        ON o.CustomerId = c.Id
    JOIN [Employee] as e
	ON o.EmployeeId = e.Id;

-- Stretch 1: Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 9 records.
SELECT c.CategoryName as "Category", count(p.ProductName) as "Product Quantity" 
    FROM Categories as c 
    JOIN Products as p 
    ON c.CategoryID = p.CategoryID 
    GROUP BY c.CategoryName;

--Stretch 2: Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT OrderDd, COUNT(ProductId) as ItemCount
FROM OrderDetail
GROUP BY OrderId;