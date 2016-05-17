
create database pruebas
use pruebas



drop table persona
create table persona
(
	rut varchar(10),
	nombre varchar(20),
)


insert into persona values (65772000, 'alcaino')
insert into persona values(79592954,'jaime')


update persona set rut = '79592951' where rut = '79592954'



-------------------------------------------------------------------------------------------
create database pruebas2
use pruebas2


create table persona
(
	rut varchar(10),
	nombre varchar(20),
)



insert into persona values (177470333, 'matias')
insert into persona values(79592951,'jaime')



select * from pruebas.dbo.persona
select * from persona


select * from persona p1
where not exists (
select * from pruebas.dbo.persona p2 where p1.rut = p2.rut and p1.nombre = p2.nombre)

truncate table Mantenedor.dbo.REGISTRO




insert into  Mantenedor.dbo.REGISTRO
select	f1.Codigo_Funcionario, f1.Rut_Funcionario, f1.DigitoV_Funcionario, f1.Nom_Funcionario,
		f1.Cod_Modulo, f1.Tipo_Registro, f1.Fecha_Registro, f1.Hora_Registro, f1.Hora_Delay_registro 
		from Modulo2.dbo.REGISTRO  f1
where not exists(
select * from Mantenedor.dbo.REGISTRO f2 
	where f1.Codigo_Funcionario = f2.Codigo_Funcionario
	and f1.Rut_Funcionario = f2.Rut_Funcionario
	and f1.DigitoV_Funcionario = f2.DigitoV_Funcionario
	and f1.Nom_Funcionario = f2.Nom_Funcionario
	and f1.Cod_Modulo = f2.Cod_Modulo
	and f1.Tipo_Registro = f2.Tipo_Registro
	and f1.Fecha_Registro = f2.Fecha_Registro
	and f1.Hora_Registro = f2.Hora_Registro
	and f1.Hora_Delay_registro = f2.Hora_Delay_registro)
	
	
	
	
	
insert Mantenedor.dbo.REGISTRO select	f1.Codigo_Funcionario, f1.Rut_Funcionario, f1.DigitoV_Funcionario, f1.Nom_Funcionario,f1.Cod_Modulo, f1.Tipo_Registro, f1.Fecha_Registro, f1.Hora_Registro, f1.Hora_Delay_registro from Modulo1.dbo.REGISTRO  f1 where not exists( select * from Mantenedor.dbo.REGISTRO f2 where f1.Codigo_Funcionario = f2.Codigo_Funcionario and f1.Rut_Funcionario = f2.Rut_Funcionario and f1.DigitoV_Funcionario = f2.DigitoV_Funcionario and f1.Nom_Funcionario = f2.Nom_Funcionario and f1.Cod_Modulo = f2.Cod_Modulo and f1.Tipo_Registro = f2.Tipo_Registro and f1.Fecha_Registro = f2.Fecha_Registro and f1.Hora_Registro = f2.Hora_Registro and f1.Hora_Delay_registro = f2.Hora_Delay_registro)
		


create proc REGISTRAR
(	
	@Codigo_Funcionario		int,
	@Rut_Funcionario		varchar(8),
	@DigitoV_Funcionario	char,
	@Nom_Funcionario		varchar(100),
	@Cod_Modulo				int,
	@Tipo_Registro			varchar(10),
	@Fecha_Registro			date,
	@Hora_Registro			datetime,
	@Hora_Delay_registro	datetime	
)
as begin
insert Mantenedor.dbo.REGISTRO
select	f1.Codigo_Funcionario, f1.Rut_Funcionario, f1.DigitoV_Funcionario, f1.Nom_Funcionario,
		f1.Cod_Modulo, f1.Tipo_Registro, f1.Fecha_Registro, f1.Hora_Registro, f1.Hora_Delay_registro 
		from Modulo1.dbo.REGISTRO  f1
where not exists(
select * from Mantenedor.dbo.REGISTRO f2 
	where f1.Codigo_Funcionario = f2.Codigo_Funcionario
	and f1.Rut_Funcionario = f2.Rut_Funcionario
	and f1.DigitoV_Funcionario = f2.DigitoV_Funcionario
	and f1.Nom_Funcionario = f2.Nom_Funcionario
	and f1.Cod_Modulo = f2.Cod_Modulo
	and f1.Tipo_Registro = f2.Tipo_Registro
	and f1.Fecha_Registro = f2.Fecha_Registro
	and f1.Hora_Registro = f2.Hora_Registro
	and f1.Hora_Delay_registro = f2.Hora_Delay_registro)
end 




	
select * from Mantenedor.dbo.REGISTRO f1

select * from Modulo1.dbo.REGISTRO as f1

select * from Modulo2.dbo.REGISTRO as f2 
	
	
	select Rut_Funcionario, DigitoV_Funcionario , Nom_Funcionario, Tipo_Registro, Cod_Modulo  from REGISTRO order by Codigo_Registro DESC
	
	select * from registro

	DigitoV_Funcionario
select f1.* from Modulo1.dbo.FUNCIONARIO as f1
left join Mantenedor.dbo.FUNCIONARIO as f2 on f1.Codigo_Funcionario = f2.Codigo_Funcionario
	and f1.Rut_Funcionario = f2.Rut_Funcionario 
	and f1.DigitoV_Funcionario = f2.DigitoV_Funcionario
	and f1.ApellidoP_Funcionario = f2. ApellidoP_Funcionario 
	and f1.ApellidoM_Funcionario = f2.ApellidoM_Funcionario 
	and f1.Nombre_Funcionario = f2.Nombre_Funcionario
	and f1.Sexo_Funcionairo = f2.Sexo_Funcionairo 
	and f1.Fecha_Nacimiento_Funcionario = f2.Fecha_Nacimiento_Funcionario
	and f1.Telefono_Funcionario = f2.Telefono_Funcionario 
	and f1.Celular_Funcionario = f2.Celular_Funcionario
	and f1.Correo_Funcionario = f2.Correo_Funcionario
	and f1.Profesion_Funcionario = f2.Profesion_Funcionario
	and f1.Cargo_Funcionario = f2.Cargo_Funcionario 
	and f1.Departamento_Funcionario = f2.Departamento_Funcionario
	and f1.Ciclo_Funcionario = f2.Ciclo_Funcionario 
	and f1.Horario_Asignado_Funcionario = f2.Horario_Asignado_Funcionario
	and f1.Estado_Funcionario = f2.Estado_Funcionario
where f2.Codigo_Funcionario is null 
	and f2.Rut_Funcionario is null 
	and f2.DigitoV_Funcionario is null 
	and f2.ApellidoP_Funcionario is null 
	and f2.ApellidoM_Funcionario is null 
	and f2.Nombre_Funcionario is null 
	and f2.Sexo_Funcionairo is null 
	and f2.Fecha_Nacimiento_Funcionario is null 
	and f2.Telefono_Funcionario is null 
	and f2.Celular_Funcionario is null 
	and f2.Correo_Funcionario is null 
	and f2.Profesion_Funcionario is null 
	and f2.Cargo_Funcionario is null 
	and f2.Departamento_Funcionario is null 
	and f2.Ciclo_Funcionario is null 
	and f2.Horario_Asignado_Funcionario is null 
	and f2.Estado_Funcionario is null 
	
	
	
	
	select * from Modulo1.dbo.FUNCIONARIO where Rut_Funcionario = '7959295'
	select * from Mantenedor.dbo.FUNCIONARIO where Rut_Funcionario =  '7959295'
	
SELECT * FROM Mantenedor.dbo.REGISTRO
SELECT * FROM Modulo1.dbo.REGISTRO
SELECT * FROM Modulo2.dbo.REGISTRO


TRUNCATE TABLE Modulo1.dbo.REGISTRO;
TRUNCATE TABLE Modulo2.dbo.REGISTRO;
INSERT INTO Modulo1.dbo.REGISTRO SELECT Codigo_Funcionario,	Rut_Funcionario	,DigitoV_Funcionario,Nom_Funcionario,Cod_Modulo,Tipo_Registro,Fecha_Registro,Hora_Registro,Hora_Delay_registro FROM Mantenedor.dbo.REGISTRO;
INSERT INTO Modulo2.dbo.REGISTRO SELECT Codigo_Funcionario,	Rut_Funcionario	,DigitoV_Funcionario,Nom_Funcionario,Cod_Modulo,Tipo_Registro,Fecha_Registro,Hora_Registro,Hora_Delay_registro FROM Mantenedor.dbo.REGISTRO;




select Rut_Funcionario, DigitoV_Funcionario , Nom_Funcionario, CONVERT(VARCHAR(8),Hora_Registro,108)  , Tipo_Registro, Cod_Modulo  from REGISTRO order by Codigo_Registro DESC