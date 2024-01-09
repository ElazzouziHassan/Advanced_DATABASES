CREATE TABLE Emp10 AS SELECT * FROM scott.emp 
  WHERE 1 = 0;

CREATE TABLE Emp_autre AS SELECT * FROM scott.emp 
  WHERE 1 = 0;

INSERT INTO Emp10 SELECT * FROM scott.emp
  WHERE deptno = 10;

INSERT INTO Emp_autre SELECT * FROM scott.emp
  WHERE deptno <> 10;
