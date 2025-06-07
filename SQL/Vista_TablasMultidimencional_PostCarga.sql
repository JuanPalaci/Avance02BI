-- Vista: Ventas detalladas
CREATE OR ALTER VIEW vw_VentasDetalladas AS
SELECT 
    fv.ID_Venta,
    f.Fecha,
    p.NombreProducto,
    p.Categoria,
    s.Nombre AS NombreSucursal,
    fv.Cantidad,
    (fv.Cantidad * p.PrecioUnitario) AS Total
FROM dbo.[Destination Ventas] fv
JOIN dbo.[Destination Fecha] f ON fv.ID_Fecha = f.ID_Fecha
JOIN dbo.[Destination Producto] p ON fv.ID_Producto = p.ID_Producto
JOIN dbo.[Destination Sucursal] s ON fv.ID_Sucursal = s.ID_Sucursal;
GO

-- Vista: Total de ventas por categoría
CREATE OR ALTER VIEW vw_VentasPorCategoria AS
SELECT 
    p.Categoria,
    SUM(fv.Cantidad * p.PrecioUnitario) AS TotalVentas
FROM dbo.[Destination Ventas] fv
JOIN dbo.[Destination Producto] p ON fv.ID_Producto = p.ID_Producto
GROUP BY p.Categoria;
GO

-- Vista: Total de ventas por sucursal
CREATE OR ALTER VIEW vw_VentasPorSucursal AS
SELECT 
    s.Nombre AS Sucursal,
    SUM(fv.Cantidad * p.PrecioUnitario) AS TotalVentas
FROM dbo.[Destination Ventas] fv
JOIN dbo.[Destination Producto] p ON fv.ID_Producto = p.ID_Producto
JOIN dbo.[Destination Sucursal] s ON fv.ID_Sucursal = s.ID_Sucursal
GROUP BY s.Nombre;
GO

-- Vista: Total de ventas por fecha
CREATE OR ALTER VIEW vw_VentasPorFecha AS
SELECT 
    f.Fecha,
    SUM(fv.Cantidad * p.PrecioUnitario) AS TotalVentas
FROM dbo.[Destination Ventas] fv
JOIN dbo.[Destination Producto] p ON fv.ID_Producto = p.ID_Producto
JOIN dbo.[Destination Fecha] f ON fv.ID_Fecha = f.ID_Fecha
GROUP BY f.Fecha;
GO

SELECT * FROM vw_VentasDetalladas;
