
-- ========================================
-- Verificación de integridad post-carga
-- ========================================

-- A. Conteo de registros en tablas principales
SELECT COUNT(*) AS TotalDimFecha FROM DimFecha;
SELECT COUNT(*) AS TotalDimInventario FROM DimInventario;
SELECT COUNT(*) AS TotalDimProducto FROM DimProducto;
SELECT COUNT(*) AS TotalDimSucursal FROM DimSucursal;
SELECT COUNT(*) AS TotalFactVentas FROM FactVentas;
GO

-- B. Verificar claves foráneas (integridad referencial)

-- 1. Ventas sin producto asociado
SELECT * FROM FactVentas fv
LEFT JOIN DimProducto p ON fv.ID_Producto = p.ID_Producto
WHERE p.ID_Producto IS NULL;
GO

-- 2. Ventas sin fecha asociada
SELECT * FROM FactVentas fv
LEFT JOIN DimFecha f ON fv.ID_Fecha = f.ID_Fecha
WHERE f.ID_Fecha IS NULL;
GO

-- 3. Ventas sin sucursal asociada
SELECT * FROM FactVentas fv
LEFT JOIN DimSucursal s ON fv.ID_Sucursal = s.ID_Sucursal
WHERE s.ID_Sucursal IS NULL;
GO

