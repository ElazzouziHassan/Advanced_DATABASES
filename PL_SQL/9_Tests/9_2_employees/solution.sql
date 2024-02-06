-- Select all employees from the 'Sales' department:
SELECT * FROM employees 
  WHERE department_id = (
    SELECT department_id FROM departments 
      WHERE department_name = 'Sales'
  )
;

-- Retrieve the names of employees who have a salary greater than $5000:
SELECT employee_name FROM employees 
  WHERE salary > 5000
;

-- Join the employees and departments tables to display the names of employees along with their respective department names:
SELECT e.employee_name, d.department_name FROM employees e 
  JOIN departments d 
  ON e.department_id = d.department_id
;

-- Retrieve the count of employees in each department:
SELECT d.department_name, COUNT(e.employee_id) 
  AS employee_count 
  FROM employees e 
  JOIN departments d 
  ON e.department_id = d.department_id 
  GROUP BY d.department_name
;

-- Find the highest salary among all employees:
SELECT MAX(salary) AS highest_salary FROM employees;

-- Section 2: Trigger - Creating the trigger check_total_amount:
CREATE OR REPLACE TRIGGER check_total_amount
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    IF :NEW.total_amount < 100 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Total amount must be at least $100.');
    END IF;
END;
/

-- Section 3: Function - Creating the function calculate_discount:

CREATE OR REPLACE FUNCTION calculate_discount(p_total_amount NUMBER)
RETURN NUMBER
IS
    v_discount NUMBER;
BEGIN
    IF p_total_amount > 1000 THEN
        v_discount := p_total_amount * 0.10; -- 10% discount
    ELSIF p_total_amount >= 500 THEN
        v_discount := p_total_amount * 0.05; -- 5% discount
    ELSE
        v_discount := 0; -- No discount
    END IF;
    
    RETURN v_discount;
END;
/

