/*
JUNIOR AARON FAGOAGA GUEVARA
U20210154
*/

/*========[PRACTICA I - DPWA]========*/
CREATE DATABASE GestionTareas
GO

CREATE TABLE Usuarios(
UsuarioID INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(50),
EMail VARCHAR(50),
Departamento VARCHAR(50)
)
GO

CREATE TABLE Proyectos(
ProyectoID INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(50),
Descripcion VARCHAR(50),
FechaInicio DATE,
FechaFin DATE
)
GO

CREATE TABLE Tareas(
TareaID INT PRIMARY KEY IDENTITY(1,1),
ProyectoID INT,
Descripcion VARCHAR(50),
FechaCreacion DATE,
FechaLimite DATE,
UsuarioID INT,
Estado VARCHAR,

FOREIGN KEY(ProyectoID) REFERENCES Proyectos(ProyectoID),
FOREIGN KEY(UsuarioID) REFERENCES Usuarios(UsuarioID)
)
GO

INSERT INTO Usuarios (Nombre, EMail, Departamento) VALUES('Aaron', 'sraaron1@outlook.com', 'Software')
GO
INSERT INTO Proyectos (Nombre, Descripcion, FechaInicio, FechaFin) VALUES('Gestor de datos para tienda', 'Realizar un gestor de inventarios para la tienda', '2024-01-25', '2024-09-25')
GO
INSERT INTO Tareas (ProyectoID, Descripcion, FechaCreacion, FechaLimite, UsuarioID, Estado) VALUES(2, 'Realizar el gestor de inventario', '2024-02-08', '2024-08-30', 1, 'P')
GO

/*=========[ACTIVIDAD]=========*/
CREATE DATABASE Hospital
GO

USE Hospital
GO

CREATE TABLE Departamento(
DepartamentoID INT PRIMARY KEY IDENTITY(1,1),
NombreD VARCHAR(50),
Descripcion VARCHAR(250)
)
GO

INSERT INTO Departamento (NombreD, Descripcion) VALUES('Unidad de operaciones', 'Departamento dedicado exclusivamente a las cirugías y operaciones.')
INSERT INTO Departamento (NombreD, Descripcion) VALUES('Unidad de curaciones', 'Departamento dedicado a tratar suturas y otras heridas leves.')
GO

CREATE TABLE Medicamento(
MedicamentoID INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(50),
Descripcion VARCHAR(250)
)
GO
INSERT INTO Medicamento (Nombre, Descripcion) VALUES('Ibuprofeno 25mg', 'Pastillas vía oral, consumo de 1 cada 8 horas.')
INSERT INTO Medicamento (Nombre, Descripcion) VALUES('Amoxicilina 50mg', 'Antibiótico en capsula, vía oral, consumo de 1 cada 24 horas.')
GO

CREATE TABLE Paciente(
PacienteID INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(50),
Apellido VARCHAR(50),
Edad INT,
TipoSanguineo VARCHAR(2),
NSeguro VARCHAR(10),
NContacto VARCHAR(9)
)
GO

INSERT INTO Paciente (Nombre, Apellido, Edad, TipoSanguineo, NSeguro, NContacto) VALUES('Azucena', 'Santos', '21', 'o-', '1020202', '7023-4112')
INSERT INTO Paciente (Nombre, Apellido, Edad, TipoSanguineo, NSeguro, NContacto) VALUES('Veneza', 'Santorini', '41', '0+', '1023202', '7223-4112')
GO

CREATE TABLE PersonalMedico(
PersonalMID INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(50),
Apellido VARCHAR(50),
Especialidad VARCHAR(50),
Codigo VARCHAR(10),
DepartamentoID INT,

FOREIGN KEY (DepartamentoID) REFERENCES Departamento(DepartamentoID)
)
GO

INSERT INTO PersonalMedico(Nombre, Apellido, Especialidad, Codigo, DepartamentoID) VALUES('Hector', 'Volcado', 'Cirujano', '252525', 1)
INSERT INTO PersonalMedico(Nombre, Apellido, Especialidad, Codigo, DepartamentoID) VALUES('Manolo', 'Galván', 'Enfermero', '212121', 2)
GO


CREATE TABLE Diagnostico(
DiagnosticoID INT PRIMARY KEY IDENTITY(1,1),
Descripcion VARCHAR(50)
)
GO

INSERT INTO Diagnostico (Descripcion) VALUES('Fiebre por gripa')
INSERT INTO Diagnostico (Descripcion) VALUES('Infección de vías urinarias')
GO

CREATE TABLE AuxDiagnostico(
DiagnosticoID INT,
MedicamentoID INT NOT NULL,

FOREIGN KEY (DiagnosticoID) REFERENCES Diagnostico(DiagnosticoID),
FOREIGN KEY (MedicamentoID) REFERENCES Medicamento(MedicamentoID)
) 
GO

INSERT INTO AuxDiagnostico (DiagnosticoID, MedicamentoID) VALUES(1,1)
INSERT INTO AuxDiagnostico (DiagnosticoID, MedicamentoID) VALUES(2,2)
GO

CREATE TABLE Historial(
HistorialID INT PRIMARY KEY IDENTITY(1,1),
PacienteID INT,
DiagnosticoID INT,
Fecha DATE

FOREIGN KEY (PacienteID) REFERENCES Paciente(PacienteID),
FOREIGN KEY (DiagnosticoID) REFERENCES Diagnostico(DiagnosticoID)
)
GO

INSERT INTO Historial (PacienteID, DiagnosticoID, Fecha) VALUES(1, 1, '2024-2-8')
INSERT INTO Historial (PacienteID, DiagnosticoID, Fecha) VALUES(2, 2, '2024-3-8')
GO