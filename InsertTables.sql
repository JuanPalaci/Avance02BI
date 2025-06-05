-- Tabla DimProducto
CREATE TABLE DimProducto
(
    ID_Producto      INT PRIMARY KEY,
    NombreProducto   VARCHAR(100),
    Categoria        VARCHAR(50),
    PrecioUnitario   DECIMAL(10, 2),
    EstadoDeRotacion VARCHAR(20)
);

-- Tabla DimSucursal
CREATE TABLE DimSucursal
(
    ID_Sucursal  INT PRIMARY KEY,
    Nombre       VARCHAR(100),
    Direccion    VARCHAR(150),
    Departamento VARCHAR(50),
    TipoSucursal VARCHAR(50)
);

-- Tabla DimFecha
CREATE TABLE DimFecha
(
    ID_Fecha INT PRIMARY KEY,
    Fecha    DATE,
    Año      INT,
    Mes      INT,
    Día      INT,
    Semana   INT
);

-- Tabla DimInventario
CREATE TABLE DimInventario
(
    ID_Producto    INT,
    ID_Sucursal    INT,
    StockActual    INT,
    FechaDeRestock DATE,
    PRIMARY KEY (ID_Producto, ID_Sucursal),
    FOREIGN KEY (ID_Producto) REFERENCES DimProducto (ID_Producto),
    FOREIGN KEY (ID_Sucursal) REFERENCES DimSucursal (ID_Sucursal)
);

-- Tabla FactVentas (con ID_Fecha y relaciones correctas)
CREATE TABLE FactVentas
(
    ID_Venta    INT PRIMARY KEY,
    ID_Fecha    INT,
    Fecha       DATE,
    ID_Producto INT,
    ID_Sucursal INT,
    Cantidad    INT,
    Total_Venta DECIMAL(10, 2),
    FOREIGN KEY (ID_Producto) REFERENCES DimProducto (ID_Producto),
    FOREIGN KEY (ID_Sucursal) REFERENCES DimSucursal (ID_Sucursal),
    FOREIGN KEY (ID_Fecha) REFERENCES DimFecha (ID_Fecha)
);


