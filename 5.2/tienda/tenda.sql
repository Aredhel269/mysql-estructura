DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
CREATE TABLE fabricante (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
CREATE TABLE producto (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DOUBLE NOT NULL,
    codigo_fabricante INT UNSIGNED NOT NULL,
    FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);
INSERT INTO fabricante
VALUES(1, 'Asus');
INSERT INTO fabricante
VALUES(2, 'Lenovo');
INSERT INTO fabricante
VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante
VALUES(4, 'Samsung');
INSERT INTO fabricante
VALUES(5, 'Seagate');
INSERT INTO fabricante
VALUES(6, 'Crucial');
INSERT INTO fabricante
VALUES(7, 'Gigabyte');
INSERT INTO fabricante
VALUES(8, 'Huawei');
INSERT INTO fabricante
VALUES(9, 'Xiaomi');
INSERT INTO producto
VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto
VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto
VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto
VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto
VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto
VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto
VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto
VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto
VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto
VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto
VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
-- 1 Llista el nom de tots els productes que hi ha en la taula producto.
SELECT nombre
FROM producto;
-- 2 Llista els noms i els preus de tots els productes de la taula producto.
SELECT nombre,
    precio
FROM producto;
-- 3 Llista totes les columnes de la taula producto.
SELECT *
FROM producto;
-- 4 Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
SELECT nombre AS nom_de_producto,
    precio AS euros,
    precio * 1.08 AS 'dòlars'
FROM producto;
-- 5 Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre),
    precio
FROM producto;
-- 6 Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre),
    precio
FROM producto;
-- 7 Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre,
    UPPER(SUBSTRING(nombre, 1, 2)) AS dos_primers_caracters_maj
FROM fabricante;
-- 8 Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
SELECT nombre,
    ROUND(precio) as preu_round
FROM producto;
-- 9 Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre,
    cast(precio AS SIGNED) as preu_trunc
FROM producto;
-- 10 Llista el codi dels fabricants que tenen productes en la taula producto.
SELECT f.codigo AS fabricants_amb_productes
FROM producto p
    JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- 11 Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
SELECT distinct f.codigo AS fabricants_amb_productes
FROM producto p
    JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- 12 Llista els noms dels fabricants ordenats de manera ascendent.
select nombre
from fabricante
order by nombre asc;
-- 13 Llista els noms dels fabricants ordenats de manera descendent.
select nombre
from fabricante
order by nombre desc;
-- 14 Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
select nombre,
    precio
from producto
ORDER by nombre asc,
    precio desc;
-- 15 Retorna una llista amb les 5 primeres files de la taula fabricante.
select *
from fabricante
where codigo <= 5;
-- 16 Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
select *
from fabricante
where codigo >= 4;
-- 17 Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
SELECT nombre,
    precio
FROM producto
ORDER BY precio
LIMIT 1;
-- 18 Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre,
    precio
FROM producto
ORDER BY precio DESC
LIMIT 1;
-- 19 Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT producto.nombre
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.codigo = 2;
-- 20 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT producto.nombre,
    producto.precio,
    fabricante.nombre AS nom_fabricant
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
-- 21 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT producto.nombre AS nom_producte,
    producto.precio,
    fabricante.nombre AS nom_fabricant
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY nom_fabricant ASC;
-- 22 Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
SELECT producto.codigo AS codi_producte,
    producto.nombre AS nom_producte,
    fabricante.codigo AS codi_fabricant,
    fabricante.nombre AS nom_fabricant
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
-- 23 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT producto.nombre AS nom_producte,
    producto.precio,
    fabricante.nombre AS nom_fabricant
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio
LIMIT 1;
-- 24 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT producto.nombre AS nom_producte,
    producto.precio,
    fabricante.nombre AS nom_fabricant
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio DESC
LIMIT 1;
-- 25 Retorna una llista de tots els productes del fabricant Lenovo.
SELECT producto.nombre AS nom_producte,
    producto.precio,
    fabricante.nombre AS nom_fabricant
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Lenovo';
-- 26 Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT producto.nombre AS nom_producte,
    producto.precio,
    fabricante.nombre AS nom_fabricant
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Crucial'
    AND producto.precio > 200;
-- 27 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.
SELECT producto.nombre AS nom_producte,
    producto.precio,
    fabricante.nombre AS nom_fabricant
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.codigo = 1
    OR fabricante.codigo = 3
    OR fabricante.codigo = 5;
-- 28 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Fent servir l'operador IN.
SELECT producto.nombre AS nom_producte,
    producto.precio,
    fabricante.nombre AS nom_fabricant
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.codigo IN (1, 3, 5);
-- 29 Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT producto.nombre AS nom_producte,
    producto.precio,
    fabricante.nombre AS nom_fabricant
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE RIGHT(fabricante.nombre, 1) = 'e';
-- 30 Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT producto.nombre AS nom_producte,
    producto.precio,
    fabricante.nombre AS nom_fabricant
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE '%w%';
-- 31 Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT producto.nombre AS nom_producte,
    producto.precio,
    fabricante.nombre AS nom_fabricant
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio >= 180
ORDER BY producto.precio DESC,
    producto.nombre ASC;
-- 32 Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT fabricante.codigo AS codi_fabricant,
    fabricante.nombre AS nom_fabricant
FROM fabricante
    JOIN producto ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.codigo;
-- 33 Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT fabricante.codigo,
    fabricante.nombre,
    producto.nombre AS nom_producte,
    producto.precio
FROM fabricante
    LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
-- 34 Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT fabricante.codigo,
    fabricante.nombre
FROM fabricante
    LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.codigo_fabricante IS NULL;
-- 35 Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT producto.nombre,
    producto.precio
FROM producto,
    fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
    AND fabricante.codigo = 2;
-- 36 Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
SELECT producto.*
FROM producto,
    fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
    AND producto.precio = (
        SELECT MAX(precio)
        FROM producto
        WHERE codigo_fabricante = (
                SELECT codigo
                FROM fabricante
                WHERE codigo = 2
            )
    );
-- 37 Llista el nom del producte més car del fabricant Lenovo.
SELECT producto.nombre
FROM producto,
    fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
    AND fabricante.codigo = 2
ORDER BY producto.precio DESC
LIMIT 1;
-- 38 Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT producto.nombre
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.codigo = 3
ORDER BY producto.precio ASC
LIMIT 1;
-- 39 Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT nombre AS nom_producte,
    precio
FROM producto
WHERE precio >= (
        SELECT MAX(precio)
        FROM producto
        WHERE codigo_fabricante = 2
    );
-- 40 Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT nombre,
    precio
FROM producto
WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE codigo = 1
    )
    AND precio > (
        SELECT AVG(precio)
        FROM producto
        WHERE codigo_fabricante = 1
    );