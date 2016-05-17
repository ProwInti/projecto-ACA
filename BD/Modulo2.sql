create database Modulo2;
use Modulo2;

drop database Modulo2

create table CARGO
(
	Codigo_Cargo	int primary key,
	Descripcion		varchar(40)
)
/*
	ADFA12
	
	Cod_Car		Código Cargo
	Des_Car		Descripción de Cargo	
*/

create table PROFESION
(
	/*Campos a Semejanza De La Tabla ADFA08*/
	Codigo_Profesion	int primary key,
	Descripcion			varchar(40)
)
/*
	Tabla ADFA08

	Cod_Prof	Código Profesión
	Des_Prof	Descripción Profesión
*/

create table DEPARTAMENTO
(
	Codigo_Departamento		int primary key,
	Descripcion				varchar(40)
)

create table CICLO
(
	Codigo_Ciclo	int primary key,
	Descripcion		varchar(40)
)

create table HORARiO
(
	Codigo_Horiaro	int primary key,
	Descripcion		varchar(40)
)

create table HORARIO_ASIGNADO
(
	Codigo_Asignado	int primary key,
	Codigo_Horario  int foreign key references HORARIO
)

create table DIA_HORARIO
(	
	Codigo_Dia		int primary key,
	Nombre_Dia		varchar(10),
	Hora_Entrada	Time(0),
	Hora_Salida		Time(0),
	Codigo_Horario	int foreign key references HORARIO,
)

create table FUNCIONARIO
(
	/*Campos a Semejanza De La Tabla ADFA11*/
	Codigo_Funcionario				int primary key,
	Rut_Funcionario					varchar(8),
	DigitoV_Funcionario				char,
	ApellidoP_Funcionario			varchar(60),
	ApellidoM_Funcionario			varchar(60),
	Nombre_Funcionario				varchar(60),
	Sexo_Funcionairo				char,
	Fecha_Nacimiento_Funcionario	DATE,
	Telefono_Funcionario			varchar(20),
	Celular_Funcionario				varchar(20),
	Correo_Funcionario				varchar(60),
	Profesion_Funcionario			int foreign key references PROFESION,
	Cargo_Funcionario				int foreign key references CARGO,	
	/*Campos Incluidos*/
	Departamento_Funcionario		int foreign key references DEPARTAMENTO,
	Ciclo_Funcionario				int	foreign key references CICLO,
	Horario_Asignado_Funcionario	int foreign key references HORARIO_ASIGNADO,
	Estado_Funcionario				char
)

/*
	Tabla ADFA11

	Rut_Fun		Rut Funcionario
	Dig_Fun		Dv Funcionario
	Pat_fun		Apellido Paterno Funcionario
	Mat_fun		Apellido Materno Funcionario
	Nom_Fun		Nombre Funcionario
	Sex_Fun		Sexo Fun
	Fnac_Fun	Fecha Nac Fun
	Fon_Fun		Fono Fun
	Cel_Fun		Celular Funcionario
	Cod_Prof	Código Profesión
	Cod_Car		Código Cargo
	Est_Fun_11	A(ctivo) I(nhibido) R(etirado)
*/


create table USUARIO
(
	Codigo_Login		int identity(1,1) primary key not null,
	Codigo_Funcionario	int foreign key references FUNCIONARIO,
	Clave_Funcionario	varchar(50)
)

create table REGISTRO
(
	Codigo_Registro			int identity(1,1) primary key,
	Codigo_Funcionario		int foreign key references FUNCIONARIO,
	Rut_Funcionario			varchar(8),
	DigitoV_Funcionario		char,
	Nom_Funcionario			varchar(100),
	Cod_Modulo				int,
	Tipo_Registro			varchar(10),
	Fecha_Registro			date,
	Hora_Registro			datetime,
	Hora_Delay_registro		datetime,
)

/*Procedimiento de Almacenado Tabla FUNCIONARIO*/
go
create proc Registrar_Funcionarios
(
	@Codigo_Funcionario				int,
	@Rut_Funcionario				varchar(8),
	@DigitoV_Funcionario			char,
	@ApellidoP_Funcionario			varchar(60),
	@ApellidoM_Funcionario			varchar(60),
	@Nombre_Funcionario				varchar(60),
	@Sexo_Funcionairo				char,
	@Fecha_Nacimiento_Funcionario	Datetime,
	@Telefono_Funcionario			varchar(20),
	@Celular_Funcionario			varchar(20),
	@Correo_Funcionario				varchar(60),
	@Profesion_Funcionario			int,
	@Cargo_Funcionario				int,	

	@Departamento_Funcionario		int,
	@Ciclo_Funcionario				int,
	@Horario_Asignado_Funcionario	int,
	@Estado_Funcionario				char
)
as begin
insert into FUNCIONARIO values
	(
		@Codigo_Funcionario,
		@Rut_Funcionario,
		@DigitoV_Funcionario,
		@ApellidoP_Funcionario,
		@ApellidoM_Funcionario,
		@Nombre_Funcionario,
		@Sexo_Funcionairo,
		@Fecha_Nacimiento_Funcionario,
		@Telefono_Funcionario,
		@Celular_Funcionario,
		@Correo_Funcionario,
		@Profesion_Funcionario,
		@Cargo_Funcionario,	

		@Departamento_Funcionario,
		@Ciclo_Funcionario,
		@Horario_Asignado_Funcionario,
		@Estado_Funcionario	
	)
end 

/*Procedimiento de Almacenado Tabla REGISTRO*/
go
create proc Registrar_Registro
(	
	@Codigo_Funcionario		int,
	@Rut_Funcionario		varchar(8),
	@DigitoV_Funcionario	char,
	@Nom_Funcionario		varchar(100),
	@Cod_Modulo				int,
	@Tipo_Registro			varchar(10)
)
as begin
insert into registro values
	(
		@Codigo_Funcionario,
		@Rut_Funcionario,
		@DigitoV_Funcionario,
		@Nom_Funcionario,
		@Cod_Modulo,
		@Tipo_Registro,
		GETDATE(),
		GETDATE(),
		DATEADD(second,10,GETDATE())
	)
end 



/*Inserciones a la Tabla CARGO*/
insert into CARGO values (1,'PROFESOR E.MEDIA')
insert into CARGO values (2,'PROFESOR E.BASICA')
insert into CARGO values (3,'JEFE DE PROYECTO')
insert into CARGO values (4,'ASISTENTE NIVEL PREESCOLAR')
insert into CARGO values (5,'EDUCADORA NIVEL PREESCOLAR')
insert into CARGO values (6,'DIRECTORA E.BASICA')
insert into CARGO values (7,'DIRECTOR E.MEDIA')
insert into CARGO values (8,'GERENTE ADMINISTRATIVO')
insert into CARGO values (9,'SECRETARIA')
insert into CARGO values (10,'CONTADOR')
insert into CARGO values (11,'INSPECTOR')
insert into CARGO values (12,'PERSONAL DE APOYO')
insert into CARGO values (13,'ADMINISTRADOR DE INFORMATICA')
insert into CARGO values (14,'ENCARGADO AUDIOVISUALES')
insert into CARGO values (15,'BIBLIOTECARIA')
insert into CARGO values (16,'ORIENTADOR')
insert into CARGO values (17,'RECTOR')
insert into CARGO values (18,'AUXILIAR DE ASEO')
insert into CARGO values (19,'MAYORDOMO')
insert into CARGO values (20,'MAESTRO JARDINERO')
insert into CARGO values (21,'ENFERMERIA')
insert into CARGO values (22,'DISEÑADORA')
insert into CARGO values (23,'TECNICO AUDIOVISUAL')
insert into CARGO values (24,'ASISTENTE BIBLIOTECA')
insert into CARGO values (25,'TECNICO PARAMEDICO')
insert into CARGO values (26,'JEFE DE TECNOLOGIA INFORMATICA')
insert into CARGO values (27,'ANALISTA CONTABLE')
insert into CARGO values (28,'JEFE ADMINISTRATIVO')
insert into CARGO values (29,'SUPERVISOR DE OPERACIONES')
insert into CARGO values (30,'JEFE DE OPERACIONES')
insert into CARGO values (31,'JUNIOR')
insert into CARGO values (32,'AUXILIAR DE BIBLIOTECA')
insert into CARGO values (33,'ADMINISTRATIVO CONTABLE')
insert into CARGO values (34,'COORDINADOR GRAL DE DEPORTES')
insert into CARGO values (35,'PSICOLOGA')
insert into CARGO values (36,'COEDUCADORA')
insert into CARGO values (37,'PROFESORA JEFE DE GRAL.BASICA')
insert into CARGO values (38,'PROFESOR/A EDUCACION FISICA')
insert into CARGO values (39,'PROFESORA JEFE PRE-ESCOLAR')
insert into CARGO values (40,'PROFESOR DE MATEMATICAS')
insert into CARGO values (41,'PROFESOR DE HISTORIA')
insert into CARGO values (42,'SOPORTE Y SISTEMAS')
insert into CARGO values (43,'INSPECTORA GENERAL')
insert into CARGO values (44,'JEFE DE MANTENCIONES')
insert into CARGO values (45,'ASISTENTE EN INFORMATICA')


/*Inserciones a la Tabla PROFESION*/
insert into PROFESION values(1,'ABOGADO')
insert into PROFESION values(69,'ACTRIZ')
insert into PROFESION values(153,'ADMINISTRACION AGRICOLA')
insert into PROFESION values(67,'ADMINISTRADOR')
insert into PROFESION values(31,'ADMINISTRADOR DE EMPRESAS')
insert into PROFESION values(66,'ADMINISTRADOR HOTELERO')
insert into PROFESION values(85,'ADMINISTRADOR PUBLICO')
insert into PROFESION values(27,'ADMINISTRATIVO')
insert into PROFESION values(160,'ADMINISTRATIVO')
insert into PROFESION values(206,'AGENTE')
insert into PROFESION values(26,'AGENTE DE VENTAS')
insert into PROFESION values(182,'AGENTE DE VIAJES')
insert into PROFESION values(20,'AGRICULTOR')
insert into PROFESION values(138,'AGRONOMO')
insert into PROFESION values(164,'ANALISTA DE SISTEMA')
insert into PROFESION values(81,'ANALISTA INFORMATICO')
insert into PROFESION values(71,'ANTROPOLOGO')
insert into PROFESION values(2,'ARQUITECTO')
insert into PROFESION values(40,'ARSENALERO')
insert into PROFESION values(25,'ARTISTA')
insert into PROFESION values(237,'ASISTENTE BIBLIOTECA')
insert into PROFESION values(47,'ASISTENTE SOCIAL')
insert into PROFESION values(137,'AUDITOR')
insert into PROFESION values(107,'AUXILIAR DE PARVULOS')
insert into PROFESION values(129,'AUXILIAR DE SERVICIOS MENORES')
insert into PROFESION values(209,'AUXILIAR DE VUELOS')
insert into PROFESION values(239,'AYUDANTE EMFERMERIA')
insert into PROFESION values(228,'AYUDANTIA')
insert into PROFESION values(181,'BANQUETERA')
insert into PROFESION values(159,'BAQUETERA')
insert into PROFESION values(143,'BIBLIOTECARIA')
insert into PROFESION values(68,'BIBLIOTECOLOGO')
insert into PROFESION values(79,'BIOLOGO')
insert into PROFESION values(73,'BIOQUIMICO')
insert into PROFESION values(152,'CANTANTE')
insert into PROFESION values(139,'CAPITAN DE EJERCITO')
insert into PROFESION values(92,'CAPTADOR')
insert into PROFESION values(133,'CARPINTERO')
insert into PROFESION values(235,'CIENTISTA POLITICA')
insert into PROFESION values(33,'CIRUJANO DENTISTA')
insert into PROFESION values(176,'CIRUJANO INFANTIL')
insert into PROFESION values(7,'COMERCIANTE')
insert into PROFESION values(108,'COMERCIO FRUTICOLA')
insert into PROFESION values(88,'COMUNICADOR SOCIAL')
insert into PROFESION values(51,'CONSTRUCTOR CIVIL')
insert into PROFESION values(14,'CONTADOR')
insert into PROFESION values(42,'CONTADOR AUDITOR')
insert into PROFESION values(49,'CORREDOR DE PROPIEDADES')
insert into PROFESION values(115,'CORREDOR DE SEGUROS')
insert into PROFESION values(113,'COSMETOLOGA')
insert into PROFESION values(22,'DECORADORA')
insert into PROFESION values(41,'DENTISTA')
insert into PROFESION values(125,'DESIÑO INDUSTRIAL')
insert into PROFESION values(216,'DIBUJANTE ARQUITECTONICO')
insert into PROFESION values(120,'DIRECCION YPROD.CINE Y T.V.')
insert into PROFESION values(174,'DISEÑADOR')
insert into PROFESION values(96,'DISEñADOR GRAFICO')
insert into PROFESION values(24,'DISEñADORA')
insert into PROFESION values(186,'DISEÑADORA VESTUARIO MENCION TEXTIL')
insert into PROFESION values(187,'DISEÑO INDUSTRIAL')
insert into PROFESION values(210,'DISEÑO INDUSTRIAL')
insert into PROFESION values(212,'DISEÑO INDUSTRIAL')
insert into PROFESION values(246,'DISEÑO INDUSTRIAL')
insert into PROFESION values(30,'DUEñA DE CASA')
insert into PROFESION values(126,'ECONOMISTA')
insert into PROFESION values(65,'ECONOMISTA AGRONOMO')
insert into PROFESION values(21,'EDUCADORA DE PARVULOS')
insert into PROFESION values(251,'EDUCADORA DE PARVULOS')
insert into PROFESION values(151,'EDUCADORA DIFERENCIAL')
insert into PROFESION values(189,'EGRESADA DERECHO')
insert into PROFESION values(12,'EJECUTIVO DE CUENTAS')
insert into PROFESION values(11,'EJECUTIVO DE VENTAS')
insert into PROFESION values(29,'EMERITO')
insert into PROFESION values(54,'EMPLEADO')
insert into PROFESION values(16,'EMPRESARIO')
insert into PROFESION values(15,'ENFERMERA')
insert into PROFESION values(167,'ENFERMERA MATRONA')
insert into PROFESION values(154,'ENOLOGO')
insert into PROFESION values(223,'ENOLOGO')
insert into PROFESION values(178,'ESCULTOR')
insert into PROFESION values(232,'ESTADISTICO')
insert into PROFESION values(147,'ESTUDIANTE')
insert into PROFESION values(166,'FONOAUDIOLOGA')
insert into PROFESION values(82,'FOTOGRAFO')
insert into PROFESION values(145,'FUTBOLISTA')
insert into PROFESION values(241,'GASTROENTEROLOGO PEDIATRICO')
insert into PROFESION values(70,'GEOFISICO')
insert into PROFESION values(100,'GEOGRAFO')
insert into PROFESION values(62,'GEOLOGO')
insert into PROFESION values(106,'GERENTE AGRICOLA')
insert into PROFESION values(105,'GERENTE DE PLANTA')
insert into PROFESION values(89,'GERENTE RECURSOS HUMANOS')
insert into PROFESION values(97,'HOTELERO /A')
insert into PROFESION values(80,'INDEPENDIENTE')
insert into PROFESION values(101,'INDUSTRIAL')
insert into PROFESION values(83,'INDUSTRIAL PANIFICADOR')
insert into PROFESION values(204,'ING. EN CONCTROL DE CALIDAD')
insert into PROFESION values(34,'INGENIERO')
insert into PROFESION values(74,'INGENIERO AGRICOLA')
insert into PROFESION values(221,'INGENIERO AGRO INDUSTRIAL')
insert into PROFESION values(5,'INGENIERO AGRONOMO')
insert into PROFESION values(171,'INGENIERO AGRONOMO ENOLOGO')
insert into PROFESION values(142,'INGENIERO ALIMENTO')
insert into PROFESION values(202,'INGENIERO AMBIENTAL')
insert into PROFESION values(23,'INGENIERO CIVIL')
insert into PROFESION values(52,'INGENIERO CIVIL ELECTRICISTA')
insert into PROFESION values(184,'INGENIERO CIVIL ELECTRONICO')
insert into PROFESION values(211,'INGENIERO CIVIL EN AGRONEGOCIOS')
insert into PROFESION values(3,'INGENIERO CIVIL INDUSTRIAL')
insert into PROFESION values(240,'INGENIERO CIVIL INFORMATICO')
insert into PROFESION values(45,'INGENIERO CIVIL MECANICO')
insert into PROFESION values(57,'INGENIERO CIVIL METALURGICO')
insert into PROFESION values(19,'INGENIERO CIVIL MINAS')
insert into PROFESION values(173,'INGENIERO CIVIL QUIMICO')
insert into PROFESION values(38,'INGENIERO COMERCIAL')
insert into PROFESION values(155,'INGENIERO COMERCIAL')
insert into PROFESION values(180,'INGENIERO CONSTRUCTOR')
insert into PROFESION values(183,'INGENIERO CONSTRUCTOR')
insert into PROFESION values(37,'INGENIERO DE FINANZAS')
insert into PROFESION values(98,'INGENIERO EJECUCION EN MINAS')
insert into PROFESION values(59,'INGENIERO ELECTRICO')
insert into PROFESION values(162,'INGENIERO EN ADMINISTRACION')
insert into PROFESION values(185,'INGENIERO EN AGRONEGOCIOS')
insert into PROFESION values(60,'INGENIERO EN ALIMENTOS')
insert into PROFESION values(225,'INGENIERO EN AVIACION')
insert into PROFESION values(214,'INGENIERO EN COMERCIO')
insert into PROFESION values(215,'INGENIERO EN INFORMATICA')
insert into PROFESION values(146,'INGENIERO EN PREVENCION DE RIESGO')
insert into PROFESION values(196,'INGENIERO EN TURISMO')
insert into PROFESION values(141,'INGENIERO FORESTAL')
insert into PROFESION values(140,'INGENIERO INDUSTRIAL')
insert into PROFESION values(17,'INGENIERO INFORMATICO')
insert into PROFESION values(172,'INGENIERO MECANICO')
insert into PROFESION values(58,'INGENIERO METALURGICO')
insert into PROFESION values(77,'INGENIERO QUIMICO')
insert into PROFESION values(231,'INGERIERO GEOMENSOR')
insert into PROFESION values(208,'INSTRUCTORA DE DANZA')
insert into PROFESION values(175,'INSTRUMENTISTA QUIRURGICO')
insert into PROFESION values(198,'INTERIORISTA')
insert into PROFESION values(109,'INTERPRETE')
insert into PROFESION values(135,'JARDINERO')
insert into PROFESION values(245,'JEFE DE OPERACIONES')
insert into PROFESION values(87,'JEFE DE PLANTA')
insert into PROFESION values(242,'JEFE TECNOLOGIA INFORMATICA')
insert into PROFESION values(36,'KINESEOLOGO')
insert into PROFESION values(84,'LABORATORISTA DENTAL')
insert into PROFESION values(197,'LICENCIADA EN ARTE')
insert into PROFESION values(177,'LICENCIADA EN ENFERMERIA')
insert into PROFESION values(131,'LICENCIATURA EN ESTADISTICA')
insert into PROFESION values(165,'LICENDIADA EN ESTUDIOS TURISTICOS')
insert into PROFESION values(205,'MAGISTER EN ADIMINSTRACION DE NEGOC')
insert into PROFESION values(112,'MARTILLERO PUBLICO')
insert into PROFESION values(6,'MATRONA')
insert into PROFESION values(134,'MAYORDOMO')
insert into PROFESION values(4,'MECANICO')
insert into PROFESION values(39,'MEDICO')
insert into PROFESION values(169,'MEDICO NEUROCIRUJANO')
insert into PROFESION values(8,'MEDICO CIRUJANO')
insert into PROFESION values(9,'MEDICO DENTISTA')
insert into PROFESION values(192,'MEDICO DERMATOLOGO')
insert into PROFESION values(219,'MEDICO GINECOLOGO')
insert into PROFESION values(218,'MEDICO NEUROLOGO')
insert into PROFESION values(168,'MEDICO PEDIATRA')
insert into PROFESION values(158,'MEDICO RADIOLOGO')
insert into PROFESION values(236,'MEDICO REUMATOLOGO')
insert into PROFESION values(217,'MEDICO SIQUIATRA')
insert into PROFESION values(191,'MEDICO TRAUMATOLOGO')
insert into PROFESION values(213,'MEDICO UROLOGO')
insert into PROFESION values(10,'MEDICO VETERINARIO')
insert into PROFESION values(150,'METALURGICO')
insert into PROFESION values(128,'MONITORA DANZA')
insert into PROFESION values(234,'MUSICO CLASICO')
insert into PROFESION values(199,'NEUROCIRUJANO')
insert into PROFESION values(117,'NUTRICIONISTA')
insert into PROFESION values(144,'OFICIAL DE CARABINEROS')
insert into PROFESION values(55,'OFICIAL EJERCITO')
insert into PROFESION values(148,'OFTALMOLOGO')
insert into PROFESION values(64,'OPERADOR DE COMPUTADOR')
insert into PROFESION values(99,'OPTICO CONTACTOLOGO')
insert into PROFESION values(91,'ORFEBRE')
insert into PROFESION values(90,'ORIENTADOR')
insert into PROFESION values(111,'ORTODONCISTA')
insert into PROFESION values(53,'PAISAJISTA')
insert into PROFESION values(121,'PARADOCENTE')
insert into PROFESION values(247,'PEDAGOGIA EN BASICA')
insert into PROFESION values(195,'PELUQUERA')
insert into PROFESION values(116,'PERIODISTA')
insert into PROFESION values(110,'PERITO AGRICOLA')
insert into PROFESION values(46,'PILOTO COMERCIAL')
insert into PROFESION values(132,'PINTOR')
insert into PROFESION values(179,'PINTORA')
insert into PROFESION values(222,'PLANIFIC. RECURSOS TURISTICOS')
insert into PROFESION values(226,'PREVENSION DE RIESGO')
insert into PROFESION values(13,'PROFESOR')
insert into PROFESION values(254,'PROFESOR DE HISTORIA')
insert into PROFESION values(253,'PROFESOR DE MATEMATICAS')
insert into PROFESION values(250,'PROFESOR/A DE EDUCACION BASICA')
insert into PROFESION values(248,'PROFESOR/A DE INGLES')
insert into PROFESION values(249,'PROFESOR/A EDUCACION FISICA')
insert into PROFESION values(252,'PROFESORA DE EDUCACION MEDIA')
insert into PROFESION values(18,'PROGRAMADOR DE COMPUTADORAS')
insert into PROFESION values(63,'PROYECTISTA')
insert into PROFESION values(156,'PSICOLOGA')
insert into PROFESION values(157,'PSICOLOGA')
insert into PROFESION values(233,'PSICOLOGA')
insert into PROFESION values(35,'PSICOLOGO')
insert into PROFESION values(102,'PSICOPEDAGOGA')
insert into PROFESION values(227,'PSICOTERAPEUTA')
insert into PROFESION values(114,'PUBLICISTA')
insert into PROFESION values(201,'PUBLICISTA')
insert into PROFESION values(44,'QUIMICO')
insert into PROFESION values(194,'QUIMICO FARMACEUTICO')
insert into PROFESION values(124,'QUIMICO LABORATORISTA')
insert into PROFESION values(118,'RECAUDADOR')
insert into PROFESION values(78,'RECEPTOR JUDICIAL')
insert into PROFESION values(136,'RECEPTORA JUDICIAL')
insert into PROFESION values(123,'RELACIONADOR PUBLICO')
insert into PROFESION values(244,'REPORTERIA Y TECNICO EN COCINA')
insert into PROFESION values(127,'SACERDOTE')
insert into PROFESION values(32,'SECRETARIA')
insert into PROFESION values(163,'SECRETARIA BIBLIOTECA')
insert into PROFESION values(86,'SECRETARIA BILINGUE')
insert into PROFESION values(122,'SECRETARIA EJECUTIVA')
insert into PROFESION values(999,'SIN PROFESION')
insert into PROFESION values(75,'SUPERVISOR')
insert into PROFESION values(243,'TEC.CONECTIVIDAD DE REDES')
insert into PROFESION values(190,'TECNICA DE LABORATORIO')
insert into PROFESION values(130,'TECNICO ADMINISTRATIVO')
insert into PROFESION values(56,'TECNICO AGRICOLA')
insert into PROFESION values(93,'TECNICO COMERCIALIZACION')
insert into PROFESION values(149,'TECNICO DE SERVICIOS')
insert into PROFESION values(103,'TECNICO ELECTRICO')
insert into PROFESION values(188,'TECNICO EN ADMINISTRACION DE AMPRES')
insert into PROFESION values(238,'TECNICO EN BIBLIOTECOLOGÍA')
insert into PROFESION values(161,'TECNICO EN CONSTRUCCION')
insert into PROFESION values(220,'TECNICO EN ENFERMERIA')
insert into PROFESION values(255,'TECNICO EN INGENIERIA EN MAQUINARIA')
insert into PROFESION values(61,'TECNICO EN TURISMO')
insert into PROFESION values(207,'TECNICO EN TURISMO')
insert into PROFESION values(104,'TECNICO FINANCIERO')
insert into PROFESION values(200,'TECNICO FINANCIERO')
insert into PROFESION values(119,'TECNICO FRUTICOLA')
insert into PROFESION values(170,'TECNICO MEDCANICO')
insert into PROFESION values(43,'TECNICO MEDICO')
insert into PROFESION values(72,'TECNICO TEXTIL')
insert into PROFESION values(48,'TECNICO UNIVERSITARIO')
insert into PROFESION values(94,'TECNOLOGO MEDICO')
insert into PROFESION values(224,'TERAPEUTA FLORAL')
insert into PROFESION values(230,'TERAPEUTA OCUPACIONAL')
insert into PROFESION values(193,'TOPOGRAFO')
insert into PROFESION values(28,'TRADUCTORA')
insert into PROFESION values(203,'TRADUCTORA IGLES FRANCES')
insert into PROFESION values(76,'TRANSPORTES INDUSTRIAL')
insert into PROFESION values(95,'TRANSPORTISTA')
insert into PROFESION values(50,'VENTAS')
insert into PROFESION values(229,'VISITADOR MEDICO')


/*Inserciones a la Tabla /*Inserciones a la Tabla PROFESION*/*/
insert into FUNCIONARIO values (6,'6577200','0','ALCAINO','TELLO','FRANCISCO J.','M','1956-12-12',214231,97424086,null,13,3,null,null,null,'A')
insert into FUNCIONARIO values (11,'8713047','9','BAZAN','CARDEMIL','MARIA EUGENIA','F','1960-05-06',11111111,98739761,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (14,'6662611','3','BRAVO','RIVERA','JAIME EDUARDO','M','1956-10-12',754533,98836166,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (16,'10154302','1','CAÑAS','OSMER','ANDREA PILAR','F','1967-10-08',585211,62087189,null,21,5,null,null,null,'A')
insert into FUNCIONARIO values (19,'6662605','9','CARVAJAL','MEDRANO','ENRIQUE','M','1956-10-10',254649,78645643,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (23,'8157622','K','CORRIAL','REBOLLEDO','RUTH','F','1959-01-31',651244,2222222222,null,107,4,null,null,null,'A')
insert into FUNCIONARIO values (24,'9471110','K','DE FERRARI','FONTECILLA','MARIA D.ROSARIO','F','1963-08-29',552178,93376420,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (25,'7961343','6','GALLEGOS','NUÑEZ','MANUEL','M','1958-03-12',280228,93570883,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (27,'9407337','5','GONZALEZ','BRAVO','JESSICA DEL R.','F','1962-10-07',750859,66571429,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (29,'7330228','5','GONZALEZ','RIOS','SEBASTIAN E.','M','1954-04-19',752769,82462368,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (40,'8101874','K','MARTINEZ','PIZARRO','MARCELA A.M.','F','1965-07-26',393053,98855859,null,21,5,null,null,null,'A')
insert into FUNCIONARIO values (42,'8729045','K','MEDINA','CONTRERAS','GERMAN A.','M','1960-06-29',462398,98791732,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (45,'8583582','3','OLEA','NUÑEZ','CLAUDIO','M','1961-09-08',245298,98443373,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (48,'7798642','1','ORTEGA','ROSALES','PATRICIA','F','1957-01-15',766376,85598104,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (50,'9251253','3','PEREZ','PANDOLFI','MARIA FERNANDA','F','1966-02-03',626400,92285688,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (52,'8137406','6','PINTO','CUEVAS','ANA L.','F','1960-08-05',251140,98261947,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (55,'9522723','6','PRADENAS','ROMAN','CRISTIAN','M','1963-08-17',230665,98791743,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (59,'7133796','0','RODRIGUEZ','CORTES','TERESA','F','1958-12-21',212126,97453894,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (60,'12291242','6','ROMERO','ALVAREZ','CAROLA','F','1972-03-22',755657,98860721,null,32,9,null,null,null,'A')
insert into FUNCIONARIO values (64,'9186196','8','SERRANO','SALIT','MARIANA','F','1962-04-01',452278,99050934,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (67,'7762014','1','URZUA','ALVAREZ','FERNANDO','M','1966-11-03',213257,0,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (70,'7447477','2','VILLALOBOS','LOPEZ','WALKIRIA','F','1957-10-02',251384,68421817,null,107,4,null,null,null,'A')
insert into FUNCIONARIO values (71,'7022774','6','ZAMORANO','RAMOS','ANA PAMELA','F','1957-09-01',954141,93037606,null,32,9,null,null,null,'A')
insert into FUNCIONARIO values (75,'7003634','7','GALILEA','VIDAURRE','ROSA','F','1958-11-28',553565,93221639,null,102,12,null,null,null,'A')
insert into FUNCIONARIO values (77,'8759412','2','MURILLO','TORO','RENE','M','1960-11-29',999999,93178825,null,13,32,null,null,null,'A')
insert into FUNCIONARIO values (78,'12911238','7','PUA','SOTO','JESUS','M','1975-07-06',230665,82085619,null,18,42,null,null,null,'A')
insert into FUNCIONARIO values (79,'12293481','0','SALGADO','GUZMAN','JULIA','F','1972-10-31',223660,975609979,null,32,9,null,null,null,'A')
insert into FUNCIONARIO values (81,'8684915','1','MELENDEZ','CARDOSO','CRISTINA I.','F','1962-05-01',252191,50685824,null,21,5,null,null,null,'A')
insert into FUNCIONARIO values (86,'10094991','1','MUÑOZ','ARANCIBIA','MARCIA','F','1964-08-27',219230,98718457,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (89,'9956750','3','FARFAN','SOTO','JOHNNY A.','M','1967-09-30',760863,97986772,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (90,'8418143','9','BERNARDO','ESCOBILLANA','MARIA ROSA','F','1963-09-30',471066,98514559,null,69,12,null,null,null,'A')
insert into FUNCIONARIO values (96,'7777002','K','ARQUES','HERNANDEZ','ROSA','F','1957-01-25',92440112,92440112,null,107,4,null,null,null,'A')
insert into FUNCIONARIO values (97,'8136445','1','HERRERA','MERCADO','OSCAR','M','1956-05-09',88497041,63036603,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (98,'6892966','0','ESPINA','CONTRERAS','JOSE','M','1953-05-10',261784,99411909,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (100,'7939821','7','CIFUENTES','BUSTAMANTE','ELIZABETH C.','F','1959-03-18',961850,95892904,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (111,'6642736','6','GARATE','MORI','HERNAN','M','1952-09-15',1111111,85293232,null,121,11,null,null,null,'A')
insert into FUNCIONARIO values (114,'9649828','4','SANCHEZ','RIVERA','JUAN FCO.','M','1963-11-25',255860,91253678,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (118,'7591507','1','OLAVARRIA','RODRIGUEZ','PAULINA','F','1964-11-11',760434,97422301,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (128,'10574040','9','MARTINEZ','ACEVEDO','CARLOS A.','M','1966-09-16',22222222,96890610,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (129,'10974363','1','EVANS','AGUILERA','JOHNNY A.','M','1970-03-18',210877,98461477,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (135,'13026212','0','PEREZ','CARO','MARIA FERNANDA','F','1975-12-16',755052,99293435,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (137,'6660342','3','CONTRERAS','VASQUEZ','GLORIA','F','1956-01-29',217605,0,null,128,12,null,null,null,'A')
insert into FUNCIONARIO values (140,'10479296','0','ESCOBAR','ORTIZ','JOSE F.','M','1967-10-27',230665,0,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (142,'6912732','0','GONZALEZ','ORELLANA','ILIA','M','1955-07-09',22222222,0,null,135,20,null,null,null,'A')
insert into FUNCIONARIO values (148,'14247815','3','ROJAS','MEDINA','VIVIANA DEL R.','F','1973-10-17',230665,0,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (153,'10606394','K','SOTO','PINO','MARIA ANGELICA','F','1965-06-14',553393,0,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (164,'9931739','6','ALVAREZ','TORREALBA','VERONICA','F','1966-05-29',530115,93097600,null,102,5,null,null,null,'A')
insert into FUNCIONARIO values (165,'8688857','2','MONTES','ORTUZAR','MARIA LORETO','F','1959-10-19',218071,68426196,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (166,'13301091','2','ROJAS','OLIVARES','CARMEN XIMENA','F','1977-05-07',280221,0,null,13,5,null,null,null,'A')
insert into FUNCIONARIO values (167,'10731119','K','HERNANDEZ','PEDRAZA','CAROLINA V.','F','1976-03-18',219955,88883448,null,13,5,null,null,null,'A')
insert into FUNCIONARIO values (169,'7812242','0','QUEZADA','QUEZADA','XIMENA','F','1960-12-15',764199,68360700,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (171,'11068287','5','DIAZ','ZAVALA','CLEMENTINA D. C.','F','1966-10-17',230665,0,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (179,'13190871','7','CRUZ','AYACH','LORETO','F','1977-01-11',98448468,98448468,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (181,'8996475','K','BENAVENTE','ESCOBAR','ALEJANDRO V.','M','1960-11-10',216308,0,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (185,'9098970','7','ARANCIBIA','PAVEZ','MARIA BEATRIZ','F','1961-12-10',411909,82935184,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (186,'13099316','8','GONZALEZ','REYES','MARIA D.PILAR','F','1976-12-19',761268,77949275,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (189,'11671410','8','AREVALO','AREVALO','JOSE LUIS','M','1970-05-25',229051,0,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (190,'12696518','4','BARRIENTOS','CAMPUSANO','PAULINA C.','F','1974-04-18',759046,0,null,102,2,null,null,null,'A')
insert into FUNCIONARIO values (192,'10242758','0','LAFOURCADE','VALENZUELA','MARIA CONSTANZA','F','1967-11-29',22222222,93997295,null,21,5,null,null,null,'A')
insert into FUNCIONARIO values (193,'9223635','8','ALVAREZ','FREIRE','WLADIMIR E.','M','1961-05-29',643389,90831886,null,999,18,null,null,null,'A')
insert into FUNCIONARIO values (196,'11224832','3','HUERTA','PIZARRO','SONIA DEL C.','F','1968-09-26',230665,91853936,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (198,'16223134','0','ACEVEDO','MORALES','JOSE ROBERTO','M','1985-09-15',50110203,950110203,null,243,26,null,null,null,'A')
insert into FUNCIONARIO values (200,'9665809','5','DE PABLO','BERGEN','ANA CAROLINA','F','1972-11-10',218482,98430441,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (205,'7765695','2','LATORRE','DIAZ','RIGOBERTO H.','M','1955-12-17',512693,97895777,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (206,'8870275','1','ROLDAN','SAELZER','IRENE C.','F','1961-10-26',218111,0,null,15,21,null,null,null,'A')
insert into FUNCIONARIO values (207,'8088451','6','REBOLLEDO','OLIVIERI','LILIAN T.','F','1958-06-08',216081,92293977,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (208,'13776939','5','VARGAS','VILLARROYA','PIA C.','F','1980-10-16',392424,0,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (209,'7231709','2','VEGA','MUÑOZ','WILLIAM H.','M','1955-09-26',412055,89582793,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (210,'13567982','8','CRESPO','SALDIAS','VICTOR HUGO','M','1979-03-19',261779,88298575,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (214,'13097711','1','REYES','IBARRA','CAROLINA A.','F','1976-07-04',760424,88199083,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (215,'15126470','0','SLATER','GUZMAN','JAVIERA A.','F','1984-04-11',214795,84396235,null,21,5,null,null,null,'A')
insert into FUNCIONARIO values (217,'14576535','8','ARROYO','PAZ','CESAR','M','1968-09-24',111111,98243537,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (218,'12291251','5','CASTRO','POBLETE','GEORGINA DEL C.','F','1972-03-05',241027,82439426,null,107,4,null,null,null,'A')
insert into FUNCIONARIO values (220,'7647150','9','MARDONES','FIGUEROA','ELIZABETH R.','F','1957-03-25',753992,79982919,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (223,'12911678','1','QUEZADA','MONTECINOS','CLAUDIA A.','F','1975-01-19',763598,88374961,null,21,5,null,null,null,'A')
insert into FUNCIONARIO values (225,'13234779','4','TAGLE','DONOSO','MAGDALENA','F','1977-11-26',2222222,93369896,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (226,'14500593','0','ABARCA','DROGUETT','NORMA A.','F','1974-01-17',754709,0,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (227,'9957782','7','BAEZA','HERNANDEZ','MARIANA A.','F','1981-04-03',22222222,96922757,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (228,'10314157','5','COLLADO','NICOLETTI','MARIA JESUS','F','1980-08-07',231292,92333144,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (230,'7224205','K','MATURANA','SALAS','VERONICA','F','1958-05-03',22222222,95439483,null,21,2,null,null,null,'A')
insert into FUNCIONARIO values (234,'14200587','5','BERTOLONE','BRICEÑO','ROSELLA G.','F','1981-02-12',281157,0,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (235,'8998053','4','GONZALEZ','GONZALEZ','MONICA C.','F','1963-06-21',22222222,94515421,null,107,4,null,null,null,'A')
insert into FUNCIONARIO values (236,'10853691','8','GUZMAN','REBOLLEDO','ERIKA E.','F','1965-09-01',281177,0,null,21,5,null,null,null,'A')
insert into FUNCIONARIO values (237,'7354847','0','SOTO','PETERSON','LUZ MARINA','F','1960-07-12',219095,98219506,null,21,2,null,null,null,'A')
insert into FUNCIONARIO values (241,'15314738','8','SAILER','ROSALES','KARIN A','F','1983-06-16',87208508,0,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (243,'12913958','7','HERRERA','OBREGON','OLGA PAULINA','F','1975-08-19',22222222,991029775,null,107,5,null,null,null,'A')
insert into FUNCIONARIO values (245,'10738281','K','BAEZA','LOBOS','ILSE PAOLA','F','1969-12-10',280936,0,null,107,4,null,null,null,'A')
insert into FUNCIONARIO values (248,'8636981','8','NUÑEZ','GONZALEZ','ANA L.','F','1964-10-04',755170,0,null,21,6,null,null,null,'A')
insert into FUNCIONARIO values (249,'7325601','1','PIZARRO','BART','SOFIA M.','F','1960-11-24',76237875,0,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (250,'10122937','8','CARQUIN','VALENZUELA','BERDA M','F','1966-11-01',764870,0,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (252,'15112944','7','ARENAS','ROMAN','ALEX ROBERTO','M','1982-07-03',511897,83261831,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (253,'13675768','7','GUTIERREZ','PEREIRA','CESAR A.','M','1979-07-09',244946,974523965,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (255,'9788812','4','BUSTAMANTE','PINO','SILVIA X.','F','1970-02-01',22222222,87681618,null,151,12,null,null,null,'A')
insert into FUNCIONARIO values (256,'11114707','8','CABRERA','BUSTAMANTE','CHEBY M.','F','1966-12-12',22222222,81711343,null,32,9,null,null,null,'A')
insert into FUNCIONARIO values (261,'13946894','5','BAEZA','LOBOS','MAUREEN A.','F','1980-02-15',752606,0,null,107,4,null,null,null,'A')
insert into FUNCIONARIO values (262,'16938205','0','DIAZ','WHITTLE','ANTONIA','F','1988-07-14',77572405,0,null,21,4,null,null,null,'A')
insert into FUNCIONARIO values (264,'12293303','2','FUENZALIDA','ROJAS','MIRIAM L.','F','1972-10-10',22222222,0,null,107,4,null,null,null,'A')
insert into FUNCIONARIO values (266,'9091025','6','BARRERA','VIDAL','JULIO J.','M','1961-11-14',233606,87567784,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (267,'9638513','7','CONTESSE','ORELLANA','JEANNETTE M.','F','1963-06-18',98271492,98271492,null,21,12,null,null,null,'A')
insert into FUNCIONARIO values (268,'10695813','0','GALVEZ','AREVALO','JULIO E.','M','1968-10-26',93149999,0,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (271,'10776250','7','MORALES','SANTELICES','MARIO A.','M','1979-05-27',62223858,0,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (272,'11889494','4','MOYA','VALENZUELA','PAOLA','F','1971-04-03',751591,99994340,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (274,'10838246','5','JARA','CONTRERAS','DOMINGO S.','M','1967-06-22',68162462,0,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (275,'21799534','5','PESSACG','P','ALDO M.','M','1963-08-13',76651832,0,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (276,'9491112','5','VALENZUELA','PEREZ','JUAN M.','M','1962-10-11',761648,96974976,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (277,'21234684','5','UEHARA','U','MIWA','F','1978-03-27',767415,76594634,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (281,'11625392','5','ARIZTIA','REYES','MARIA SOLEDAD','F','1970-09-21',747078,98269759,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (286,'10049080','3','RIFFO','JARA','MIRTA ERIKA','F','1964-01-27',91068864,91068864,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (288,'15847140','K','ALARCON','VELASQUEZ','EVELYN LORENA','F','1984-03-25',71376079,71376079,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (292,'14171745','6','DROGUETT','ORELLANA','EVELYN SOLEDAD','F','1981-02-27',93249366,93249366,null,107,5,null,null,null,'A')
insert into FUNCIONARIO values (293,'8508466','6','DE BAEREMAECKER','MUÑOZ','MADELEINE ASTRID','F','1960-07-21',73377730,73377730,null,13,5,null,null,null,'A')
insert into FUNCIONARIO values (294,'14427127','0','MUÑOZ','ROMAN','ALVARO VLADIMIR','M','1974-05-01',91458570,0,null,13,7,null,null,null,'A')
insert into FUNCIONARIO values (298,'15125256','7','PEREZ','VERA','CARLOS','M','1983-01-01',22222222,92094681,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (300,'17134727','0','SOTO','CARRASCO','ROMINA DEL PILAR','F','1989-01-03',22222222,76181098,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (303,'11015559','K','PAVEZ','PEÑA','MARIA JUSTINA','F','1965-07-10',85451928,0,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (306,'15730735','5','PEREZ DE ARCE','GONZALEZ','VERONICA','F','1983-03-21',81994153,0,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (307,'8635477','2','POBLETE','HERRERA','MARIA ELENA','F','1961-07-20',98743772,0,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (308,'13503580','7','UGARTE','DAIBER','MARIA JOSE','F','1978-11-06',74992740,0,null,174,22,null,null,null,'A')
insert into FUNCIONARIO values (309,'7239633','2','BARRIOS','BULLING','TULIO RICARDO','M','1961-07-13',94343228,94343228,null,13,17,null,null,null,'A')
insert into FUNCIONARIO values (310,'16532572','9','VARAS','TRUJILLO','NICOLE ANDREA','F','1986-12-23',22222222,97930020,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (311,'8938401','K','HERRERA','SANCHEZ','SYLVIA ALEJANDRA','F','1965-06-10',2281702,96593274,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (312,'13249021','K','QUEZADA','HORMAZABAL','PAMELA GIANNINA','F','1976-12-26',81892197,81892197,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (314,'10253472','7','SOSEMANN','UNDURRAGA','CHRISTIAN','M','1981-04-04',91272374,91272374,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (315,'16212985','6','INFANTE','VERMEHREN','DENISE','F','1986-11-22',6226542,62265426,null,228,12,null,null,null,'A')
insert into FUNCIONARIO values (316,'11634150','6','FUENTES','FREDES','DANYS FAVIANA','F','1970-06-16',22222222,82309095,null,68,15,null,null,null,'A')
insert into FUNCIONARIO values (318,'17235222','7','CORTES','IBACACHE','BERNARDITA ISABELA','F','1989-08-29',2452917,0,null,21,5,null,null,null,'A')
insert into FUNCIONARIO values (321,'16792135','3','TORRES-LAUREDA','GAETE','JAVIERA ORLANDA','M','1982-10-23',22222222,90706385,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (322,'7959295','1','MEZA','LOPEZ','JAIME OMAR','M','1960-05-27',22222222,0,null,103,12,null,null,null,'A')
insert into FUNCIONARIO values (323,'13848162','K','MOHR','FERRON','CAROLINA ANDREA','F','1980-04-11',62079485,0,null,233,12,null,null,null,'A')
insert into FUNCIONARIO values (324,'16792653','3','OLATE','MEDINA','CRISTIAN ANTONIO','M','1988-05-30',94461031,94461031,null,999,18,null,null,null,'A')
insert into FUNCIONARIO values (327,'9235659','0','REBOLLEDO','SAAVEDRA','GUSTAVO ADOLFO','M','1961-12-20',95396051,0,null,68,15,null,null,null,'A')
insert into FUNCIONARIO values (328,'16883383','0','FARIAS','FARIAS','ANGELA TAMARA','F','1988-07-23',22222222,53723958,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (329,'17134076','4','GODOY','HERNANDEZ','NOELIA BEATRIZ','F','1988-11-11',50061937,60061937,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (332,'16532589','3','MARTINEZ','DEL RIO','CLAUDIA ANDREA','F','1984-11-22',2231024,99691362,null,13,4,null,null,null,'A')
insert into FUNCIONARIO values (333,'16532943','0','GONZALEZ','RUIZ','CRISTIAN ANTONIO','M','1987-07-27',22222222,954036355,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (334,'13500861','3','ARAVENA','CARREÑO','EDMUNDO ANDRES','M','1978-01-27',22222222,63061142,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (336,'15639424','6','RODRIGUEZ','UNDURRAGA','CONSTANZA','F','1983-11-30',22222222,96306909,null,80,11,null,null,null,'A')
insert into FUNCIONARIO values (337,'9595204','6','AHUMADA','RIOS','JOHANNA ANDREA','F','1979-02-21',2214878,89013818,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (338,'10530188','K','GIL','CARTER','JULIO ENRIQUE','M','1965-07-03',22222222,68345958,null,13,1,null,null,null,'A')
insert into FUNCIONARIO values (339,'16997688','0','BRUGGINK','ZUBER','GIOVANNA ANDREA','F','1976-12-06',77749429,0,null,156,12,null,null,null,'A')
insert into FUNCIONARIO values (341,'13945281','K','MIRANDA','CORREA','ANA MARIA','F','1980-09-15',2760184,99994677,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (342,'16884225','2','AVILES','SOTO','SANDRA PAULINA','F','1988-09-13',42265013,89200381,null,13,2,null,null,null,'A')
insert into FUNCIONARIO values (344,'12690982','9','VEGA','SILVA','MANUEL ALBERTO','M','1974-01-30',95082556,99084657,null,999,18,null,null,null,'A')
insert into FUNCIONARIO values (346,'9218307','6','MOLLER','UNDURRAGA','JOSE TOMAS','M','1963-09-25',2281392,98253970,null,31,8,null,null,null,'A')
insert into FUNCIONARIO values (347,'11364995','K','ORTEGA','ACOSTA','CLAUDIA ANDREA','F','1969-04-16',22222222,88524969,null,238,24,null,null,null,'A')
insert into FUNCIONARIO values (348,'8303934','5','SALAZAR','IBAÑEZ','LILIANA DE JESUS','F','1960-12-31',72222233,83248906,null,999,29,null,null,null,'A')
insert into FUNCIONARIO values (349,'17160539','3','CATALAN','SANDOVAL','VALESKA SOLANGE','F','1989-01-23',99786113,0,null,239,25,null,null,null,'A')
insert into FUNCIONARIO values (351,'14496565','5','MIRANDA','PALMA','ADID JOCHEBED','F','1974-01-13',1653816,91653816,null,42,28,null,null,null,'A')
insert into FUNCIONARIO values (353,'13343647','2','ROMAN','ZUÑIGA','MARCELA DEL CARMEN','F','1978-07-28',22220352,78246886,null,244,18,null,null,null,'A')
insert into FUNCIONARIO values (354,'14332264','5','VASQUEZ','GUAJARDO','RENE MIRIEL','M','1977-09-24',98913155,98913155,null,23,30,null,null,null,'A')
insert into FUNCIONARIO values (357,'11528451','7','PINO','AGUILERA','YASNA ELISABETH','F','1970-01-29',98647984,83142982,null,32,9,null,null,null,'A')
insert into FUNCIONARIO values (358,'12515067','5','ZUÑIGA','GONZALEZ','INGRID DEL CARMEN','F','1972-12-24',2319963,86128392,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (362,'11635703','8','SOLO DE ZALDIVAR','VERGARA','JUAN ANDRES','M','1970-10-09',8872857,8872857,null,38,34,null,null,null,'A')
insert into FUNCIONARIO values (363,'17083947','1','VALDIVIESO','LECAROS','TRINIDAD','F','1988-11-08',22423959,991903624,null,156,35,null,null,null,'A')
insert into FUNCIONARIO values (364,'16223242','8','AREVALO','IBARRA','MARIA JOSE','F','1985-10-31',86323642,86323642,null,247,36,null,null,null,'A')
insert into FUNCIONARIO values (365,'16840227','9','BELTRAMI','ZAMORANO','PAULINA ALEJANDRA','F','1988-06-28',2750927,61397664,null,247,37,null,null,null,'A')
insert into FUNCIONARIO values (366,'18105357','7','BARAHONA','REYES','MARIANA JOSE','F','1992-12-01',88801839,88801839,null,247,36,null,null,null,'A')
insert into FUNCIONARIO values (367,'16771948','1','JAMETT','MERY','CAMILA KAYE','F','1988-02-29',54618505,54618505,null,248,36,null,null,null,'A')
insert into FUNCIONARIO values (368,'16209163','8','VEGA','BUSTAMANTE','XIMENA PIEDAD','F','1986-05-11',97641946,985051479,null,247,37,null,null,null,'A')
insert into FUNCIONARIO values (369,'17138652','7','YAÑEZ','POBLETE','NATALY NICOLE','F','1989-08-01',97137027,97137027,null,247,36,null,null,null,'A')
insert into FUNCIONARIO values (370,'18177269','7','ALARCON','ACEVEDO','VIVIAN DANIELA','F','1993-05-11',92215059,92215059,null,249,38,null,null,null,'A')
insert into FUNCIONARIO values (371,'17651114','1','FLORES','LOPEZ','PABLO ANDRES','M','1990-07-21',2256255,83286778,null,249,38,null,null,null,'A')
insert into FUNCIONARIO values (372,'15105575','3','LANTADILLA','HERRERA','BERNARDITA','F','1985-09-16',2231847,92179842,null,250,37,null,null,null,'A')
insert into FUNCIONARIO values (373,'15524627','8','CORTES','FARRAN','ALICIA ELENA','F','1983-05-02',97894816,97894816,null,251,39,null,null,null,'A')
insert into FUNCIONARIO values (374,'16048341','5','GUTIERREZ','MEZA','MARIA FERNANDA','F','1985-11-18',58197894,58197894,null,252,11,null,null,null,'A')
insert into FUNCIONARIO values (375,'9214477','1','MEZA','VALENZUELA','LUIS ARTURO','M','1961-03-02',2751957,92218059,null,253,40,null,null,null,'A')
insert into FUNCIONARIO values (376,'17135571','0','CHAVEZ','CERDA','CRISTIAN ALEJANDRO','M','1989-02-22',42442686,42442686,null,254,41,null,null,null,'A')
insert into FUNCIONARIO values (377,'25113263','1','DE LA BARRA','GONZALEZ','VICTOR EDUARDO','M','1972-06-15',2342920,0,null,129,18,null,null,null,'A')
insert into FUNCIONARIO values (378,'13671553','4','TORRES','BELLO','MARIA ANGELICA','F','1979-06-13',9188096,9188096,null,251,36,null,null,null,'A')




insert into USUARIO values(198,'123456')



select * from REGISTRO

select * from USUARIO
select Rut_Funcionario from FUNCIONARIO where Codigo_Funcionario = 198 