SET CMDSEP GO

DROP TABLE [FDQA_All_types]
GO

CREATE TABLE [FDQA_All_types] (
 [tbigint] [bigint] NULL ,
 [tbinary] [binary] (50) NULL ,
 [tbit] [bit] NULL ,
 [tchar] [char] (10) NULL ,
 [tdatetime] [datetime] NULL ,
 [tfloat] [float] NULL ,
 [timage] [image] NULL ,
 [tint] [int] NULL ,
 [tmoney] [money] NULL ,
 [tnchar] [nchar] (10) NULL ,
 [tntext] [ntext] NULL ,
 [tnumeric] [numeric](18, 10) NULL ,
 [tnvarchar] [nvarchar] (50) NULL ,
 [treal] [real] NULL ,
 [tsmalldatetime] [smalldatetime] NULL ,
 [tsmallint] [smallint] NULL ,
 [tsmallmoney] [smallmoney] NULL ,
 [tsql_variant] [sql_variant] NULL ,
 [ttext] [text] NULL ,
 [ttimestamp] [timestamp] NULL ,
 [ttinyint] [tinyint] NULL ,
 [tuniqueidentifier] [uniqueidentifier] NULL ,
 [tvarbinary] [varbinary] (50) NULL ,
 [tvarchar] [varchar] (50) NULL 
)
GO

CREATE CLUSTERED INDEX I_FDQA_All_types ON
  FDQA_All_types (tbigint)
GO

DROP TABLE [FDQA_Numbers]
GO

CREATE TABLE [FDQA_Numbers] (
 [dtByte] [tinyint] NULL ,
 [dtSByte] [tinyint] NULL ,
 [dtInt16] [smallint] NULL ,
 [dtInt32] [int] NULL ,
 [dtInt64] [bigint] NULL ,
 [dtUInt16] [decimal](5, 0) NULL ,
 [dtUInt32] [decimal](10, 0) NULL ,
 [dtUInt64] [decimal](20, 0) NULL ,
 [dtDouble] [float] NULL ,
 [dtCurrency] [money] NULL ,
 [dtBCD] [decimal](28, 14) NULL ,
 [dtFmtBCD] [decimal](28, 14) NULL 
)
GO

CREATE CLUSTERED INDEX I_FDQA_Numbers ON
  FDQA_Numbers (dtByte)
GO

DROP TABLE [FDQA_Identity_tab]
GO

CREATE TABLE [FDQA_Identity_tab] (
 [auto] [int] IDENTITY NOT NULL ,
 [descr] [nvarchar] (50) NULL 
)
GO

CREATE CLUSTERED INDEX I_FDQA_Identity_tab ON
  FDQA_Identity_tab (auto)
GO

DROP TABLE [FDQA_details_autoinc]
GO

CREATE TABLE [FDQA_details_autoinc] (
 [id2] [int] IDENTITY NOT NULL ,
 [fk_id1] [int] NOT NULL ,
 [name2] [varchar] (20) NULL
)
GO

DROP TABLE [FDQA_master_autoinc]
GO

CREATE TABLE [FDQA_master_autoinc] (
 [id1] [int] IDENTITY NOT NULL ,
 [name1] [varchar] (20) NULL
)
GO

ALTER TABLE [FDQA_master_autoinc] WITH NOCHECK ADD
  CONSTRAINT [PK_master_autoinc] PRIMARY KEY CLUSTERED
 (
  [id1]
 ) 
GO

ALTER TABLE [FDQA_master_autoinc] WITH NOCHECK ADD
  CONSTRAINT [UK_master_autoinc] UNIQUE
 (
  [name1]
 ) 
GO

ALTER TABLE [FDQA_details_autoinc] WITH NOCHECK ADD
  CONSTRAINT [PK_details_autoinc] PRIMARY KEY CLUSTERED
 (
  [id2]
 ) 
GO

ALTER TABLE [FDQA_details_autoinc] ADD 
 CONSTRAINT [FK_details_autoinc_master_autoinc] FOREIGN KEY 
 (
  [fk_id1]
 ) REFERENCES [FDQA_master_autoinc] (
  [id1]
 ) ON DELETE CASCADE ON UPDATE CASCADE 
GO

DROP TABLE [FDQA_TransTable]
GO

CREATE TABLE [FDQA_TransTable] (
 [id] [int] NOT NULL ,
 [name] [varchar] (100) NULL 
) 
GO

ALTER TABLE [FDQA_TransTable] WITH NOCHECK ADD 
 CONSTRAINT [PK_TransTable] PRIMARY KEY CLUSTERED
 (
  [id]
 ) 
GO

ALTER TABLE [FDQA_TransTable] WITH NOCHECK ADD 
 CONSTRAINT [DF_TransTable_id] DEFAULT (2000) FOR [id],
 CONSTRAINT [DF_TransTable_name] DEFAULT ('hello') FOR [name]
GO

DROP TABLE [FDQA_WString]
GO

CREATE TABLE [FDQA_WString] (
 [WIDESTRING] NVARCHAR(1000)
)
GO

DROP TABLE [FDQA_NoValsTable]
GO

CREATE TABLE [FDQA_NoValsTable] (
 [id] [int] NULL,
 [name] [varchar] (100) NULL 
)
GO

CREATE CLUSTERED INDEX I_FDQA_NoValsTable ON
  FDQA_NoValsTable (id)
GO

ALTER TABLE [FDQA_NoValsTable] WITH NOCHECK ADD 
 CONSTRAINT [DF_NoValsTable_id] DEFAULT (2000) FOR [id],
 CONSTRAINT [DF_NoValsTable_name] DEFAULT ('hello') FOR [name]
GO

DROP TABLE [FDQA_LockTable]
GO

CREATE TABLE [FDQA_LockTable] (
 [id] [int] NOT NULL ,
 [name] [varchar] (100) NOT NULL 
)
GO

CREATE CLUSTERED INDEX I_FDQA_LockTable ON
  FDQA_LockTable (id)
GO

DROP TABLE [FDQA_TabWithPK]
GO

CREATE TABLE [FDQA_TabWithPK] (
 [f1] [int] NOT NULL,
 [f2] [varchar] (2000) NULL 
)
GO

ALTER TABLE [FDQA_TabWithPK] WITH NOCHECK ADD
  CONSTRAINT [PK_TabWithPK] PRIMARY KEY CLUSTERED
 (
  [f1]
 ) 
GO

DROP TRIGGER [TI_FDQA_TabWithPK]
GO

CREATE TRIGGER [TI_FDQA_TabWithPK] ON [FDQA_TabWithPK] FOR INSERT AS
begin
  set nocount on
  declare @ins_f1 int
  select @ins_f1 = inserted.f1 from inserted
  if @ins_f1 > 10000 begin
    delete [FDQA_TabWithPK] where f1 = @ins_f1
    raiserror ('F1 must be less than or equal to 10000', 16, 1)
  end
end
GO

DROP TABLE [FDQA_Batch_test]
GO

CREATE TABLE [FDQA_Batch_test] (
 [tint] [int] NULL ,
 [tstring] [varchar] (50) NULL ,
 [tblob] [image] NULL 
)
GO

CREATE CLUSTERED INDEX I_FDQA_Batch_test ON
  FDQA_Batch_test (tint)
GO

DROP TABLE [FDQA_MaxLength]
GO

CREATE TABLE [FDQA_MaxLength] (
 [str] [char] (255) NULL ,
 [blobs] [image] NULL 
)
GO

CREATE CLUSTERED INDEX I_FDQA_MaxLength ON
  FDQA_MaxLength (str)
GO

DROP TABLE [FDQA_MaxLengthNVarchar]
GO

CREATE TABLE [FDQA_MaxLengthNVarchar] (
 [widestr] [nvarchar] (4000) NULL 
)
GO

CREATE CLUSTERED INDEX I_FDQA_MaxLengthNVarchar ON
  FDQA_MaxLengthNVarchar (widestr)
GO

DROP TABLE [FDQA_MaxLengthVarchar]
GO

CREATE TABLE [FDQA_MaxLengthVarchar] (
 [memos] [varchar] (8000) NULL 
) 
GO

--CREATE CLUSTERED INDEX I_FDQA_MaxLengthVarchar ON
--  FDQA_MaxLengthVarchar (memos)
--GO

DROP TABLE [FDQA_Blob]
GO

CREATE TABLE [FDQA_Blob] (
 [id] [int] IDENTITY NOT NULL ,
 [blobdata] [image] NULL 
)
GO

CREATE CLUSTERED INDEX I_FDQA_Blob ON
  FDQA_Blob (id)
GO

DROP TABLE [FDQA_ForAsync]
GO

CREATE TABLE [FDQA_ForAsync] (
 [id] [int] NULL ,
 [name] [varchar] (20) NULL 
)
GO

CREATE CLUSTERED INDEX I_FDQA_ForAsync ON
  FDQA_ForAsync (id)
GO

DROP TABLE [FDQA_All_types_NoUnicode]
GO

CREATE TABLE [FDQA_All_types_NoUnicode] (
 [tbigint] [bigint] NULL ,
 [tbinary] [binary] (50) NULL ,
 [tbit] [bit] NULL ,
 [tchar] [char] (10) NULL ,
 [tdatetime] [datetime] NULL ,
 [tfloat] [float] NULL ,
 [timage] [image] NULL ,
 [tint] [int] NULL ,
 [tmoney] [money] NULL ,
 [tnumeric] [numeric](18, 10) NULL ,
 [treal] [real] NULL ,
 [tsmalldatetime] [smalldatetime] NULL ,
 [tsmallint] [smallint] NULL ,
 [tsmallmoney] [smallmoney] NULL ,
 [ttext] [text] NULL ,
 [ttimestamp] [timestamp] NULL ,
 [ttinyint] [tinyint] NULL ,
 [tuniqueidentifier] [uniqueidentifier] NULL ,
 [tvarbinary] [varbinary] (50) NULL ,
 [tvarchar] [varchar] (50) NULL 
)
GO

CREATE CLUSTERED INDEX I_FDQA_All_types_NoUnicode ON
  FDQA_All_types_NoUnicode (tbigint)
GO

DROP TABLE [FDQA_Ascii_types]
GO

CREATE TABLE [FDQA_Ascii_types] (
 [atString] [varchar] (5) NULL ,
 [atFloat] [float] NULL ,
 [atNumber] [smallint] NULL ,
 [atBool] [bit] NULL ,
 [atLongInt] [int] NULL ,
 [atDate] [datetime] NULL ,
 [atTime] [datetime] NULL ,
 [atDateTime] [datetime] NULL ,
 [atBlob] [image] NULL ,
 [atMemo] [text] NULL 
)
GO

CREATE CLUSTERED INDEX I_FDQA_Ascii_types ON
  FDQA_Ascii_types (atString)
GO

DROP TABLE [FDQA_DB_types]
GO

CREATE TABLE [FDQA_DB_types] (
 [ftString] [varchar] (50) NULL ,
 [ftSmallInt] [smallint] NULL ,
 [ftInteger] [int] NULL ,
 [ftWord] [smallint] NULL ,
 [ftBoolean] [bit] NULL ,
 [ftFloat] [float] NULL ,
 [ftCurrency] [money] NULL ,
 [ftBCD] [decimal](19, 4) NULL ,
 [ftDate] [datetime] NULL ,
 [ftTime] [datetime] NULL ,
 [ftDateTime] [datetime] NULL ,
 [ftBytes] [varbinary] (50) NULL ,
 [ftBlob] [image] NULL ,
 [ftMemo] [text] NULL 
)
GO

CREATE CLUSTERED INDEX I_FDQA_DB_types ON
  FDQA_DB_types (ftString)
GO

DROP TABLE [FDQA_Bcd]
GO

CREATE TABLE [FDQA_Bcd] (
 [ftCurrency] [money] NULL ,
 [ftBCD] [decimal](19, 4) NULL ,
 [ftFmtBCD] [decimal](22, 4) NULL
)
GO

CREATE CLUSTERED INDEX I_FDQA_Bcd ON
  FDQA_Bcd (ftCurrency)
GO

DROP TABLE [FDQA_ParamBind]
GO

CREATE TABLE [FDQA_ParamBind] (
 [p1] [varchar] (50) NULL ,
 [p2] [varchar] (50) NULL ,
 [p3] [varchar] (50) NULL ,
 [p4] [varchar] (50) NULL 
)
GO

CREATE CLUSTERED INDEX I_FDQA_ParamBind ON
  FDQA_ParamBind (p1)
GO

DROP TABLE [FDQA_map1]
GO

CREATE TABLE [FDQA_map1] (
  id1 int NOT NULL primary key clustered,
  name1 varchar(20) NOT NULL
)
GO

DROP TABLE [FDQA_map2]
GO

CREATE TABLE [FDQA_map2] (
  id2 int NOT NULL,
  name2 varchar(20) NOT NULL default ''
) 
GO

CREATE CLUSTERED INDEX I_FDQA_map2 ON
  FDQA_map2 (id2)
GO

DROP TABLE [FDQA_map3]
GO

CREATE TABLE [FDQA_map3] (
   id3 int NOT NULL,
   name3 varchar(20) NOT NULL default ''
) 
GO

CREATE CLUSTERED INDEX I_FDQA_map3 ON
  FDQA_map3 (id3)
GO

DROP TABLE [FDQA_map4]
GO

CREATE TABLE [FDQA_map4] (
    id4 int NOT NULL,
    name4 varchar(20) NOT NULL default ''
)
GO

CREATE CLUSTERED INDEX I_FDQA_map4 ON
  FDQA_map4 (id4)
GO

DROP TABLE FDQA_PrnRecNo1
GO

CREATE TABLE FDQA_PrnRecNo1 (
  id [int] IDENTITY NOT NULL ,
  name varchar(20) NULL
)
GO

CREATE CLUSTERED INDEX I_FDQA_PrnRecNo1 ON
  FDQA_PrnRecNo1 (id)
GO

DROP TABLE FDQA_PrnRecNo2
GO

CREATE TABLE FDQA_PrnRecNo2 (
  id [int] IDENTITY NOT NULL ,
  name varchar(20) NULL
)
GO

CREATE CLUSTERED INDEX I_FDQA_PrnRecNo2 ON
  FDQA_PrnRecNo2 (id)
GO

DROP TRIGGER TI_FDQA_PrnRecNo1
GO

CREATE TRIGGER TI_FDQA_PrnRecNo1 ON FDQA_PrnRecNo1 FOR INSERT AS
set nocount on
print '111'
exec FDQA_PrnRecNo3
print '222'
set nocount on
GO

DROP VIEW [FDQA_V_Test]
GO

CREATE VIEW [FDQA_V_Test] AS
SELECT p.ProductID, p.ProductName, p.UnitPrice * p.UnitsInStock as TotalPrice,
  c.CategoryID, c.CategoryID as CID, c.CategoryName
FROM [Products] p left join [Categories] c on p.CategoryID = c.CategoryID
GO

DROP TABLE FDQA_Guid
GO

CREATE TABLE FDQA_Guid (
  id INT NOT NULL PRIMARY KEY CLUSTERED,
  G uniqueidentifier
)
GO

-- FireDAC Speed Tester

DROP TABLE FDQA_Products
GO

CREATE TABLE FDQA_Products (
       ProductID            INT PRIMARY KEY CLUSTERED,
       ProductName          VARCHAR(100),
       FromDate             DATETIME,
       SupplierID           INT,
       CategoryID           INT,
       QuantityPerUnit      VARCHAR(20),
       UnitPrice            MONEY,
       UnitsInStock         INT,
       UnitsOnOrder         INT,
       OnDate               DATETIME
)
GO

DROP TABLE FDQA_Categories
GO

CREATE TABLE FDQA_Categories (
       CategoryID           INT PRIMARY KEY CLUSTERED,
       CategoryName         VARCHAR(15),
       Description          TEXT
)
GO

DROP TABLE FDQA_OrderDetails
GO

CREATE TABLE FDQA_OrderDetails (
       OrderID              INT PRIMARY KEY CLUSTERED,
       OnDate               DATETIME,
       ProductID            INT,
       UnitPrice            MONEY,
       Quantity             SMALLINT,
       Discount             REAL,
       Notes                VARCHAR(100)
)
GO

DROP TABLE [FDQA_FK_tab]
GO

CREATE TABLE [FDQA_FK_tab] (
 id int NOT NULL PRIMARY KEY CLUSTERED,
 fk_id int,
 CONSTRAINT FK_FDQA_FK_tab FOREIGN KEY (fk_id) REFERENCES [FDQA_FK_tab](id)
)
GO 
