DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;
-- TAULES --
CREATE TABLE client (
    idcl INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    cognom VARCHAR(255) NOT NULL,
    adreça VARCHAR(255) NOT NULL,
    CP INT NOT NULL,
    localitat VARCHAR(255) NOT NULL,
    provincia VARCHAR(255) NOT NULL,
    telefon VARCHAR(255) NOT NULL
);
CREATE TABLE tipusComanda (
    idtc INT PRIMARY KEY AUTO_INCREMENT,
    tipus VARCHAR(255) NOT NULL
);
CREATE TABLE pizzes (
    idpz INT PRIMARY KEY AUTO_INCREMENT,
    tipus VARCHAR(255) NOT NULL);
CREATE TABLE productes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_pizza INT,
    nom VARCHAR(255) NOT NULL,
    descripcio TEXT NOT NULL,
    imatge TEXT NOT NULL,
    preu FLOAT NOT NULL,
    FOREIGN KEY (id_pizza) REFERENCES pizzes(idpz)
);

CREATE TABLE botiga (
    idb INT PRIMARY KEY AUTO_INCREMENT,
    adreça VARCHAR(255) NOT NULL,
    CP INT NOT NULL,
    localitat VARCHAR(255) NOT NULL,
    provincia VARCHAR(255) NOT NULL
);
CREATE TABLE comanda (
    idcm INT PRIMARY KEY AUTO_INCREMENT,
    id_client INT NOT NULL,
    id_tipusComanda INT NOT NULL,
    id_productes INT NOT NULL,
    id_botiga INT NOT NULL,
    data_hora DATETIME NOT NULL,
    preu_total FLOAT NOT NULL,
    FOREIGN KEY (id_client) REFERENCES client (idcl),
    FOREIGN KEY (id_tipusComanda) REFERENCES tipusComanda (idtc),
    FOREIGN KEY (id_productes) REFERENCES productes (idp),
    FOREIGN KEY (id_botiga) REFERENCES botiga (idb)
);
CREATE TABLE categoria_empleat (
    idce INT PRIMARY KEY AUTO_INCREMENT,
    tipus VARCHAR (255) NOT NULL
);
CREATE TABLE empleat (
    ide INT PRIMARY KEY AUTO_INCREMENT,
    id_categoriaEmpleat INT NOT NULL,
    id_botiga INT NOT NULL,
    nom VARCHAR(255) NOT NULL,
    cognom VARCHAR(255) NOT NULL,
    NIF VARCHAR(255) NOT NULL,
    telefon VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_categoriaEmpleat) REFERENCES categoria_empleat (idce),
    FOREIGN KEY (id_botiga) REFERENCES botiga (idb)
);
CREATE TABLE repartidor (
    idr INT PRIMARY KEY AUTO_INCREMENT,
    id_empleat INT NOT NULL,
    id_comanda INT NOT NULL,
    FOREIGN KEY (id_empleat) REFERENCES empleat (ide),
    FOREIGN KEY (id_comanda) REFERENCES comanda (idcm)
);
-- INSERTS --
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO client (
        nom,
        cognom,
        adreça,
        CP,
        localitat,
        provincia,
        telefon
    )
VALUES (
        'Dean',
        'Flowers',
        '518 Efeeri Key',
        79440,
        'Ibidrus',
        'U.S. Virgin Islands',
        '846918704'
    ),
    (
        'Isaac',
        'Medina',
        '1612 Bizo Ridge',
        20061,
        'Tajikistan',
        'Congo - Brazzaville',
        '248474866'
    ),
    (
        'May',
        'Crawford',
        '386 Bujuh Terrace',
        47320,
        'Fadgodta',
        'Portugal',
        '539194240'
    ),
    (
        'Stephen',
        'Richards',
        '857 Bebo Parkway',
        3082,
        'Reedowu',
        'Kiribati',
        '345081991'
    );
INSERT INTO tipusComanda (tipus)
VALUES ('domicili'),
    ('botiga');
INSERT INTO pizza (tipus)
VALUES ('Margarita'),
    ('Pepperoni'),
    ('Hawaiana'),
    ('Quatre formatges vegans'),
    ('Patata'),
    ('Napolitana'),
    ('Prosciutto e funghi veggis'),
    ('Carbonara'),
    ('Diavola'),
    ('Marinera veggie');
INSERT INTO productes (
    id_pizza,
        nom,
        descripcio,
        imatge,
        preu
    )
VALUES (
        'pizza',
        'join speak rays rock valuable spin reader per steep complete path jump win sudden upper aware seeing about proper gravity same bill successful former',
        'http://koskedoc.cg/cangabva.jpg',
        10.45
    ),
    (
        'hamburguesa',
        'wall raw include complete language human gate order operation said market level one card understanding fish adjective mountain vessels trunk about lesson paper rope',
        'http://igo.bn/hiabgu.jpg',
        8.95
    ),
    (
        'beguda',
        'pound statement will merely built crowd having struggle share who human as wish piece egg frequently consonant bad hill problem degree remember pay introduced',
        'http://buj.nu/kiu.jpg',
        2.45
    );
INSERT INTO botiga (
        adreça,
        CP,
        localitat,
        provincia
    )
VALUES (
        '69 Wewnu Lane',
        33422,
        'Wepibfav',
        'Aruba'
    ),
    (
        '1613 Naegi Trail',
        78175,
        'Cimuaw',
        'St.Kitts & Nevis'
    );
INSERT INTO comanda (
        id_client,
        id_tipusComanda,
        id_productes,
        id_botiga,
        data_hora,
        preu_total
    )
VALUES (1, 2, 3, 2, '2023-08-07 14:36:50', 20.55),
    (2, 1, 1, 1, '2023-07-09 17:19:39', 8.89),
    (1, 2, 2, 2, '2023-04-04 17:59:00', 2.45),
    (4, 1, 6, 3, '2023-10-05 08:30:04', 15.75),
    (2, 2, 9, 5, '2023-05-06 12:45:30', 12.30),
    (1, 2, 8, 1, '2023-07-11 16:20:19', 18.45),
    (4, 1, 2, 2, '2023-11-03 10:05:25', 3.60),
    (2, 1, 7, 6, '2023-06-05 21:30:28', 9.20),
    (3, 2, 4, 3, '2023-08-03 14:00:55', 5.90),
    (4, 2, 1, 5, '2023-04-07 08:00:25', 1.85);
INSERT INTO categoria_empleat (tipus)
VALUES ('cuiner'),
    ('repartidor');
INSERT INTO empleat (
        id_categoriaEmpleat,
        id_botiga,
        nom,
        cognom,
        NIF,
        telefon
    )
VALUES (
        1,
        1,
        'Virgie',
        'French',
        '596437236',
        '791996065'
    ),
    (
        1,
        2,
        'Kyle',
        'Roy',
        '766796860',
        '939908142'
    ),
    (
        2,
        1,
        'Lida',
        'Black',
        '150142347',
        '938655262'
    ),
    (
        2,
        2,
        'Bertie',
        'Hudson',
        '393608349',
        '667534669'
    ),
    (
        1,
        2,
        'Bernard',
        'Rogers',
        '222447756',
        '971160499'
    );
INSERT INTO repartidor (id_empleat, id_comanda)
VALUES (1, 3),
    (2, 1),
    (3, 4),
    (4, 2);