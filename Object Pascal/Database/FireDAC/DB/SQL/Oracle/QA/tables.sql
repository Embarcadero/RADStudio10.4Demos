SET CMDSEP / DEFINE ON

DROP SEQUENCE seq_mast
/

CREATE SEQUENCE seq_mast
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  INCREMENT BY 1
  NOCYCLE
  NOORDER
  CACHE 20
/

DROP SEQUENCE seq_det
/

CREATE SEQUENCE seq_det
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  INCREMENT BY 1
  NOCYCLE
  NOORDER
  CACHE 20
/

DROP SEQUENCE seq_ident_tab
/

CREATE SEQUENCE seq_ident_tab
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  INCREMENT BY 1
  NOCYCLE
  NOORDER
  CACHE 20
/

DROP TABLE "FDQA_All_types"
/

CREATE TABLE "FDQA_All_types" (
    tnvarchar2 NVARCHAR2(2000) NULL,
    tvarchar2  VARCHAR2(15)    NULL,
    tnumber    NUMBER          NULL,
    tfloat     FLOAT(126)      NULL,
    tlong      LONG            NULL,
    tvarchar   VARCHAR2(15)    NULL,
    tdate      DATE            NULL,
    traw       RAW(18)         NULL,
    trowid     ROWID           NULL,
    tnchar     NCHAR(405)      NULL,
    tchar      CHAR(5)         NULL,
    tnclob     NCLOB           NULL,
    tclob      CLOB            NULL,
    tblob      BLOB            NULL,
    tbfile     BFILE           NULL,
    turowid    !_ora_UROWID    NULL)
/

DROP TABLE "FDQA_TabWithPK"
/

CREATE TABLE "FDQA_TabWithPK" (
  f1 NUMBER NOT NULL,
  f2 VARCHAR2(2000)
)
/

ALTER TABLE "FDQA_TabWithPK"
  ADD PRIMARY KEY (
    f1
  )
/

DROP TABLE "FDQA_Numbers"
/

CREATE TABLE "FDQA_Numbers" (
  dtbyte     NUMBER(3,0)   NULL,
  dtsbyte    NUMBER(3,0)   NULL,
  dtint16    NUMBER(5,0)   NULL,
  dtint32    NUMBER(10,0)  NULL,
  dtint64    NUMBER(19,0)  NULL,
  dtuint16   NUMBER(5,0)   NULL,
  dtuint32   NUMBER(10,0)  NULL,
  dtuint64   NUMBER(20,0)  NULL,
  dtdouble   FLOAT(126)    NULL,
  dtcurrency NUMBER(19,4)  NULL,
  dtbcd      NUMBER(28,14) NULL,
  dtfmtbcd   NUMBER(28,14) NULL,
  dtboolean  NUMBER(2,0)   NULL
)
/

DROP TABLE "FDQA_WString"
/

CREATE TABLE "FDQA_WString" (
  widestring NVARCHAR2(2000) NULL
)
/

DROP TABLE "FDQA_TransTable"
/

CREATE TABLE "FDQA_TransTable" (
  id   NUMBER(11,0)  DEFAULT 2000 NULL,
  name VARCHAR2(100) DEFAULT 'hello' NULL
)
/

DROP TABLE "FDQA_ForAsync"
/

CREATE TABLE "FDQA_ForAsync" (
  id   NUMBER(10,0) NULL,
  name VARCHAR2(20) NULL
)
/

DROP TABLE "FDQA_NoValsTable"
/

CREATE TABLE "FDQA_NoValsTable" (
  id   NUMBER(11,0)  DEFAULT 2000 NULL,
  name VARCHAR2(100) DEFAULT 'hello' NULL
)
/

DROP TABLE "FDQA_details_autoinc"
/

DROP TABLE "FDQA_master_autoinc"
/

CREATE TABLE "FDQA_master_autoinc" (
  id1   NUMBER(10,0) NOT NULL,
  name1 VARCHAR2(20) NULL
)
/

ALTER TABLE "FDQA_master_autoinc"
  ADD CONSTRAINT "PK_master_autoinc" PRIMARY KEY (
    id1
)
/

ALTER TABLE "FDQA_master_autoinc"
  ADD CONSTRAINT "UK_master_autoinc" UNIQUE (
    name1
)
/

CREATE OR REPLACE TRIGGER tr_master_autoinc
BEFORE INSERT
ON "FDQA_master_autoinc"
FOR EACH ROW
BEGIN
  IF :NEW.id1 IS NULL THEN
    SELECT Seq_mast.NEXTVAL INTO :NEW.id1 FROM dual;
  END IF;
END;
/

CREATE TABLE "FDQA_details_autoinc" (
  id2    NUMBER(10,0) NOT NULL,
  fk_id1 NUMBER(10,0) NOT NULL,
  name2  VARCHAR2(20) NULL
)
/

ALTER TABLE "FDQA_details_autoinc"
  ADD CONSTRAINT "PK_detailsautoinc" PRIMARY KEY (
    id2
  )
/

ALTER TABLE "FDQA_details_autoinc"
  ADD CONSTRAINT "FK_detautoinc_mastautoinc" FOREIGN KEY (
    fk_id1
  ) REFERENCES "FDQA_master_autoinc" (
    id1
  )
/

CREATE OR REPLACE TRIGGER tr_details_autoinc
BEFORE INSERT
ON "FDQA_details_autoinc"
FOR EACH ROW
BEGIN
  IF :NEW.id2 IS NULL THEN
    SELECT Seq_det.NEXTVAL INTO :NEW.id2 FROM dual;
  END IF;
END;
/

DROP TABLE "FDQA_LockTable"
/

CREATE TABLE "FDQA_LockTable" (
  id   NUMBER(11,0)  NOT NULL,
  name VARCHAR2(100) NOT NULL
)
/

DROP TABLE "FDQA_Batch_test"
/

CREATE TABLE "FDQA_Batch_test" (
  tint    NUMBER(10,0) NULL,
  tstring VARCHAR2(20) NULL,
  tblob   BLOB         NULL
)
/

DROP TABLE "FDQA_MaxLength"
/

CREATE TABLE "FDQA_MaxLength" (
  str     CHAR(255)       NULL,
  memos   LONG            NULL,
  widestr NVARCHAR2(2000) NULL,
  blobs   BLOB            NULL
)
/

DROP TABLE "FDQA_Blob"
/

CREATE TABLE "FDQA_Blob" (
  id    NUMBER(10,0) NOT NULL,
  blobdata  BLOB NULL
)
/

CREATE OR REPLACE TRIGGER tr_ident_blob
BEFORE INSERT
ON "FDQA_Blob"
FOR EACH ROW
BEGIN
  IF :NEW.id IS NULL THEN
    SELECT seq_ident_tab.NEXTVAL INTO :NEW.id FROM dual;
  END IF;
END;
/

DROP TABLE "FDQA_Clob"
/

CREATE TABLE "FDQA_Clob" (
  id    NUMBER(10,0) NOT NULL,
  blobdata  CLOB NULL
)
/

CREATE OR REPLACE TRIGGER tr_ident_clob
BEFORE INSERT
ON "FDQA_Clob"
FOR EACH ROW
BEGIN
  IF :NEW.id IS NULL THEN
    SELECT seq_ident_tab.NEXTVAL INTO :NEW.id FROM dual;
  END IF;
END;
/

DROP TABLE "FDQA_LongRaw"
/

CREATE TABLE "FDQA_LongRaw" (
  id    NUMBER(10,0) NOT NULL,
  blobdata  LONG RAW NULL
)
/

CREATE OR REPLACE TRIGGER tr_ident_longraw
BEFORE INSERT
ON "FDQA_LongRaw"
FOR EACH ROW
BEGIN
  IF :NEW.id IS NULL THEN
    SELECT seq_ident_tab.NEXTVAL INTO :NEW.id FROM dual;
  END IF;
END;
/

DROP TABLE "FDQA_NumbersPrec"
/

CREATE TABLE "FDQA_NumbersPrec" (
   n__   number,
   n_0   number(*,0),
   n40   number(4,0),
   n50   number(5,0),
   n60   number(6,0),
   n4_   number(4),
   n5_   number(5),
   n6_   number(6),
   n90   number(9, 0),
   n100  number(10,0),
   n110  number(11,0),
   n9_   number(9),
   n10_  number(10),
   n11_  number(11),
   n19_  number(19),
   n194  number(19,4),
   n195  number(19,5),
   f1 NUMBER(1,0),
   f2 NUMBER(2,0),
   f3 NUMBER(3,0),
   f4 NUMBER(4,0),
   f5 NUMBER(5,0),
   f6 NUMBER(6,0),
   f7 NUMBER(7,0),
   f8 NUMBER(8,0),
   f9 NUMBER(9,0),
   f10 NUMBER(10,0),
   f11 NUMBER(11,0),
   f12 NUMBER(12,0),
   f13 NUMBER(13,0),
   f14 NUMBER(14,0),
   f15 NUMBER(15,0),
   f16 NUMBER(16,0),
   f17 NUMBER(17,0),
   f18 NUMBER(18,0),
   f19 NUMBER(19,0),
   f20 NUMBER(20,0),
   f21 NUMBER(21,0),
   f22 NUMBER(22,0),
   f23 NUMBER(23,0),
   f24 NUMBER(24,0),
   f25 NUMBER(25,0),
   f26 NUMBER(26,0),
   f27 NUMBER(27,0),
   f28 NUMBER(28,0),
   f29 NUMBER(29,0),
   f30 NUMBER(30,0),
   f31 NUMBER(31,0),
   f32 NUMBER(32,0),
   f33 NUMBER(33,0),
   f34 NUMBER(34,0),
   f35 NUMBER(35,0),
   f36 NUMBER(36,0),
   f37 NUMBER(37,0),
   f38 NUMBER(38,0),
   f39 NUMBER(1,1),
   f40 NUMBER(1,2),
   fi1 INTEGER,
   ff1 FLOAT
)
/

INSERT INTO "FDQA_NumbersPrec" VALUES (
   1234567890.1234567890,
   123456789012345678901234567890,
   1234,
   12345,
   123456,
   1234,
   12345,
   123456,
   123456789,
   1234567890,
   12345678901,
   123456789,
   1234567890,
   12345678901,
   1234567890123456789,
   123456789012345.1234,
   12345678901234.12345,
   1,
   12,
   123,
   1234,
   12345,
   123456,
   1234567,
   12345678,
   123456789,
   1234567890,
   12345678901,
   123456789012,
   1234567890123,
   12345678901234,
   123456789012345,
   1234567890123456,
   12345678901234567,
   123456789012345678,
   1234567890123456789,
   12345678901234567890,
   123456789012345678901,
   1234567890123456789012,
   12345678901234567890123,
   123456789012345678901234,
   1234567890123456789012345,
   12345678901234567890123456,
   123456789012345678901234567,
   1234567890123456789012345678,
   12345678901234567890123456789,
   123456789012345678901234567890,
   1234567890123456789012345678901,
   12345678901234567890123456789012,
   123456789012345678901234567890123,
   1234567890123456789012345678901234,
   12345678901234567890123456789012345,
   123456789012345678901234567890123456,
   1234567890123456789012345678901234567,
   12345678901234567890123456789012345678,
   .1,
   null,
   1234567890,
   1234567890.1234567890
)
/

COMMIT
/

DROP TABLE "FDQA_Identity_tab"
/

BEGIN
  EXECUTE IMMEDIATE 
    'CREATE TABLE "FDQA_Identity_tab" (' ||
      '"auto" NUMBER(10,0) GENERATED BY DEFAULT AS IDENTITY , ' ||
      'descr varchar2(50) NULL ' ||
    ')';
EXCEPTION WHEN OTHERS THEN
  EXECUTE IMMEDIATE 
    'CREATE TABLE "FDQA_Identity_tab" (' ||
    '  "auto" NUMBER(10,0) NOT NULL , ' ||
    '  descr varchar2(50) NULL ' ||
    ')';
  EXECUTE IMMEDIATE 
    'CREATE OR REPLACE TRIGGER tr_ident ' ||
    'BEFORE INSERT ' ||
    'ON "FDQA_Identity_tab" ' ||
    'FOR EACH ROW ' ||
    'BEGIN ' ||
    '  IF :NEW."auto" IS NULL THEN ' ||
    '    SELECT seq_ident_tab.NEXTVAL INTO :NEW."auto" FROM dual; ' ||
    '  END IF; ' ||
    'END;';
END;
/

DROP TABLE "FDQA_All_types_DTM"
/

CREATE TABLE "FDQA_All_types_DTM" (
  tnvarchar2 NVARCHAR2(2000) NULL,
  tvarchar2  VARCHAR2(15)    NULL,
  tnumber    NUMBER          NULL,
  tfloat     FLOAT(126)      NULL,
  tdate      DATE            NULL,
  traw       RAW(18)         NULL,
  trowid     ROWID           NULL,
  tnchar     NCHAR(1000)     NULL,
  tchar      CHAR(5)         NULL
)
/

DROP TABLE "FDQA_Ascii_types"
/

CREATE TABLE "FDQA_Ascii_types" (
  atstring   VARCHAR2(5) NULL,
  atfloat    FLOAT(126)   NULL,
  atnumber   NUMBER(4,0)  NULL,
  atbool     NUMBER(2,0)  NULL,
  atlongint  NUMBER(10,0) NULL,
  atdate     DATE         NULL,
  attime     DATE         NULL,
  atdatetime DATE         NULL,
  atblob     BLOB         NULL,
  atmemo     LONG         NULL
)
/

DROP TABLE "FDQA_DB_types"
/

CREATE TABLE "FDQA_DB_types" (
  ftstring   VARCHAR2(50) NULL,
  ftsmallint NUMBER(5,0)  NULL,
  ftinteger  NUMBER(10,0) NULL,
  ftword     NUMBER(5,0)  NULL,
  ftboolean  NUMBER(2,0)  NULL,
  ftfloat    FLOAT(126)   NULL,
  ftcurrency NUMBER(19,4) NULL,
  ftbcd      NUMBER(19,4) NULL,
  ftdate     DATE         NULL,
  fttime     DATE         NULL,
  ftdatetime DATE         NULL,
  ftbytes    RAW(18)      NULL,
  ftblob     BLOB         NULL,
  ftmemo     LONG         NULL
)
/

DROP TABLE "FDQA_Bcd"
/

CREATE TABLE "FDQA_Bcd" (
  ftcurrency NUMBER(19,4) NULL,
  ftbcd      NUMBER(19,4) NULL,
  ftfmtbcd   NUMBER(22,4) NULL
)
/

DROP TABLE "FDQA_ParamBind"
/

CREATE TABLE "FDQA_ParamBind" (
  p1 VARCHAR2(50) NULL,
  p2 VARCHAR2(50) NULL,
  p3 VARCHAR2(50) NULL,
  p4 VARCHAR2(50) NULL
)
/

DROP TABLE "FDQA_map1"
/

CREATE TABLE "FDQA_map1" (
  id1   NUMBER(10,0) NOT NULL PRIMARY KEY,
  name1 VARCHAR2(20) NOT NULL
)
/

DROP TABLE "FDQA_map2"
/

CREATE TABLE "FDQA_map2" (
  id2   NUMBER(10,0) NOT NULL,
  name2 VARCHAR2(20) NULL
)
/

DROP TABLE "FDQA_map3"
/

CREATE TABLE "FDQA_map3" (
  id3   NUMBER(10,0) NOT NULL,
  name3 VARCHAR2(20) NULL
)
/

DROP TABLE "FDQA_map4"
/

CREATE TABLE "FDQA_map4" (
  id4   NUMBER(10,0) NOT NULL,
  name4 VARCHAR2(20) NULL
)
/

DROP VIEW "FDQA_V_Test"
/

CREATE VIEW "FDQA_V_Test" AS
SELECT p.ProductID, p.ProductName, p.UnitPrice * p.UnitsInStock as TotalPrice,
  c.CategoryID, c.CategoryID as CID, c.CategoryName
FROM "Products" p left join "Categories" c on p.CategoryID = c.CategoryID
/

-- FireDAC Speed Tester

DROP TABLE FDQA_Products
/

CREATE TABLE FDQA_Products (
       ProductID            NUMBER(10,0) PRIMARY KEY,
       ProductName          VARCHAR2(100),
       FromDate             DATE,
       SupplierID           NUMBER(10,0),
       CategoryID           NUMBER(10,0),
       QuantityPerUnit      VARCHAR2(20),
       UnitPrice            NUMBER(19,4),
       UnitsInStock         NUMBER(5,0),
       UnitsOnOrder         NUMBER(5,0),
       OnDate               DATE
)
/

DROP TABLE FDQA_Categories
/

CREATE TABLE FDQA_Categories (
       CategoryID           NUMBER(10,0) PRIMARY KEY,
       CategoryName         VARCHAR2(15),
       Description          LONG
)
/

DROP TABLE FDQA_OrderDetails
/

CREATE TABLE FDQA_OrderDetails (
       OrderID              NUMBER(10,0) PRIMARY KEY,
       OnDate               DATE,
       ProductID            NUMBER(10,0),
       UnitPrice            NUMBER(19,4),
       Quantity             NUMBER(5,0),
       Discount             NUMBER,
       Notes                VARCHAR2(100)
)
/

DROP TABLE "FDQA_FK_tab"
/

CREATE TABLE "FDQA_FK_tab" (
 id int NOT NULL PRIMARY KEY,
 fk_id int,
 CONSTRAINT FK_FDQA_FK_tab FOREIGN KEY (fk_id) REFERENCES "FDQA_FK_tab"(id)
)
/

