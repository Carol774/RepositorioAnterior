create database inventario2;

create table Usuario(
    id_psc int not null primary key,
    rol varchar(20) not null,
    numero_doc int not null,
    tipo_doc varchar(20) not null,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    correo varchar(45) not null,
    telefono int not null
);

create table Categoria_Material(
    id_cat int not null primary key,
    descripcion_cat varchar(255) not null
);

create table Marca(
    id_marca int not null primary key,
    marca varchar(20) not null
);

create table Proveedor(
    id_nit int not null primary key,
    Proveedor varchar(40) not null,
    tel_prov int not null,
    correo_prov varchar(40) not null
);

create table Centro_costos(
    id_centro_costos int not null primary key,
    descripcion_centro_costos varchar(20) not null
);

create table Unidad_Medida(
    id_und_medida int not null primary key,
    descripcion_und_medida varchar(200) not null
);

create table Stock(
    id_stock int not null primary key,
    unidades_disponible int not null
);

create table Soportes(
    id_soporte int not null primary key,
    abreviatura varchar(20) not null,
    nombre_documento varchar(20) not null
);

create table Localidad(
    id_localidad int not null primary key,
    nombre_localidad varchar(20) not null
);

create table Log_sistema(
    idLog_sistema int auto_increment not null primary key,
    fecha datetime not null,
    id_psc int not null,
    foreign key(id_psc) references Usuario(id_psc)   
);

create table Almacen_general(
    id_entrada int not null primary key,
    fecha date not null,
    id_psc int not null,
    id_und_medida int not null,
    id_stock int not null,
    id_soporte int not null,
    foreign key(id_psc) references Usuario(id_psc),
    foreign key(id_und_medida) references Unidad_Medida (id_und_medida),
    foreign key(id_stock) references Stock(id_stock),
    foreign key(id_soporte) references Soportes(id_soporte)
);

create table Articulo(
    id_articulo int not null primary key,
    nombre_articulo varchar(20) not null,
    precio_articulo float not null,
    descripcion_articulo varchar(50) not null,
    id_entrada int not null,
    id_centro_costos int not null,
    id_marca int not null,
    id_cat int not null,
    id_nit int not null,
    foreign key(id_entrada) references Almacen_general(id_entrada),
    foreign key(id_centro_costos) references Centro_costos(id_centro_costos),
    foreign key(id_marca) references Marca(id_marca),
    foreign key(id_cat) references Categoria_Material(id_cat),
    foreign key(id_nit) references Proveedor(id_nit)
);

create table Salidas(
    id_salida int not null primary key,
    fecha_entrega date not null,
    observacion text not null,
    id_entrada int not null,
    foreign key(id_entrada) references Almacen_general(id_entrada)
);

create table Almacen_Temporal(
    id_alm_tem int not null primary key,
    fecha_apertura_alm_tem date not null,
    fecha_cierre date not null,
    estado varchar(20) not null,
    id_localidad int not null,
    id_entrada int not null,
    foreign key(id_localidad) references Localidad(id_localidad),
    foreign key(id_entrada) references Almacen_general(id_entrada)
);

create table Historico_Precio(  
    id_hp int auto_increment not null primary key,
    fecha datetime not null,
    id_articulo int not null,
    foreign key(id_articulo) references Articulo(id_articulo)
);

insert into Categoria_Material values(1,"hola te amo");
alter table Usuario ADD Clave varchar(30) not null;
ALTER TABLE Usuario DROP Clave;
alter table Usuario ADD Password varchar(30) not null;
ALTER TABLE Usuario DROP Password;
alter table Usuario ADD Clave varchar(30) not null;


insert into Usuario values(1,MD5('psc'),"Administrador",1023456789,"Cedula","Camilo","Ramirez","cr@gmail.com",3207965438);
ALTER TABLE Usuario DROP telefono;
alter table Usuario ADD telefono smallint(10) not null;
ALTER TABLE Usuario DROP telefono;
alter table Usuario ADD telefono varchar(45) not null;
UPDATE Usuario set telefono = 3207965438 where telefono = 0;
SELECT * FROM Usuario;
insert into Usuario values(2,MD5('145'),"Almacenista",1023547698,"Cedula","Rodrigo","Neira","nr@gmail.com",3203548900);
ALTER TABLE Usuario DROP Clave;
alter table Usuario ADD Clave varchar(45) not null;
update Usuario set Clave = MD5('545') where id_psc = 1;
SELECT * FROM usuario;

insert into Usuario values(3,MD5('789455'),"ingeniero",87951851,"Cedula","Francisco","Corrales","cf@gmail.com",3205132362);

insert into Categoria_Material values(10,"consumo");
insert into Categoria_Material values(20,"No consumo");
update Categoria_Material set descripcion_cat ="consumo" where id_cat=1;

insert into Marca values(15,"Argos");
insert into Marca values(20,"Holcim");
SELECT * FROM marca;

insert into Proveedor values(900978781,"Ferreteria don jose",2807897,"fdj@gmail.com");
insert into Proveedor values(900887185,"Homecenter",2807897,"homecenter@gmail.com");
SELECT id_nit FROM Proveedor;
SELECT id_nit FROM Proveedor where id_nit=900887185;

insert into Centro_costos values(1,"Mampostero");
insert into Centro_costos values(2,"Obra civil");
update Centro_costos set descripcion_centro_costos="Mamposteria"
where id_centro_costos=1;
SELECT * FROM Centro_costos;

insert into Unidad_Medida values(1,"Kilogramo");
insert into Unidad_Medida value(2,"Metro lineal");
SELECT * FROM Unidad_Medida;

insert into Stock values(40,900);
insert into Stock values(50,1500);
SELECT * FROM Stock;

insert into Soportes values(1,"FAC","Factura");
insert into Soportes values(3,"ORCOM","Orden de Compra");
SELECT * FROM soportes;

insert into Localidad values(05,"Usme");
insert into Localidad values(06,"Tunjuelito");
SELECT * FROM localidad;

insert into Log_sistema values(1,"2020/09/17",1);
insert into Log_sistema values(2,"2020/04/07",2);
update Log_sistema set fecha ="2020/09/17 14:55:00" where idLog_sistema=1;
update Log_sistema set fecha ="2020/04/07 08:08:00" where idLog_sistema=2;
SELECT * FROM log_sistema;

insert into Almacen_general values(1,"2020/07/04",1,1,40,3);
insert into Almacen_general values(2,"2020/01/25",2,2,50,1);
SELECT * FROM almacen_general;

insert into Articulo values(1,"Ladrillo",1.000,"Tipo bloque",1,1,15,10,900887185);
insert into Articulo values(2,"Cemento",17.000,"Bulto",2,2,15,10,9009787815);
update Articulo set precio_articulo = 1000 where id_articulo=1;
update Articulo set precio_articulo = 17000 where id_articulo=2;
SELECT * FROM Articulo;

insert into Salidas values(1,"2020/02/20","Envio para el almacen temporal de Usme",2);
insert into Salidas values(2,"2019/11/10","Envio para el almacen temporal de Tunjuelito",1);
SELECT * FROM Salidas;

insert into Almacen_Temporal values(10,"2020/02/04","2021/02/04","Cerrado",05,1);
insert into Almacen_Temporal values(15,"2020/08/22","2021/12/12","Abierto",06,2);
SELECT * FROM almacen_temporal;

insert into Historico_Precio values(1,"2020/02/03 10:30:15",2);
insert into Historico_Precio values(2,"2019/11/20 13:45:00",1);
SELECT * FROM historico_precio;


SELECT h.fecha, a.nombre_articulo, p.Proveedor 
FROM historico_precio h INNER JOIN articulo a 
on h.id_articulo=a.id_articulo 
INNER JOIN Proveedor p 
ON p.id_nit=a.id_nit;

SELECT * from almacen_general ag 
INNER JOIN almacen_temporal a on ag.id_entrada=a.id_entrada;

SELECT ag.fecha 'fecha de Ingreso', a.estado 'Estado Almacen Temporal' 
from almacen_general ag INNER JOIN almacen_temporal a 
on ag.id_entrada=a.id_entrada;

SELECT ag.fecha 'fecha de Ingreso', a.estado 'Estado Almacen Temporal', ar.nombre_articulo 
from almacen_general ag 
INNER JOIN almacen_temporal a 
on ag.id_entrada=a.id_entrada 
INNER JOIN articulo ar 
on ag.id_entrada= ar.id_entrada;

SELECT hp.fecha,ar.nombre_articulo, ar.precio_articulo, cm.descripcion_cat 
from articulo ar INNER JOIN historico_precio hp 
on ar.id_articulo= hp.id_articulo INNER JOIN categoria_material cm 
on ar.id_cat= cm.id_cat;


