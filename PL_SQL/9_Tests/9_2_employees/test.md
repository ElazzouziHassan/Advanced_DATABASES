# Test on PL/SQL :

## **Section 1: SQL Queries** :

- Consider two tables: employees and departments. Write a SQL query to select all employees from the 'Sales' department.
- Write a SQL query to retrieve the names of employees who have a salary greater than $5000.
- Join the employees and departments tables to display the names of employees along with their respective department names.
- Retrieve the count of employees in each department.
- Write a SQL query to find the highest salary among all employees.

## **Section 2: Trigger** :

Given the table orders with columns order_id, order_date, and total_amount, create a trigger named check_total_amount that ensures no order can be inserted with a total amount less than $100.

## **Section 3: Function** :

Create a PL/SQL function named calculate_discount that takes the order total amount as input and returns the discount amount based on the following criteria:

- If the order total is greater than $1000, apply a discount of 10%.
- If the order total is between $500 and $1000 (inclusive), apply a discount of 5%.
- If the order total is less than $500, apply no discount.