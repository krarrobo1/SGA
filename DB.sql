
/* Categorias*/
CREATE TABLE IF NOT EXISTS CATEGORY
(
    id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(80),
    categoryid INTEGER DEFAULT NULL references CATEGORY(id)
);
INSERT INTO CATEGORY(NAME, description, CATEGORYID) 
VALUES 
('Role', 'Hace referencia al catálogo de roles identificados dentro de la organización.', NULL),
('Estudiante', 'Estudiantes en general', 1),
('Docente', 'Docentes en general', 1),
('Administrador', 'Administrador del sistema',1),
('Invitado', 'Invitados en general',1),

('Keywords', 'Hace referencia al catálogo de palabras clave de un post', NULL),
('Emprendimiento', 'palabra clave', 6),
('Docencia', 'palabra clave',6),
('Investigacion', 'palabra clave', 6),
('Innovación', 'palabra clave', 6);


/*Usuarios*/
CREATE TABLE IF NOT EXISTS USERS
(
    ci VARCHAR(10) UNIQUE PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    lastname VARCHAR(80) NOT NULL,
    dateofbirth DATE,
    role INTEGER references CATEGORY(id),
    titulationid INTEGER references TITULATION(id),
    status BOOLEAN DEFAULT true 
);

/*Credenciales*/
CREATE TABLE IF NOT EXISTS CREDENTIALS
(
    email VARCHAR UNIQUE NOT NULL,
    password VARCHAR NOT NULL,
    userid VARCHAR(10) references USERS(ci)
);


/*Publicaciones*/

-- CREATE TABLE IF NOT EXISTS POSTS
-- (
--     id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
--     title VARCHAR,
--     body TEXT,
--     autorid VARCHAR(10) references USERS(ci),
--     createdat TIMESTAMP
-- );

/*Publicaciones*/

CREATE TABLE IF NOT EXISTS POSTS
(
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    createdAt TIMESTAMP with time zone DEFAULT now(),
    updatedAt TIMESTAMP with time zone DEFAULT now(),
    description VARCHAR,
    autorid VARCHAR(10) references USERS(ci),
    content TEXT,
    title VARCHAR,
    categoryid integer references CATEGORY(id),
    isPublic BOOLEAN DEFAULT false
);

/*Publicaciones-keywords*/
CREATE TABLE IF NOT EXISTS POSTS_HAS_KEYWORDS
(
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    postid integer references POSTS(id),
    keywordid integer references CATEGORY(id)
);

INSERT INTO USERS(CI, NAME, LASTNAME, DATEOFBIRTH, ROLE, titulationid)
VALUES ('1105587388','Richard', 'Arrobo', '1998-07-03', 4, 18);


INSERT INTO CREDENTIALS(EMAIL, PASSWORD, USERID)
VALUES('krarrobo1@utpl.edu.ec', '$2a$10$EFFIT0nxB2JGi2BvZvAT2uSHq2YBohOsJu.HFgjpthdxYpJNaBDhG', '1105587388');

/* Assets */
CREATE TABLE IF NOT EXISTS ASSETS
(
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    title  VARCHAR(80),
    assetUrl VARCHAR,
    publicId VARCHAR NOT NULL,
    categoryid integer references CATEGORY(id),
    userid VARCHAR references USERS(ci)
);


-- POSIBLE EDICION DE LA TABLA


-- CREATE TABLE IF NOT EXISTS CATEGORYTEST
-- (
-- 	category VARCHAR(10) NOT NULL,
--     id integer,
--     name VARCHAR(50) NOT NULL,
--     description VARCHAR(80),
-- 	primary key(category,id)
-- );

-- INSERT INTO CATEGORYTEST(CATEGORY, ID ,NAME, description) //Subir heroku
-- VALUES 
-- ('Role',1,'Estudiante', 'Estudiantes en general'),
-- ('Role',2,'Docente', 'Docentes en general'),
-- ('Role',3,'Administrador', 'Administrador del sistema'),
-- ('Role',4,'Invitado', 'Invitados en general'),

-- ('Keywords',1,'Emprendimiento', 'palabra clave'),
-- ('Keywords',2,'Docencia', 'palabra clave'),
-- ('Keywords',3,'Investigacion', 'palabra clave'),
-- ('Keywords',4,'Innovación', 'palabra clave');

CREATE TABLE IF NOT EXISTS TITULATION
(
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(80) NOT NULL,
    description VARCHAR(180),
    areaid INTEGER DEFAULT NULL references TITULATION(id)
);

INSERT INTO TITULATION(name, description, areaid) 
VALUES 
('Area Administrativa', 'Area Administrativa Descripcion', NULL),
('Area Sociohumanistica', 'Area Sociohumanistica Descripcion', NULL),
('Area Biologica', 'Area Biologica Descripcion', NULL),
('Area Tecnica', 'Area Tecnica Descripcion', NULL),
____________________________________
('Administracion de Empresas', 'Administracion de Empresas', 1),
('Economía', 'Economía', 1),
('Ingeniería en Contabilidad y Auditoría', 'Ingeniería en Contabilidad y Auditoría', 1),
('Licenciatura en Gastronomía', 'Licenciatura en Gastronomía', 1),

('Licenciado en Ciencias de la Educación mención Inglés', 'Licenciado en Ciencias de la Educación mención Inglés', 2),
('Licenciado en Psicología', 'Licenciado en Psicología', 2),
('Licenciado en Comunicación Social', 'Licenciado en Comunicación Social', 2),
('Licenciado en Relaciones Públicas', 'Licenciado en Relaciones Públicas', 2),

('Ingeniería Agropecuaria', 'Ingeniería Agropecuaria', 3),
('Ingeniería en Alimentos', 'Ingeniería en Alimentos', 3),
('Ingeniería Química', 'Ingeniería Química', 3),
('Ingeniería Industrial', 'Ingeniería Industrial', 3),

('Ingeniería en Electrónica y Telecomunicaciones', 'Ingeniería en Electrónica y Telecomunicaciones', 4),
('Sistemas Informáticos y Computación', 'Sistemas Informáticos y Computación', 4),
('Ingeniería en Geología y Minas', 'Ingeniería en Geología y Minas', 4),
('Ingeniería Civil', 'Ingeniería Civil', 4);