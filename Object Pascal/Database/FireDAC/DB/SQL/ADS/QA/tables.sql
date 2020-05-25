SET CMDSEP ;

DROP TABLE "FDQA_All_types";

CREATE TABLE "FDQA_All_types" (
  tshort short,
  tinteger integer,
  tdouble double,
  tcurdouble curdouble,
  tlogical logical,
  tblob blob,
  traw raw(10),
  tchar char(10),
  tcichar cichar(10),
  tmemo memo,
  tnumeric numeric(12,8),
  tdate date,
  ttime time,
  ttimestamp timestamp,
  tmoney money,
  tvarchar varchar(50),
  tvarbinary varbinary(50),
  tnvarchar nvarchar(50),
  tnmemo nmemo,
  tnchar nchar(10)
);

DROP TABLE "FDQA_Numbers";

CREATE TABLE "FDQA_Numbers" (
 dtByte short,
 dtSByte short,
 dtInt16 short,
 dtInt32 integer,
 dtInt64 numeric(21, 0),
 dtUInt16 short,
 dtUInt32 integer,
 dtUInt64 numeric(22, 0),
 dtDouble double,
 dtCurrency money,
 dtBCD numeric(20, 4),
 dtFmtBCD numeric(30, 14) 
);

DROP TABLE "FDQA_Identity_tab";

CREATE TABLE "FDQA_Identity_tab" (
 auto autoinc,
 descr varchar (50)
); 

execute procedure sp_DropReferentialIntegrity (
  'FK_details_autoinc_master_autoinc');
DROP TABLE "FDQA_details_autoinc";
DROP TABLE "FDQA_master_autoinc";

CREATE TABLE "FDQA_details_autoinc" (
 id2 autoinc,
 fk_id1 integer,
 name2 varchar (20),
 CONSTRAINT "PK_details_autoinc" PRIMARY KEY (id2) 
);

CREATE TABLE "FDQA_master_autoinc" (
 id1 autoinc,
 name1 varchar (20),
 CONSTRAINT "PK_master_autoinc" PRIMARY KEY (id1)
);

CREATE UNIQUE INDEX "UK_master_autoinc"
  ON "FDQA_master_autoinc" (
    name1
  );

CREATE INDEX "I_FDQA_details_autoinc_fk_id1"
  ON "FDQA_details_autoinc" (
    fk_id1
  );

execute procedure sp_CreateReferentialIntegrity (
  'FK_details_autoinc_master_autoinc',
  'FDQA_master_autoinc',
  'FDQA_details_autoinc',
  'I_FDQA_details_autoinc_fk_id1',
  2, 2,
  NULL, NULL, NULL);
							 
DROP TABLE "FDQA_TransTable";

CREATE TABLE "FDQA_TransTable" (
 id integer,
 name varchar (100),
 CONSTRAINT "PK_TransTable" PRIMARY KEY (id)
);

DROP TABLE "FDQA_WString";

CREATE TABLE "FDQA_WString" (
 widestring nvarchar(1000)
);

DROP TABLE "FDQA_NoValsTable";

CREATE TABLE "FDQA_NoValsTable" (
 id integer default '2000',
 name varchar (100) default 'hello'
);

DROP TABLE "FDQA_LockTable";

CREATE TABLE "FDQA_LockTable" (
 id integer,
 name varchar (100)
);

DROP TABLE "FDQA_TabWithPK";

CREATE TABLE "FDQA_TabWithPK" (
 f1 integer, 
 f2 varchar(1024),
 CONSTRAINT "PK_TabWithPK" PRIMARY KEY (f1) 
);

DROP TRIGGER "FDQA_TabWithPK"."TI_FDQA_TabWithPK";

SET CMDSEP /

CREATE TRIGGER "TI_FDQA_TabWithPK" 
ON "FDQA_TabWithPK" BEFORE INSERT  
begin
  declare v integer;
  set v = (select f1 from __new);
  if v > 10000 then
    raise TabWithPKError(2500, 'f1 must be greater tan 10000');
  end if;
end;
/

SET CMDSEP ;

DROP TABLE "FDQA_Batch_test";

CREATE TABLE "FDQA_Batch_test" (
 tint integer,
 tstring varchar (50),
 tblob blob
);

DROP TABLE "FDQA_MaxLength";

CREATE TABLE "FDQA_MaxLength" (
 str char (255), 
 memos memo,
 widestr nmemo,
 blobs blob
);

DROP TABLE "FDQA_Blob";

CREATE TABLE "FDQA_Blob" (
 id autoinc,
 blobdata blob
);

DROP TABLE "FDQA_ForAsync";

CREATE TABLE "FDQA_ForAsync" (
 id integer,
 name varchar (20)
);

DROP TABLE "FDQA_Ascii_types";

CREATE TABLE "FDQA_Ascii_types" (
 atString varchar (5),
 atFloat double,
 atNumber short,
 atBool logical,
 atLongInt integer,
 atDate date,
 atTime time,
 atDateTime timestamp,
 atBlob blob,
 atMemo memo
);

DROP TABLE "FDQA_DB_types";

CREATE TABLE "FDQA_DB_types" (
 ftString varchar (50),
 ftSmallInt short,
 ftInteger integer,
 ftWord short,
 ftBoolean logical,
 ftFloat double,
 ftCurrency money,
 ftBCD numeric(21, 4),
 ftDate date,
 ftTime time,
 ftDateTime timestamp,
 ftBytes varbinary (50),
 ftBlob blob,
 ftMemo memo
);

DROP TABLE "FDQA_Bcd";

CREATE TABLE "FDQA_Bcd" (
 ftCurrency money,
 ftBCD numeric(21, 4),
 ftFmtBCD numeric(24, 4)
);

DROP TABLE "FDQA_ParamBind";

CREATE TABLE "FDQA_ParamBind" (
 p1 varchar (50),
 p2 varchar (50),
 p3 varchar (50),
 p4 varchar (50)
);

DROP TABLE "FDQA_map1";

CREATE TABLE "FDQA_map1" (
  id1 integer primary key,
  name1 varchar(20)
);

DROP TABLE "FDQA_map2";

CREATE TABLE "FDQA_map2" (
  id2 integer,
  name2 varchar(20) default ''
);

DROP TABLE "FDQA_map3";

CREATE TABLE "FDQA_map3" (
   id3 integer,
   name3 varchar(20) default ''
);

DROP TABLE "FDQA_map4";

CREATE TABLE "FDQA_map4" (
    id4 integer,
    name4 varchar(20) default ''
);

DROP VIEW "FDQA_V_Test";

CREATE VIEW "FDQA_V_Test" AS
SELECT p.ProductID, p.ProductName, p.UnitPrice * p.UnitsInStock as TotalPrice,
  c.CategoryID, c.CategoryID as CID, c.CategoryName
FROM "Products" p left join "Categories" c on p.CategoryID = c.CategoryID;

DROP TABLE FDQA_Guid;

CREATE TABLE FDQA_Guid (
  id INTEGER NOT NULL PRIMARY KEY,
  G GUID
);

-- FireDAC Speed Tester

DROP TABLE FDQA_Products;

CREATE TABLE FDQA_Products (
       ProductID            INTEGER PRIMARY KEY,
       ProductName          VARCHAR(100),
       FromDate             timestamp,
       SupplierID           INTEGER,
       CategoryID           INTEGER,
       QuantityPerUnit      VARCHAR(20),
       UnitPrice            MONEY,
       UnitsInStock         INTEGER,
       UnitsOnOrder         INTEGER,
       OnDate               timestamp
);

DROP TABLE FDQA_Categories;

CREATE TABLE FDQA_Categories (
       CategoryID           INTEGER PRIMARY KEY,
       CategoryName         VARCHAR(15),
       Description          MEMO
);

DROP TABLE FDQA_OrderDetails;

CREATE TABLE FDQA_OrderDetails (
       OrderID              INTEGER PRIMARY KEY,
       OnDate               timestamp,
       ProductID            INTEGER,
       UnitPrice            MONEY,
       Quantity             SHORT,
       Discount             DOUBLE,
       Notes                VARCHAR(100)
);

execute procedure sp_DropReferentialIntegrity (
  'FK_FDQA_FK_tab');
DROP TABLE "FDQA_FK_tab";

CREATE TABLE "FDQA_FK_tab" (
  id integer PRIMARY KEY,
  fk_id integer
);

CREATE INDEX "I_FDQA_FK_tab_id1"
  ON "FDQA_FK_tab" (
    fk_id
  );

execute procedure sp_CreateReferentialIntegrity (
  'FK_FDQA_FK_tab',
  'FDQA_FK_tab',
  'FDQA_FK_tab',
  'I_FDQA_FK_tab_id1',
  2, 2,
  NULL, NULL, NULL);
