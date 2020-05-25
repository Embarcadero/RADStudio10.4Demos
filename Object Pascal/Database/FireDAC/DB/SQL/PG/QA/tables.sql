DROP SEQUENCE SEQ_IDENT_TAB;

DROP FUNCTION FDQA_set_values(in_smallint smallint, in_integer integer, in_real real, in_double double precision, in_date date, in_time time without time zone, in_timestamp timestamp without time zone, in_decimal numeric, in_varchar character varying, in_char bpchar, in_boolean boolean);
DROP FUNCTION FDQA_all_values(IN i_smallint smallint, IN i_integer integer, IN i_real real, IN i_double double precision, IN i_date date, IN i_time time without time zone, IN i_timestamp timestamp without time zone, IN i_decimal numeric, IN i_varchar character varying, IN i_char bpchar, IN i_boolean boolean, OUT o_smallint smallint, OUT o_integer integer, OUT o_real real, OUT o_double double precision, OUT o_date date, OUT o_time time without time zone, OUT o_timestamp timestamp without time zone, OUT o_decimal numeric, OUT o_varchar character varying, OUT o_char bpchar, OUT o_boolean boolean);
DROP FUNCTION FDQA_get_values();
DROP FUNCTION FDQA_zget_region(OUT regionid integer, OUT regiondescription character varying);
DROP FUNCTION FDQA_batch(IN i_smallint smallint, IN i_integer integer, OUT o_smallint smallint, OUT o_integer integer);
DROP FUNCTION FDQA_ref_cursors1(out t1 varchar, out t2 varchar, out t3 refcursor, out t4 refcursor);
DROP FUNCTION FDQA_ref_cursors2 (out t1 refcursor);
DROP FUNCTION FDQA_ref_cursors3 ();
DROP FUNCTION FDQA_TestBinding(in p1 INTEGER, in p2 VARCHAR(10), out p3 INTEGER, out p4 VARCHAR(10));
DROP FUNCTION FDQA_TestUnnamed(INTEGER, INTEGER);
DROP FUNCTION FDQA_TestInOut(IN p1 integer, OUT p2 integer, INOUT p3 integer);

DROP VIEW "FDQA_V_Test";
DROP TABLE "FDQA_Numbers";
DROP TABLE "FDQA_All_types";
DROP TABLE "FDQA_TabWithPK";
DROP TABLE "FDQA_Numbers";
DROP TABLE "FDQA_WString";
DROP TABLE "FDQA_TransTable";
DROP TABLE "FDQA_ForAsync";
DROP TABLE "FDQA_NoValsTable";
DROP TABLE "FDQA_details_autoinc";
DROP TABLE "FDQA_master_autoinc";
DROP TABLE "FDQA_LockTable";
DROP TABLE "FDQA_Batch_test";
DROP TABLE "FDQA_MaxLength";
DROP TABLE "FDQA_Blob";
DROP TABLE "FDQA_Clob";
DROP TABLE "FDQA_LO";
DROP TABLE "FDQA_NumbersPrec";
DROP TABLE "FDQA_Identity_tab";
DROP TABLE "FDQA_Bcd";
DROP TABLE "FDQA_ParamBind";
DROP TABLE "FDQA_map1";
DROP TABLE "FDQA_map2";
DROP TABLE "FDQA_map3";
DROP TABLE "FDQA_map4";
DROP TABLE "FDQA_FK_tab";
DROP TABLE FDQA_Array;
DROP TABLE "FDQA_time";
DROP TABLE FDQA_Guid;

DROP TABLE FDQA_Products;
DROP TABLE FDQA_Categories;
DROP TABLE FDQA_OrderDetails;

CREATE SEQUENCE SEQ_IDENT_TAB;

set ignore on
CREATE DOMAIN LO OID;
set ignore off

CREATE TABLE "FDQA_All_types" (
    tsmallint   SMALLINT,
    tinteger    INTEGER,
    treal       REAL,
    tdouble     DOUBLE PRECISION,
    tdate       DATE,
    ttime       TIME,
    ttimestamp  TIMESTAMP,
    tdecimal    DECIMAL(18,6),
    tvarchar    VARCHAR(15),
    tchar       CHAR(15),
    tmemo       TEXT,
    tblob       BYTEA,
    tboolean    BOOLEAN
);

CREATE TABLE "FDQA_TabWithPK" (
  f1 INTEGER NOT NULL PRIMARY KEY,
  f2 varchar(2000)
);

CREATE TABLE "FDQA_Numbers" (
  dtbyte     DECIMAL(3,0),
  dtsbyte    DECIMAL(3,0),
  dtint16    DECIMAL(5,0),
  dtint32    DECIMAL(10,0),
  dtint64    DECIMAL(19,0),
  dtuint16   DECIMAL(5,0),
  dtuint32   DECIMAL(10,0),
  dtuint64   DECIMAL(20,0),
  dtdouble   DOUBLE PRECISION,
  dtcurrency MONEY,
  dtbcd      DECIMAL(28,14),
  dtfmtbcd   DECIMAL(28,14),
  dtboolean  BOOLEAN
);

CREATE TABLE "FDQA_WString" (
  widestring VARCHAR(2000) NULL
);

CREATE TABLE "FDQA_TransTable" (
  id   DECIMAL(11,0) DEFAULT 2000,
  name VARCHAR(100)  DEFAULT 'hello'
);

CREATE TABLE "FDQA_ForAsync" (
  id   DECIMAL(10,0),
  name VARCHAR(20)
);

CREATE TABLE "FDQA_NoValsTable" (
  id   DECIMAL(11,0) DEFAULT 2000,
  name VARCHAR(100)  DEFAULT 'hello'
);

CREATE TABLE "FDQA_master_autoinc" (
  id1   SERIAL NOT NULL PRIMARY KEY ,
  name1 VARCHAR(20)
);

CREATE TABLE "FDQA_details_autoinc" (
  id2    SERIAL NOT NULL,
  fk_id1 INTEGER NOT NULL,
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

CREATE TABLE "FDQA_LockTable" (
  id   DECIMAL(11,0) NOT NULL,
  name VARCHAR(100)  NOT NULL
);

CREATE TABLE "FDQA_Batch_test" (
  tint    DECIMAL(10,0),
  tstring VARCHAR(20),
  tblob   BYTEA
);

CREATE TABLE "FDQA_MaxLength" (
  str     VARCHAR(255),
  memos   TEXT,
  widestr TEXT,
  blobs   BYTEA
);

CREATE TABLE "FDQA_Blob" (
  id       SERIAL NOT NULL,
  blobdata BYTEA
);

CREATE TABLE "FDQA_Clob" (
  id       SERIAL NOT NULL,
  blobdata TEXT
);

CREATE TABLE "FDQA_LO" (
  id SERIAL NOT NULL,
  blobdata LO
);

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

CREATE TABLE "FDQA_Identity_tab" (
  "auto"  SERIAL NOT NULL,
  descr VARCHAR(50) 
) WITH (OIDS=TRUE);

CREATE TABLE "FDQA_FK_tab" (
 id int NOT NULL PRIMARY KEY,
 fk_id int,
 CONSTRAINT FK_FDQA_FK_tab FOREIGN KEY (fk_id) REFERENCES "FDQA_FK_tab"(id)
);

CREATE TABLE "FDQA_Bcd" (
  ftcurrency MONEY,
  ftbcd      DECIMAL(19,4),
  ftfmtbcd   DECIMAL(22,4)
);

CREATE TABLE "FDQA_ParamBind" (
  p1 VARCHAR(50),
  p2 VARCHAR(50),
  p3 VARCHAR(50),
  p4 VARCHAR(50)
);

CREATE TABLE "FDQA_map1" (
  id1   DECIMAL(10,0) NOT NULL PRIMARY KEY,
  name1 VARCHAR(20) NOT NULL
);

CREATE TABLE "FDQA_map2" (
  id2   DECIMAL(10,0) NOT NULL,
  name2 VARCHAR(20)
);

CREATE TABLE "FDQA_map3" (
  id3   DECIMAL(10,0) NOT NULL,
  name3 VARCHAR(20)
);

CREATE TABLE "FDQA_map4" (
  id4   DECIMAL(10,0) NOT NULL,
  name4 VARCHAR(20)
);

CREATE VIEW "FDQA_V_Test" AS
SELECT p.ProductID, p.ProductName, p.UnitPrice * p.UnitsInStock as TotalPrice,
  c.CategoryID, c.CategoryID as CID, c.CategoryName
FROM "Products" p left join "Categories" c on p.CategoryID = c.CategoryID;

CREATE TABLE FDQA_Array (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(20),
  items VARCHAR(5)[4]
);

CREATE TABLE "FDQA_time" (
  ttime time(6),
  ttimestamp timestamp(6),
  tdatetime timestamp(6)
); 

CREATE TABLE FDQA_Guid (
  id INTEGER NOT NULL PRIMARY KEY,
  G UUID
);

/*
REM -------------------
REM FireDAC Speed Tester
REM -------------------
*/
CREATE TABLE FDQA_Products (
       ProductID            DECIMAL(10,0) NOT NULL PRIMARY KEY,
       ProductName          VARCHAR(100),
       FromDate             DATE,
       SupplierID           DECIMAL(10,0),
       CategoryID           DECIMAL(10,0),
       QuantityPerUnit      VARCHAR(20),
       UnitPrice            MONEY,
       UnitsInStock         DECIMAL(5,0),
       UnitsOnOrder         DECIMAL(5,0),
       OnDate               DATE
);

CREATE TABLE FDQA_Categories (
       CategoryID           DECIMAL(10,0) NOT NULL PRIMARY KEY,
       CategoryName         VARCHAR(15),
       Description          TEXT
);

CREATE TABLE FDQA_OrderDetails (
       OrderID              DECIMAL(10,0) NOT NULL PRIMARY KEY,
       OnDate               DATE,
       ProductID            DECIMAL(10,0),
       UnitPrice            MONEY,
       Quantity             DECIMAL(5,0),
       Discount             DOUBLE PRECISION,
       Notes                VARCHAR(100)
);
