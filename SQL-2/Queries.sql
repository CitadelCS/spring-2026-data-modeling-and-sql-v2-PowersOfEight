-- Queries for classicmodels database
--

-- Set the search path for convenience
SET SEARCH_PATH TO classicmodels, public;

-- 1. For all the orders, display the order
-- number and the total price of the order, where the status of the order is 'SHIPPED'.
-- Display only the first 10 rows.

SELECT
    orderNumber "orderNumber",
    status,
    CAST(SUM(quantityordered * priceeach) AS NUMERIC(10,2)) total
FROM
    orders NATURAL JOIN orderdetails
WHERE
    upper(status) = 'SHIPPED'
GROUP BY
    ordernumber, status
ORDER BY ordernumber
FETCH FIRST 10 ROWS ONLY;

-- 2. Display the following information for all orders:
-- orderNumber, orderDate, customerName, orderLineNumber, productName, quantityOrdered, priceEach
-- Display only the first 10 rows.

SELECT
    ordernumber "orderNumber",
    orderdate "orderDate",
    customername "customerName",
    orderlinenumber "orderLineNumber",
    productname "productName",
    quantityordered "quantityOrdered",
    priceeach "priceEach"
FROM
    orders
NATURAL JOIN
    customers
NATURAL JOIN
    orderdetails
NATURAL JOIN
    products
ORDER BY "orderNumber", "orderLineNumber"
FETCH FIRST 10 ROWS ONLY;

-- 3. Find all the orders with total price greater than 10,000. For the relevant orders found, display the following:
-- orderNumber, itemsCount, totalPrice
-- Order by totalPrice.
-- Display only the first 10 rows.
-- Note: both itemsCount and totalPrice will be calculated values for the order after grouping all the related rows together.

SELECT
    ordernumber "orderNumber",
    SUM(quantityordered) "itemsCount",
    CAST(SUM(quantityordered * priceeach) AS NUMERIC(10,2)) "totalPrice"
FROM
    orders NATURAL JOIN orderdetails
GROUP BY
    ordernumber
HAVING
    SUM(quantityordered * priceeach) > 10000
ORDER BY "totalPrice"
FETCH FIRST 10 ROWS ONLY;

-- 4. Using a subquery, find the customer who has the minimum payment.
-- Display the customerNumber, customerName, and amount.

SELECT
    customernumber "customerNumber",
    customername "customerName",
    checknumber "checkNumber",
    amount
FROM
    customers
NATURAL JOIN
    payments
WHERE
    amount = (
    SELECT MIN(amount) FROM payments
    );
