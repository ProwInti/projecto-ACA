create database modulo1
use modulo1

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
