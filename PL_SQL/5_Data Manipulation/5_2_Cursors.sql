DECLARE
   CURSOR my_cursor IS SELECT column1, column2 FROM my_table;
   v_value1 my_table.column1%TYPE;
   v_value2 my_table.column2%TYPE;
BEGIN
   OPEN my_cursor;
   LOOP
      FETCH my_cursor INTO v_value1, v_value2;
      EXIT WHEN my_cursor%NOTFOUND;
      -- Process data
   END LOOP;
   CLOSE my_cursor;
END;
