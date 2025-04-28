-- Insertar datos en Autores
INSERT INTO Autores (Nombre, Nacionalidad, Fecha_Nacimiento) VALUES
('Gabriel García Márquez', 'Colombiano', '1927-03-06'),
('J.K. Rowling', 'Británica', '1965-07-31'),
('George Orwell', 'Británica', '1903-06-25'),
('Mario Vargas Llosa', 'Peruano', '1936-03-28'),
('Isabel Allende', 'Chilena', '1942-08-02');

-- Insertar datos en Categorias
INSERT INTO Categorias (Nombre_Categoria) VALUES
('Novela'),
('Ciencia Ficción'),
('Fantasía'),
('Ensayo'),
('Realismo Mágico'),
('Distopía');

-- Insertar datos en Libros
INSERT INTO Libros (Titulo, ID_Autor, ID_Categoria, Año_Publicacion) VALUES
('Cien Años de Soledad', 1, 5, 1967),
('Harry Potter y la Piedra Filosofal', 2, 3, 1997),
('1984', 3, 6, 1949),
('La Ciudad y los Perros', 4, 1, 1963),
('La Casa de los Espíritus', 5, 5, 1982),
('El Amor en los Tiempos del Cólera', 1, 1, 1985),
('Rebelión en la Granja', 3, 6, 1945),
('Harry Potter y la Cámara Secreta', 2, 3, 1998);

-- Insertar datos en Usuarios
INSERT INTO Usuarios (Nombre, Direccion, Telefono) VALUES
('Carlos Martínez', 'Calle Luna, 123', '123456789'),
('Lucía Fernández', 'Avenida Sol, 456', '987654321'),
('María González', 'Plaza Estrella, 789', '555444333'),
('Juan Pérez', 'Boulevard Júpiter, 321', '111222333'),
('Ana Rodríguez', 'Camino Saturno, 654', '999888777');

-- Insertar datos en Prestamos
INSERT INTO Prestamos (ID_Usuario, ID_Libro, Fecha_Prestamo, Fecha_Devolucion) VALUES
(1, 1, '2024-08-01', '2024-08-15'),
(2, 2, '2024-08-02', '2024-08-16'),
(3, 3, '2024-08-03', '2024-08-17'),
(4, 4, '2024-08-04', '2024-08-18'),
(1, 5, '2024-08-05', '2024-08-19'),
(2, 6, '2024-08-06', '2024-08-20');

-- Insertar datos en prestamos_usuarios
INSERT INTO prestamos_usuarios (ID_Prestamo, ID_Usuario) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 1),
(6, 2);