create database ProyectAdmin;
use ProyectAdmin;

create table tblCategoriaProyecto (
    CategoriaProyectoId int primary key not null auto_increment,
    CategoriaProyecto varchar(50) not null
);

insert into tblCategoriaProyecto (CategoriaProyecto) values('Tecnologías de información');
insert into tblCategoriaProyecto (CategoriaProyecto) values('Cuidado del ambiente');
insert into tblCategoriaProyecto (CategoriaProyecto) values('Administración');
insert into tblCategoriaProyecto (CategoriaProyecto) values('Desarrollo de Software');
insert into tblCategoriaProyecto (CategoriaProyecto) values('Construcción');
insert into tblCategoriaProyecto (CategoriaProyecto) values('Organizacion de eventos');
insert into tblCategoriaProyecto (CategoriaProyecto) values('Compras');
insert into tblCategoriaProyecto (CategoriaProyecto) values('Corporativo');
insert into tblCategoriaProyecto (CategoriaProyecto) values('Ventas');
insert into tblCategoriaProyecto (CategoriaProyecto) values('Personal');
insert into tblCategoriaProyecto (CategoriaProyecto) values('Otros');

create table tblEstados (
    EstadoId int primary key not null auto_increment,
    Estado varchar(50) not null
);

insert into tblEstados (Estado)  Values('En progreso');
insert into tblEstados (Estado)  Values('Reabierto');
insert into tblEstados (Estado)  Values('Abierto');
insert into tblEstados (Estado)  Values('Cerrado');
insert into tblEstados (Estado)  Values('Pausado');
insert into tblEstados (Estado)  Values('Pendiente');

create table tblUsuario (
    UsuarioId int primary key not null auto_increment,
    Nombre varchar(50) not null,
    Apellido varchar(50) not null,
    Nickname varchar(30) null,
    Correo varchar(60) not null,
    Contrasena varchar(16) not null,
    Sexo varchar(2) not null
);

create table tblProyecto (
    ProyectoId int primary key not null auto_increment,
    Proyecto varchar(50) not null,
    Descripcion varchar(300) null,
    FechaCreacion timestamp,
    FechaFinEstimada datetime
);
	
create table tblProyectoEstado (
    ProyectoId int not null,
    EstadoId int not null,
    FechaEstado datetime not null,
	UsuarioId int not null,
	foreign key (ProyectoId) references tblProyecto(ProyectiId),
	foreign key (EstadoId) references tblEstado(EstadoId)
	foreign key (UsuarioId) references tblUsuario(UsuarioId),
);

create table tblUsuarioProyecto (
    UsuarioId int not null,
    ProyectoId int not null,
    Rol int not null,
	foreign key (UsuarioId) references tblUsuario(UsuarioId),
	foreign key (ProyectoId) references tblProyecto(ProyectiId)
);

create table tblTarea (
    TareaId int primary key not null auto_increment,
    Tarea varchar(50) not null,
    Descripcion varchar(300),
    FechaInicio datetime,
    FechaFin datetime,
    ProyectoId int not null,
    UsuarioId int not null,
    UsuarioIdAsigna int not null,    
	foreign key (ProyectoId) references tblProyecto(ProyectiId),
	foreign key (UsuarioId) references tblUsuario(UsuarioId),
	foreign key (UsuarioIdAsigna) references tblUsuario(UsuarioId)
);

create table tblTareaEstado(
	TareaId int not null,
	EstadoId int not null,
	UsuarioId int not null ,
	Fecha timestamp
	foreign key (ProyectoId) references tblProyecto(ProyectiId),
	foreign key (UsuarioId) references tblUsuario(UsuarioId),
	foreign key (EstadoId) references tblEstado(EstadoId)
)

create table tblNotas (
    NotaId int primary key not null,
    Nota varchar(50) not null,
    Contenido varchar(500) not null,
    FechaCracion datetime not null,
    UsuarioId int not null,
    ProyectoId int not null,
	foreign key (ProyectoId) references tblProyecto(ProyectiId),
	foreign key (UsuarioId) references tblUsuario(UsuarioId)
);

create table tblArchivo (
    ArchivoId int not null,
	ProyectoId int not null,
    Titulo varchar(50) not null,
    Archivo varchar(50) not null,
    Version int not null,
    UsuarioId int not null,
    Fecha datetime,
    Review varchar(100),
	foreign key (ProyectoId) references tblProyecto(ProyectiId),
	foreign key (UsuarioId) references tblUsuario(UsuarioId)
);

create table tblTipoElemento (
    TipoComentarioId int not null primary key auto_increment,
    TipoComentario varchar(50) not null
);

insert into tblTipoElemento (TipoComentario) Values('Post');
insert into tblTipoElemento (TipoComentario) Values('Evento');
insert into tblTipoElemento (TipoComentario) Values('Nota');
insert into tblTipoElemento (TipoComentario) Values('Archivo');
insert into tblTipoElemento (TipoComentario) Values('Comentario');

create table tblComentario (
    TipoElementoId int auto_increment,
	UsuarioId int not null,
    ElemetoId int not null,
    Fecha datetime,
	foreign key (UsuarioId) references tblUsuario(UsuarioId)
);


create table tblLike(
	UsuarioId int not null,
	TipoElementoId int not null,
	ElementoId int not null,
	foreign key (UsuarioId) references tblUsuario(UsuarioId)
);

create table tblPost(
	ProyectiId int not null,
	PostId int not null auto_increment,
	TipoElementoId int not null,
	ElementoId int not null
	Redaccion varchar(300)	
);

create table tblEvento(
	EventoId int not null auto_increment,
	Evento varchar(100) not null,
	Descripcion varchar(600),
	Lugar varchar (300),
	Inicio datetime,
	Fin datetime
); 








