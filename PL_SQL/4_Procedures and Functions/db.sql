CREATE OR REPLACE PROCEDURE my_procedure IS
BEGIN
   -- Procedure logic
END my_procedure;

CREATE OR REPLACE FUNCTION add_numbers(a NUMBER, b NUMBER) RETURN NUMBER IS
   result NUMBER;
BEGIN
   result := a + b;
   RETURN result;
END add_numbers;
