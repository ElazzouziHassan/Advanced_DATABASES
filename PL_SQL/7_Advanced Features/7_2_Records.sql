DECLARE
   TYPE employee_record IS RECORD (
      id NUMBER,
      name VARCHAR2(50)
   );
   emp_info employee_record;
BEGIN
   emp_info.id := 1;
   emp_info.name := 'John Doe';
END;
