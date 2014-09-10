drop database ProyectAdmin;
create database ProyectAdmin;
use ProyectAdmin;

create table tblCategoriaProyecto (
    CategoriaProyectoId int not null auto_increment,
    CategoriaProyecto varchar(50) not null,
	primary key(CategoriaProyectoId)	
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
    EstadoId int not null auto_increment,
    Estado varchar(50) not null,
	primary key (EstadoId)
);

insert into tblEstados (Estado)  Values('En progreso');
insert into tblEstados (Estado)  Values('Reabierto');
insert into tblEstados (Estado)  Values('Abierto');
insert into tblEstados (Estado)  Values('Cerrado');
insert into tblEstados (Estado)  Values('Pausado');
insert into tblEstados (Estado)  Values('Pendiente');

create table tblUsuario (
    UsuarioId int not null auto_increment,
    Nombre varchar(50) not null,
    Apellido varchar(50) not null,
    Nickname varchar(30) null,
    Correo varchar(60) not null,
    Contrasena varchar(16) not null,
    Sexo varchar(2) not null,
	primary key (UsuarioId)
);

create table tblProyecto (
    ProyectoId int not null auto_increment,
    Proyecto varchar(50) not null,
    Descripcion varchar(300) null,
    FechaCreacion timestamp,
    FechaFinEstimada datetime,
	primary key (ProyectoId)
);
	
/*drop table tblProyectoEstado;*/
create table tblProyectoEstado (
    ProyectoId int not null,
    EstadoId int not null,
    FechaEstado datetime not null,
	UsuarioId int not null,
	foreign key fk_PE_ProyectoId (ProyectoId) references tblProyecto(ProyectoId),
	foreign key fk_PE_EstadoId (EstadoId) references tblEstados(EstadoId),
	foreign key fk_PE_UsuarioId (UsuarioId) references tblUsuario(UsuarioId)
);

create table tblUsuarioProyecto (
    UsuarioId int not null,
    ProyectoId int not null,
    Rol int not null,
	foreign key fk_UP_UsuarioId (UsuarioId) references tblUsuario(UsuarioId),
	foreign key fk_UP_ProyectoId (ProyectoId) references tblProyecto(ProyectoId)
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
	foreign key fk_TA_ProyectoId (ProyectoId) references tblProyecto(ProyectoId),
	foreign key fk_TA_UsuarioId (UsuarioId) references tblUsuario(UsuarioId),
	foreign key fk_TA_UsuarioIdAsigna(UsuarioIdAsigna) references tblUsuario(UsuarioId)
);

drop table tblTareaEstado;
create table tblTareaEstado(
	TareaId int not null,
	EstadoId int not null,
	UsuarioId int not null ,
	Fecha timestamp	,
	foreign key fk_TE_EstadoId (EstadoId) references tblEstados(EstadoId),
	foreign key fk_TE_TareaId (TareaId) references tblTarea(TareaId),
	foreign key fk_TE_UsuarioId (UsuarioId) references tblUsuario(UsuarioId)
);

create table tblNotas (
    NotaId int primary key not null,
    Nota varchar(50) not null,
    Contenido varchar(500) not null,
    FechaCracion datetime not null,
    UsuarioId int not null,
    ProyectoId int not null,
	foreign key fk_NO_ProyectoId (ProyectoId) references tblProyecto(ProyectoId),
	foreign key fk_NO_UsuarioId(UsuarioId) references tblUsuario(UsuarioId)
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
	foreign key fk_AR_ProyectoId (ProyectoId) references tblProyecto(ProyectoId),
	foreign key fk_AR_UsuarioId (UsuarioId) references tblUsuario(UsuarioId)
);

drop table tblTipoElemento;
create table tblTipoElemento (
    TipoElementoId int not null primary key auto_increment,
    TipoElemento varchar(50) not null
);

insert into tblTipoElemento (TipoElemento) Values('Post');
insert into tblTipoElemento (TipoElemento) Values('Evento');
insert into tblTipoElemento (TipoElemento) Values('Nota');
insert into tblTipoElemento (TipoElemento) Values('Archivo');
insert into tblTipoElemento (TipoElemento) Values('Comentario');

drop table tblComentario;
create table tblComentario (
    TipoElementoId int,
	UsuarioId int not null,
    ElemetoId int not null,
    Fecha datetime,
	foreign key fk_CO_UsuarioId (UsuarioId) references tblUsuario(UsuarioId)
);

drop table tblLike;
create table tblLike(
	UsuarioId int not null,
	TipoElementoId int not null,
	ElementoId int not null,
	foreign key fk_LK_UsuarioId (UsuarioId) references tblUsuario(UsuarioId)
);

drop table tblPost;
create table tblPost(
	ProyectoId int not null,
	PostId int not null primary key auto_increment,
	TipoElementoId int not null,
	ElementoId int not null,
	Redaccion varchar(300)	,
	foreign key fk_PS_ProyectoId (ProyectoId) references tblProyecto(ProyectoId),
	foreign key fk_PS_TipoElementoId (TipoElementoId) references tblTipoElemento(TipoElementoId)	
);


create table tblEvento(
	EventoId int not null primary key  auto_increment,
	Evento varchar(100) not null,
	Descripcion varchar(600),
	Lugar varchar (300),
	Inicio datetime,
	Fin datetime,
	ProyectoId int not null,
	foreign key fk_EV_ProyectoId (ProyectoId) references tblProyecto(ProyectoId)
); 

create table tblEventoUsuario(
	EventoId int not null,
	UsuarioId int not null,
	Rol int not null,
	foreign key fk_EU_EventoId (EventoId) references tblEvento(EventoId),
	foreign key fk_EU_UsuarioId (UsuarioId) references tblUsuario(UsuarioId)
);








