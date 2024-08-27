create table contrasenas (
  cod_contrasena char(5) primary key not null,
  cod_cliente char(6) not null
)
create table pais (
  cod_pais char(4) primary key not null,
  nom_pais varchar(20) not null
)
create table peliculas (
  id_pelicula char(5) primary key not null,
  titulo_peli varchar(50) not null,
  idioma_principal varchar(15),
  pais_origen char(4),
  valoracion_peli varchar(20) not null,
  fecha_estreno date not null,
  foreign key (pais_origen) references pais (cod_pais)
)
create table cliente (
  cod_cliente char(6) primary key not null,
  cod_contrasena char(5) unique not null,
  nombre_cliente varchar(15) not null,
  apellido_cliente varchar(20) not null,
  fch_nac date not null,
  fch_reg date,
  cod_pais char(4) not null,
  email_cliente varchar(35) unique not null,
  foreign key (cod_pais) references pais (cod_pais),
  foreign key (cod_contrasena) references contrasenas (cod_contrasena)
)

create table categorias (
  id_categoria char(5) not null,
  id_pelicula char(5) not null,
  nombre_categ varchar(15) not null,
  primary key (id_categoria, id_pelicula),
  foreign key (id_pelicula) references peliculas (id_pelicula)
)

create table formapago (
  cod_form_pago char(3) primary key not null,
  tipo_pag varchar(20) not null
)

create table registro (
  nro_registro char(6) primary key not null,
  cod_cliente char(6) not null,
  cod_contrasena char(5) not null,
  foreign key (cod_cliente) references cliente (cod_cliente),
  foreign key (cod_contrasena) references contrasenas (cod_contrasena)
)

create table reclamos (
  cod_reclamo char(7) primary key not null,
  cod_cliente char(6) not null,
  fecha_reclamo date,
  detalle_reclamo varchar(50) not null,
  foreign key (cod_cliente) references cliente (cod_cliente)
)

create table calificaciones (
  id_calificacion char(3) primary key not null,
  id_pelicula char(5) not null,
  cod_cliente char(6) not null,
  fch_calif date ,
  calificacion varchar(15),
  foreign key (id_pelicula) references peliculas (id_pelicula),
  foreign key (cod_cliente) references cliente (cod_cliente)
)

create table tipo_suscripcion (
  cod_tipo_suscripcion char(3) primary key not null,
  cod_cliente char(6) not null,
  id_pelicula char(5) not null,
  foreign key (cod_cliente) references cliente (cod_cliente),
  foreign key (id_pelicula) references peliculas (id_pelicula)
)

create table cancelacion (
  nro_cancelacion char(6) primary key not null,
  fecha_cancela date,
  motivo_cancela varchar(50) not null,
  cod_cliente char(6) not null,
  cod_tipo_suscripcion char(3) not null,
  cod_form_pago char(3) not null,
  foreign key (cod_cliente) references cliente (cod_cliente),
  foreign key (cod_tipo_suscripcion) references tipo_suscripcion (cod_tipo_suscripcion),
  foreign key (cod_form_pago) references formapago (cod_form_pago)
)

create table factura (
  nro_fact char(6) primary key not null,
  fech_fact date,
  cod_tipo_suscripcion char(3) not null,
  cod_form_pago char(3) not null,
  cod_cliente char(6) not null,
  foreign key (cod_cliente) references cliente (cod_cliente),
  foreign key (cod_tipo_suscripcion) references tipo_suscripcion (cod_tipo_suscripcion),
  foreign key (cod_form_pago) references formapago (cod_form_pago)
)

create table vistas (
  id_vistas char(4) primary key not null,
  cod_cliente char(6) not null,
  id_pelicula char(5) not null,
  fch_vista date,
  foreign key (cod_cliente) references cliente (cod_cliente),
  foreign key (id_pelicula) references peliculas (id_pelicula)
)

create table recomendaciones (
  id_recomendacion char(4) primary key not null,
  id_pelicula char(5) not null,
  cod_cliente char(6) not null,
  id_vistas char(4) not null,
  foreign key (cod_cliente) references cliente (cod_cliente),
  foreign key (id_pelicula) references peliculas (id_pelicula),
  foreign key (id_vistas) references vistas (id_vistas)
)

create table lista_pelicula (
  id_lista_pel char(5) primary key not null,
  cod_cliente char(6) not null,
  id_pelicula char(5) not null,
  foreign key (cod_cliente) references cliente (cod_cliente),
  foreign key (id_pelicula) references peliculas (id_pelicula)
)









insert into pais values ('0001','Peru')
insert into pais values ('0002','Argentina')
insert into pais values ('0003','Brasil')
insert into pais values ('0004','España')
insert into pais values ('0005','Estados Unidos')
insert into pais values ('0006','Uruguay')
insert into pais values ('0007','Mexico')
insert into pais values ('0008','Canada')
insert into pais values ('0009','Colombia')
insert into pais values ('0010','Alemania')
go

select *from Contrasenas

insert into Contrasenas values('A1234','U00001')
insert into Contrasenas values('A1235','U00002')
insert into Contrasenas values('A1236','U00003')
insert into Contrasenas values('A1237','U00004')
insert into Contrasenas values('A1238','U00005')
insert into Contrasenas values('A1239','U00006')
insert into Contrasenas values('A1240','U00007')
insert into Contrasenas values('A1241','U00008')
insert into Contrasenas values('A1242','U00009')
insert into Contrasenas values('A1243','U00010')
insert into Contrasenas values('A1244','U00011')
insert into Contrasenas values('A1245','U00012')
insert into Contrasenas values('A1246','U00013')
insert into Contrasenas values('A1247','U00014')
insert into Contrasenas values('A1248','U00015')

GO

select * from Cliente 
insert into Cliente values('U00001','A1234','Pedro Pablo','Torres Rengifo','2001-06-23','2024-08-24','0005','pedropablo@gmail.com')
insert into Cliente values ('U00002','A1235','Matias Jair','Perez Guimaraes','2003-03-11','2024-03-21','0004','matiasperez@gmail.com') 
insert into Cliente values ('U00003','A1236','Maria Mercedes','Becerra Gonzales','1996-10-25','2016-03-21','0003','maria1996@gmail.com')
insert into Cliente values ('U00004','A1237','Byron David ','Lopez Aliaga','2002-12-24','2021-05-12','0007','davidlopez@gmail.com')
insert into Cliente values ('U00005','A1238','Carlos Daniel','Novillo Jara','1993-12-05','2023-12-01','0001','carlosmessi@gmail.com')
insert into Cliente values ('U00006','A1239','Cristiano Jose','Ronaldo Aveiro','1991-05-17','2024-02-10','0010','cristiano07@gmail.com')
insert into Cliente values ('U00007','A1240','Jaime Vicente','Martinez Cespedes','1999-05-12','2019-08-29','0001','jaimeelpro@gmail.com')
insert into Cliente values ('U00008','A1241','Teodoro Ivan','De Sousa Ruiz','2001-05-29','2024-03-12','0009','teodororuiz@gmail.com')
insert into Cliente values ('U00009','A1242','Jessica Rosa','Lainez Landi','2002-02-23','2023-10-01','0005','rositalainez23@gmail.com')
insert into Cliente values ('U00010','A1243','Monica Cristina','Arias Santos','2003-12-20','2024-12-24','0002','monica2003arias@gmail.com')
insert into Cliente values ('U00011','A1244','Patricia','Rosales Jaramillo','2001-10-21','2023-11-29','0002','patriciabarbie@gmail.com')
insert into Cliente values ('U00012','A1245','Edwin Arturo','Soto Suarez','2001-11-30','2021-12-24','0001','edwinsosu@gmail.com')
insert into Cliente values ('U00013','A1246','Lionel Andres','Messi Cuccitini','2001-10-24','2024-11-20','0002','lionelmessi@gmail.com')
insert into Cliente values ('U00014','A1247','Ariana','Rodriguez Camargo','2001-11-24','2024-12-18','0004','ariana1124@gmail.com')
insert into Cliente values ('U00015','A1248','Peter Adrian','Parker Dominguez','2003-11-21','2024-10-12','0005','elhombrearaña@gmail.com')
GO

select * from FormaPago
 
 insert into FormaPago values('001','tarjeta')
 insert into FormaPago values('002','efectivo')
 insert into FormaPago values('003','paypal')
 insert into FormaPago values('004','pago efectivo')
 go

 select * from Peliculas
 insert into Peliculas values('P0001','El vengador','Ingles','0003','5estrellas','2010-10-14')
 insert into Peliculas values('P0002','Depredador','Ingles','0006','5 estrellas','1987-12-24')
 insert into Peliculas values('P0003','John Wick','Ingles','0001','5 estrellas','2014-12-25')
 insert into Peliculas values('P0004','El Conjuro','Ingles','0009','4.5 estrellas','2013-08-13')
 insert into Peliculas values('P0005','El Exorcista','Ingles','0005','4 estrellas','2015-07-22')
 insert into Peliculas values('P0006','Juego del Miedo','Ingles','0006','5 estrellas','2004-10-29')
 insert into Peliculas values('P0007','Supercool','Ingles','0007','5 estrellas','2007-10-13')
 insert into Peliculas values('P0008','Que paso ayer','Ingles','0010','5 estrellas','2009-02-18')
 insert into Peliculas values('P0009','Sherk','Ingles','0009','5 estrellas','2001-08-24')
 insert into Peliculas values('P0010','Muertos de risa','Ingles','0002','5 estrellas','2004-12-10')
 go

 select * from Registro
 insert into Registro values ('N00001','U00001','A1234')
 insert into Registro values ('N00002','U00002','A1235')
 insert into Registro values ('N00003','U00003','A1236')
 insert into Registro values ('N00004','U00004','A1237')
 insert into Registro values ('N00005','U00005','A1238')
 insert into Registro values ('N00006','U00006','A1239')
 insert into Registro values ('N00007','U00007','A1240')
 insert into Registro values ('N00008','U00008','A1241')
 insert into Registro values ('N00009','U00009','A1242')
 insert into Registro values ('N00010','U00010','A1243')
 GO

 SELECT * from Categorias
 insert into Categorias values('C0001','P0001','Accion')
 insert into Categorias values('C0001','P0002','Accion')
 insert into Categorias values('C0001','P0003','Accion')
 insert into Categorias values('C0002','P0004','Terror')
 insert into Categorias values('C0002','P0005','Terror')
 insert into Categorias values('C0002','P0006','Terror')
 insert into Categorias values('C0003','P0007','Comedia')
 insert into Categorias values('C0003','P0008','Comedia')
 insert into Categorias values('C0003','P0009','Comedia')
 insert into Categorias values('C0003','P0010','Comedia')
 go


 select * from Reclamos
INSERT INTO Reclamos VALUES('RCL0001', 'U00001', '2024-08-01', 'Problema con la calidad de video')
INSERT INTO Reclamos VALUES('RCL0002', 'U00002', '2024-04-02', 'Cobro duplicado en la factura')
INSERT INTO Reclamos VALUES('RCL0003', 'U00003', '2024-05-03', 'Problemas al iniciar sesión')
INSERT INTO Reclamos VALUES('RCL0004', 'U00004', '2024-05-04', 'Error en subtítulos')
INSERT INTO Reclamos VALUES('RCL0005', 'U00005', '2024-02-05', 'No se puede descargar película')
INSERT INTO Reclamos VALUES('RCL0006', 'U00006', '2024-03-06', 'Película no disponible')
INSERT INTO Reclamos VALUES('RCL0007', 'U00007', '2024-12-07', 'Problema con la aplicación móvil')
INSERT INTO Reclamos VALUES('RCL0008', 'U00008', '2024-11-08', 'Película no reproduce')
INSERT INTO Reclamos VALUES('RCL0009', 'U00009', '2024-10-09', 'Problemas de sincronización de audio')
INSERT INTO Reclamos VALUES('RCL0010', 'U00010', '2024-01-10', 'Error de facturación')
go

select * from Tipo_suscripcion
INSERT INTO Tipo_suscripcion VALUES('T01', 'U00001', 'P0001')
INSERT INTO Tipo_suscripcion VALUES('T02', 'U00002', 'P0002')
INSERT INTO Tipo_suscripcion VALUES('T03', 'U00003', 'P0003')
INSERT INTO Tipo_suscripcion VALUES('T04', 'U00004', 'P0004')
INSERT INTO Tipo_suscripcion VALUES('T05', 'U00005', 'P0005')
INSERT INTO Tipo_suscripcion VALUES('T06', 'U00006', 'P0006')
INSERT INTO Tipo_suscripcion VALUES('T07', 'U00007', 'P0007')
INSERT INTO Tipo_suscripcion VALUES('T08', 'U00008', 'P0008')
INSERT INTO Tipo_suscripcion VALUES('T09', 'U00009', 'P0009')
INSERT INTO Tipo_suscripcion VALUES('T10', 'U00010', 'P0010')
go
select * from Calificaciones
INSERT INTO Calificaciones VALUES('C01', 'P0001', 'U00001', '2024-08-01', 'Excelente')
INSERT INTO Calificaciones VALUES('C02', 'P0002', 'U00002', '2024-08-02', 'Buena')
INSERT INTO Calificaciones VALUES('C03', 'P0003', 'U00003', '2024-08-03', 'Regular')
INSERT INTO Calificaciones VALUES('C04', 'P0004', 'U00004', '2024-08-04', 'Mala')
INSERT INTO Calificaciones VALUES('C05', 'P0005', 'U00005', '2024-08-05', 'Excelente')
INSERT INTO Calificaciones VALUES('C06', 'P0006', 'U00006', '2024-08-06', 'Buena')
INSERT INTO Calificaciones VALUES('C07', 'P0007', 'U00007', '2024-08-07', 'Regular')
INSERT INTO Calificaciones VALUES('C08', 'P0008', 'U00008', '2024-08-08', 'Mala')
INSERT INTO Calificaciones VALUES('C09', 'P0009', 'U00009', '2024-08-09', 'Excelente')
INSERT INTO Calificaciones VALUES('C10', 'P0010', 'U00010', '2024-08-10', 'Buena')
	
select * FROM Cancelacion
INSERT INTO Cancelacion  VALUES('CNC001', '2024-08-11', 'No usa el servicio', 'U00001', 'T01', '001')
INSERT INTO Cancelacion  VALUES('CNC002', '2023-10-21', 'Servicio caro', 'U00002', 'T02', '002')
INSERT INTO Cancelacion  VALUES('CNC003', '2021-12-30', 'Mala calidad', 'U00003', 'T03', '003')
INSERT INTO Cancelacion  VALUES('CNC004', '2018-03-21', 'No satisface necesidades', 'U00004', 'T04', '001')
INSERT INTO Cancelacion  VALUES('CNC005', '2017-11-11', 'Falta de tiempo', 'U00005', 'T05', '002')
INSERT INTO Cancelacion  VALUES('CNC006', '2022-10-26', 'Problemas técnicos', 'U00006', 'T06', '001')
INSERT INTO Cancelacion  VALUES('CNC007', '2021-02-27', 'Cambió de servicio', 'U00007', 'T07', '003')
INSERT INTO Cancelacion  VALUES('CNC008', '2023-12-24', 'No funciona en su región', 'U00008', 'T08', '002')
INSERT INTO Cancelacion  VALUES('CNC009', '2020-01-01', 'Desinteresado en el servicio', 'U00009', 'T09', '003')
INSERT INTO Cancelacion  VALUES('CNC010', '2021-03-19', 'No se actualiza', 'U00010', 'T10', '001')
go

select * from Factura
INSERT INTO Factura VALUES('FAC001', '2024-07-10', 'T01', '001', 'U00001')
INSERT INTO Factura VALUES('FAC002', '2023-10-29', 'T02', '001', 'U00002')
INSERT INTO Factura VALUES('FAC003', '2022-02-03', 'T03', '003', 'U00003')
INSERT INTO Factura VALUES('FAC004', '2024-05-14', 'T04', '001', 'U00004')
INSERT INTO Factura VALUES('FAC005', '2024-01-15', 'T05', '002', 'U00005')
INSERT INTO Factura VALUES('FAC006', '2019-07-19', 'T06', '003', 'U00006')
INSERT INTO Factura VALUES('FAC007', '2017-08-21', 'T07', '001', 'U00007')
INSERT INTO Factura VALUES('FAC008', '2022-12-18', 'T08', '002', 'U00008')
INSERT INTO Factura VALUES('FAC009', '2020-11-28', 'T09', '003', 'U00009')
INSERT INTO Factura VALUES('FAC010', '2021-10-30', 'T10', '001', 'U00010')
go

select * from Vistas
INSERT INTO Vistas VALUES('VST1', 'U00001', 'P0001', '2024-08-01')
INSERT INTO Vistas VALUES('VST2', 'U00002', 'P0002', '2024-03-02')
INSERT INTO Vistas VALUES('VST3', 'U00003', 'P0003', '2024-02-10')
INSERT INTO Vistas VALUES('VST4', 'U00004', 'P0004', '2024-05-29')
INSERT INTO Vistas VALUES('VST5', 'U00005', 'P0005', '2024-10-15')
INSERT INTO Vistas VALUES('VST6', 'U00006', 'P0006', '2024-12-04')
INSERT INTO Vistas VALUES('VST7', 'U00007', 'P0007', '2024-01-19')
INSERT INTO Vistas VALUES('VST8', 'U00008', 'P0008', '2024-12-25')
INSERT INTO Vistas VALUES('VST9', 'U00009', 'P0009', '2024-03-30')
INSERT INTO Vistas VALUES('VT10','U00010', 'P0010', '2024-02-14')
go

select * from Recomendaciones
INSERT INTO Recomendaciones VALUES('REC1', 'P0001', 'U00001', 'VST1')
INSERT INTO Recomendaciones VALUES('REC2', 'P0002', 'U00002', 'VST2')
INSERT INTO Recomendaciones VALUES('REC3', 'P0003', 'U00003', 'VST3')
INSERT INTO Recomendaciones VALUES('REC4', 'P0004', 'U00004', 'VST4')
INSERT INTO Recomendaciones VALUES('REC5', 'P0005', 'U00005', 'VST5')
INSERT INTO Recomendaciones VALUES('REC6', 'P0006', 'U00006', 'VST6')
INSERT INTO Recomendaciones VALUES('REC7', 'P0007', 'U00007', 'VST7')
INSERT INTO Recomendaciones VALUES('REC8', 'P0008', 'U00008', 'VST8')
INSERT INTO Recomendaciones VALUES('REC9', 'P0009', 'U00009', 'VST9')
INSERT INTO Recomendaciones VALUES('RE10', 'P0010', 'U00010', 'VT10')
go

select * from Lista_pelicula
INSERT INTO Lista_pelicula VALUES('LST01', 'U00001', 'P0001')
INSERT INTO Lista_pelicula VALUES('LST02', 'U00002', 'P0002')
INSERT INTO Lista_pelicula VALUES('LST03', 'U00003', 'P0003')
INSERT INTO Lista_pelicula VALUES('LST04', 'U00004', 'P0004')
INSERT INTO Lista_pelicula VALUES('LST05', 'U00005', 'P0005')
INSERT INTO Lista_pelicula VALUES('LST06', 'U00006', 'P0006')
INSERT INTO Lista_pelicula VALUES('LST07', 'U00007', 'P0007')
INSERT INTO Lista_pelicula VALUES('LST08', 'U00008', 'P0008')
INSERT INTO Lista_pelicula VALUES('LST09', 'U00009', 'P0009')
INSERT INTO Lista_pelicula VALUES('LST10', 'U00010', 'P0010')
go


create  or alter view  Vista_Cancelaciones_Detalles as
select
    ca.nro_cancelacion as 'Numero cancelacion',
    ca.fecha_cancela  as 'Fecha cancelacion',
    ca.motivo_cancela  as 'Motivo cancelacion',
    c.nombre_cliente  as 'Nombre Cliente',
    ts.cod_tipo_suscripcion as 'Codigo de Suscripcion',
    f.tipo_Pag as 'Tipo Pago'
from 
    Cancelacion ca
join
   Cliente c on ca.cod_cliente = c.cod_cliente
join
    Tipo_suscripcion ts on ca.cod_tipo_suscripcion = ts.cod_tipo_suscripcion
join
    FormaPago f on ca.cod_form_pago = f.cod_form_pago;
go
SELECT * FROM Vista_Cancelaciones_Detalles;
go


--vista2------------
--peliculas vistas por cliente
Create  or alter view peliculas_por_cliente as
select c.cod_cliente as 'Cliente', c.nombre_cliente as 'Nombre',c.apellido_cliente as'Apellidos',
p.id_pelicula as 'Pelicula', p.titulo_peli as 'Titulo Pelicula', p.fecha_estreno as 'Estreno'
from
	cliente c
join
		Vistas v on c.cod_cliente = v.cod_cliente
join
		Peliculas p on v.id_pelicula = p.id_pelicula;
go

select * from peliculas_por_cliente
go
-------vista3------
--valoraciones por pelicula
create or alter  view peliculas_valoraciones as
select     p.titulo_peli, p.valoracion_peli,
                c.nombre_categ as 'Categoria',
    count(cal.id_calificacion) as 'Numero_Calificaciones'
from
    peliculas p
left join
    calificaciones cal on p.id_pelicula = cal.id_pelicula
left join
    categorias c on p.id_pelicula = c.id_pelicula
group by
    p.titulo_peli, p.valoracion_peli, c.nombre_categ;
go
select * from peliculas_valoraciones
go
--vista 4
--popularidad de de vistas peliculas por categoria
create or alter view Vistas_Totales as
select 
    cat.nombre_categ as categoría,
    p.titulo_peli as película,
    count(v.id_vistas) as vizualizaciones_totales
from
    peliculas p
join
    categorias cat on p.id_pelicula = cat.id_pelicula
join
    vistas v on p.id_pelicula = v.id_pelicula
group by
    cat.nombre_categ, p.titulo_peli;
go

select * from Vistas_Totales
go

--vista 5 
--para ver los clientes ah que pais pertenecen y que peliculas an visto--
create or alter view clientes_pais as 
select cli.nombre_cliente as 'cliente',cli.apellido_cliente as 'apellidos',p.nom_pais as 'Pais',
    count(v.id_vistas) as vistas
from 
    cliente cli
inner join
    pais p on cli.cod_pais = p.cod_pais
left join
    vistas v on cli.cod_cliente = v.cod_cliente
group by
    cli.nombre_cliente, cli.apellido_cliente, p.nom_pais;
go
select * from clientes_pais
go


----------------------PROCEDIMIENTO 1....................................................
CREATE OR ALTER PROCEDURE SP_Categoria_pelicula (
    @nombre_categ VARCHAR(15)
)
AS
if exists(  SELECT p.id_pelicula, p.titulo_peli
    FROM Peliculas p
    INNER JOIN Categorias c ON p.id_pelicula = c.id_pelicula
    WHERE c.nombre_categ = @nombre_categ
 )
BEGIN

    SELECT p.id_pelicula, p.titulo_peli
    FROM Peliculas p
    INNER JOIN Categorias c ON p.id_pelicula = c.id_pelicula
    WHERE c.nombre_categ = @nombre_categ;
END
else
begin
print 'No hay peliculas registradas en la categoria'
end

execute SP_Categoria_pelicula'comedia'
go
--procedimiento2---------------------------------------------------------------------
--procedimiento para agregar una pelicula--
create procedure SP_Agregar_peli
(@id_pelicula CHAR(5), @titulo_peli VARCHAR(50), @idioma_principal VARCHAR(15),@pais_origen CHAR(4),@valoracion_peli VARCHAR(20),
 @fecha_estreno DATE,@id_categoria CHAR(5), @nombre_categ VARCHAR(15))
as
begin
    
    insert into peliculas 
	(id_pelicula, titulo_peli, idioma_principal, pais_origen, valoracion_peli, fecha_estreno)
    values
	(@id_pelicula, @titulo_peli, @idioma_principal, @pais_origen, @valoracion_peli, @fecha_estreno);

    insert into categorias 
	(id_categoria, id_pelicula, nombre_categ)
    values
	(@id_categoria, @id_pelicula, @nombre_categ);
end
go
go
execute SP_Agregar_peli 'P0017','Al fondo hay sitio','Español','0001','5estrellas','2024-05-11','C0003','Comedia'
GO
---------------------------------------------------------------------------------------------------------------------------------------------------
------Procedimiento 3-----------------------------------------------------------
--procedimiento para eliminar una pelicula repetida---------------------------------------------------------
create or alter procedure  SP_Eliminar_peli
(@id_pelicula CHAR(5))
as
begin
    delete from peliculas where id_pelicula = @id_pelicula
	delete from categorias WHERE id_pelicula = @id_pelicula
end
go
EXECUTE SP_Eliminar_peli 'P0017'
select * from peliculas
go

----PROCEDIMIENTO4-------------------------------------------------------------------------
--Procedimiento para agregar mas clientes-----------------------------------------------------

create or alter procedure SP_Agregar_Cliente
(@cod_cliente CHAR(6),@cod_contrasena CHAR(5),@nombre_cliente VARCHAR(15), @apellido_cliente VARCHAR(20), @fch_nac DATE,
@fch_reg DATE, @cod_pais CHAR(4),@email_cliente VARCHAR(35), @nom_pais VARCHAR(20))
  
as
begin
  
    if not exists (select 1 from pais where cod_pais = @cod_pais)
    begin
      
        insert into pais 
		(cod_pais, nom_pais)
        values 
		(@cod_pais, @nom_pais);
    end
    if not exists (select 1 from contrasenas where cod_contrasena = @cod_contrasena)
    begin  
        insert into contrasenas 
		(cod_contrasena, cod_cliente)
        values 
		(@cod_contrasena, @cod_cliente);
    end

   insert into cliente 
   (cod_cliente, cod_contrasena, nombre_cliente, apellido_cliente, fch_nac, fch_reg, cod_pais, email_cliente)
   values
	(@cod_cliente, @cod_contrasena, @nombre_cliente, @apellido_cliente, @fch_nac, @fch_reg, @cod_pais, @email_cliente);
end
go



execute SP_Agregar_Cliente 'U00019','A1252','Pepe',' Dominguez','2003-11-22','2024-10-12','0011','elhombreardaadda@gmail.com','bolivia'
go
--------------------------------------------------------------------------------------------------------------------------
---------------------Procedimiento 5------------------------------------------------------------------------------
----------------------registrar  vista de una pelicula
create or alter procedure SP_nueva_lista
    @fch_vista DATE , @id_vistas CHAR(4),@id_pelicula CHAR(5),@cod_cliente CHAR(6)
as
begin
    -- Verifica que la película y el cliente existen
   if exists (select 1 from peliculas where id_pelicula = @id_pelicula)
       AND EXISTS (select 1 from cliente where cod_cliente = @cod_cliente)
    begin
        -- Inserta una nueva fila en la tabla vistas
        insert into vistas (id_vistas, cod_cliente, id_pelicula, fch_vista)
        values (@id_vistas, @cod_cliente, @id_pelicula, @fch_vista);
    end
    else
    begin
        
        print 'El id_pelicula o el cod_cliente no son válidos.';
    end
end;
GO

execute SP_nueva_lista '2024-08-29', 'VT11', 'P0001', 'U00001';

SELECT * FROM vistas
go
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------PROCEDIMIENTO 6
------------CALCULAR LOS CLIENTES QUE TIENE UN METODO DE PAGO------------------------------------------------------------

create or alter procedure  SP_Conteo_cliente_metodo
as
begin
    select
        fpa.tipo_pag as TipoDePago,
        count(c.cod_cliente) as Clientes
    from formapago fpa
	left join factura f on fpa.cod_form_pago = f.cod_form_pago
    left join cliente c on f.cod_cliente = c.cod_cliente
    left join cancelacion ca on fpa.cod_form_pago = ca.cod_form_pago AND c.cod_cliente = ca.cod_cliente
    group by fpa.tipo_pag;
end
go
	
execute SP_Conteo_cliente_metodo
go
-----------------------------------------------------------------procedimiento 7----------------------------------------------------------------
------------------------eliminar un cliente ------------------------------------------

create or alter procedure SP_Borrar_CLi
(@cod_cliente CHAR(6))
as
begin
   
    delete from recomendaciones where cod_cliente = @cod_cliente;
    delete from vistas where cod_cliente = @cod_cliente;
    delete from factura where cod_cliente = @cod_cliente;
    delete from cancelacion where cod_cliente = @cod_cliente;
    delete from tipo_suscripcion where cod_cliente = @cod_cliente;
    delete from calificaciones where cod_cliente = @cod_cliente;
    delete from reclamos where cod_cliente = @cod_cliente;
    delete from lista_pelicula where cod_cliente = @cod_cliente;
    delete from registro where cod_cliente = @cod_cliente;
    delete from cliente where cod_cliente = @cod_cliente;
end
GO

execute  SP_Borrar_CLi 'U00017'

go
-----------------------------------------------------------procedimiento 8------------------------------------------------------------------------------------
----------------------cambiar la categoria de una pelicula existente
create or alter procedure SP_Cambiar_CATEGORIA_PELICULA
(@id_categoria CHAR(5),@id_pelicula CHAR(5),@nombre_categ VARCHAR(15))
as
begin
   
   update categorias
   set nombre_categ = @nombre_categ
    where  id_categoria = @id_categoria AND id_pelicula = @id_pelicula;
end
go

execute SP_Cambiar_CATEGORIA_PELICULA'C0001','P0001','romance'

select * from categorias
--------------------------------------------------------------------procedimiento 9------------------------------------------------------------------------------------
----------------------------para cambiar el metodo de pago.--------------------
go
create or alter procedure SP_Cambiar_metodo_pago
(@cod_form_pago CHAR(3),@tipo_pag VARCHAR(20))
as
begin

    update formapago
    set tipo_pag = @tipo_pag
   where cod_form_pago = @cod_form_pago;
end
go

execute SP_Cambiar_metodo_pago '002','tarjeta'

select * from formapago
go
----------------------------------------------procedimiento10-----------------------------------------------------------------
---------------------------registrar una nueva factura de cliente----------------------------
create or alter procedure SP_Registrar_Factura
( @nro_fact CHAR(6), @fech_fact DATE, @cod_tipo_suscripcion CHAR(3),@cod_form_pago CHAR(3), @cod_cliente CHAR(6))
as
begin
  
    insert into  factura 
	(nro_fact, fech_fact, cod_tipo_suscripcion, cod_form_pago, cod_cliente)
    values
	(@nro_fact, @fech_fact, @cod_tipo_suscripcion, @cod_form_pago, @cod_cliente);
end
go
   execute SP_Registrar_Factura 'FAC013','2024-08-26','T02','001','U00002'
   go

