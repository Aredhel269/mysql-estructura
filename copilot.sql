-- Elimina la base de datos si existe
DROP DATABASE IF EXISTS optica;

-- Crea la base de datos "optica"
CREATE DATABASE optica;

-- Usa la base de datos "optica"
USE optica;

-- Tabla "proveidors"
CREATE TABLE proveidors (
   id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(30) NOT NULL,
   street VARCHAR(60) NOT NULL,
   street_number INT NOT NULL,
   floor_number VARCHAR(10),
   door_number INT,
   city VARCHAR(60) NOT NULL,
   CP INT NOT NULL,
   country VARCHAR(10) NOT NULL,
   telephone VARCHAR(9) NOT NULL,
   fax VARCHAR(9),
   NIF VARCHAR(9) NOT NULL
);

-- Tabla "marca"
CREATE TABLE marca (
   id INT PRIMARY KEY AUTO_INCREMENT,
   name_marca VARCHAR(30) NOT NULL
);

-- Tabla "ulleres"
CREATE TABLE ulleres (
   id INT PRIMARY KEY AUTO_INCREMENT,
   id_proveidor INT NOT NULL,
   id_marca INT NOT NULL,
   graduacio_ullDret FLOAT NOT NULL,
   graduacio_ullEsquerre FLOAT NOT NULL,
   montura VARCHAR(10) NOT NULL,
   color VARCHAR(10) NOT NULL,
   preu FLOAT NOT NULL,
   FOREIGN KEY (id_proveidor) REFERENCES proveidors (id),
   FOREIGN KEY (id_marca) REFERENCES marca(id)
);

-- Tabla "client"
CREATE TABLE client (
   id INT PRIMARY KEY AUTO_INCREMENT,
   id_ulleres INT NOT NULL,
   name_client VARCHAR(60) NOT NULL,
   adress_client VARCHAR(90) NOT NULL,
   telf_client VARCHAR(9) NOT NULL,
   email_client VARCHAR(30) NOT NULL,
   data_registre DATE NOT NULL,
   recomanacio INT,
   FOREIGN KEY (id_ulleres) REFERENCES ulleres (id),
   FOREIGN KEY (recomanacio) REFERENCES client (id)
);

-- Tabla "empleat"
CREATE TABLE empleat (
   id INT PRIMARY KEY AUTO_INCREMENT,
   nom_empleat VARCHAR(90) NOT NULL
);

-- Tabla "vendes"
CREATE TABLE vendes (
   id INT PRIMARY KEY AUTO_INCREMENT,
   id_ulleres INT NOT NULL,
   id_client INT NOT NULL,
   id_empleat INT NOT NULL,
   data_venda DATE NOT NULL,
   FOREIGN KEY (id_ulleres) REFERENCES ulleres (id),
   FOREIGN KEY (id_empleat) REFERENCES empleat (id),
   FOREIGN KEY (id_client) REFERENCES client (id)
);
