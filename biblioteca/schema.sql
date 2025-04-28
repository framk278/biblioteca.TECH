-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS Biblioteca;
USE Biblioteca;

-- Tabla Autores
CREATE TABLE Autores (
    ID_Autor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Nacionalidad VARCHAR(50),
    Fecha_Nacimiento DATE
);

-- Tabla Categorias
CREATE TABLE Categorias (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Categoria VARCHAR(50) NOT NULL
);

-- Tabla Libros
CREATE TABLE Libros (
    ID_Libro INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    ID_Autor INT,
    ID_Categoria INT,
    Año_Publicacion INT,
    Disponible BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (ID_Autor) REFERENCES Autores(ID_Autor),
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria)
);

-- Tabla Usuarios
CREATE TABLE Usuarios (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200),
    Telefono VARCHAR(20)
);

-- Tabla Prestamos
CREATE TABLE Prestamos (
    ID_Prestamo INT AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT,
    ID_Libro INT,
    Fecha_Prestamo DATE NOT NULL,
    Fecha_Devolucion DATE,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro)
);

-- Tabla prestamos_usuarios
CREATE TABLE prestamos_usuarios (
    ID_Prestamo_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    ID_Prestamo INT,
    ID_Usuario INT,
    FOREIGN KEY (ID_Prestamo) REFERENCES Prestamos(ID_Prestamo),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);