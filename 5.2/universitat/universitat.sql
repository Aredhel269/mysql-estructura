-- Base de dades Universidad --
DROP DATABASE IF EXISTS universidad;
CREATE DATABASE universidad CHARACTER SET utf8mb4;
USE universidad;
CREATE TABLE departamento (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
CREATE TABLE persona (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    tipo ENUM('profesor', 'alumno') NOT NULL
);
CREATE TABLE profesor (
    id_profesor INT UNSIGNED PRIMARY KEY,
    id_departamento INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES persona(id),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);
CREATE TABLE grado (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
CREATE TABLE asignatura (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT UNSIGNED NOT NULL,
    tipo ENUM('básica', 'obligatoria', 'optativa') NOT NULL,
    curso TINYINT UNSIGNED NOT NULL,
    cuatrimestre TINYINT UNSIGNED NOT NULL,
    id_profesor INT UNSIGNED,
    id_grado INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY(id_grado) REFERENCES grado(id)
);
CREATE TABLE curso_escolar (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    anyo_inicio YEAR NOT NULL,
    anyo_fin YEAR NOT NULL
);
CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT UNSIGNED NOT NULL,
    id_asignatura INT UNSIGNED NOT NULL,
    id_curso_escolar INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES persona(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);
/* Departamento */
INSERT INTO departamento
VALUES (1, 'Informática');
INSERT INTO departamento
VALUES (2, 'Matemáticas');
INSERT INTO departamento
VALUES (3, 'Economía y Empresa');
INSERT INTO departamento
VALUES (4, 'Educación');
INSERT INTO departamento
VALUES (5, 'Agronomía');
INSERT INTO departamento
VALUES (6, 'Química y Física');
INSERT INTO departamento
VALUES (7, 'Filología');
INSERT INTO departamento
VALUES (8, 'Derecho');
INSERT INTO departamento
VALUES (9, 'Biología y Geología');
/* Persona */
INSERT INTO persona
VALUES (
        1,
        '26902806M',
        'Salvador',
        'Sánchez',
        'Pérez',
        'Almería',
        'C/ Real del barrio alto',
        '950254837',
        '1991/03/28',
        'H',
        'alumno'
    );
INSERT INTO persona
VALUES (
        2,
        '89542419S',
        'Juan',
        'Saez',
        'Vega',
        'Almería',
        'C/ Mercurio',
        '618253876',
        '1992/08/08',
        'H',
        'alumno'
    );
INSERT INTO persona
VALUES (
        3,
        '11105554G',
        'Zoe',
        'Ramirez',
        'Gea',
        'Almería',
        'C/ Marte',
        '618223876',
        '1979/08/19',
        'M',
        'profesor'
    );
INSERT INTO persona
VALUES (
        4,
        '17105885A',
        'Pedro',
        'Heller',
        'Pagac',
        'Almería',
        'C/ Estrella fugaz',
        NULL,
        '2000/10/05',
        'H',
        'alumno'
    );
INSERT INTO persona
VALUES (
        5,
        '38223286T',
        'David',
        'Schmidt',
        'Fisher',
        'Almería',
        'C/ Venus',
        '678516294',
        '1978/01/19',
        'H',
        'profesor'
    );
INSERT INTO persona
VALUES (
        6,
        '04233869Y',
        'José',
        'Koss',
        'Bayer',
        'Almería',
        'C/ Júpiter',
        '628349590',
        '1998/01/28',
        'H',
        'alumno'
    );
INSERT INTO persona
VALUES (
        7,
        '97258166K',
        'Ismael',
        'Strosin',
        'Turcotte',
        'Almería',
        'C/ Neptuno',
        NULL,
        '1999/05/24',
        'H',
        'alumno'
    );
INSERT INTO persona
VALUES (
        8,
        '79503962T',
        'Cristina',
        'Lemke',
        'Rutherford',
        'Almería',
        'C/ Saturno',
        '669162534',
        '1977/08/21',
        'M',
        'profesor'
    );
INSERT INTO persona
VALUES (
        9,
        '82842571K',
        'Ramón',
        'Herzog',
        'Tremblay',
        'Almería',
        'C/ Urano',
        '626351429',
        '1996/11/21',
        'H',
        'alumno'
    );
INSERT INTO persona
VALUES (
        10,
        '61142000L',
        'Esther',
        'Spencer',
        'Lakin',
        'Almería',
        'C/ Plutón',
        NULL,
        '1977/05/19',
        'M',
        'profesor'
    );
INSERT INTO persona
VALUES (
        11,
        '46900725E',
        'Daniel',
        'Herman',
        'Pacocha',
        'Almería',
        'C/ Andarax',
        '679837625',
        '1997/04/26',
        'H',
        'alumno'
    );
INSERT INTO persona
VALUES (
        12,
        '85366986W',
        'Carmen',
        'Streich',
        'Hirthe',
        'Almería',
        'C/ Almanzora',
        NULL,
        '1971-04-29',
        'M',
        'profesor'
    );
INSERT INTO persona
VALUES (
        13,
        '73571384L',
        'Alfredo',
        'Stiedemann',
        'Morissette',
        'Almería',
        'C/ Guadalquivir',
        '950896725',
        '1980/02/01',
        'H',
        'profesor'
    );
INSERT INTO persona
VALUES (
        14,
        '82937751G',
        'Manolo',
        'Hamill',
        'Kozey',
        'Almería',
        'C/ Duero',
        '950263514',
        '1977/01/02',
        'H',
        'profesor'
    );
INSERT INTO persona
VALUES (
        15,
        '80502866Z',
        'Alejandro',
        'Kohler',
        'Schoen',
        'Almería',
        'C/ Tajo',
        '668726354',
        '1980/03/14',
        'H',
        'profesor'
    );
INSERT INTO persona
VALUES (
        16,
        '10485008K',
        'Antonio',
        'Fahey',
        'Considine',
        'Almería',
        'C/ Sierra de los Filabres',
        NULL,
        '1982/03/18',
        'H',
        'profesor'
    );
INSERT INTO persona
VALUES (
        17,
        '85869555K',
        'Guillermo',
        'Ruecker',
        'Upton',
        'Almería',
        'C/ Sierra de Gádor',
        NULL,
        '1973/05/05',
        'H',
        'profesor'
    );
INSERT INTO persona
VALUES (
        18,
        '04326833G',
        'Micaela',
        'Monahan',
        'Murray',
        'Almería',
        'C/ Veleta',
        '662765413',
        '1976/02/25',
        'H',
        'profesor'
    );
INSERT INTO persona
VALUES (
        19,
        '11578526G',
        'Inma',
        'Lakin',
        'Yundt',
        'Almería',
        'C/ Picos de Europa',
        '678652431',
        '1998/09/01',
        'M',
        'alumno'
    );
INSERT INTO persona
VALUES (
        20,
        '79221403L',
        'Francesca',
        'Schowalter',
        'Muller',
        'Almería',
        'C/ Quinto pino',
        NULL,
        '1980/10/31',
        'H',
        'profesor'
    );
INSERT INTO persona
VALUES (
        21,
        '79089577Y',
        'Juan',
        'Gutiérrez',
        'López',
        'Almería',
        'C/ Los pinos',
        '678652431',
        '1998/01/01',
        'H',
        'alumno'
    );
INSERT INTO persona
VALUES (
        22,
        '41491230N',
        'Antonio',
        'Domínguez',
        'Guerrero',
        'Almería',
        'C/ Cabo de Gata',
        '626652498',
        '1999/02/11',
        'H',
        'alumno'
    );
INSERT INTO persona
VALUES (
        23,
        '64753215G',
        'Irene',
        'Hernández',
        'Martínez',
        'Almería',
        'C/ Zapillo',
        '628452384',
        '1996/03/12',
        'M',
        'alumno'
    );
INSERT INTO persona
VALUES (
        24,
        '85135690V',
        'Sonia',
        'Gea',
        'Ruiz',
        'Almería',
        'C/ Mercurio',
        '678812017',
        '1995/04/13',
        'M',
        'alumno'
    );
/* Profesor */
INSERT INTO profesor
VALUES (3, 1);
INSERT INTO profesor
VALUES (5, 2);
INSERT INTO profesor
VALUES (8, 3);
INSERT INTO profesor
VALUES (10, 4);
INSERT INTO profesor
VALUES (12, 4);
INSERT INTO profesor
VALUES (13, 6);
INSERT INTO profesor
VALUES (14, 1);
INSERT INTO profesor
VALUES (15, 2);
INSERT INTO profesor
VALUES (16, 3);
INSERT INTO profesor
VALUES (17, 4);
INSERT INTO profesor
VALUES (18, 5);
INSERT INTO profesor
VALUES (20, 6);
/* Grado */
INSERT INTO grado
VALUES (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
INSERT INTO grado
VALUES (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
INSERT INTO grado
VALUES (
        3,
        'Grado en Ingeniería Electrónica Industrial (Plan 2010)'
    );
INSERT INTO grado
VALUES (4, 'Grado en Ingeniería Informática (Plan 2015)');
INSERT INTO grado
VALUES (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
INSERT INTO grado
VALUES (
        6,
        'Grado en Ingeniería Química Industrial (Plan 2010)'
    );
INSERT INTO grado
VALUES (7, 'Grado en Biotecnología (Plan 2015)');
INSERT INTO grado
VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO grado
VALUES (9, 'Grado en Matemáticas (Plan 2010)');
INSERT INTO grado
VALUES (10, 'Grado en Química (Plan 2009)');
/* Asignatura */
INSERT INTO asignatura
VALUES (
        1,
        'Álgegra lineal y matemática discreta',
        6,
        'básica',
        1,
        1,
        3,
        4
    );
INSERT INTO asignatura
VALUES (2, 'Cálculo', 6, 'básica', 1, 1, 14, 4);
INSERT INTO asignatura
VALUES (
        3,
        'Física para informática',
        6,
        'básica',
        1,
        1,
        3,
        4
    );
INSERT INTO asignatura
VALUES (
        4,
        'Introducción a la programación',
        6,
        'básica',
        1,
        1,
        14,
        4
    );
INSERT INTO asignatura
VALUES (
        5,
        'Organización y gestión de empresas',
        6,
        'básica',
        1,
        1,
        3,
        4
    );
INSERT INTO asignatura
VALUES (6, 'Estadística', 6, 'básica', 1, 2, 14, 4);
INSERT INTO asignatura
VALUES (
        7,
        'Estructura y tecnología de computadores',
        6,
        'básica',
        1,
        2,
        3,
        4
    );
INSERT INTO asignatura
VALUES (
        8,
        'Fundamentos de electrónica',
        6,
        'básica',
        1,
        2,
        14,
        4
    );
INSERT INTO asignatura
VALUES (
        9,
        'Lógica y algorítmica',
        6,
        'básica',
        1,
        2,
        3,
        4
    );
INSERT INTO asignatura
VALUES (
        10,
        'Metodología de la programación',
        6,
        'básica',
        1,
        2,
        14,
        4
    );
INSERT INTO asignatura
VALUES (
        11,
        'Arquitectura de Computadores',
        6,
        'básica',
        2,
        1,
        3,
        4
    );
INSERT INTO asignatura
VALUES (
        12,
        'Estructura de Datos y Algoritmos I',
        6,
        'obligatoria',
        2,
        1,
        3,
        4
    );
INSERT INTO asignatura
VALUES (
        13,
        'Ingeniería del Software',
        6,
        'obligatoria',
        2,
        1,
        14,
        4
    );
INSERT INTO asignatura
VALUES (
        14,
        'Sistemas Inteligentes',
        6,
        'obligatoria',
        2,
        1,
        3,
        4
    );
INSERT INTO asignatura
VALUES (
        15,
        'Sistemas Operativos',
        6,
        'obligatoria',
        2,
        1,
        14,
        4
    );
INSERT INTO asignatura
VALUES (16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4);
INSERT INTO asignatura
VALUES (
        17,
        'Estructura de Datos y Algoritmos II',
        6,
        'obligatoria',
        2,
        2,
        14,
        4
    );
INSERT INTO asignatura
VALUES (
        18,
        'Fundamentos de Redes de Computadores',
        6,
        'obligatoria',
        2,
        2,
        3,
        4
    );
INSERT INTO asignatura
VALUES (
        19,
        'Planificación y Gestión de Proyectos Informáticos',
        6,
        'obligatoria',
        2,
        2,
        3,
        4
    );
INSERT INTO asignatura
VALUES (
        20,
        'Programación de Servicios Software',
        6,
        'obligatoria',
        2,
        2,
        14,
        4
    );
INSERT INTO asignatura
VALUES (
        21,
        'Desarrollo de interfaces de usuario',
        6,
        'obligatoria',
        3,
        1,
        14,
        4
    );
INSERT INTO asignatura
VALUES (
        22,
        'Ingeniería de Requisitos',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        23,
        'Integración de las Tecnologías de la Información en las Organizaciones',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        24,
        'Modelado y Diseño del Software 1',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        25,
        'Multiprocesadores',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        26,
        'Seguridad y cumplimiento normativo',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        27,
        'Sistema de Información para las Organizaciones',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        28,
        'Tecnologías web',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        29,
        'Teoría de códigos y criptografía',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        30,
        'Administración de bases de datos',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        31,
        'Herramientas y Métodos de Ingeniería del Software',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        32,
        'Informática industrial y robótica',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        33,
        'Ingeniería de Sistemas de Información',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        34,
        'Modelado y Diseño del Software 2',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        35,
        'Negocio Electrónico',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        36,
        'Periféricos e interfaces',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        37,
        'Sistemas de tiempo real',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        38,
        'Tecnologías de acceso a red',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        39,
        'Tratamiento digital de imágenes',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        40,
        'Administración de redes y sistemas operativos',
        6,
        'optativa',
        4,
        1,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        41,
        'Almacenes de Datos',
        6,
        'optativa',
        4,
        1,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        42,
        'Fiabilidad y Gestión de Riesgos',
        6,
        'optativa',
        4,
        1,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        43,
        'Líneas de Productos Software',
        6,
        'optativa',
        4,
        1,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        44,
        'Procesos de Ingeniería del Software 1',
        6,
        'optativa',
        4,
        1,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        45,
        'Tecnologías multimedia',
        6,
        'optativa',
        4,
        1,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        46,
        'Análisis y planificación de las TI',
        6,
        'optativa',
        4,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        47,
        'Desarrollo Rápido de Aplicaciones',
        6,
        'optativa',
        4,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        48,
        'Gestión de la Calidad y de la Innovación Tecnológica',
        6,
        'optativa',
        4,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        49,
        'Inteligencia del Negocio',
        6,
        'optativa',
        4,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        50,
        'Procesos de Ingeniería del Software 2',
        6,
        'optativa',
        4,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        51,
        'Seguridad Informática',
        6,
        'optativa',
        4,
        2,
        NULL,
        4
    );
INSERT INTO asignatura
VALUES (
        52,
        'Biologia celular',
        6,
        'básica',
        1,
        1,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (53, 'Física', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura
VALUES (54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura
VALUES (
        55,
        'Química general',
        6,
        'básica',
        1,
        1,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        56,
        'Química orgánica',
        6,
        'básica',
        1,
        1,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        57,
        'Biología vegetal y animal',
        6,
        'básica',
        1,
        2,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura
VALUES (59, 'Genética', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura
VALUES (60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura
VALUES (61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura
VALUES (
        62,
        'Botánica agrícola',
        6,
        'obligatoria',
        2,
        1,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        63,
        'Fisiología vegetal',
        6,
        'obligatoria',
        2,
        1,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        64,
        'Genética molecular',
        6,
        'obligatoria',
        2,
        1,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        65,
        'Ingeniería bioquímica',
        6,
        'obligatoria',
        2,
        1,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        66,
        'Termodinámica y cinética química aplicada',
        6,
        'obligatoria',
        2,
        1,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        67,
        'Biorreactores',
        6,
        'obligatoria',
        2,
        2,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        68,
        'Biotecnología microbiana',
        6,
        'obligatoria',
        2,
        2,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        69,
        'Ingeniería genética',
        6,
        'obligatoria',
        2,
        2,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        70,
        'Inmunología',
        6,
        'obligatoria',
        2,
        2,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura
VALUES (
        72,
        'Bases moleculares del desarrollo vegetal',
        4.5,
        'obligatoria',
        3,
        1,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        73,
        'Fisiología animal',
        4.5,
        'obligatoria',
        3,
        1,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        74,
        'Metabolismo y biosíntesis de biomoléculas',
        6,
        'obligatoria',
        3,
        1,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        75,
        'Operaciones de separación',
        6,
        'obligatoria',
        3,
        1,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        76,
        'Patología molecular de plantas',
        4.5,
        'obligatoria',
        3,
        1,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        77,
        'Técnicas instrumentales básicas',
        4.5,
        'obligatoria',
        3,
        1,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        78,
        'Bioinformática',
        4.5,
        'obligatoria',
        3,
        2,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        79,
        'Biotecnología de los productos hortofrutículas',
        4.5,
        'obligatoria',
        3,
        2,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        80,
        'Biotecnología vegetal',
        6,
        'obligatoria',
        3,
        2,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        81,
        'Genómica y proteómica',
        4.5,
        'obligatoria',
        3,
        2,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        82,
        'Procesos biotecnológicos',
        6,
        'obligatoria',
        3,
        2,
        NULL,
        7
    );
INSERT INTO asignatura
VALUES (
        83,
        'Técnicas instrumentales avanzadas',
        4.5,
        'obligatoria',
        3,
        2,
        NULL,
        7
    );
/* Curso escolar */
INSERT INTO curso_escolar
VALUES (1, 2014, 2015);
INSERT INTO curso_escolar
VALUES (2, 2015, 2016);
INSERT INTO curso_escolar
VALUES (3, 2016, 2017);
INSERT INTO curso_escolar
VALUES (4, 2017, 2018);
INSERT INTO curso_escolar
VALUES (5, 2018, 2019);
/* Alumno se matricula en asignatura */
INSERT INTO alumno_se_matricula_asignatura
VALUES (1, 1, 1);
INSERT INTO alumno_se_matricula_asignatura
VALUES (1, 2, 1);
INSERT INTO alumno_se_matricula_asignatura
VALUES (1, 3, 1);
INSERT INTO alumno_se_matricula_asignatura
VALUES (2, 1, 1);
INSERT INTO alumno_se_matricula_asignatura
VALUES (2, 2, 1);
INSERT INTO alumno_se_matricula_asignatura
VALUES (2, 3, 1);
INSERT INTO alumno_se_matricula_asignatura
VALUES (4, 1, 1);
INSERT INTO alumno_se_matricula_asignatura
VALUES (4, 2, 1);
INSERT INTO alumno_se_matricula_asignatura
VALUES (4, 3, 1);
INSERT INTO alumno_se_matricula_asignatura
VALUES (24, 1, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (24, 2, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (24, 3, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (24, 4, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (24, 5, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (24, 6, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (24, 7, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (24, 8, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (24, 9, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (24, 10, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (23, 1, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (23, 2, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (23, 3, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (23, 4, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (23, 5, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (23, 6, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (23, 7, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (23, 8, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (23, 9, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (23, 10, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (19, 1, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (19, 2, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (19, 3, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (19, 4, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (19, 5, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (19, 6, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (19, 7, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (19, 8, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (19, 9, 5);
INSERT INTO alumno_se_matricula_asignatura
VALUES (19, 10, 5);
-- 1 Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1,
    apellido2,
    nombre
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1 ASC,
    apellido2,
    nombre;
-- 2 Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT apellido1,
    apellido2,
    nombre
FROM persona
WHERE tipo = 'alumno'
    and telefono is null;
-- 3 Retorna el llistat dels alumnes que van néixer en 1999.
SELECT apellido1,
    apellido2,
    nombre
FROM persona
WHERE tipo = 'alumno'
    and year(fecha_nacimiento) = '1999';
-- 4 Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT apellido1,
    apellido2,
    nombre
FROM persona
WHERE tipo = 'profesor'
    and telefono is null
    and nif LIKE '%K';
-- 5 Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
select nombre
from asignatura
where cuatrimestre = 1
    and curso = 3
    and id_grado = 7;
-- 6 Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT persona.apellido1,
    persona.apellido2,
    persona.nombre,
    departamento.nombre as 'departamento'
FROM persona
    JOIN profesor ON persona.id = profesor.id_profesor
    JOIN departamento ON profesor.id_departamento = departamento.id
WHERE persona.tipo = 'profesor'
ORDER BY persona.apellido1 ASC,
    persona.apellido2,
    persona.nombre;
-- 7 Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
select a.nombre,
    c.anyo_inicio as inici,
    c.anyo_fin as fin
from alumno_se_matricula_asignatura am
    INNER JOIN asignatura a ON am.id_asignatura = a.id
    INNER JOIN persona p ON p.id = am.id_alumno
    INNER JOIN curso_escolar c ON c.id = am.id_curso_escolar
WHERE p.nif = '26902806M';
-- 8 Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT d.nombre AS departament
FROM profesor P
    INNER JOIN departamento d ON d.id = p.id_departamento
    INNER JOIN asignatura a ON a.id_profesor = p.id_profesor
    INNER JOIN grado g ON g.id = a.id_grado
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)'
GROUP BY d.nombre;
-- 9 Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT p.nombre,
    p.apellido1,
    p.apellido2
FROM persona p
    JOIN alumno_se_matricula_asignatura ce ON p.id = ce.id_alumno
    JOIN curso_escolar c ON ce.id_curso_escolar = c.id
WHERE c.anyo_inicio = 2018
    AND c.anyo_fin = 2019;
-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
-- 10 Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre AS departament,
    p.apellido1,
    p.apellido2,
    p.nombre
FROM persona p
    LEFT JOIN profesor pf ON p.id = pf.id_profesor
    LEFT JOIN departamento d ON d.id = pf.id_departamento
ORDER BY d.nombre ASC,
    p.apellido1 ASC,
    p.apellido2 ASC,
    p.nombre ASC;
-- 11 Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT p.nombre,
    p.apellido1,
    p.apellido2
FROM persona p
    LEFT JOIN profesor pf ON p.id = pf.id_profesor
WHERE pf.id_departamento IS NULL
    AND p.tipo = 'profesor';
-- 12 Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT d.nombre
FROM departamento d
    LEFT JOIN profesor p ON d.id = p.id_departamento
WHERE p.id_departamento IS NULL;
-- 13 Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT p.apellido1,
    p.apellido2,
    p.nombre,
    a.nombre AS assignatura
FROM persona p
    LEFT JOIN profesor pf ON p.id = pf.id_profesor
    LEFT JOIN asignatura a ON pf.id_profesor = a.id_profesor
WHERE a.id_profesor IS NULL;
-- 14 Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT a.nombre,
    p.nombre AS professor
FROM asignatura a
    LEFT JOIN profesor pf ON a.id_profesor = pf.id_profesor
    LEFT JOIN persona p ON pf.id_profesor = p.id
WHERE pf.id_profesor IS NULL;
-- 15 Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT DISTINCT d.id,
    d.nombre
FROM departamento d
    LEFT JOIN profesor p ON d.id = p.id_departamento
    LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor
    LEFT JOIN curso_escolar c ON a.id = c.id
WHERE a.id IS NULL;
-- Consultes resum:
-- 16 Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(*) AS total_alumnes
FROM persona
WHERE tipo = 'alumno';
-- 17 Calcula quants alumnes van néixer en 1999.
SELECT COUNT(*) AS alumnes1999
FROM persona
WHERE tipo = 'alumno'
    AND YEAR(fecha_nacimiento) = 1999;
-- 18 Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT d.nombre AS nom_departament,
    COUNT(p.id_profesor) AS número_professors
FROM departamento d
    LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre
HAVING COUNT(p.id_profesor) > 0
ORDER BY número_professors DESC;
-- 19 Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT d.nombre AS departament,
    COUNT(p.id_profesor) AS número_professors
FROM departamento d
    LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre
ORDER BY número_professors DESC;
-- 20 Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT grado.nombre AS grau,
    COUNT(a.id) AS número_assignatures
FROM grado
    LEFT JOIN asignatura a ON grado.id = a.id_grado
GROUP BY grado.nombre
ORDER BY número_assignatures DESC;
-- 21 Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
-- 22 Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
-- 23 Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
-- 24 Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
-- 25 Retorna totes les dades de l'alumne/a més jove.
-- 26 Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.