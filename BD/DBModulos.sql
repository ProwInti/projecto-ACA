create database DBModulos
use DBModulos

create proc RegistrarRegistro
(
	@Rut_Fun	varchar	(10),
	@Nom_Fun	varchar	(100),
	@Cod_Mod	int,
	@Tipo_Reg	varchar (10)
)
as begin
insert into registro values
	(
		@Rut_Fun,
		@Nom_Fun,
		@Cod_Mod,
		@Tipo_Reg,
		GETDATE(),
		GETDATE(),
		DATEADD(second,20,GETDATE())
	)
end 

drop proc RegistrarRegistro

create table FUNCIONARIO
(
	Rut					varchar(9) primary key not null,
	Nombre_Completo		varchar(100)not null,
	Direccion			varchar(100),
	Correo				varchar(100),
	Fono				varchar(100),
	Edad				int 
)
create table USUARIO
(
	Id_Login		int identity(1,1) primary key not null,
	Rut_Funcionario	varchar(9) foreign key references FUNCIONARIO not null,
	Clave			varchar(50)
)
create table	REGISTRO
(
	Cod_Reg		int identity(1,1) primary key,
	Rut_Fun		varchar(10),
	Nom_Fun		varchar(100),
	Cod_Mod		int,
	Tipo_Reg	varchar(10),
	Fecha_Reg	date,
	Hora_Reg	datetime,
	Hora_Delay	datetime,
)

insert into FUNCIONARIO values ('177470333','Matias Nicolas Orostegui Espinoza','Doña Ester 3, Pasaje Valle Nevado #0420','matias.orostegui@institutoingles.cl','+56998863731',25)
insert into FUNCIONARIO values ('162231340','Jose Roverto Acevedo Morales','Doña Ester 3, Pasaje Valle Nevado #0420','matias.orostegui@institutoingles.cl','+56998863731',25)
insert into FUNCIONARIO values ('238480590','Domingo Sharp Wormull','Doña Ester 3, Pasaje Valle Nevado #0420','matias.orostegui@institutoingles.cl','+56998863731',25)
insert into FUNCIONARIO values ('241587436','Dominga Contador WillatT','Doña Ester 3, Pasaje Valle Nevado #0420','matias.orostegui@institutoingles.cl','+56998863731',25)

insert into USUARIO values('177470333','123456')

select * from REGISTRO
truncate table registro


insert into registro 
select  Rut_Fun,Nom_Fun	,Cod_Mod,Tipo_Reg,Fecha_Reg,Hora_Reg,Hora_Delay 
from Modulo1.dbo.REGISTRO where NOT  Modulo1.dbo.REGISTRO.Hora_Reg
IN	(SELECT Hora_Reg FROM registro) and NOT  Modulo1.dbo.REGISTRO.Rut_Fun
IN	(SELECT Rut_Fun FROM registro);

insert into registro 
select  Rut_Fun,Nom_Fun	,Cod_Mod,Tipo_Reg,Fecha_Reg,Hora_Reg,Hora_Delay 
from Modulo2.dbo.REGISTRO where NOT  Modulo2.dbo.REGISTRO.Hora_Reg
IN	(SELECT Hora_Reg FROM registro) and NOT  Modulo2.dbo.REGISTRO.Rut_Fun
IN	(SELECT Rut_Fun FROM registro);


truncate table Modulo1.dbo.REGISTRO;
truncate table Modulo2.dbo.REGISTRO;
truncate table registro

insert into modulo1.dbo.REGISTRO select Rut_Fun,Nom_Fun	,Cod_Mod,Tipo_Reg,Fecha_Reg,Hora_Reg,Hora_Delay 
from REGISTRO;
insert into modulo2.dbo.REGISTRO select Rut_Fun,Nom_Fun	,Cod_Mod,Tipo_Reg,Fecha_Reg,Hora_Reg,Hora_Delay 
from REGISTRO;
 
 
 select * from REGISTRO

 
 
  
insert into registro
SELECT M1R.Rut_Fun,M1R.Nom_Fun,M1R.Cod_Mod,M1R.Tipo_Reg,M1R.Fecha_Reg,M1R.Hora_Reg,M1R.Hora_Delay 
FROM modulo1.dbo.REGISTRO  M1R 
WHERE NOT EXISTS
(SELECT Hora_Reg,Hora_Delay 
FROM registro )


SELECT [modulo1.dbo.REGISTRO].* FROM [Tabla1] LEFT JOIN [Tabla2] ON [Tabla1].[ID] =
[Tabla2].[ID] WHERE [Tabla2].[ID] IS NULL

Select R1.Cod_Reg, R1.Nom_Fun, R1.Tipo_Reg 
From modulo1.dbo.REGISTRO R1, REGISTRO R
where not r.Hora_Reg In (select )


insert into registro
Select Rut_Fun,Nom_Fun,Cod_Mod,Tipo_Reg,Fecha_Reg,Hora_Reg,Hora_Delay From modulo1.dbo.REGISTRO 
where Not Hora_Reg In (Select Hora_Reg From REGISTRO);
insert into registro
Select Rut_Fun,Nom_Fun,Cod_Mod,Tipo_Reg,Fecha_Reg,Hora_Reg,Hora_Delay From modulo2.dbo.REGISTRO 
where Not Hora_Reg In (Select Hora_Reg From REGISTRO);

truncate table modulo1.dbo.REGISTRO;
truncate table modulo2.dbo.REGISTRO ;

insert into modulo1.dbo.REGISTRO
select  Rut_Fun,Nom_Fun,Cod_Mod,Tipo_Reg,Fecha_Reg,Hora_Reg,Hora_Delay from REGISTRO;
insert into modulo2.dbo.REGISTRO
select  Rut_Fun,Nom_Fun,Cod_Mod,Tipo_Reg,Fecha_Reg,Hora_Reg,Hora_Delay from REGISTRO;

select * from modulo1.dbo.REGISTRO
select * from modulo2.dbo.REGISTRO
select * from REGISTRO
 
 
 
insert into REGISTRO SELECT M1R.Rut_Fun,M1R.Nom_Fun,M1R.Cod_Mod,M1R.Tipo_Reg,M1R.Fecha_Reg,M1R.Hora_Reg,M1R.Hora_Delay FROM modulo1.dbo.REGISTRO  M1R WHERE NOT EXISTS 
 (SELECT p.Rut_Fun,p.Nom_Fun,p.Cod_Mod,p.Tipo_Reg,p.Fecha_Reg,p.Hora_Reg, p.Hora_Delay FROM registro p
WHERE not M1R.Rut_Fun=p.Rut_Fun and M1R.Hora_Reg = p.Hora_Reg and M1R.Tipo_Reg = p.Tipo_Reg)