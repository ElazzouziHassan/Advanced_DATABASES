declare
 max_salaire DOUBLE;
  min_salaire DOUBLE;
  moy_salaire DOUBLE;
  nb_employees INTEGER;
BEGIN 
  SELECT MAX(salaire), MIN(salaire), AVG(salaire), COUNT(*)
  INTO max_salaire, min_salaire, moy_salaire, nb_employees
  FROM `employee`;
  
  SELECT 
END
  
