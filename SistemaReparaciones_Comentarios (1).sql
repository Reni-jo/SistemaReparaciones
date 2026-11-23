USE [master]
GO
/****** Objeto: Database [SistemaReparaciones] Fecha de script: 22/11/2026 19:53:30 ******/
CREATE DATABASE [SistemaReparaciones]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaReparaciones', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS01\MSSQL\DATA\SistemaReparaciones.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemaReparaciones_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS01\MSSQL\DATA\SistemaReparaciones_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SistemaReparaciones] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemaReparaciones].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemaReparaciones] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SistemaReparaciones] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaReparaciones] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemaReparaciones] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SistemaReparaciones] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaReparaciones] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SistemaReparaciones] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaReparaciones] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemaReparaciones] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemaReparaciones] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemaReparaciones] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SistemaReparaciones] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [SistemaReparaciones] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SistemaReparaciones] SET QUERY_STORE = ON
GO
ALTER DATABASE [SistemaReparaciones] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SistemaReparaciones]
GO
/****** Objeto: Table [dbo].[Asignaciones] Fecha de script: 22/11/2026 19:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaciones](
	[AsignacionID] [int] IDENTITY(1,1) NOT NULL,
	[ReparacionID] [int] NOT NULL,
	[TecnicoID] [int] NULL,
	[FechaAsignacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AsignacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[DetallesReparacion] Fecha de script: 22/11/2026 19:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesReparacion](
	[DetalleID] [int] IDENTITY(1,1) NOT NULL,
	[ReparacionID] [int] NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[FechaInicio] [datetime] NULL,
	[FechaFin] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Equipos] Fecha de script: 22/11/2026 19:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[EquipoID] [int] IDENTITY(1,1) NOT NULL,
	[TipoEquipo] [varchar](100) NOT NULL,
	[Modelo] [varchar](100) NOT NULL,
	[UsuarioID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EquipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Reparaciones] Fecha de script: 22/11/2026 19:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reparaciones](
	[ReparacionID] [int] IDENTITY(1,1) NOT NULL,
	[EquipoID] [int] NOT NULL,
	[FechaSolicitud] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReparacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Tecnicos] Fecha de script: 22/11/2026 19:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tecnicos](
	[TecnicoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Especialidad] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TecnicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Usuarios] Fecha de script: 22/11/2026 19:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[CorreoElectronico] [varchar](100) NOT NULL,
	[telefono] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CorreoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD FOREIGN KEY([ReparacionID])
REFERENCES [dbo].[Reparaciones] ([ReparacionID])
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD  CONSTRAINT [FK_Asignaciones_Tecnicos] FOREIGN KEY([TecnicoID])
REFERENCES [dbo].[Tecnicos] ([TecnicoID])
GO
ALTER TABLE [dbo].[Asignaciones] CHECK CONSTRAINT [FK_Asignaciones_Tecnicos]
GO
ALTER TABLE [dbo].[DetallesReparacion]  WITH CHECK ADD FOREIGN KEY([ReparacionID])
REFERENCES [dbo].[Reparaciones] ([ReparacionID])
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[Reparaciones]  WITH CHECK ADD FOREIGN KEY([EquipoID])
REFERENCES [dbo].[Equipos] ([EquipoID])
GO

/***************************************************************
 PROCEDIMIENTO ALMACENADO: sp_AsignarTecnico

 LÓGICA:
 Este procedimiento permite asignar un técnico a una reparación.
 Recibe como parámetros el identificador de la reparación y
 el identificador del técnico.

 Inserta la información en la tabla Asignaciones y registra
 automáticamente la fecha y hora actual mediante GETDATE().
****************************************************************/

/****** Objeto: StoredProcedure [dbo].[sp_AsignarTecnico] Fecha de script: 22/11/2026 19:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AsignarTecnico]
    @ReparacionID INT,
    @TecnicoID INT
AS
BEGIN
    INSERT INTO Asignaciones (ReparacionID, TecnicoID, FechaAsignacion)
    VALUES (@ReparacionID, @TecnicoID, GETDATE());
END;
GO

/***************************************************************
 PROCEDIMIENTO ALMACENADO: sp_RegistrarReparacion

 LÓGICA:
 Este procedimiento permite registrar una nueva solicitud
 de reparación para un equipo.

 Recibe como parámetros el identificador del equipo y la
 fecha en que se realiza la solicitud.

 Inserta estos datos en la tabla Reparaciones, permitiendo
 mantener un registro de las solicitudes realizadas para
 cada equipo.
****************************************************************/

/****** Objeto: StoredProcedure [dbo].[sp_RegistrarReparacion] Fecha de script: 22/11/2026 19:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RegistrarReparacion]
    @EquipoID INT,
    @FechaSolicitud DATE
AS
BEGIN
    INSERT INTO Reparaciones (EquipoID, FechaSolicitud)
    VALUES (@EquipoID, @FechaSolicitud);
END;
GO
USE [master]
GO
ALTER DATABASE [SistemaReparaciones] SET READ_WRITE 
GO
