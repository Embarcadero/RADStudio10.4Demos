SET CMDSEP ;

DROP TABLE "FDQA_All_types";

CREATE TABLE "FDQA_All_types"  (
      TBIGINT BIGINT,
      TINT INT,
      TSMALLINT SMALLINT,
      TDECIMAL DECIMAL(19,4), 
      TMONEY MONEY,
      TFLOAT FLOAT, 
      TSMALLFLOAT SMALLFLOAT, 
      TDATE DATE, 
      TDATETIME DATETIME YEAR TO FRACTION, 
      TINTYM INTERVAL YEAR TO MONTH,
      TINTDF INTERVAL DAY TO FRACTION,
      TBOOLEAN BOOLEAN,
      TCHAR CHAR(10), 
      TNCHAR NCHAR(10), 
      TVARCHAR VARCHAR(10), 
      TNVARCHAR NVARCHAR(10), 
      TLVARCHAR LVARCHAR(10), 
      TTEXT TEXT,
      TBYTE BYTE,
      TCLOB CLOB,
      TBLOB BLOB
);   

DROP TABLE "FDQA_Ascii_types"; 

CREATE TABLE "FDQA_Ascii_types"  (
      ATSTRING VARCHAR(5), 
      ATFLOAT FLOAT, 
      ATNUMBER SMALLINT, 
      ATBOOL BOOLEAN, 
      ATLONGINT INTEGER, 
      ATDATE DATE, 
      ATTIME DATETIME HOUR TO FRACTION, 
      ATDATETIME DATETIME YEAR TO FRACTION, 
      ATBLOB BYTE, 
      ATMEMO TEXT 
);

DROP TABLE "FDQA_Batch_test";

CREATE TABLE "FDQA_Batch_test"  (
      TINT INTEGER, 
      TSTRING VARCHAR(50), 
      TBLOB BYTE 
);

DROP TABLE "FDQA_Blob";      

CREATE TABLE "FDQA_Blob"  (
      ID SERIAL NOT NULL,
      BLOBDATA BLOB 
);

DROP TABLE "FDQA_DB_types"; 

CREATE TABLE "FDQA_DB_types"  (
      FTSTRING VARCHAR(50), 
      FTSMALLINT SMALLINT, 
      FTINTEGER INTEGER, 
      FTWORD SMALLINT, 
      FTBOOLEAN BOOLEAN, 
      FTFLOAT FLOAT, 
      FTCURRENCY MONEY, 
      FTBCD DECIMAL(19,4), 
      FTDATE DATE, 
      FTTIME DATETIME HOUR TO FRACTION, 
      FTDATETIME DATETIME YEAR TO FRACTION, 
      FTBYTES BYTE, 
      FTBLOB BYTE, 
      FTMEMO TEXT 
);   

DROP TABLE "FDQA_details_autoinc"; 

DROP TABLE "FDQA_master_autoinc"; 

CREATE TABLE "FDQA_master_autoinc"  (
      ID1 SERIAL NOT NULL, 
      NAME1 VARCHAR(20) NOT NULL 
);   

ALTER TABLE "FDQA_master_autoinc" 
  ADD CONSTRAINT PRIMARY KEY (ID1)
  CONSTRAINT "PK_mast_autoinc";

ALTER TABLE "FDQA_master_autoinc" 
  ADD CONSTRAINT UNIQUE (NAME1)
  CONSTRAINT "UK_master_autoinc"; 

CREATE TABLE "FDQA_details_autoinc"  (
      ID2 SERIAL NOT NULL, 
      FK_ID1 INTEGER, 
      NAME2 VARCHAR(50) 
);   

ALTER TABLE "FDQA_details_autoinc" 
  ADD CONSTRAINT PRIMARY KEY (ID2)
  CONSTRAINT "PK_det_autoinc";

ALTER TABLE "FDQA_details_autoinc" 
  ADD CONSTRAINT FOREIGN KEY (FK_ID1)
  REFERENCES "FDQA_master_autoinc" (ID1)
  ON DELETE CASCADE
  CONSTRAINT "FK_detaut_mastauto";
 
DROP TRIGGER "FDQA_autoinc";

CREATE TRIGGER "FDQA_autoinc"
UPDATE OF id1 ON "FDQA_master_autoinc"
REFERENCING NEW AS N OLD AS O
FOR EACH ROW (
  UPDATE "FDQA_details_autoinc" SET fk_id1 = N.id1 WHERE fk_id1 = O.id1
)
/

DROP TABLE "FDQA_ForAsync";

CREATE TABLE "FDQA_ForAsync"  (
      ID INTEGER, 
      NAME VARCHAR(20) 
);   

DROP TABLE "FDQA_Identity_tab";

CREATE TABLE "FDQA_Identity_tab"  (
      "auto" SERIAL NOT NULL, 
      DESCR VARCHAR(50) 
);   

DROP TABLE "FDQA_LockTable";

CREATE TABLE "FDQA_LockTable"  (
      ID INTEGER, 
      NAME VARCHAR(100) 
) LOCK MODE ROW;

DROP TABLE "FDQA_MaxLength";

CREATE TABLE "FDQA_MaxLength"  (
      STR VARCHAR(255), 
      MEMOS TEXT,
      WIDESTR NVARCHAR(255), 
      BLOBS BYTE 
);   

DROP TABLE "FDQA_NoValsTable";       

CREATE TABLE "FDQA_NoValsTable"  (
      ID INTEGER DEFAULT 2000, 
      NAME VARCHAR(10) DEFAULT 'hello');   

DROP TABLE "FDQA_Numbers";

CREATE TABLE "FDQA_Numbers"  (
      DTBYTE SMALLINT, 
      DTSBYTE SMALLINT, 
      DTINT16 SMALLINT, 
      DTINT32 INTEGER, 
      DTINT64 BIGINT, 
      DTUINT16 DECIMAL(5,0), 
      DTUINT32 DECIMAL(10,0), 
      DTUINT64 DECIMAL(20,0), 
      DTDOUBLE FLOAT, 
      DTCURRENCY MONEY,
      DTBCD DECIMAL(28,14), 
      DTFMTBCD DECIMAL(28,14),
      DTBOOLEAN BOOLEAN 
);   

DROP TABLE "FDQA_TabWithPK";

CREATE TABLE "FDQA_TabWithPK"  (
      F1 INTEGER NOT NULL,
      F2 LVARCHAR(2000) 
);   

ALTER TABLE "FDQA_TabWithPK"
  ADD CONSTRAINT PRIMARY KEY (F1)
  CONSTRAINT "PK_tabwpk";

DROP TABLE "FDQA_TransTable";

CREATE TABLE "FDQA_TransTable"  (
      ID INTEGER NOT NULL DEFAULT 2000,
      NAME VARCHAR(100) DEFAULT '' 
) LOCK MODE ROW;

ALTER TABLE "FDQA_TransTable"
  ADD CONSTRAINT PRIMARY KEY (ID)
  CONSTRAINT "PK_TransTable";

DROP TABLE "FDQA_WString";

CREATE TABLE "FDQA_WString" (
      WIDESTRING NVARCHAR (255)
);

DROP TABLE "FDQA_Bcd";

CREATE TABLE "FDQA_Bcd"  (
      FTCURRENCY MONEY, 
      FTBCD DECIMAL(19,4), 
      FTFMTBCD DECIMAL(22,4) 
);

DROP TABLE "FDQA_ParamBind";

CREATE TABLE "FDQA_ParamBind" (
  P1 VARCHAR(50),
  P2 VARCHAR(50),
  P3 VARCHAR(50),
  P4 VARCHAR(50) 
);

DROP TABLE "FDQA_map1";

CREATE TABLE "FDQA_map1"  (
  ID1 INTEGER NOT NULL , 
  NAME1 VARCHAR(20) NOT NULL
);

DROP TABLE "FDQA_map2";

CREATE TABLE "FDQA_map2"  (
  ID2 INTEGER NOT NULL , 
  NAME2 VARCHAR(20) 
);

DROP TABLE "FDQA_map3";
 
CREATE TABLE "FDQA_map3"  (
  ID3 INTEGER NOT NULL , 
  NAME3 VARCHAR(20) 
);   

DROP TABLE "FDQA_map4";

CREATE TABLE "FDQA_map4"  (
  ID4 INTEGER NOT NULL , 
  NAME4 VARCHAR(20) 
);

DROP TABLE "FDQA_FK_tab";

CREATE TABLE "FDQA_FK_tab" (
  id int NOT NULL PRIMARY KEY,
  fk_id int
);

ALTER TABLE "FDQA_FK_tab"
  ADD CONSTRAINT
  FOREIGN KEY (fk_id) REFERENCES "FDQA_FK_tab"(id) 
  CONSTRAINT FK_FDQA_FK_tab;
 
DROP VIEW "FDQA_V_Test";

CREATE VIEW "FDQA_V_Test" (ProductID, ProductName, TotalPrice, CategoryID, CID, CategoryName) AS
SELECT p.ProductID, p.ProductName, p.UnitPrice * p.UnitsInStock as TotalPrice,
  c.CategoryID, c.CategoryID as CID, c.CategoryName
FROM "Products" p, "Categories" c 
WHERE p.CategoryID = c.CategoryID;

DROP TABLE FDQA_OrderDetails;

CREATE TABLE FDQA_OrderDetails (
  OrderID              INT NOT NULL PRIMARY KEY,
  OnDate               DATE,
  ProductID            INT,
  UnitPrice            MONEY,
  Quantity             SMALLINT,
  Discount             REAL,
  Notes                VARCHAR(100)
);
