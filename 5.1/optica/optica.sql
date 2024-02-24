DROP database if exists optica;
CREATE database optica;
USE optica;
-- TAULES --
CREATE table proveidors (
   idp INT primary key auto_increment,
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
CREATE table marca (
   idm INT primary key auto_increment,
   name_marca VARCHAR(30) NOT NULL
);
CREATE table ulleres (
   idu INT primary key auto_increment,
   id_proveidor INT NOT NULL,
   id_marca INT NOT NULL,
   graduacio_ullDret FLOAT NOT NULL,
   graduacio_ullEsquerre FLOAT NOT NULL,
   montura VARCHAR(20) NOT NULL,
   color VARCHAR(10) NOT NULL,
   preu FLOAT NOT NULL,
   FOREIGN KEY (id_proveidor) REFERENCES proveidors (idp),
   FOREIGN KEY (id_marca) references marca(idm)
);
CREATE table client (
   idc INT primary key auto_increment,
   id_ulleres INT NOT NULL,
   name_client VARCHAR(60) NOT NULL,
   adress_client VARCHAR(90) NOT NULL,
   telf_client VARCHAR(9) NOT NULL,
   email_client VARCHAR(30) NOT NULL,
   data_registre DATE NOT NULL,
   recomanacio INT,
   FOREIGN KEY (id_ulleres) REFERENCES ulleres (idu),
   foreign KEY (recomanacio) references client (idc)
);
CREATE table empleat (
   ide INT primary key auto_increment,
   nom_empleat VARCHAR(90) NOT NULL
);
CREATE table vendes (
   idv INT PRIMARY KEY auto_increment,
   id_ulleres INT NOT NULL,
   id_client INT NOT NULL,
   id_empleat INT NOT NULL,
   data_venda DATE NOT NULL,
   FOREIGN KEY (id_ulleres) REFERENCES ulleres (idu),
   FOREIGN KEY (id_empleat) REFERENCES empleat (ide),
   FOREIGN KEY (id_client) REFERENCES client (idc)
);
-- INSERTS --
INSERT INTO proveidors (
      name,
      street,
      street_number,
      floor_number,
      door_number,
      city,
      CP,
      country,
      telephone,
      fax,
      NIF
   )
VALUES (
      'Visió',
      'C/primer',
      1,
      'baixos',
      NULL,
      'Girona',
      08001,
      'Espanya',
      '123456789',
      NULL,
      '123456789'
   ),
   (
      'Wanda',
      'C/segon',
      2,
      NULL,
      NULL,
      'Barcelona',
      08002,
      'Espanya',
      '023456789',
      NULL,
      '123456780'
   ),
   (
      'NatVis',
      'C/tercer',
      33,
      3,
      3,
      'Moscú',
      08003,
      'Russia',
      '123456733',
      NULL,
      '123456339'
   ),
   (
      'Gran Ull',
      'C/quart',
      14,
      'entresol',
      NULL,
      'Arlkji',
      66666,
      'Goiiaseouh',
      '166656789',
      NULL,
      '666456789'
   ),
   (
      'Optic Center',
      'Carrer Major',
      12,
      '1r',
      1,
      'Barcelona',
      08005,
      'Espanya',
      '934567890',
      NULL,
      'B12345678'
   ),
   (
      'Vision World',
      'Passeig de Gràcia',
      45,
      '2n',
      3,
      'Barcelona',
      08007,
      'Espanya',
      '932345678',
      NULL,
      'B87654321'
   ),
   (
      'Spectacle HoUSE',
      'Carrer Gran de Gràcia',
      112,
      NULL,
      NULL,
      'Barcelona',
      08012,
      'Espanya',
      '931234567',
      NULL,
      'B98765432'
   );
INSERT INTO marca (name_marca)
VALUES ('Pluja'),
   ('Sol'),
   ('Aigua'),
   ('Vent'),
   ('Neu'),
   ('Foc'),
   ('Gel'),
   ('Llum');
INSERT INTO ulleres (
      id_proveidor,
      id_marca,
      graduacio_ullDret,
      graduacio_ullEsquerre,
      montura,
      color,
      preu
   )
VALUES (
      1,
      1,
      0.5,
      1,
      'flotant',
      'vermell',
      95.39
   ),
   (
      2,
      2,
      2.5,
      3,
      'metàl·liques',
      'verd',
      86.79
   ),
   (
      3,
      3,
      0.4,
      1,
      'pasta',
      'groc',
      77.77
   ),
   (
      2,
      4,
      2.0,
      2.5,
      'metàl·liques',
      'blau',
      120.99
   ),
   (
      3,
      5,
      3.0,
      3.5,
      'pasta',
      'negre',
      99.99
   ),
   (
      1,
      2,
      1.5,
      1.0,
      'flotant',
      'marró',
      89.99
   );
INSERT INTO client (
      id_ulleres,
      name_client,
      adress_client,
      telf_client,
      email_client,
      data_registre,
      recomanacio
   )
VALUES (
      1,
      'Jan',
      'C/bitxo, 21, Barcelona',
      '212121212',
      'jan@mail.com',
      '2022-08-21',
      NULL
   ),
   (
      2,
      'Aran',
      'Avda petarda, 1, Terrassa',
      '123456789',
      'aran@mail.com',
      '2023-04-06',
      1
   ),
   (
      3,
      'Clàudia',
      'Trav peque, 2, St Cugat',
      '123456789',
      'claud@mail.com',
      '2023-11-03',
      1
   ),
   (
      3,
      'Carla',
      'Carrer de Sants, 5, Barcelona',
      '612345678',
      'carla@mail.com',
      '2023-10-15',
      NULL
   ),
   (
      1,
      'Mildred Alexander',
      'Avinguda Diagonal, 234, Andorra',
      '688765432',
      'david@mail.com',
      '2024-01-20',
      NULL
   ),
   (
      2,
      'Howard Wilkerson',
      'Carrer Provença 98, Vilavall',
      '634567890',
      'laura@mail.com',
      '2023-02-10',
      NULL
   );
INSERT INTO empleat (nom_empleat)
VALUES ('Mar Alzina'),
   ('Emi Zapata');
INSERT INTO vendes (id_ulleres, id_client, id_empleat, data_venda)
VALUES (4, 2, 2, '2022-01-02'),
   (1, 1, 1, '2023-05-04'),
   (5, 3, 1, '2022-02-04'),
   (2, 5, 1, '2023-08-12'),
   (3, 5, 2, '2023-02-08'),
   (1, 3, 1, '2022-11-20'),
   (6, 4, 2, '2023-02-02'),
   (1, 1, 1, '2023-05-04'),
   (5, 3, 1, '2022-02-04'),
   (2, 2, 1, '2023-08-12'),
   (4, 5, 2, '2023-02-08');
-- TOTAL COMPRES CLIENTS --
SELECT c.idc,
   c.name_client as 'Client',
   COUNT(v.idv) AS 'Total compres'
FROM client c
   LEFT JOIN vendes v ON c.idc = v.id_client
WHERE name_client = 'Jan'
GROUP BY c.idc,
   c.name_client;
-- TOTAL VENDES EMPLEAT/ANY --
SELECT m.name_marca AS 'marca',
   u.montura,
   u.preu,
   COUNT(v.idv) AS 'Total vendes'
FROM vendes v
   JOIN ulleres u ON v.id_ulleres = u.idu
   JOIN marca m ON u.id_marca = m.idm
WHERE v.id_empleat = 1
   AND YEAR(v.data_venda) = 2023
GROUP BY m.name_marca,
   u.montura,
   u.preu;
-- PROVEÏDORS ULLERES VENUDES --
SELECT p.name AS 'proveïdor',
   COUNT(v.idv) AS 'Ulleres venudes'
FROM vendes v
   JOIN ulleres u ON v.id_ulleres = u.idu
   JOIN proveidors p ON u.id_proveidor = p.idp
GROUP BY p.name;