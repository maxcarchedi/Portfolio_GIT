--1
SELECT distinct C.customerid
FROM CUSTOMER_T C, Order_t O
WHERE c.customerid NOT IN (SELECT customerid FROM Order_t)

/*
SELECT customerid FROM Order_t

SELECT customerid
FROM Order_t
Where customerid

Select customerid
from customer_t
group by customerid
*/

--2
select distinct employeename, count(employeesupervisor) as [head count]
from employee_t
group by employeename
having count(employeesupervisor) > 2

select distinct employeesupervisor 
from  employee_t


--3
Select * from customer_t

select * from employee_t


Select c.customerstate
from customer_t c, order_t o, orderline_t ol, product_t p, producedin_t pt,workcenter_t wc, worksin_t wi, employee_t e
where c.customerstate minus e.employeestate

select c.customerstate
from customer_t c, order_t o, orderline_t ol, product_t p, producedin_t pt, workcenter_t wc, worksin_t wi, employee_t e
where c.customerid = o.customerid, o.orderid = ol.orderid, ol.productid = p.productid, p.productid = pt.productid, pt.workcenterid = wc.workcenterid, wc.workcenterid = wi.workcenterid, wi.employeeid = e.employeeid

select e.employeestate
from customer_t c, order_t o, orderline_t ol, product_t p, producedin_t pt,workcenter_t wc, worksin_t wi, employee_t e
where c.customerid = o.customerid, o.orderid = ol.orderid, ol.productid = p.productid, p.productid = pt.productid, pt.workcenterid = wc.workcenterid, wc.workcenterid = wi.workcenterid, wi.employeeid = e.employeeid


select distinct customerstate
from customer_t
minus
select distinct employeestate
from employee_t

select c.customerstate
from employee_t e, customer_t c
where c.customerstate = e.employeestate




FINAL QUERIES
--1)

SELECT customerid
FROM customer_t
WHERE customerid NOT IN ( SELECT customerid FROM order_t )

--2)

SELECT s.employeename, count(e.employeeid) AS headcount
FROM employee_t e AS e, employee_t AS s
WHERE s.employeeid=e.employeesupervisor
Group by s.employeename
Having headcount > 2

--3)

SELECT customerstate
FROM customer_t
Minus
SELECT salespersonstate
FROM salesperson_t

--4)

SELECT c.customerid, c customername
FROM customer_t c, order_t o, orderline_t ol
WHERE c.customerid = o.customerid and o.orderid=ol.orderid and ol.productid = 4 and o.orderid IN (SELECT orderid FROM orderline_t ol WHERE ol.productid = 5)

--5)

SELECT C.CustomerID, CustomerName
FROM Customer_T C, Order_T O1, OrderLine_T OL1
WHERE C.CustomerID = O1.CustomerID AND O1.OrderID = OL1.OrderID AND OL1.ProductID = 4 AND O1.OrderID IN (
   	 SELECT OrderID
   	 FROM OrderLine_T OL2
    	WHERE OL2.ProductID = 5);

--6)

SELECT ProductLineID, ProductLineName
FROM ProductLine_T
WHERE ProductLineID IN (
    SELECT ProductLineID
    FROM Product_T
    WHERE ProductStandardPrice <= (
   	 SELECT AVG(ProductStandardPrice)
   	 FROM Product_T));

--7)
Select t.TerritoryID, t.TerritoryName
From Territory_T t, DoesBusiness_T d
Where t.TerritoryID = d.TerritoryID
Group by t.TerritoryID, t.TerritoryName 
Having count(d.customerID) >= 1.5*(
Select count(d.customer)/count(t.territory)
From DoesBusinessin_T d, Territory_T t
Where d.TerritoryID = t.TerritoryID)


--8)
Select o.orderID, o.orderedQuantity
From orderLine_T o, (select productID, avg(orderedQuantity) as [avgproductQuan]
From orderline_T, Group by productID) a
Where o.productID = a.productID and o.orderquantity > a.avgproductquan

--9)
SELECT
FROM product_t INNER JOIN orderline_t AS po ON product_t.productid = po.productid
WHERE ( (po.orderedquantity > (SELECT AVG(orderedquantity) FROM orderline_t ol WHERE ol.productid = po.productid)) and (p.productid = [po].[productid])

Finds average total (subquery for the one above)
SELECT AVG(orderedquantity) As average FROM orderline_t ol, product_t p WHERE ol.productid = po.productid and (p.productid = [po].[productid])

--10)
Select top(1) sum(p.productsprice * o.ordered quantity) as [Revenue], p.productid
From product_t p, orderline_t o
Where p.productid = o.productid
Group by p.productid
Order by [Revenue] asc

--11)
SELECT c.customername, c.customerstate
FROM customer_t c, order_t o, orderline_t ol, product_t p
WHERE c.customerid = o.customerid and o.orderid = ol.orderid and ol.productid = p.productid
GROUP BY c.customername, c. customerstate
HAVING Sum(p.productstandardsprice * ol.orderedquantity) AS revenue in (
SELECT TOP 3 Sum(p.productstandardsprice * ol.orderedquantity)
FROM customer_t as c, order_t o, orderline_t ol, product_t p 
WHERE c.customerid = o.customerid and o.orderid = ol.orderid and ol.productid = p.productid
GROUP BY c.customerid
ORDER BY revenue)

SELECT TOP 3 Sum(p.productstandardsprice * ol.orderedquantity) AS revenue
FROM customer_t as c, order_t o, orderline_t ol, product_t p 
WHERE c.customerid = o.customerid and o.orderid = ol.orderid and ol.productid = p.productid
GROUP BY c.customerid
ORDER BY revenue
