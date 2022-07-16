CREATE DATABASE fase2

CREATE TABLE album (
    cod_album INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(200),
    fecha DATE,
    descripcion VARCHAR(200),
    imagen VARBINARY(MAX),
    artista_cod_artista INT NOT NULL,
    estado_cod_estado INT NOT NULL
);

CREATE TABLE artista (
    cod_artista INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(200),
    fecha_formacion DATE,
    imagen VARBINARY(MAX),
    descripcion VARCHAR(200),
    facebook VARCHAR(200),
    twitter VARCHAR(200),
    youtube VARCHAR(200),
    pag_web VARCHAR(200),
    pais_cod_pais INT NOT NULL,
    usuario_cod_usuario INT NOT NULL,
    estado_cod_estado INT NOT NULL
);

CREATE TABLE cancion (
    cod_cancion INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    cancion VARBINARY(MAX),
    nombre VARCHAR(200),
    album_cod_album INT NOT NULL
);

CREATE TABLE detalle_ga (
    cod_detalle INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    genero_cod_genero INT NOT NULL,
    artista_cod_artista INT NOT NULL
);

CREATE TABLE estado (
    cod_estado INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(200),
    fecha DATE
);

CREATE TABLE genero (
    cod_genero INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(200),
    imagen VARBINARY(MAX),
    estado_cod_estado INT NOT NULL
);

CREATE TABLE lista (
    cod_lista INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(200),
    usuario_cod_usuario INT NOT NULL
);

CREATE TABLE lista_cancion (
    cod_lc INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    lista_cod_lista INT NOT NULL,
    cancion_cod_cancion INT NOT NULL
);

CREATE TABLE pais (
    cod_pais INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(200)
);

CREATE TABLE tipo_usuario (
    cod_tipo INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(200)
);

CREATE TABLE usuario (
    cod_usuario INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    fecha_creacion DATE,
    fecha_nacimiento DATE,
    nombre VARCHAR(200),
    correo VARCHAR(200),
    password VARCHAR(200),
    usuario VARCHAR(200),
    tipo_usuario_cod_tipo INT NOT NULL
);

CREATE TABLE like_a (
	album_cod_album INT NOT NULL,
	usuario_cod_usuario INT NOT NULL,
	CONSTRAINT like_a_pk PRIMARY KEY ( album_cod_album, usuario_cod_usuario )
);

CREATE TABLE like_c (
	cancion_cod_cancion INT NOT NULL,
	usuario_cod_usuario INT NOT NULL,
	CONSTRAINT like_c_pk PRIMARY KEY ( cancion_cod_cancion, usuario_cod_usuario )
);

CREATE TABLE fav_album (
	album_cod_album INT NOT NULL,
	usuario_cod_usuario INT NOT NULL
);

CREATE TABLE comentario (
	cod_comentario INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	comentario VARCHAR(200),
	usuario_cod_usuario INT NOT NULL,
	album_cod_album INT NOT NULL
);

CREATE TABLE novedad (
	cod_novedad INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	titulo VARCHAR(200),
	contenido VARCHAR(200),
	imagen VARBINARY(MAX)
);

ALTER TABLE comentario
    ADD CONSTRAINT comentario_usuario_fk FOREIGN KEY ( usuario_cod_usuario )
        REFERENCES usuario ( cod_usuario ); 

ALTER TABLE comentario
    ADD CONSTRAINT comentario_album_fk FOREIGN KEY ( album_cod_album )
        REFERENCES album ( cod_album ); 

ALTER TABLE like_c
    ADD CONSTRAINT like_c_usuario FOREIGN KEY ( usuario_cod_usuario )
        REFERENCES usuario ( cod_usuario ); 

ALTER TABLE like_c
    ADD CONSTRAINT like_c_cancion FOREIGN KEY ( cancion_cod_cancion )
        REFERENCES cancion ( cod_cancion ); 

ALTER TABLE like_a
    ADD CONSTRAINT like_a_usuario FOREIGN KEY ( usuario_cod_usuario )
        REFERENCES usuario ( cod_usuario ); 

ALTER TABLE like_a
    ADD CONSTRAINT like_a_album FOREIGN KEY ( album_cod_album )
        REFERENCES album ( cod_album ); 

-- ALTER TABLE fav_album
 --   ADD CONSTRAINT fav_album_usuario FOREIGN KEY ( usuario_cod_usuario )
  --      REFERENCES usuario ( cod_usuario ); 

-- ALTER TABLE fav_album
 --   ADD CONSTRAINT fav_album_album FOREIGN KEY ( album_cod_album )
  --      REFERENCES album ( cod_album ); 

ALTER TABLE genero
    ADD CONSTRAINT genero_estado_fk FOREIGN KEY ( estado_cod_estado )
        REFERENCES estado ( cod_estado ); 

ALTER TABLE album
    ADD CONSTRAINT album_artista_fk FOREIGN KEY ( artista_cod_artista )
        REFERENCES artista ( cod_artista ); 

ALTER TABLE album
    ADD CONSTRAINT album_estado_fk FOREIGN KEY ( estado_cod_estado )
        REFERENCES estado ( cod_estado ); 

ALTER TABLE artista
    ADD CONSTRAINT artista_estado_fk FOREIGN KEY ( estado_cod_estado )
        REFERENCES estado ( cod_estado ); 

ALTER TABLE artista
    ADD CONSTRAINT artista_pais_fk FOREIGN KEY ( pais_cod_pais )
        REFERENCES pais ( cod_pais ); 

ALTER TABLE artista
    ADD CONSTRAINT artista_usuario_fk FOREIGN KEY ( usuario_cod_usuario )
        REFERENCES usuario ( cod_usuario ); 

ALTER TABLE cancion
    ADD CONSTRAINT cancion_album_fk FOREIGN KEY ( album_cod_album )
        REFERENCES album ( cod_album ); 

ALTER TABLE detalle_ga
    ADD CONSTRAINT detalle_ga_artista_fk FOREIGN KEY ( artista_cod_artista )
        REFERENCES artista ( cod_artista ); 

ALTER TABLE detalle_ga
    ADD CONSTRAINT detalle_ga_genero_fk FOREIGN KEY ( genero_cod_genero )
        REFERENCES genero ( cod_genero ); 

ALTER TABLE lista_cancion
    ADD CONSTRAINT lista_cancion_cancion_fk FOREIGN KEY ( cancion_cod_cancion )
        REFERENCES cancion ( cod_cancion ); 

ALTER TABLE lista_cancion
    ADD CONSTRAINT lista_cancion_lista_fk FOREIGN KEY ( lista_cod_lista )
        REFERENCES lista ( cod_lista ); 

ALTER TABLE lista
    ADD CONSTRAINT lista_usuario_fk FOREIGN KEY ( usuario_cod_usuario )
        REFERENCES usuario ( cod_usuario ); 

ALTER TABLE usuario
    ADD CONSTRAINT usuario_tipo_usuario_fk FOREIGN KEY ( tipo_usuario_cod_tipo )
        REFERENCES tipo_usuario ( cod_tipo ); 

INSERT INTO tipo_usuario(nombre) VALUES('Administrador'),('Usuario');

INSERT INTO estado(nombre) VALUES('Activo'),('Eliminado'),('Bloqueado');

INSERT INTO usuario(fecha_creacion,password, usuario, tipo_usuario_cod_tipo,nombre,correo,fecha_nacimiento) VALUES('11/04/2018','1234','admin',1,'Joaquin Ancelmo','joancx@gmail.com','11/05/1997');

INSERT INTO usuario(fecha_creacion,password, usuario, tipo_usuario_cod_tipo,nombre,correo,fecha_nacimiento) VALUES('11/04/2018','1234','joaquin',2,'Joaquin Ancelmo','joancx@gmail.com','11/05/1997');

INSERT INTO lista(nombre,usuario_cod_usuario) VALUES('Favoritos',2);

INSERT INTO pais(nombre) VALUES ('Argentina'),('Bolivia'),('Brasil'),('Chile'),('Colombia'),('Costa Rica'),('Cuba'),
    ('Ecuador'),('El Salvador'),('Guatemala'),('Honduras'),('Jamaica'),('México'),('Nicaragua'),
    ('Panamá'),('Paraguay'),('Perú'),('Puerto Rico'),('República Dominicana'),
    ('Uruguay'),('Venezuela');

INSERT INTO genero(nombre,estado_cod_estado) VALUES ('Rock',1),('Pop',1),('Metal',1),('Electronica',1),('Blues',1),('Funk',1),('HipHop',1),('Jazz',1),('Rap',1),('Reggae',1),('Clasica',1),('Dance',1);
