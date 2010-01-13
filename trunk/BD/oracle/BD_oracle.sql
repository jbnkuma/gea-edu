-- Generated by Oracle SQL Developer Data Modeler Version: 2.0.0 Build: 584
--   at:        2010-01-13 13:52:25
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE Alumno 
    ( 
     Numero_de_cuenta VARCHAR2 (10 CHAR)  NOT NULL , 
     Nombre VARCHAR2 (50 CHAR)  NOT NULL , 
     Apellido_Paterno VARCHAR2 (50 CHAR)  NOT NULL , 
     Apellido_Materno VARCHAR2 (50 CHAR)  NOT NULL , 
     Telefono VARCHAR2 (12 CHAR) , 
     Email VARCHAR2 (30 CHAR) 
    ) LOGGING 
;



ALTER TABLE Alumno 
    ADD CONSTRAINT Alumno_PK PRIMARY KEY ( Numero_de_cuenta ) ;

ALTER TABLE Alumno 
    ADD CONSTRAINT Alumno__UN UNIQUE ( Numero_de_cuenta ) 
;


CREATE TABLE Catedratico 
    ( 
     Clave VARCHAR2 (20 CHAR)  NOT NULL , 
     Nombre VARCHAR2 (50 CHAR)  NOT NULL , 
     Apellido_Paterno VARCHAR2 (50 CHAR)  NOT NULL , 
     Apellido_Materno VARCHAR2 (50 CHAR)  NOT NULL , 
     Hora_entrada DATE  NOT NULL , 
     Hora_salida DATE  NOT NULL , 
     Telefono VARCHAR2 (12 CHAR) , 
     Email VARCHAR2 (30 CHAR) 
    ) LOGGING 
;



ALTER TABLE Catedratico 
    ADD CONSTRAINT Catedratico_PK PRIMARY KEY ( Clave ) ;

ALTER TABLE Catedratico 
    ADD CONSTRAINT Catedratico__UN UNIQUE ( Clave ) 
;


CREATE TABLE Grupo 
    ( 
     Grupo_id VARCHAR2 (10 CHAR)  NOT NULL , 
     Horario_Horario_id VARCHAR2 (12 CHAR)  NOT NULL , 
     num_maximo_alumnos NUMBER 
    ) LOGGING 
;



ALTER TABLE Grupo 
    ADD CONSTRAINT Grupo_PK PRIMARY KEY ( Grupo_id ) ;

ALTER TABLE Grupo 
    ADD CONSTRAINT Grupo__UN UNIQUE ( Grupo_id ) 
;


CREATE TABLE Horario 
    ( 
     Horario_id VARCHAR2 (12 CHAR)  NOT NULL , 
     Catedratico_Clave VARCHAR2 (20 CHAR)  NOT NULL , 
     Alumno_Numero_de_cuenta VARCHAR2 (10 CHAR)  NOT NULL , 
     Dia DATE  NOT NULL , 
     Hora DATE  NOT NULL 
    ) LOGGING 
;



ALTER TABLE Horario 
    ADD CONSTRAINT Horario_PK PRIMARY KEY ( Horario_id ) ;

ALTER TABLE Horario 
    ADD CONSTRAINT Horario__UN UNIQUE ( Horario_id ) 
;


CREATE TABLE Materia 
    ( 
     Clave VARCHAR2 (30 CHAR)  NOT NULL , 
     Nombre VARCHAR2 (30 CHAR)  NOT NULL , 
     Semestre VARCHAR2 (30 CHAR)  NOT NULL , 
     Creditos INTEGER , 
     Horario_Horario_id VARCHAR2 (12 CHAR)  NOT NULL 
    ) LOGGING 
;



ALTER TABLE Materia 
    ADD CONSTRAINT Materia_PK PRIMARY KEY ( Clave ) ;

ALTER TABLE Materia 
    ADD CONSTRAINT Materia__UN UNIQUE ( Clave ) 
;


CREATE TABLE Usuarios 
    ( 
     Id_usuario NUMBER  NOT NULL , 
     Nombre VARCHAR2 (20 CHAR)  NOT NULL , 
     Clave_de_acceso VARCHAR2 (12 CHAR)  NOT NULL 
    ) LOGGING 
;



ALTER TABLE Usuarios 
    ADD CONSTRAINT Usuarios_PK PRIMARY KEY ( Id_usuario ) ;

ALTER TABLE Usuarios 
    ADD CONSTRAINT Usuarios__UN UNIQUE ( Id_usuario ) 
;



ALTER TABLE Grupo 
    ADD CONSTRAINT Grupo_Horario_FK FOREIGN KEY 
    ( 
     Horario_Horario_id
    ) 
    REFERENCES Horario 
    ( 
     Horario_id
    ) 
    NOT DEFERRABLE 
;


ALTER TABLE Horario 
    ADD CONSTRAINT Horario_Alumno_FK FOREIGN KEY 
    ( 
     Alumno_Numero_de_cuenta
    ) 
    REFERENCES Alumno 
    ( 
     Numero_de_cuenta
    ) 
    NOT DEFERRABLE 
;


ALTER TABLE Horario 
    ADD CONSTRAINT Horario_Catedratico_FK FOREIGN KEY 
    ( 
     Catedratico_Clave
    ) 
    REFERENCES Catedratico 
    ( 
     Clave
    ) 
    NOT DEFERRABLE 
;


ALTER TABLE Materia 
    ADD CONSTRAINT Materia_Horario_FK FOREIGN KEY 
    ( 
     Horario_Horario_id
    ) 
    REFERENCES Horario 
    ( 
     Horario_id
    ) 
    NOT DEFERRABLE 
;


    
    
    
    
    
    

-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- CREATE PROCEDURE                         0
-- CREATE TRIGGER                           0
-- CREATE STRUCTURED TYPE                   0
-- CREATE COLLECTION TYPE                   0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE SNAPSHOT                          0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
