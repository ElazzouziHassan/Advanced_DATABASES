CREATE OR REPLACE TRIGGER my_trigger
BEFORE INSERT ON my_table
FOR EACH ROW
BEGIN
   -- Trigger logic
END my_trigger;
