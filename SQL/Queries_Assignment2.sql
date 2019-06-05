Queries

1. Top Grossing Concession Stand:
 
SELECT cs.StandID, sum(fi.price*ot.quantity)
FROM Concession_stand cs, Food_item fi, Order_transaction ot
WHERE fi.FoodItemID = ot.FoodItemID and cs.StandID =
GROUP BY cs.StandID
HAVING sum(fi.price*ot.quantity) in (
	SELECT * 
FROM (
SELECT sum(fi.price*ot.quantity)
FROM Order_transaction ot, Food_item fi
ORDER BY cs.StandID) 
WHERE rownum =1));

2. Inventory Below a Certain Threshold:
 
SELECT cs.StandID, (i.Quantity / SUM(i.Quantity)) AS Percentage_Inventory
FROM Inventory i, Stadium s, Concession_stand cs
WHERE cs.StadiumID = s.StadiumID and s.StadiumID=i.StadiumID
GROUP BY  Concession_stand

3. Total Number of Orders per Section:

SELECT section_number, count(orderID)
FROM Order_transaction O, Food_item FI, Concession_Stand CS
WHERE O.fooditemID = FI.fooditemID and FI.fooditemID = CS.fooditemID
GROUP BY section_number

4.  Best Chef (chef who makes the most items):

SELECT Ch.employeeID, sum(quantity)
FROM Order_transaction O, Food_item FI, Concession_Stand CS, Stadium S, Employee EM, Chef ch
WHERE O.fooditemID = FI.fooditemID and FI.fooditemID = CS.fooditemID and CS.stadiumID = S.stadiumID and S.stadiumID = EM.stadiumID and EM.employeeID = Ch.employeeID
GROUP BY ch.employeeID
Order by sum(quantity) desc

