

/**********************************************/
/********VARIABLES DE TIPO TABLA**************/
/**********************************************/

DECLARE @Tabla1 table
(
	[IdProducto] int NOT NULL,
	[NombreProducto] [nvarchar](50) NOT NULL,
	[CodigoProducto] [nvarchar](25) NOT NULL,
	[Color] [nvarchar](15) NULL,
	[FechaInicioVentas] [datetime] NOT NULL
)

insert into @Tabla1
(
	[IdProducto] ,
	[NombreProducto] ,
	[CodigoProducto] ,
	[Color] ,
	[FechaInicioVentas] 
)
select
a.ProductID as IdProducto, 
a.Name as NombreProducto, 
a.ProductNumber as CodigoProducto, 
a.Color, 
SellStartDate as FechaInicioVentas
from AdventureWorks2014.Production.Product a


SELECT * FROM @Tabla1 Where Color is not null



/**********************************************/
/******TABLAS TEMPORALES DE SESSION - GLOBALES*****/
/**********************************************/

---#temporal local fisica en tempdb
---##temporal global fisica
--@temporales de variable


---#temporal local fisica en tempdb
---Puede realizar creaciones de de index
--

select
a.ProductID as IdProducto, 
a.Name as NombreProducto, 
a.ProductNumber as CodigoProducto, 
a.Color, 
SellStartDate as FechaInicioVentas
into #ProductosExternos1
from AdventureWorks2014.Production.Product a


SELECT * FROM #ProductosExternos1


CREATE TABLE #ProductosExternos2(
	[IdProducto] int NOT NULL,
	[NombreProducto] [nvarchar](50) NOT NULL,
	[CodigoProducto] [nvarchar](25) NOT NULL,
	[Color] [nvarchar](15) NULL,
	[FechaInicioVentas] [datetime] NOT NULL
)

----TEMPORAL GLOBAL

select
a.ProductID as IdProducto, 
a.Name as NombreProducto, 
a.ProductNumber as CodigoProducto, 
a.Color, 
SellStartDate as FechaInicioVentas
into ##ProductosExternos100
from AdventureWorks2014.Production.Product a

SELECT * FROM ##ProductosExternos100

