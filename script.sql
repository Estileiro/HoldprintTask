USE [master]
GO
/****** Object:  Database [Database]    Script Date: 3/17/2021 2:08:02 PM ******/
CREATE DATABASE [Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Database.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Database_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Database] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Database] SET  MULTI_USER 
GO
ALTER DATABASE [Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Database] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Database] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Database]
GO
/****** Object:  Table [dbo].[tbl_cliente]    Script Date: 3/17/2021 2:08:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](max) NULL,
	[Nome] [varchar](max) NULL,
	[Endereco] [nvarchar](max) NULL,
	[Cidade] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Sp_cliente]    Script Date: 3/17/2021 2:08:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_cliente]

   @Email    NVARCHAR (100) ,

    @Password NVARCHAR (MAX) ,

    @Nome     VARCHAR (MAX)  ,

    @Endereco  NVARCHAR (MAX) ,

    @Cidade     NVARCHAR (MAX)

     as

     begin

     insert into tbl_cliente values(@Email,@Password,@Nome,@Endereco,@Cidade)

     end
GO
/****** Object:  StoredProcedure [dbo].[Sp_cliente_byid]    Script Date: 3/17/2021 2:08:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_cliente_byid]

@id int

as

begin

Select * from tbl_cliente where id=@id

End
GO
/****** Object:  StoredProcedure [dbo].[Sp_cliente_delete]    Script Date: 3/17/2021 2:08:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_cliente_delete]

@id int

as

begin

delete from tbl_cliente where id=@id

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_cliente_get]    Script Date: 3/17/2021 2:08:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_cliente_get]

as

begin

Select * from tbl_cliente

End
GO
/****** Object:  StoredProcedure [dbo].[Sp_cliente_Update]    Script Date: 3/17/2021 2:08:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_cliente_Update]

@id int ,

@Email nvarchar(200),

@Password nvarchar(200),

@Nome nvarchar(200),

@Endereco nvarchar(max),

@Cidade nvarchar(200)

as

begin

update tbl_cliente set Email=@Email,Password=@Password,Nome=@Nome,Endereco=@Endereco,Cidade=@Cidade where id=@id

end

GO
USE [master]
GO
ALTER DATABASE [Database] SET  READ_WRITE 
GO
