FarmaciaDashboard (Plantilla Visual de Power BI)

Esta plantilla está diseñada para representar datos de ventas de una farmacia e incluye visuales vacíos para:

- Gráfico de línea para tendencia de ventas
- Gráfico de barras para categoría más vendida
- Matriz para productos más vendidos
- Tarjetas KPI para ventas totales, unidades, sucursales y productos
- Visuales opcionales para stock, sucursales, rotación, y frecuencia de venta

Cómo usarla:
1. Abre Power BI Desktop
2. Crea conexión con tu base de datos SQL (FarmaciaDB)
3. Inserta las visualizaciones desde la sección "Visualizaciones"
4. Aplica el tema moderno que descargaste (modern_dark_blue_theme.json)
5. Usa tus tablas: DimProducto, DimSucursal, DimFecha, DimInventario, FactVentas

Campos sugeridos:
- Eje X temporal: DimFecha[Fecha]
- Medidas: Total_Venta, Cantidad, StockActual
- Filtros: Categoria, Año, NombreSucursal

Este archivo es solo una estructura conceptual.
Para una plantilla .pbit real, debe generarse directamente en Power BI Desktop.