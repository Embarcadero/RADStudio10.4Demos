DROP PROCEDURE "FDQA_Set_Values";
DROP PROCEDURE "FDQA_All_Values";
DROP PROCEDURE FDQA_get_values;
DROP PROCEDURE FDQA_Zget_region;
DROP TABLE "FDQA_All_types";
DROP TABLE "FDQA_Numbers";
DROP TRIGGER tr_master_autoinc;
DROP TRIGGER tr_ident_clob;
DROP TRIGGER tr_ident_blob;
DROP TRIGGER tr_details_autoinc;
DROP TRIGGER tr_identity_tab;
DROP GENERATOR GEN_MAST;
DROP GENERATOR GEN_DET;
DROP GENERATOR GEN_IDENT_TAB;

SET BREAK OFF IGNORE ON
DROP DOMAIN BOOLEAN;
DROP DOMAIN GUID;
CREATE DOMAIN BOOLEAN AS SMALLINT CHECK (VALUE IS NULL OR VALUE IN (0, 1));
CREATE DOMAIN GUID AS CHAR(16) CHARACTER SET OCTETS;
SET BREAK ON IGNORE OFF

CREATE GENERATOR GEN_MAST;
SET GENERATOR GEN_MAST TO 0;

CREATE GENERATOR GEN_DET;
SET GENERATOR GEN_DET TO 0;

CREATE GENERATOR GEN_IDENT_TAB;
SET GENERATOR GEN_IDENT_TAB TO 0;

CREATE TABLE "FDQA_All_types" (
    tsmallint   SMALLINT,
    tinteger    INTEGER,
    tfloat      FLOAT,
    tdouble     DOUBLE PRECISION,
    tdate       DATE,
    ttime       TIME,
    ttimestamp  TIMESTAMP,
    tdecimal    DECIMAL(18,6),
    tbinary     CHAR(50) CHARACTER SET OCTETS,
    tvarchar_cs VARCHAR(10921) CHARACTER SET UNICODE_FSS,
    tvarchar    VARCHAR(15),
    tchar       CHAR(15),
    tmemo       BLOB(2000,1),
    tblob       BLOB(2000,0),
    tboolean    BOOLEAN,
    tvarbinary  VARCHAR(50) CHARACTER SET OCTETS
);

DROP TABLE "FDQA_TabWithPK";

CREATE TABLE "FDQA_TabWithPK" (
  f1 INTEGER NOT NULL PRIMARY KEY,
  f2 varchar(2000)
);

DROP TABLE "FDQA_FK_tab";

CREATE TABLE "FDQA_FK_tab" (
 id int NOT NULL PRIMARY KEY,
 fk_id int,
 CONSTRAINT FK_FDQA_FK_tab FOREIGN KEY (fk_id) REFERENCES "FDQA_FK_tab"(id)
);

DROP TABLE "FDQA_Numbers";

CREATE TABLE "FDQA_Numbers" (
  dtbyte     DECIMAL(3,0),
  dtsbyte    DECIMAL(3,0),
  dtint16    DECIMAL(5,0),
  dtint32    DECIMAL(10,0),
  dtint64    DECIMAL(18,0),
  dtuint16   DECIMAL(5,0),
  dtuint32   DECIMAL(10,0),
  dtuint64   DECIMAL(18,0),
  dtdouble   DOUBLE PRECISION,
  dtcurrency DECIMAL(18,4),
  dtbcd      DECIMAL(18,6),
  dtfmtbcd   DECIMAL(18,6),
  dtboolean  BOOLEAN
);

DROP TABLE "FDQA_WString";

CREATE TABLE "FDQA_WString" (
  widestring VARCHAR(10921) CHARACTER SET UNICODE_FSS
);

DROP TABLE "FDQA_TransTable";

CREATE TABLE "FDQA_TransTable" (
  id   DECIMAL(11,0) DEFAULT 2000,
  name VARCHAR(100)  DEFAULT 'hello'
);

DROP TABLE "FDQA_ForAsync";

CREATE TABLE "FDQA_ForAsync" (
  id   DECIMAL(10,0),
  name VARCHAR(20)
);

DROP TABLE "FDQA_NoValsTable";

CREATE TABLE "FDQA_NoValsTable" (
  id   DECIMAL(11,0) DEFAULT 2000,
  name VARCHAR(100)  DEFAULT 'hello'
);

DROP TABLE "FDQA_details_autoinc";
DROP TABLE "FDQA_master_autoinc";

CREATE TABLE "FDQA_master_autoinc" (
  id1   DECIMAL(10,0) NOT NULL PRIMARY KEY,
  name1 VARCHAR(20) NOT NULL UNIQUE
);

SET TERM ^;
CREATE TRIGGER tr_master_autoinc FOR "FDQA_master_autoinc"
ACTIVE BEFORE INSERT POSITION 0
as
BEGIN
  IF (NEW.id1 IS NULL) THEN
   begin
    NEW.id1 = GEN_ID( GEN_MAST, 1);
   end
END^
SET TERM ;^

CREATE TABLE "FDQA_details_autoinc" (
  id2    DECIMAL(10,0) NOT NULL,
  fk_id1 DECIMAL(10,0) NOT NULL,
  name2  VARCHAR(20)
);

ALTER TABLE "FDQA_details_autoinc"
  ADD CONSTRAINT "PK_detailsautoinc" PRIMARY KEY (
    id2
  );

ALTER TABLE "FDQA_details_autoinc"
  ADD CONSTRAINT "FK_detautoinc_mastautoinc" FOREIGN KEY (
    fk_id1
  ) REFERENCES "FDQA_master_autoinc" (
    id1
  );

SET TERM ^;
CREATE TRIGGER tr_details_autoinc FOR "FDQA_details_autoinc"
ACTIVE BEFORE INSERT POSITION 0
as
BEGIN
  IF (NEW.id2 IS NULL) THEN
   begin
    NEW.id2 = GEN_ID( GEN_DET, 1);
   end
END^
SET TERM ;^

DROP TABLE "FDQA_LockTable";

CREATE TABLE "FDQA_LockTable" (
  id   DECIMAL(11,0) NOT NULL,
  name VARCHAR(100)  NOT NULL
);

DROP TABLE "FDQA_Batch_test";

CREATE TABLE "FDQA_Batch_test" (
  tint    DECIMAL(10,0),
  tstring VARCHAR(20),
  tblob   BLOB(2000,0)
);

DROP TABLE "FDQA_MaxLength";

CREATE TABLE "FDQA_MaxLength" (
  str     CHAR(8150),
  memos   BLOB(2000, 1),
  widestr VARCHAR(10921) CHARACTER SET UNICODE_FSS,
  blobs   BLOB(2000, 0)
);

DROP TABLE "FDQA_Blob";

CREATE TABLE "FDQA_Blob" (
  id       DECIMAL(10,0) NOT NULL,
  blobdata BLOB(2000,0)
);

SET TERM ^;
CREATE TRIGGER tr_ident_blob FOR "FDQA_Blob"
ACTIVE BEFORE INSERT POSITION 0
as
BEGIN
  IF (NEW.id IS NULL) THEN
   begin
    NEW.id = GEN_ID( GEN_IDENT_TAB, 1);
   end
END^
SET TERM ;^

DROP TABLE "FDQA_Clob";

CREATE TABLE "FDQA_Clob" (
  id       DECIMAL(10,0) NOT NULL,
  blobdata BLOB(2000,1)
);

SET TERM ^;
CREATE TRIGGER tr_ident_clob FOR "FDQA_Clob"
ACTIVE BEFORE INSERT POSITION 0
as
BEGIN
  IF (NEW.id IS NULL) THEN
   begin
    NEW.id = GEN_ID( GEN_IDENT_TAB, 1);
   end
END^
SET TERM ;^

DROP TABLE "FDQA_NumbersPrec";

CREATE TABLE "FDQA_NumbersPrec" (
   f1_0   DECIMAL(1,0),
   f2_0   DECIMAL(2,0),
   f3_0   DECIMAL(3,0),
   f4_0   DECIMAL(4,0),
   f5_0   DECIMAL(5,0),
   f6_0   DECIMAL(6,0),
   f7_0   DECIMAL(7,0),
   f8_0   DECIMAL(8,0),
   f9_0   DECIMAL(9,0),
   f10_0  DECIMAL(10,0),
   f11_0  DECIMAL(11,0),
   f12_0  DECIMAL(12,0),
   f13_0  DECIMAL(13,0),
   f14_0  DECIMAL(14,0),
   f15_0  DECIMAL(15,0),
   f16_0  DECIMAL(16,0),
   f17_0  DECIMAL(17,0),
   f18_0  DECIMAL(18,0),
   f1_1   DECIMAL(1,1),
   f2_1   DECIMAL(2,1),
   f2_2   DECIMAL(2,2),
   f3_1   DECIMAL(3,1),
   f3_2   DECIMAL(3,2),
   f3_3   DECIMAL(3,3),
   f4_1   DECIMAL(4,1),
   f4_2   DECIMAL(4,2),
   f4_4   DECIMAL(4,4),
   f5_1   DECIMAL(5,1),
   f5_3   DECIMAL(5,3),
   f5_5   DECIMAL(5,5),
   f6_1   DECIMAL(6,1),
   f6_3   DECIMAL(6,3),
   f6_6   DECIMAL(6,6),
   f7_1   DECIMAL(7,1),
   f7_4   DECIMAL(7,4),
   f7_7   DECIMAL(7,7),
   f10_1  DECIMAL(10,1),
   f10_2  DECIMAL(10,2),
   f10_3  DECIMAL(10,3),
   f10_4  DECIMAL(10,4),
   f10_5  DECIMAL(10,5),
   f10_10 DECIMAL(10,10),
   f15_1  DECIMAL(15,1),
   f15_2  DECIMAL(15,2),
   f15_3  DECIMAL(15,3),
   f15_4  DECIMAL(15,4),
   f15_5  DECIMAL(15,5),
   f15_15 DECIMAL(15,15),
   f18_1  DECIMAL(18,1),
   f18_2  DECIMAL(18,2),
   f18_3  DECIMAL(18,3),
   f18_4  DECIMAL(18,4),
   f18_5  DECIMAL(18,5),
   f18_18 DECIMAL(18,18)
);

DROP TABLE "FDQA_Identity_tab";

CREATE TABLE "FDQA_Identity_tab" (
  "auto" DECIMAL(10,0) NOT NULL,
  descr VARCHAR(50) 
);

SET TERM ^;
CREATE TRIGGER tr_identity_tab FOR "FDQA_Identity_tab"
ACTIVE BEFORE INSERT POSITION 0
as
BEGIN
  IF (NEW."auto" IS NULL) THEN
   begin
    NEW."auto" = GEN_ID( GEN_IDENT_TAB, 1);
   end
END^
SET TERM ;^

/*
DROP TABLE "FDQA_All_types_DTM";

CREATE TABLE "FDQA_All_types_DTM" (
  tvarchar2 NVARCHAR2(2000),
  tvarchar2  VARCHAR(15),
  tnumber    DECIMAL,
  tfloat     FLOAT(126),
  tdate      DATE,
  traw       RAW(18),
  trowid     ROWID,
  tnchar     NCHAR(1000),
  tchar      CHAR(5)
);

DROP TABLE "FDQA_Ascii_types";

CREATE TABLE "FDQA_Ascii_types" (
  atstring   VARCHAR(5),
  atfloat    FLOAT(126),
  atnumber   DECIMAL(4,0),
  atbool     BOOLEAN,
  atlongint  DECIMAL(10,0),
  atdate     DATE,
  attime     DATE,
  atdatetime DATE,
  atblob     BLOB,
  atmemo     LONG
);

DROP TABLE "FDQA_DB_types";

CREATE TABLE "FDQA_DB_types" (
  ftstring   VARCHAR(50),
  ftsmallint DECIMAL(5,0),
  ftinteger  DECIMAL(10,0),
  ftword     DECIMAL(5,0),
  ftboolean  BOOLEAN,
  ftfloat    FLOAT(126),
  ftcurrency DECIMAL(19,4),
  ftbcd      DECIMAL(19,4),
  ftdate     DATE,
  fttime     DATE,
  ftdatetime DATE,
  ftbytes    RAW(18),
  ftblob     BLOB,
  ftmemo     LONG
);
*/

DROP TABLE "FDQA_Bcd";

CREATE TABLE "FDQA_Bcd" (
  ftcurrency DECIMAL(18,4),
  ftbcd      DECIMAL(18,4),
  ftfmtbcd   DECIMAL(18,4)
);

DROP TABLE "FDQA_ParamBind";

CREATE TABLE "FDQA_ParamBind" (
  p1 VARCHAR(50),
  p2 VARCHAR(50),
  p3 VARCHAR(50),
  p4 VARCHAR(50)
);

DROP TABLE "FDQA_map1";

CREATE TABLE "FDQA_map1" (
  id1   DECIMAL(10,0) NOT NULL PRIMARY KEY,
  name1 VARCHAR(20) NOT NULL
);

DROP TABLE "FDQA_map2";

CREATE TABLE "FDQA_map2" (
  id2   DECIMAL(10,0) NOT NULL,
  name2 VARCHAR(20)
);

DROP TABLE "FDQA_map3";

CREATE TABLE "FDQA_map3" (
  id3   DECIMAL(10,0) NOT NULL,
  name3 VARCHAR(20)
);

DROP TABLE "FDQA_map4";

CREATE TABLE "FDQA_map4" (
  id4   DECIMAL(10,0) NOT NULL,
  name4 VARCHAR(20)
);

DROP TABLE "FDQA_Calc";

CREATE TABLE "FDQA_Calc" (
  id   INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(20),
  expr VARCHAR(30) COMPUTED BY (CAST(id AS VARCHAR(20)) || name)
);

DROP VIEW "FDQA_V_Test";

CREATE VIEW "FDQA_V_Test" (ProductID, ProductName, TotalPrice, CategoryID, 
  CID, CategoryName)  AS
SELECT p.ProductID, p.ProductName, p.UnitPrice * p.UnitsInStock as TotalPrice,
  c.CategoryID, c.CategoryID as CID, c.CategoryName
FROM "Products" p left join "Categories" c on p.CategoryID = c.CategoryID;

DROP TABLE FDQA_Array;

CREATE TABLE FDQA_Array (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(20),
  items VARCHAR(5)[4]
);

DROP TABLE FDQA_Guid;

CREATE TABLE FDQA_Guid (
  id INTEGER NOT NULL PRIMARY KEY,
  G GUID
);

REM -------------------
REM FireDAC Speed Tester
REM -------------------

DROP TABLE FDQA_Products;

CREATE TABLE FDQA_Products (
       ProductID            DECIMAL(10,0) NOT NULL PRIMARY KEY,
       ProductName          VARCHAR(100),
       FromDate             DATE,
       SupplierID           DECIMAL(10,0),
       CategoryID           DECIMAL(10,0),
       QuantityPerUnit      VARCHAR(20),
       UnitPrice            DECIMAL(18,4),
       UnitsInStock         DECIMAL(5,0),
       UnitsOnOrder         DECIMAL(5,0),
       OnDate               DATE
);

DROP TABLE FDQA_Categories;

CREATE TABLE FDQA_Categories (
       CategoryID           DECIMAL(10,0) NOT NULL PRIMARY KEY,
       CategoryName         VARCHAR(15),
       Description          BLOB(2000,1)
);

DROP TABLE FDQA_OrderDetails;

CREATE TABLE FDQA_OrderDetails (
       OrderID              DECIMAL(10,0) NOT NULL PRIMARY KEY,
       OnDate               DATE,
       ProductID            DECIMAL(10,0),
       UnitPrice            DECIMAL(18,4),
       Quantity             DECIMAL(5,0),
       Discount             DOUBLE PRECISION,
       Notes                VARCHAR(100)
);
