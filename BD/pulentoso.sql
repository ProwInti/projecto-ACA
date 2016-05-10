drop database pruebas

create database pruebas
use pruebas

drop proc RegistrarRegistro

go
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


select Tipo_Reg from REGISTRO where Cod_Reg = (select MAX(Cod_Reg)from REGISTRO where Rut_Fun = '177470333')

insert into FUNCIONARIO values ('177470333','Matias Nicolas Orostegui Espinoza','Doña Ester 3, Pasaje Valle Nevado #0420','matias.orostegui@institutoingles.cl','+56998863731',25)

insert into USUARIO values('177470333','123456')


select * from FUNCIONARIO
select * from REGISTRO
select * from USUARIO

select MAX(Cod_Reg) from REGISTRO where Rut_Fun='177470333'

select top 10  Nom_Fun, Tipo_Reg   from registro order by Cod_Reg DESC 


exec RegistrarRegistro  '177470333',  'Matias Nicolas Orostegui Espinoza', 2, 'SALIDA'

exec RegistrarRegistro  '177470333',  'Matias Nicolas Orostegui Espinoza', 2, 'SALIDA'
truncate table registro

select Hora_Reg from REGISTRO where Cod_Reg = (select MAX(Cod_Reg) from REGISTRO where Rut_Fun='177470333')
select Hora_Delay from REGISTRO where Cod_Reg = (select MAX(Cod_Reg)from REGISTRO where Rut_Fun = '177470333')

IF (CONVERT (time, GETDATE())) >
(select Hora_Delay from REGISTRO where Cod_Reg = (select MAX(Cod_Reg)from REGISTRO where Rut_Fun = '177470333'))
select 'true'
else select 'false'
go






truncate table registro






select Nombre_Completo from FUNCIONARIO where Rut = '177470333'

select Hora_Delay from REGISTRO where Cod_Reg = (select MAX(Cod_Reg)from REGISTRO where Rut_Fun = '177470333')

select Tipo_Reg from REGISTRO where Cod_Reg = (select MAX(Cod_Reg)from REGISTRO where Rut_Fun = '177470333')

IF (GETDATE()) > (select Hora_Delay from REGISTRO where Cod_Reg = (select MAX(Cod_Reg)from REGISTRO where Rut_Fun = '177470333'))select 'true'else select 'false'go


IF (GETDATE())) > (select Hora_Delay from REGISTRO where Cod_Reg = (select MAX(Cod_Reg)from REGISTRO where '"+rut+"' = '177470333'))select 'true'else select 'false'go






insert into FUNCIONARIO values ('177470333','Matias Nicolas Orostegui Espinoza','Doña Ester 3, Pasaje Valle Nevado #0420','matias.orostegui@institutoingles.cl','+56998863731',25)
insert into FUNCIONARIO values ('162231340','Jose Roverto Acevedo Morales','Doña Ester 3, Pasaje Valle Nevado #0420','matias.orostegui@institutoingles.cl','+56998863731',25)
insert into FUNCIONARIO values ('238480590','Domingo Sharp Wormull','Doña Ester 3, Pasaje Valle Nevado #0420','matias.orostegui@institutoingles.cl','+56998863731',25)
insert into FUNCIONARIO values ('241587436','Dominga Contador WillatT','Doña Ester 3, Pasaje Valle Nevado #0420','matias.orostegui@institutoingles.cl','+56998863731',25)







(select Hora_Reg from  REGISTRO where Rut_Fun = '241240746' and Tipo_Reg = 'SALIDA') (select Hora_Reg from  REGISTRO where Rut_Fun = '241240746' and Tipo_Reg = 'ENTRADA')


SELECT ADDTIME((select Hora_Reg from  REGISTRO where Rut_Fun = '241240746' and Tipo_Reg = 'SALIDA'),(select Hora_Reg from  REGISTRO where Rut_Fun = '241240746' and Tipo_Reg = 'ENTRADA'))


SELECT idEmpleado, SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(HoraSalida, HoraEntrada)))) TotalHoras
FROM tabla
GROUP BY idEmpleado;


SELECT HOUR(SEC_TO_TIME(SUM(TIME_TO_SEC(horas_trabajada)))) TotalHoras
    -> FROM Tabla;
    
    
    
    
SELECT SUM(DATEDIFF(MILLISECOND,(select Hora_Reg from  REGISTRO where Tipo_Reg = 'ENTRADA' and Rut_Fun = '241240746' ),(select Hora_Reg from  REGISTRO where Tipo_Reg = 'SALIDA' and Rut_Fun = '241240746' )))


SELECT SUM(DATEDIFF(MILLISECOND);












