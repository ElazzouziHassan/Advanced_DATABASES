DECLARE
   my_exception EXCEPTION;
BEGIN
   IF condition THEN
      RAISE my_exception;
   END IF;
EXCEPTION
   WHEN my_exception THEN
      -- Handle custom exception
END;
