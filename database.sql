-- Active: 1700498588424@@127.0.0.1@3306@cooperative_db
CREATE DATABASE cooperative_db;

use cooperative_db;
-- TABLE CAFES :
CREATE TABLE `cafes`(
  num INT PRIMARY KEY AUTO_INCREMENT,
  type VARCHAR(50) NOT NULL,
  annee DATE,
  taux_cafeine FLOAT NOT NULL
);
-- TABLE PRODUCTEURS :
CREATE TABLE `producteurs`(
  num INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(60) NOT NULL,
  pernom VARCHAR(60) NOT NULL,
  region VARCHAR(60) NOT NULL
);
-- TABLE RECOLTES :
CREATE TABLE `recoltes`(
  nprod INT,
  ncafe INT,
  quantite INT NOT NULL,
  PRIMARY KEY(nprod, ncafe),
  Foreign Key (nprod) REFERENCES `producteurs`(num),
  Foreign Key (ncafe) REFERENCES `cafes`(num)
);


-- Insertion des données dans la table CAFES
INSERT INTO CAFES (NUM, TYPE, ANNEE, TAUX_CAFEINE) VALUES (1, 'Arabica', 2022, 1.10);
INSERT INTO CAFES (NUM, TYPE, ANNEE, TAUX_CAFEINE) VALUES (2, 'Robusta', 2021, 1.50);
INSERT INTO CAFES (NUM, TYPE, ANNEE, TAUX_CAFEINE) VALUES (3, 'Moka', 2022, 0.90);
INSERT INTO CAFES (NUM, TYPE, ANNEE, TAUX_CAFEINE) VALUES (4, 'Colombien', 2021, 1.20);
INSERT INTO CAFES (NUM, TYPE, ANNEE, TAUX_CAFEINE) VALUES (5, 'Ethiopien', 2022, 1.15);
INSERT INTO CAFES (NUM, TYPE, ANNEE, TAUX_CAFEINE) VALUES (12, 'NouveauCafe', 2023, 1.25);

-- Insertion des données dans la table PRODUCTEURS
INSERT INTO PRODUCTEURS (NUM, NOM, PERNOM, REGION) VALUES (1, 'Dupont', 'Pierre', 'Blue Mountain');
INSERT INTO PRODUCTEURS (NUM, NOM, PERNOM, REGION) VALUES (2, 'Martin', 'Sophie', 'Sidamo');
INSERT INTO PRODUCTEURS (NUM, NOM, PERNOM, REGION) VALUES (3, 'Durand', 'Nicolas', 'Kona');
INSERT INTO PRODUCTEURS (NUM, NOM, PERNOM, REGION) VALUES (4, 'Leroy', 'Isabelle', 'Blue Mountain');
INSERT INTO PRODUCTEURS (NUM, NOM, PERNOM, REGION) VALUES (5, 'Petit', 'François', 'Yirgacheffe');
INSERT INTO PRODUCTEURS (NUM, NOM, PERNOM, REGION) VALUES (6, 'Garcia', 'Juan', 'Tarrazú');
INSERT INTO PRODUCTEURS (NUM, NOM, PERNOM, REGION) VALUES (35, 'Lopez', 'Maria', 'Antigua');

-- Insertion des données dans la table RECOLTES
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (1, 1, 150);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (1, 2, 120);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (1, 3, 100);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (2, 1, 150);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (2, 2, 400);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (2, 3, 250);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (3, 1, 350);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (3, 2, 500);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (3, 3, 150);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (4, 1, 450);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (4, 2, 600);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (4, 4, 700);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (5, 1, 200);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (5, 2, 100);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (5, 5, 800);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (6, 1, 500);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (6, 2, 400);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (6, 3, 200);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (6, 4, 350);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (6, 5, 900);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (6, 12, 600);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (35, 1, 800);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (35, 3, 200);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (35, 4, 450);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (35, 5, 600);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (1, 12, 110);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (2, 12, 300);
INSERT INTO RECOLTES (NPROD, NCAFE, QUANTITE) VALUES (3, 12, 500);



-- 1) Donner la liste des producteurs:
SELECT * FROM `producteurs`;

-- 2) Donner la liste des producteurs de la région du "Blue Mountain".
SELECT * FROM `producteurs` WHERE `region` = 'Blue Mountain';

-- 3) Donner par ordre alphabétique les noms et les prénoms des producteurs de la 
-- région du "Blue Mountain" qui ont récolté au moins un café en quantité 
-- supérieure à 300 kilogrammes.
SELECT DISTINCT nom, pernom FROM `Producteurs`
  WHERE region = 'Blue Mountain' 
  AND num IN (
    SELECT nprod FROM `Recoltes` WHERE quantite > 300
  )
  ORDER BY nom, pernom;

-- 4) Calculer la quantité totale de café numéro 12 produite.
SELECT SUM(quantite) AS QteTotal FROM `Recoltes`
  WHERE ncafe = 12;

-- 5) Réaliser le produit cartésien entre les cafés et les récoltes
SELECT * FROM `Cafes`, `Recoltes`;

-- 6) Calculer la quantité de café produite par type.
SELECT TYPE, SUM(quantite) AS QteTotal FROM `Cafes`,`recoltes`
  WHERE `Cafes`.num = `Recoltes`.ncafe
  GROUP BY type;

-- 7) Le langage SQL possède un opérateur d'union de deux relations, UNION. 
-- Retrouver les numéros des cafés qui ont un taux de caféine supérieur à 1.2 
-- ou qui ont été produit par le producteur numéro 35.
SELECT num FROM `Cafes`
  WHERE taux_cafeine > 1.2 OR num IN (
    SELECT ncafe FROM `Recoltes` WHERE nprod = 35
  );

-- 8) Retrouver les noms des producteurs du café numéro 12.
SELECT nom FROM `producteurs`, `recoltes`
  WHERE `producteurs`.num = `recoltes`.nprod
  AND `recoltes`.ncafe = 12
; 



-- CREATE PROCEDURE printMessage (my_message IN VARCHAR) IS
-- BEGIN
--   dbms_output.put_line(my_message);
-- END printMessage;

-- CREATE PROCEDURE augSalaire( augmentation int) RETURNS DOUBLE
-- BEGIN
-- DECLARE augmentation INT
