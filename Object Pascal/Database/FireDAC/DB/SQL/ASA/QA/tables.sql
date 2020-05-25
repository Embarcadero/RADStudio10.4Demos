SET CMDSEP ;

DROP TABLE "FDQA_All_types";

CREATE TABLE "FDQA_All_types" (
 tbigint bigint NULL ,
 tubigint unsigned bigint NULL ,
 tbinary binary (50) NULL ,
 tbit bit NULL ,
 tchar char (10) NULL ,
 tdate date NULL ,
 ttime time NULL ,
 tdecimal decimal(19,4) NULL,
 tdouble double NULL ,
 tfloat float(20) NULL ,
 tlongbinary long binary NULL ,
 tint int NULL ,
 tuint unsigned int NULL ,
 tnumeric numeric(18, 10) NULL ,
 treal real NULL ,
 tsmallint smallint NULL ,
 tusmallint unsigned smallint NULL ,
 tlongvarchar long varchar NULL ,
 ttimestamp timestamp NULL ,
 ttinyint tinyint NULL ,
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
 dtUInt16 unsigned smallint NULL ,
 dtUInt32 unsigned int NULL ,
 dtUInt64 unsigned bigint NULL ,
 dtDouble double NULL ,
 dtCurrency numeric (19,4) NULL ,
 dtBCD decimal(28, 14) NULL ,
 dtFmtBCD decimal(28, 14) NULL 
);

DROP TABLE "FDQA_Identity_tab";

CREATE TABLE "FDQA_Identity_tab" (
 auto int IDENTITY NOT NULL ,
 descr varchar (50) NULL 
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
 name1 varchar (20) NOT NULL
);

ALTER TABLE "FDQA_master_autoinc" ADD
  CONSTRAINT "PK_master_autoinc" PRIMARY KEY
 (
  id1
 ); 

ALTER TABLE "FDQA_master_autoinc" ADD
  CONSTRAINT "UK_master_autoinc" UNIQUE
 (
  name1
 ); 

ALTER TABLE "FDQA_details_autoinc" ADD
  CONSTRAINT "PK_details_autoinc" PRIMARY KEY 
 (
  id2
 ); 

ALTER TABLE "FDQA_details_autoinc" ADD 
 CONSTRAINT "FK_details_autoinc_master_autoinc" FOREIGN KEY 
 (
  fk_id1
 ) REFERENCES "FDQA_master_autoinc" (
  id1
 ) ON DELETE CASCADE ON UPDATE CASCADE; 

DROP TABLE "FDQA_TransTable";

CREATE TABLE "FDQA_TransTable" (
 id int NOT NULL ,
 name varchar (100) NULL 
);

ALTER TABLE "FDQA_TransTable" ADD 
 CONSTRAINT "PK_TransTable" PRIMARY KEY 
 (
  id
 ); 

DROP TABLE "FDQA_WString";

CREATE TABLE "FDQA_WString" (
 widestring nvarchar(1000)
);

DROP TABLE "FDQA_NoValsTable";

CREATE TABLE "FDQA_NoValsTable" (
 id int NULL default 2000,
 name varchar (100) NULL default 'hello'
);

DROP TABLE "FDQA_LockTable";

CREATE TABLE "FDQA_LockTable" (
 id int NOT NULL ,
 name varchar (100) NOT NULL 
);

DROP TABLE "FDQA_TabWithPK";

CREATE TABLE "FDQA_TabWithPK" (
 f1 int NOT NULL, 
 f2 varchar(2000) NULL
);

ALTER TABLE "FDQA_TabWithPK" ADD
  CONSTRAINT "PK_TabWithPK" PRIMARY KEY 
 (
  f1
 ); 

DROP TRIGGER "TI_FDQA_TabWithPK";

SET CMDSEP /

CREATE TRIGGER "TI_FDQA_TabWithPK" 
BEFORE INSERT ON "FDQA_TabWithPK" 
REFERENCING NEW AS new_rec
FOR EACH ROW
begin
  declare err exception for sqlstate '99999';
  if new_rec.f1 > 10000 then
    signal err;
  end if;
end;
/

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
 memos long varchar NULL ,
 widestr long nvarchar NULL,
 blobs image NULL 
);

DROP TABLE "FDQA_Blob";

CREATE TABLE "FDQA_Blob" (
 id int IDENTITY NOT NULL,
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
 atFloat double NULL ,
 atNumber smallint NULL ,
 atBool bit NULL ,
 atLongInt int NULL ,
 atDate date NULL ,
 atTime time NULL ,
 atDateTime timestamp NULL ,
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
 ftFloat double NULL ,
 ftCurrency numeric (19,4) NULL ,
 ftBCD decimal(19, 4) NULL ,
 ftDate date NULL ,
 ftTime time NULL ,
 ftDateTime timestamp NULL ,
 ftBytes varbinary (50) NULL ,
 ftBlob image NULL ,
 ftMemo text NULL 
);

DROP TABLE "FDQA_Bcd";

CREATE TABLE "FDQA_Bcd" (
 ftCurrency numeric (19,4) NULL ,
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
       FromDate             timestamp,
       SupplierID           INT,
       CategoryID           INT,
       QuantityPerUnit      VARCHAR(20),
       UnitPrice            MONEY,
       UnitsInStock         INT,
       UnitsOnOrder         INT,
       OnDate               timestamp
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
       OnDate               timestamp,
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
