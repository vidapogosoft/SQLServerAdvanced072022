use master
go

---creacion de la base de datos
create database MovieStore

go

--Archivo Primario: .mdf
--Archivo Secundario: .ndf
--Archivo Log: .ldf

----creacion de base de datos en modo personalizado

create database MovieStore2
on
(
	name = MovieStore2_data,
	filename = 'D:\SQLData\MovieStore2data.mdf',
	size = 500,
	MAXSIZE = 2048, ---UNLIMITED 
	filegrowth = 300
)
log on
(
	name = MovieStore2_log,
	filename = 'D:\SQLData\MovieStore2log.ldf',
	size = 500,
	filegrowth = 300
)
go

use MovieStore2
go
select * from sys.database_files

----- archivos secundarios de la base datos
alter database MovieStore add filegroup MovieStore_data_3
go

alter database MovieStore
add file
(
	name = MovieStoredata3,
	filename = 'D:\SQLData\MovieStoredata3.ndf',
	size = 500,
	MAXSIZE = 2048, ---UNLIMITED 
	filegrowth = 300
)to filegroup MovieStore_data_3
go


----------example
use MovieStore
go

Create Table Movies
(
	IdMovie int identity(1,1),
	NombreMovie varchar(200),
	AnioMovie int,
	Estado char(1),
	FechaRegistro datetime default getdate(),

	constraint PK_IdMovie primary key clustered (IdMovie desc)
)on MovieStore_data_3
go


----

Para mover una tabla a un grupo de archivos diferente, es necesario mover el índice agrupado de la tabla 
al nuevo grupo de archivos. Aunque esto puede parecer extraño al principio esto no es sorprendente 
cuando recuerda que el nivel de hoja del índice agrupado contiene realmente los datos de la tabla. 
Mover el índice agrupado se puede hacer en una sola instrucción usando la cláusula DROP_EXISTING 
de la siguiente manera (usando las tablas de AdventureWorks como ejemplo):

CREATE UNIQUE CLUSTERED INDEX PK_Department_DepartmentID
ON HumanResources.Department(DepartmentID)
WITH (DROP_EXISTING=ON,ONLINE=ON) ON SECONDARY
