CREATE TYPE my_object AS OBJECT (
   id NUMBER,
   name VARCHAR2(50),
   MEMBER FUNCTION get_info RETURN VARCHAR2
);

CREATE TYPE BODY my_object AS
   MEMBER FUNCTION get_info RETURN VARCHAR2 IS
   BEGIN
      RETURN 'ID: ' || id || ', Name: ' || name;
   END;
END;
