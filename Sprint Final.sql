-- Desarrollo Sprint Final Modulo 5
-- Claudio Campos
-- Crear la base de datos 
CREATE DATABASE SprintFinal;
USE SprintFinal;

-- Crear usuario con todos los privilegios
CREATE USER 'adminUser'@'localhost' IDENTIFIED BY 'user132421';
GRANT ALL PRIVILEGES ON SprintFinal.* TO 'adminUser'@'localhost';

-- Crear las tablas Usuario, Operario y Soporte 
CREATE TABLE Usuario (
    ID_usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Edad INT,
    Correo_electronico VARCHAR(100),
    Veces_usado INT DEFAULT 1
);

CREATE TABLE Operario (
    ID_operario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Edad INT,
    Correo_electronico VARCHAR(100),
    Veces_soporte INT DEFAULT 1
);

CREATE TABLE Soporte (
    ID_soporte INT AUTO_INCREMENT PRIMARY KEY,
    ID_usuario INT,
    ID_operario INT,
    Fecha DATE,
    Evaluacion INT,
    Comentario TEXT,
    FOREIGN KEY (ID_usuario) REFERENCES Usuario(ID_usuario),
    FOREIGN KEY (ID_operario) REFERENCES Operario(ID_operario)
);

-- Insertar datos para Usuario, Operario y Soporte
INSERT INTO Usuario (ID_usuario, Nombre, Apellido, Edad, Correo_electronico, Veces_usado)VALUES
('1','Armando','Barrera','20','simurd234@correo.com','2'),
('2','Marjorie','Bouvier','22','marjoriee32@correo.com','10'),
('3','Margaret','Simons','32','magy3452@correo.com','5'),
('4','Herbert','Powell','14','herbertt4342@correo.com','7'),
('5','Lenford','Leonard','34','lenyy123@correo.com','3');
SELECT * FROM usuario;

INSERT INTO Operario(ID_operario, Nombre, Apellido, Edad, Correo_electronico, Veces_soporte)VALUES
('1','Charles','Burns','60','monty21@correo.com','7'),
('2','Daphne',' Burns','46','daphne345@correo.com','1'),
('3','Nedward','Flanders','30','nedd21@correo.com','8'),
('4','Todd','Flanes','18','todyy12345@correo.com','5'),
('5','Rod','Flanes','18','roddy1234@correo.com','10');
SELECT * FROM Operario;

INSERT INTO Soporte(ID_soporte, ID_usuario, ID_operario, Fecha, Evaluacion, Comentario)VALUES
('1','5','3','2024-03-24','4','regular atencion '),
('2','4','3','2024-02-14','6','buena atencion'),
('3','1','3','2024-12-20','7','muy buena atencion'),
('4','3','1','2024-11-11','2','pésima atencion'),
('5','2','2','2024-07-29','3','mala atencion'),
('6','3','3','2024-04-13','7','excelente atencion'),
('7','5','2','2024-03-16','1','Mala atencion, deja bastante que desear'),
('8','4','4','2024-12-22','4','la atencion fue bastante regular'),
('9','2','1','2024-02-19','2','pésima!!'),
('10','3','3','2024-03-29','6','buena atencion pero puede mejorar');
SELECT * FROM Soporte;
-- Consultas 
-- Las 3 operaciones con mejor evaluación
SELECT * FROM Soporte ORDER BY Evaluacion DESC LIMIT 3;

-- Las 3 operaciones con menos evaluación
SELECT * FROM Soporte ORDER BY Evaluacion ASC LIMIT 3;

-- Operario que más soportes ha realizado
SELECT Id_operario, COUNT(*) AS soportes_realizados
FROM soporte
GROUP BY Id_operario
ORDER BY soportes_realizados DESC
LIMIT 1;

-- Cliente que menos veces ha utilizado la aplicación
SELECT * FROM Usuario ORDER BY Veces_usado ASC LIMIT 1;

-- Agregar 10 años a los tres primeros usuarios registrados
UPDATE Usuario SET Edad = Edad + 10 ORDER BY ID_usuario ASC LIMIT 3;
SELECT * FROM usuario;

-- Renombrar columna 'correo electrónico' a 'email'
ALTER TABLE Usuario RENAME COLUMN correo_electronico TO Email;
ALTER TABLE Operario RENAME COLUMN correo_electronico TO Email;
SELECT * FROM usuario;
SELECT * FROM operario;

-- Seleccionar solo los operarios mayores de 20 años
SELECT * FROM Operario WHERE Edad > 20;
