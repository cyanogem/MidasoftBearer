USE [master]
GO
/****** Object:  Database [GrupoFamiliar]    Script Date: 26/03/2024 5:22:05 a. m. ******/
CREATE DATABASE [GrupoFamiliar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GrupoFamiliar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GrupoFamiliar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GrupoFamiliar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GrupoFamiliar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GrupoFamiliar] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GrupoFamiliar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GrupoFamiliar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET ARITHABORT OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GrupoFamiliar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GrupoFamiliar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GrupoFamiliar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GrupoFamiliar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET RECOVERY FULL 
GO
ALTER DATABASE [GrupoFamiliar] SET  MULTI_USER 
GO
ALTER DATABASE [GrupoFamiliar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GrupoFamiliar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GrupoFamiliar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GrupoFamiliar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GrupoFamiliar] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GrupoFamiliar] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GrupoFamiliar', N'ON'
GO
ALTER DATABASE [GrupoFamiliar] SET QUERY_STORE = OFF
GO
USE [GrupoFamiliar]
GO
/****** Object:  Table [dbo].[Familiares]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Familiares](
	[IdFamilia] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Cedula] [int] NOT NULL,
	[Nombres] [nvarchar](60) NOT NULL,
	[Apellidos] [nvarchar](60) NOT NULL,
	[IdGenero] [int] NULL,
	[IdParentesco] [int] NULL,
	[Edad] [int] NOT NULL,
	[MenorEdad] [bit] NULL,
	[FechaNacimiento] [date] NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Familiares] PRIMARY KEY CLUSTERED 
(
	[IdFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[IdGenero] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionGenero] [nvarchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[IdGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[IdLog] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Accion] [nvarchar](50) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[FechaRegistro] [date] NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[IdLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parentesco]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parentesco](
	[IdParentesco] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionParentesco] [nvarchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Parentesco] PRIMARY KEY CLUSTERED 
(
	[IdParentesco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [nvarchar](50) NOT NULL,
	[Contraseña] [nvarchar](50) NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Cedula] [int] NOT NULL,
	[Telefono] [nvarchar](50) NOT NULL,
	[Activo] [bit] NULL,
	[Fecharegistro]  AS (getdate()),
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Familiares] ON 

INSERT [dbo].[Familiares] ([IdFamilia], [IdUsuario], [Cedula], [Nombres], [Apellidos], [IdGenero], [IdParentesco], [Edad], [MenorEdad], [FechaNacimiento], [FechaRegistro]) VALUES (8, 1, 545558, N'yesenia', N'sanabria', 5, 1, 26, 0, CAST(N'2024-03-12' AS Date), CAST(N'2024-03-12T23:02:21.627' AS DateTime))
SET IDENTITY_INSERT [dbo].[Familiares] OFF
GO
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([IdGenero], [DescripcionGenero], [Activo], [FechaRegistro]) VALUES (5, N'Masculino', 1, CAST(N'2024-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Genero] ([IdGenero], [DescripcionGenero], [Activo], [FechaRegistro]) VALUES (6, N'Femenino', 1, CAST(N'2024-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Genero] ([IdGenero], [DescripcionGenero], [Activo], [FechaRegistro]) VALUES (7, N'Binario', 1, CAST(N'2024-03-12T10:25:06.813' AS DateTime))
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (1, 1, N'Listar', N'{"success":true,"message":"Exito","result":{"genero":[{"IdGenero":5,"DescripcionGenero":"Masculino","Activo":true},{"IdGenero":6,"DescripcionGenero":"Femenino","Activo":true},{"IdGenero":7,"DescripcionGenero":"Binario","Activo":true}]}}', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (2, 1, N'sp_ListGenero', N'ResultadoExito True', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (3, 1, N'sp_ListUsuario', N'ResultadoExito True', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (4, 1, N'sp_ValidarLoginUsuario', N'ResultadoExito ', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (5, 1, N'sp_ValidarLoginUsuario', N'ResultadoExito ', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (6, 1, N'sp_ValidarLoginUsuario', N'Resultado', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (7, 1, N'sp_ValidarLoginUsuario', N'Resultado', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (8, 1, N'sp_ValidarLoginUsuario', N'Resultado', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (9, 1, N'sp_ValidarLoginUsuario', N'Resultado', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (10, 1, N'sp_ValidarLoginUsuario', N'Resultado', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (11, 1, N'sp_ValidarLoginUsuario', N'Resultado', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (12, 1, N'sp_ValidarLoginUsuario', N'Resultado', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (13, 1, N'Listar', N'Error converting value {null} to type ''System.DateTime''. Path ''[0].FechaNacimiento'', line 1, position 205.', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (14, 1, N'Listar', N'Error converting value {null} to type ''System.DateTime''. Path ''[0].FechaNacimiento'', line 1, position 205.', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (15, 1, N'sp_ValidarLoginUsuario', N'Resultado', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (16, 1, N'sp_ListFamiliar', N'ResultadoExito True', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (17, 1, N'sp_ListFamiliar', N'ResultadoExito True', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (1002, 1, N'sp_ValidarLoginUsuario', N'Resultado', CAST(N'2024-03-18' AS Date))
INSERT [dbo].[Log] ([IdLog], [IdUsuario], [Accion], [Body], [FechaRegistro]) VALUES (1003, 1, N'sp_ValidarLoginUsuario', N'Resultado', CAST(N'2024-03-19' AS Date))
SET IDENTITY_INSERT [dbo].[Log] OFF
GO
SET IDENTITY_INSERT [dbo].[Parentesco] ON 

INSERT [dbo].[Parentesco] ([IdParentesco], [DescripcionParentesco], [Activo], [FechaRegistro]) VALUES (1, N'Hermana', 1, CAST(N'2024-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Parentesco] ([IdParentesco], [DescripcionParentesco], [Activo], [FechaRegistro]) VALUES (2, N'Padre', 1, CAST(N'2024-03-12T10:24:45.727' AS DateTime))
INSERT [dbo].[Parentesco] ([IdParentesco], [DescripcionParentesco], [Activo], [FechaRegistro]) VALUES (3, N'Madre', 1, CAST(N'2024-03-12T10:24:50.387' AS DateTime))
SET IDENTITY_INSERT [dbo].[Parentesco] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario], [Usuario], [Contraseña], [Nombres], [Apellido], [Cedula], [Telefono], [Activo]) VALUES (1, N'jairo.sanabria', N'123456', N'Jairo ', N'Sanabria', 26554, N'3654555', 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Familiares] ADD  CONSTRAINT [DF_Familiares_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Genero] ADD  CONSTRAINT [DF_Genero_FechaRegistroGenero]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_Log_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Parentesco] ADD  CONSTRAINT [DF_Parentesco_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Familiares]  WITH CHECK ADD  CONSTRAINT [FK_Familiares_Genero] FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Genero] ([IdGenero])
GO
ALTER TABLE [dbo].[Familiares] CHECK CONSTRAINT [FK_Familiares_Genero]
GO
ALTER TABLE [dbo].[Familiares]  WITH CHECK ADD  CONSTRAINT [FK_Familiares_Parentesco] FOREIGN KEY([IdParentesco])
REFERENCES [dbo].[Parentesco] ([IdParentesco])
GO
ALTER TABLE [dbo].[Familiares] CHECK CONSTRAINT [FK_Familiares_Parentesco]
GO
ALTER TABLE [dbo].[Familiares]  WITH CHECK ADD  CONSTRAINT [FK_Familiares_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Familiares] CHECK CONSTRAINT [FK_Familiares_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteFamiliar]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_DeleteFamiliar]
(
	@idfamiliar int
)
AS
BEGIN
    delete from Familiares where IdFamilia = @idfamiliar
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteGenero]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteGenero]
(
	@idgenero int
)
AS
BEGIN
    delete from Genero where IdGenero = @idgenero
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteUsuario]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_DeleteUsuario]
(
	@idUsuario int
)
AS
BEGIN
    delete from Usuarios where IdUsuario = @idUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFamiliar]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetFamiliar]
(
	@idfamiliar int
)
AS
BEGIN
        select IdFamilia,IdUsuario,Nombres,Apellidos,Cedula,g.DescripcionGenero,p.DescripcionParentesco,Edad,MenorEdad,FechaNacimiento 
			from Familiares f inner join Genero g on f.IdGenero = g.IdGenero 
							  inner join Parentesco p on f.IdParentesco = p.IdParentesco
							  where f.IdFamilia = @idfamiliar
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUsuario]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetUsuario]
(
	@idUsuario int
)
AS
BEGIN
        select * from Usuarios
		where IdUsuario = @idUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertFamiliar]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertFamiliar]
(
	@idUsuario int,
    @cedula    int,
    @nombres nvarchar(60),
	@apellidos nvarchar(60),
	@idgenero int,
	@idparentesco int,
	@edad int,
	@menoredad bit,
	@fechanacimiento datetime
)
AS
BEGIN
    insert into Familiares(IdUsuario,Cedula,Nombres,Apellidos,IdGenero,IdParentesco,Edad,MenorEdad,FechaNacimiento) 
		values (@idUsuario,@cedula,@nombres,@apellidos,@idgenero,@idparentesco,@edad,@menoredad,@fechanacimiento);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertGenero]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertGenero]
(
	@idgenero int,
    @descripciongenero    nvarchar(50),
    @activo bit
)
AS
BEGIN
    insert into Genero (DescripcionGenero,Activo) values (@descripciongenero,@activo);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLog]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_InsertLog]
(
	@idUsuario int,
    @accion    nvarchar(60),
    @body nvarchar(max)
)
AS
BEGIN
    insert into Log(IdUsuario,Accion,Body) 
		values (@idUsuario,@accion,@body);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUsuario]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_InsertUsuario]
(
    @usuario    int,
    @contraseña nvarchar(60),
	@nombres nvarchar(60),
	@apellido nvarchar(60),
	@cedula int,
	@telefono nvarchar(60),
	@activo bit
)
AS
BEGIN
    insert into Usuarios(Usuario,Contraseña,Nombres,Apellido,Cedula,Telefono,Activo) 
		values (@usuario,@contraseña,@nombres,@apellido,@cedula,@telefono,@activo);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListFamiliar]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListFamiliar]
(
 @IdUsuario int
)
AS
BEGIN
    select IdFamilia,IdUsuario,Nombres,Apellidos,Cedula,g.DescripcionGenero,p.DescripcionParentesco,Edad,MenorEdad,FechaNacimiento 
			from Familiares f inner join Genero g on f.IdGenero = g.IdGenero 
							  inner join Parentesco p on f.IdParentesco = p.IdParentesco
							  where f.IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListGenero]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListGenero]

AS
BEGIN
    select * from Genero
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListUsuario]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_ListUsuario]
AS
BEGIN
    select * from Usuarios
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateFamiliar]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_UpdateFamiliar]
(
	@idfamiliar int,
	@idUsuario int,
    @cedula    int,
    @nombres nvarchar(60),
	@apellidos nvarchar(60),
	@idgenero int,
	@idparentesco int,
	@edad int,
	@menoredad bit,
	@fechanacimiento datetime
)
AS
BEGIN
    UPDATE Familiares
    SET IdUsuario = @idUsuario, Cedula = @cedula, Nombres = @nombres, Apellidos = @apellidos, IdGenero = @idgenero, IdParentesco = @idparentesco,
	Edad = @edad, MenorEdad = @menoredad, FechaNacimiento = @fechanacimiento
     WHERE IdFamilia = @idfamiliar
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateGenero]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateGenero]
(
	@idgenero int,
    @descripciongenero    nvarchar(50),
    @activo bit
)
AS
BEGIN
    UPDATE Genero
    SET DescripcionGenero = @descripciongenero, Activo = @activo
     WHERE IdGenero = @idgenero
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUsuario]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_UpdateUsuario]
(
	@idUsuario int,
    @usuario    int,
    @contraseña nvarchar(60),
	@nombres nvarchar(60),
	@apellido nvarchar(60),
	@cedula int,
	@telefono nvarchar(60),
	@activo bit
)
AS
BEGIN
    UPDATE Usuarios
    SET Usuario = @usuario, Contraseña = @contraseña, Nombres = @nombres, Apellido = @apellido, Cedula = @cedula, Telefono = @telefono,	
	Activo = @activo
     WHERE IdUsuario = @idUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarCedulaFamiliar]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_ValidarCedulaFamiliar]
(
@cedula int
)
AS
BEGIN
    select Cedula from Familiares where Cedula = @cedula
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarCedulaUsuario]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_ValidarCedulaUsuario]
(
@cedula int,
@usuario nvarchar(60)
)
AS
BEGIN
    select Cedula from Usuarios where Cedula = @cedula and Usuario = @usuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarLoginUsuario]    Script Date: 26/03/2024 5:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ValidarLoginUsuario]
(
	@usuario nvarchar(60)
)
AS
BEGIN
    select IdUsuario,Usuario,Contraseña from Usuarios where Usuario = @usuario
END
GO
USE [master]
GO
ALTER DATABASE [GrupoFamiliar] SET  READ_WRITE 
GO
