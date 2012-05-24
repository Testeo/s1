-- SIS 758 Javier Quispe Fernandez -- Martes 22 de mayo 2012 v2.6--drop database BiblioContenidos;--create database BiblioContenidos;--GO--use BiblioContenidos;--GOcreate table Usuarios( 	Id int identity(1,1),	Avatar varchar(100), --URL de la imagen	ApPaterno varchar(50),	ApMaterno varchar(50),	Nombres varchar(150),	Ubicacion varchar(150),	Karma int,	UserId uniqueidentifier not null,    foreign key(UserId) references 	aspnet_Users(UserId),	primary key(Id))create table Intereses(	Interes varchar(50) primary key,	IdUsuario int not null,	foreign key(IdUsuario) references Usuarios(Id))create table Categorias(	Id int identity(1,1),	Descripcion varchar(150) not null,	Estado varchar(50) not null,	primary key(Id) )create table Contenidos(	Id int identity(1,1),	FechaPublicacion datetime not null,	IdUsuario int not null,	Tipo varchar(50) not null, --Libro,Tutorial,Curso,Articulo,Pregunta,Respuesta	Titulo varchar(150) not null,	Descripcion varchar(300),   --En v2.5 maaaaaaaaaaaas largo	UrlReal varchar(50) not null, --v2.0	UrlVirtual varchar(50) not null,	Estado varchar(50),	foreign key(IdUsuario) references Usuarios(Id),	primary key(Id))create table RelContenidosCategorias(	IdContenido int not null,	IdCategoria int not null,	primary key(IdContenido, IdCategoria),	foreign key(IdContenido) references Contenidos(Id),	foreign key(IdCategoria) references Categorias(Id))create table Seccions(	Id int not null, --12, 13 ... | 21, 22, ...	SubTitulo varchar(250) not null,	URL varchar(150) not null,	IdContenido int not null,	primary key(Id),	foreign key(IdContenido) references Contenidos(Id))create table Archivos( --imgs, ejems, zips	Id int identity(1,1),	UrlVirtual varchar(300),	UrlAbsoluta varchar(300),	Fecha datetime,	IdContenido int,	IdSeccion int,	foreign key(IdContenido) references Contenidos(Id),	foreign key(IdSeccion) references Seccions(Id))create table Gustas( --v1.5	Id int identity(1,1),	IdContenido int not null,	IdUsuario int not null,	MeGusta int not null, -- 0(No me gusta) OR  1(Me gusta)	Fecha datetime not null	primary key(Id),	foreign key(IdContenido) references Contenidos(Id),	foreign key(IdUsuario) references Usuarios(Id))create table Preguntas( --Es un Contenido 	Id int identity(1,1),	IdContenido int not null,	primary key(Id),	foreign key(IdContenido) references Contenidos(Id))create table Respuestas( --Es un Contenido 	Id int identity(1,1),	IdPregunta int not null,	IdContenido int not null,	primary key(Id),	foreign key(IdContenido) references Contenidos(Id),	foreign key(IdPregunta) references Preguntas(Id))create table Libros( --Es un Contenido 	Id int identity(1,1),	Autor varchar(150) not null,	Portada varchar(150), --URL de la imagen	Indice varchar(150),	AnhoPublicacion int,	IdContenido int,	primary key(Id),	foreign key(IdContenido) references Contenidos(Id))create table Comentarios(	Id int identity(1,1),	Comentario varchar(1000) not null, --v2.0	IdUsuario int not null,	Fecha datetime not null,	IdContenido int not null, --v1.5	Estado varchar(50),	primary key(Id),	foreign key(IdUsuario) references Usuarios(Id),	foreign key(IdContenido) references Contenidos(Id))