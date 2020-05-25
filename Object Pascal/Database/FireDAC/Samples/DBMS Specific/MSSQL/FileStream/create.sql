set cmdsep go

use master
go

if exists (select name from sys.databases where name = 'FSDb')
  drop database FSDb
go

create database FSDb on primary (
  name = 'FSDb_data', 
  filename = 'C:\DB\FSDb_data.mdf', 
  size = 10240KB, 
  maxsize = 51200KB, 
  filegrowth = 1024KB
), 
filegroup FSDb_group contains filestream default (
  name = 'FSDb_dir', 
  filename = 'C:\DB\FSDb_dir'
)
log on (
  name = 'FSDb_log',
  filename = 'C:\DB\FSDb_log.ldf', 
  size = 5120KB,
  maxsize = 25600KB,
  filegrowth = 5120KB
)
go

alter database FSDb set compatibility_level = 100
go

use FSDb
go

create table FSTab (
  id int IDENTITY(1,1) NOT NULL Primary Key,
  name varchar(100) NOT NULL,
  data varbinary(max) filestream NULL,
  rowguid uniqueidentifier NOT NULL rowguidcol unique DEFAULT (newid())
)
go
