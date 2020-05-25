DROP TABLE "FDQA_All_types";

CREATE TABLE "FDQA_All_types" (
 tbigint bigint NULL ,
 tbinary binary (50) NULL ,
 tbit bit NULL ,
 tchar char (10) NULL ,
 tdatetime datetime NULL ,
 tfloat float NULL ,
 timage image NULL ,
 tint int NULL ,
 tmoney money NULL ,
 tnchar nchar (10) NULL ,
 tntext ntext NULL ,
 tnumeric numeric(18, 10) NULL ,
 tnvarchar nvarchar (50) NULL ,
 treal real NULL ,
 tsmalldatetime smalldatetime NULL ,
 tsmallint smallint NULL ,
 tsmallmoney smallmoney NULL ,
 tsql_variant sql_variant NULL ,
 ttext text NULL ,
 ttimestamp timestamp NULL ,
 ttinyint tinyint NULL ,
 tuniqueidentifier uniqueidentifier NULL ,
 tvarbinary varbinary (50) NULL ,
 tvarchar varchar (50) NULL 
);

DROP TABLE "FDQA_Numbers";

CREATE TABLE "FDQA_Numbers" (
 dtByte tinyint NULL ,
 dtSByte tinyint NULL ,
 dtInt16 smallint NULL ,
 dtInt32 int NULL ,
 dtInt64 bigint NULL ,
 dtUInt16 decimal(5, 0) NULL ,
 dtUInt32 decimal(10, 0) NULL ,
 dtUInt64 decimal(20, 0) NULL ,
 dtDouble float NULL ,
 dtCurrency money NULL ,
 dtBCD decimal(28, 14) NULL ,
 dtFmtBCD decimal(28, 14) NULL 
);

DROP TABLE "FDQA_Identity_tab";

CREATE TABLE "FDQA_Identity_tab" (
 auto int IDENTITY NOT NULL ,
 descr nvarchar (50) NULL 
);

DROP TABLE "FDQA_details_autoinc";

CREATE TABLE "FDQA_details_autoinc" (
 id2 int IDENTITY NOT NULL ,
 fk_id1 int NOT NULL ,
 name2 varchar (20) NULL
);

DROP TABLE "FDQA_master_autoinc";

CREATE TABLE "FDQA_master_autoinc" (
 id1 int IDENTITY NOT NULL ,
 name1 varchar (20) NULL
);

ALTER TABLE "FDQA_master_autoinc" ADD CONSTRAINT 
  PK_master_autoinc PRIMARY KEY (id1);

ALTER TABLE "FDQA_details_autoinc" ADD CONSTRAINT 
  PK_details_autoinc PRIMARY KEY (id2);

ALTER TABLE "FDQA_details_autoinc" ADD CONSTRAINT 
  FK_details_autoinc_master_autoinc FOREIGN KEY (fk_id1) 
  REFERENCES FDQA_master_autoinc (id1) 
  ON DELETE CASCADE ON UPDATE CASCADE;

DROP TABLE "FDQA_TransTable";

CREATE TABLE "FDQA_TransTable" (
 id int NOT NULL DEFAULT (2000),
 name varchar (100) NULL DEFAULT ('hello')
);

ALTER TABLE "FDQA_TransTable" ADD CONSTRAINT 
  PK_TransTable PRIMARY KEY (id);

DROP TABLE "FDQA_WString";

CREATE TABLE "FDQA_WString" (
 widestring nvarchar(1000)
);

DROP TABLE "FDQA_NoValsTable";

CREATE TABLE "FDQA_NoValsTable" (
 id int NULL DEFAULT (2000),
 name varchar (100) NULL DEFAULT ('hello')
);

DROP TABLE "FDQA_LockTable";

CREATE TABLE "FDQA_LockTable" (
 id int NOT NULL ,
 name varchar (100) NOT NULL 
);

DROP TABLE "FDQA_TabWithPK";

CREATE TABLE "FDQA_TabWithPK" (
 f1 int NOT NULL,
 f2 varchar (2000) NULL 
);

ALTER TABLE "FDQA_TabWithPK" ADD CONSTRAINT 
  PK_TabWithPK PRIMARY KEY (f1);

DROP TRIGGER TI_FDQA_TabWithPK;

SET CMDSEP GO
CREATE TRIGGER TI_FDQA_TabWithPK 
BEFORE INSERT ON "FDQA_TabWithPK"
AS
BEGIN
  IF NEW.f1 > 10000 THEN
    SIGNAL 'F1 must be less than or equal to 10000';
  END IF;
END
GO
SET CMDSEP ;

DROP TABLE "FDQA_Batch_test";

CREATE TABLE "FDQA_Batch_test" (
 tint int NULL ,
 tstring varchar (50) NULL ,
 tblob image NULL 
);

DROP TABLE "FDQA_MaxLength";

CREATE TABLE "FDQA_MaxLength" (
 str char (255) NULL ,
 blobs image NULL 
);

DROP TABLE "FDQA_Blob";

CREATE TABLE "FDQA_Blob" (
 id int IDENTITY NOT NULL ,
 blobdata image NULL 
);

DROP TABLE "FDQA_ForAsync";

CREATE TABLE "FDQA_ForAsync" (
 id int NULL ,
 name varchar (20) NULL 
);

DROP TABLE "FDQA_Ascii_types";

CREATE TABLE "FDQA_Ascii_types" (
 atString varchar (5) NULL ,
 atFloat float NULL ,
 atNumber smallint NULL ,
 atBool bit NULL ,
 atLongInt int NULL ,
 atDate datetime NULL ,
 atTime datetime NULL ,
 atDateTime datetime NULL ,
 atBlob image NULL ,
 atMemo text NULL 
);

DROP TABLE "FDQA_DB_types";

CREATE TABLE "FDQA_DB_types" (
 ftString varchar (50) NULL ,
 ftSmallInt smallint NULL ,
 ftInteger int NULL ,
 ftWord smallint NULL ,
 ftBoolean bit NULL ,
 ftFloat float NULL ,
 ftCurrency money NULL ,
 ftBCD decimal(19, 4) NULL ,
 ftDate datetime NULL ,
 ftTime datetime NULL ,
 ftDateTime datetime NULL ,
 ftBytes varbinary (50) NULL ,
 ftBlob image NULL ,
 ftMemo text NULL 
);

DROP TABLE "FDQA_Bcd";

CREATE TABLE "FDQA_Bcd" (
 ftCurrency money NULL ,
 ftBCD decimal(19, 4) NULL ,
 ftFmtBCD decimal(22, 4) NULL
);

DROP TABLE "FDQA_ParamBind";

CREATE TABLE "FDQA_ParamBind" (
 p1 varchar (50) NULL ,
 p2 varchar (50) NULL ,
 p3 varchar (50) NULL ,
 p4 varchar (50) NULL 
);

DROP TABLE "FDQA_map1";

CREATE TABLE "FDQA_map1" (
  id1 int NOT NULL primary key,
  name1 varchar(20) NOT NULL
);

DROP TABLE "FDQA_map2";

CREATE TABLE "FDQA_map2" (
  id2 int NOT NULL,
  name2 varchar(20) NOT NULL default ''
);

DROP TABLE "FDQA_map3";

CREATE TABLE "FDQA_map3" (
   id3 int NOT NULL,
   name3 varchar(20) NOT NULL default ''
);

DROP TABLE "FDQA_map4";

CREATE TABLE "FDQA_map4" (
    id4 int NOT NULL,
    name4 varchar(20) NOT NULL default ''
);

DROP VIEW "FDQA_V_Test";

CREATE VIEW "FDQA_V_Test" AS
SELECT p.ProductID, p.ProductName, p.UnitPrice * p.UnitsInStock as TotalPrice,
  c.CategoryID, c.CategoryID as CID, c.CategoryName
FROM "Products" p left join "Categories" c on p.CategoryID = c.CategoryID;

-- FireDAC Speed Tester

DROP TABLE FDQA_Products;

CREATE TABLE FDQA_Products (
       ProductID            INT PRIMARY KEY,
       ProductName          VARCHAR(100),
       FromDate             DATETIME,
       SupplierID           INT,
       CategoryID           INT,
       QuantityPerUnit      VARCHAR(20),
       UnitPrice            MONEY,
       UnitsInStock         INT,
       UnitsOnOrder         INT,
       OnDate               DATETIME
);

DROP TABLE FDQA_Categories;

CREATE TABLE FDQA_Categories (
       CategoryID           INT PRIMARY KEY,
       CategoryName         VARCHAR(15),
       Description          TEXT
);

DROP TABLE FDQA_OrderDetails;

CREATE TABLE FDQA_OrderDetails (
       OrderID              INT PRIMARY KEY,
       OnDate               DATETIME,
       ProductID            INT,
       UnitPrice            MONEY,
       Quantity             SMALLINT,
       Discount             REAL,
       Notes                VARCHAR(100)
);

DROP TABLE "FDQA_FK_tab";

CREATE TABLE "FDQA_FK_tab" (
 id int NOT NULL PRIMARY KEY,
 fk_id int,
 CONSTRAINT FK_FDQA_FK_tab FOREIGN KEY (fk_id) REFERENCES "FDQA_FK_tab"(id)
);
