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
CREATE TABLE pizza (
    idpz INT PRIMARY KEY AUTO_INCREMENT,
    tipus VARCHAR(255) NOT NULL
);
CREATE TABLE productes (
    idp INT PRIMARY KEY AUTO_INCREMENT,
    id_pizza INT,
    nom VARCHAR(255) NOT NULL,
    descripcio TEXT NOT NULL,
    imatge TEXT NOT NULL,
    preu FLOAT NOT NULL,
    FOREIGN KEY (id_pizza) REFERENCES pizza (idpz)
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
    tipus VARCHAR(255) NOT NULL
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
        'Maria',
        'Roca',
        '123 Carrer Major',
        08001,
        'Barcelona',
        'Barcelona',
        '123456789'
    ),
    (
        'David',
        'Martí',
        '456 Avinguda Gran',
        08002,
        'Barcelona',
        'Barcelona',
        '987654321'
    ),
    (
        'Laura',
        'Anglada',
        '789 Carrer Petit',
        08003,
        'Barcelona',
        'Barcelona',
        '456789123'
    ),
    (
        'Carles',
        'Puig',
        '101 Carrer Llarg',
        08004,
        'Barcelona',
        'Barcelona',
        '321654987'
    ),
    (
        'Sara',
        'Gual',
        '234 Passeig Estret',
        08005,
        'Barcelona',
        'Barcelona',
        '789123456'
    ),
    (
        'Xavi',
        'Díaz',
        '567 Carrer Fosc',
        08006,
        'Barcelona',
        'Barcelona',
        '456123789'
    ),
    (
        'Anna',
        'Marí',
        '890 Travessera Brillant',
        08007,
        'Barcelona',
        'Barcelona',
        '147258369'
    ),
    (
        'Pau',
        'Gonzàlez',
        '111 Carrer Corts',
        08008,
        'Barcelona',
        'Barcelona',
        '369258147'
    ),
    (
        'Helena',
        'Rodríguez',
        '222 Carrer Verge',
        08009,
        'Barcelona',
        'Barcelona',
        '258369147'
    ),
    (
        'Marc',
        'Sánchez',
        '333 Carrer Sagrat',
        08010,
        'Barcelona',
        'Barcelona',
        '147369258'
    ),
    (
        'Andrea',
        'Vidal',
        '444 Avinguda Jove',
        08011,
        'Esplugues',
        'Barcelona',
        '369147258'
    ),
    (
        'Ernest',
        'Solà',
        '555 Carrer Vell',
        08012,
        'Esplugues',
        'Barcelona',
        '258147369'
    ),
    (
        'Cristina',
        'Mora',
        '666 Carrer Pla',
        08013,
        'Esplugues',
        'Barcelona',
        '147258369'
    ),
    (
        'Ricard',
        'Vila',
        '777 Plaça del Nou',
        08014,
        'Esplugues',
        'Barcelona',
        '369147258'
    ),
    (
        'Patricia',
        'Juvanteny',
        '888 Carrer Bell',
        08015,
        'Esplugues',
        'Barcelona',
        '258369147'
    ),
    (
        'Judit',
        'Coll',
        '999 Plaça de la Torre',
        08016,
        'Esplugues',
        'Barcelona',
        '147258369'
    );
INSERT INTO tipusComanda (tipus)
VALUES ('domicili'),
    ('botiga');
INSERT INTO pizza (tipus)
VALUES ('Margarita'),
    ('Pepperoni'),
    ('Hawaiana'),
    ('Quatre formatges'),
    ('Vegana'),
    ('Napolitana'),
    ('Prosciutto e funghi'),
    ('Carbonara'),
    ('Marinera');
INSERT INTO productes (
        id_pizza,
        nom,
        descripcio,
        imatge,
        preu
    )
VALUES (
        1,
        'pizza',
        'join speak rays rock valuable spin reader per steep complete path jump win sudden upper aware seeing about proper gravity same bill successful former',
        'http://koskedoc.cg/cangabva.jpg',
        10.45
    ),
    (
        NULL,
        'hamburguesa',
        'wall raw include complete language human gate order operation said market level one card understanding fish adjective mountain vessels trunk about lesson paper rope',
        'http://igo.bn/hiabgu.jpg',
        8.95
    ),
    (
        NULL,
        'beguda',
        'pound statement will merely built crowd having struggle share who human as wish piece egg frequently consonant bad hill problem degree remember pay introduced',
        'http://buj.nu/kiu.jpg',
        2.45
    ),
    (
        3,
        'pizza',
        'storm health tail spin took ran fight ten tiny environment mine eleven everybody younger broken first friend wooden hot caught until mail too wonderful',
        'http://go.tg/rohravi.jpg',
        15.45
    ),
    (
        4,
        'pizza',
        'rocky ill aid surrounded meat ahead hard forest design split buy on return anything individual improve who saddle halfway tired spin without bottle making',
        'http://ozopete.pm/lavazguc.jpg',
        18.55
    ),
    (
        NULL,
        'beguda',
        'bad suit luck successful underline plate audience process porch nature pleasure birthday love alone friend but board accident grade continued water how ability flat',
        'http://sij.ag/ilupefi.jpg',
        1.75
    ),
    (
        NULL,
        'hamburguesa',
        'wheel fell means summer daughter remarkable giving famous thumb teacher orange distance village stop fresh soon fifty burst universe above fix industrial gravity gone',
        'http://ipeki.com/gakni.jpg',
        9.89
    ),
    (
        NULL,
        'beguda',
        'arrive write pour on dot take spoken speech quietly two mighty feel sign hardly screen proper mostly clay mile quiet interest breath chosen negative',
        'http://naifpiw.eu/irsalap.jpg',
        4.50
    ),
    (
        1,
        'pizza',
        'slide ahead mad fellow hurried fireplace society crack another explanation that weather height plastic chair exactly usual vertical find discuss kind tip choose wheat',
        'http://fodere.gw/ro.jpg',
        12.35
    ),
    (
        NULL,
        'hamburguesa',
        'near inch report indicate seldom wore negative become season element might information throughout almost glass enter therefore bit sold oxygen eager chain planned life',
        'http://fajsobe.sb/pi.jpg',
        6.95
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
        'Barcelona',
        'Aruba'
    ),
    (
        '1613 Naegi Trail',
        78175,
        'Esplugues',
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
        'Carlota',
        'French',
        '596437236',
        '791996065'
    ),
    (
        1,
        2,
        'Quim',
        'Roy',
        '766796860',
        '939908142'
    ),
    (
        2,
        1,
        'Joel',
        'Black',
        '150142347',
        '938655262'
    ),
    (
        2,
        2,
        'Adrià',
        'Hudson',
        '393608349',
        '667534669'
    ),
    (
        1,
        2,
        'Ester',
        'Rogers',
        '222447756',
        '971160499'
    );
INSERT INTO repartidor (id_empleat, id_comanda)
VALUES (2, 1),
    (2, 2),
    (4, 3),
    (5, 4),
    (4, 5),
    (2, 6),
    (4, 7),
    (5, 8),
    (4, 9),
    (2, 10),
    (2, 11),
    (4, 12),
    (4, 13),
    (2, 14),
    (4, 15);
-- Begudes venudes a Barcelona --   
SELECT c.localitat,
    COUNT(*) AS begudes_vendudes
FROM comanda co
    INNER JOIN productes p ON co.id_productes = p.idp
    INNER JOIN client c ON co.id_client = c.idcl
WHERE p.nom = 'beguda'
GROUP BY c.localitat;
-- Comandes efectuades pel repartidor 'Quim' --
SELECT e.nom,
    COUNT(*) AS comandes_efectuades
FROM empleat e
    INNER JOIN repartidor r ON e.ide = r.id_empleat
where e.nom = 'Quim';