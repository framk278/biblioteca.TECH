-- CONSULTAS BÁSICAS

-- 1. Mostrar todos los autores
SELECT * FROM Autores ORDER BY Nombre;

-- 2. Mostrar todos los libros disponibles
SELECT * FROM Libros WHERE Disponible = TRUE ORDER BY Titulo;

-- 3. Mostrar todos los préstamos activos
SELECT * FROM Prestamos WHERE Fecha_Devolucion > CURDATE();

-- CONSULTAS CON JOINS

-- 4. Libros con sus autores y categorías
SELECT 
    l.Titulo AS Libro,
    a.Nombre AS Autor,
    c.Nombre_Categoria AS Categoria,
    l.Año_Publicacion AS Año,
    CASE WHEN l.Disponible THEN 'Sí' ELSE 'No' END AS Disponible
FROM 
    Libros l
JOIN 
    Autores a ON l.ID_Autor = a.ID_Autor
JOIN 
    Categorias c ON l.ID_Categoria = c.ID_Categoria
ORDER BY 
    a.Nombre, l.Titulo;

-- 5. Préstamos con detalles completos
SELECT 
    p.ID_Prestamo,
    u.Nombre AS Usuario,
    l.Titulo AS Libro,
    a.Nombre AS Autor,
    p.Fecha_Prestamo,
    p.Fecha_Devolucion,
    DATEDIFF(p.Fecha_Devolucion, p.Fecha_Prestamo) AS Dias_Prestamo
FROM 
    Prestamos p
JOIN 
    Usuarios u ON p.ID_Usuario = u.ID_Usuario
JOIN 
    Libros l ON p.ID_Libro = l.ID_Libro
JOIN 
    Autores a ON l.ID_Autor = a.ID_Autor
ORDER BY 
    p.Fecha_Prestamo DESC;

-- CONSULTAS ESPECÍFICAS

-- 6. Libros de Gabriel García Márquez
SELECT 
    l.Titulo,
    l.Año_Publicacion,
    c.Nombre_Categoria
FROM 
    Libros l
JOIN 
    Autores a ON l.ID_Autor = a.ID_Autor
JOIN 
    Categorias c ON l.ID_Categoria = c.ID_Categoria
WHERE 
    a.Nombre = 'Gabriel García Márquez';

-- 7. Usuarios con libros prestados actualmente
SELECT DISTINCT
    u.Nombre AS Usuario,
    u.Telefono,
    COUNT(p.ID_Prestamo) AS Libros_Prestados
FROM 
    Usuarios u
JOIN 
    Prestamos p ON u.ID_Usuario = p.ID_Usuario
WHERE 
    p.Fecha_Devolucion > CURDATE()
GROUP BY 
    u.ID_Usuario
ORDER BY 
    Libros_Prestados DESC;

-- 8. Libros más populares (más prestados)
SELECT 
    l.Titulo,
    a.Nombre AS Autor,
    COUNT(p.ID_Prestamo) AS Veces_Prestado
FROM 
    Libros l
JOIN 
    Autores a ON l.ID_Autor = a.ID_Autor
LEFT JOIN 
    Prestamos p ON l.ID_Libro = p.ID_Libro
GROUP BY 
    l.ID_Libro
ORDER BY 
    Veces_Prestado DESC;

-- 9. Consulta para buscar libros por título o autor
SELECT 
    l.Titulo,
    a.Nombre AS Autor,
    c.Nombre_Categoria AS Categoria
FROM 
    Libros l
JOIN 
    Autores a ON l.ID_Autor = a.ID_Autor
JOIN 
    Categorias c ON l.ID_Categoria = c.ID_Categoria
WHERE 
    l.Titulo LIKE '%soledad%' OR 
    a.Nombre LIKE '%garcía%' OR
    c.Nombre_Categoria LIKE '%novela%';

-- 10. Resumen de préstamos por mes
SELECT 
    DATE_FORMAT(Fecha_Prestamo, '%Y-%m') AS Mes,
    COUNT(*) AS Total_Prestamos,
    COUNT(DISTINCT ID_Usuario) AS Usuarios_Unicos,
    COUNT(DISTINCT ID_Libro) AS Libros_Diferentes
FROM 
    Prestamos
GROUP BY 
    Mes
ORDER BY 
    Mes DESC;