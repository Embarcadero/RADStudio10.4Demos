DROP TABLE "FDQA_all_types";

CREATE TABLE "FDQA_all_types" (
  ttinyint tinyint(4),
  tbit bit,
  tbool bool,
  tsmallint smallint(6),
  tmediumint mediumint(9),
  tint int(11),
  tinteger int(11),
  tbigint bigint(20),
  treal real,
  tdouble double,
  tfloat float,
  tdecimal decimal(19,4),
  tnumeric numeric(10,0),
  tchar char(100),
  tvarchar varchar(100),
  tdate date,
  ttime time,
  tyear year(4),
  ttimestamp timestamp(14),
  tdatetime datetime,
  ttinyblob tinyblob,
  tblob blob,
  tmediumblob mediumblob,
  tlongblob longblob,
  ttinytext tinytext,
  ttext text,
  tmediumtext mediumtext,
  tlongtext longtext
);

DROP TABLE "FDQA_tabwithpk";

CREATE TABLE "FDQA_tabwithpk" (
  f1 int(11) NOT NULL,
  f2 varchar(2000),
  CONSTRAINT PK_tabwithpk PRIMARY KEY  (f1)
);

DROP TABLE "FDQA_numbers";

CREATE TABLE "FDQA_numbers" (
  dtByte tinyint unsigned(3),
  dtSByte tinyint(3),
  dtInt16 smallint(5),
  dtInt32 int(10),
  dtInt64 decimal(19,0),
  dtUInt16 smallint unsigned(5),
  dtUInt32 int unsigned(10),
  dtUInt64 decimal unsigned(20,0),
  dtDouble double,
  dtCurrency double,
  dtBCD decimal(18,4),
  dtFmtBCD decimal(18,4)
); 

DROP TABLE "FDQA_novalstable";

CREATE TABLE "FDQA_novalstable" (
  id int(11) default '2000',
  name varchar(100) default 'hello'
);

DROP TABLE "FDQA_WString";

CREATE TABLE "FDQA_WString" (
  widestring nvarchar(2000) NULL
);

DROP TABLE "FDQA_transtable";

CREATE TABLE "FDQA_transtable" (
  id int(11) NOT NULL default '2000',
  name varchar(100) default 'hello',
  CONSTRAINT PK_transtable PRIMARY KEY  (id)
);

DROP TABLE "FDQA_map1";

CREATE TABLE "FDQA_map1" (
  id1 int(11) NOT NULL,
  name1 varchar(20) NOT NULL,
  CONSTRAINT PK_map1 PRIMARY KEY  (id1)
);

DROP TABLE "FDQA_map2";

CREATE TABLE "FDQA_map2" (
  id2 int(11) NOT NULL,
  name2 varchar(20) NOT NULL
);

DROP TABLE "FDQA_map3";

CREATE TABLE "FDQA_map3" (
  id3 int(11) NOT NULL,
  name3 varchar(20) NOT NULL
);

DROP TABLE "FDQA_map4";

CREATE TABLE "FDQA_map4" (
  id4 int(11) NOT NULL,
  name4 varchar(20) NOT NULL
); 

DROP TABLE "FDQA_locktable";

CREATE TABLE "FDQA_locktable" (
  id int(11) NOT NULL,
  name varchar(100) NOT NULL
);

DROP TABLE "FDQA_batch_test";

CREATE TABLE "FDQA_batch_test" (
  tint int(11),
  tstring varchar(100),
  tblob blob
); 

DROP TABLE "FDQA_Maxlength";

CREATE TABLE "FDQA_Maxlength" (
  str varchar(255),
  memos text,
  widestr text,
  blobs blob
); 

DROP TABLE "FDQA_blob";

CREATE TABLE "FDQA_blob" (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  blobdata longblob
);

DROP TABLE "FDQA_details_autoinc";

DROP TABLE "FDQA_master_autoinc";

CREATE TABLE "FDQA_master_autoinc" (
  id1 INTEGER PRIMARY KEY AUTOINCREMENT,
  name1 varchar(20),
  CONSTRAINT UK_master_autoinc UNIQUE (name1)
);

CREATE TABLE "FDQA_details_autoinc" (
  id2 INTEGER PRIMARY KEY AUTOINCREMENT,
  fk_id1 int(11) NOT NULL,
  name2 varchar(20) NOT NULL,
  CONSTRAINT FK_detautoinc_mastautoinc
  FOREIGN KEY (fk_id1)
  REFERENCES FDQA_master_autoinc (id1) ON DELETE CASCADE
);

DROP TABLE "FDQA_identity_tab";
 
CREATE TABLE "FDQA_identity_tab" (
  auto INTEGER PRIMARY KEY AUTOINCREMENT,
  descr varchar(50)
);

DROP TABLE "FDQA_ascii_types";

CREATE TABLE "FDQA_ascii_types" (
  atString varchar(5),
  atFloat double,
  atNumber tinyint(4),
  atBool tinyint(1),
  atLongInt int(11),
  atDate date,
  atTime time,
  atDateTime datetime,
  atBlob blob,
  atMemo text
); 

DROP TABLE "FDQA_db_types";

CREATE TABLE "FDQA_db_types" (
  ftString varchar(100),
  ftSmallInt smallint(6),
  ftInteger int(11),
  ftWord smallint unsigned (5),
  ftBoolean tinyint(1),
  ftFloat double,
  ftCurrency decimal(19,4),
  ftBCD decimal(19,4),
  ftDate date,
  ftTime time,
  ftDateTime datetime,
  ftBytes tinyblob,
  ftBlob blob,
  ftMemo text
); 

DROP TABLE "FDQA_bcd";

CREATE TABLE "FDQA_bcd" (
  ftCurrency money,
  ftBCD decimal(19,4),
  ftFmtBCD decimal(22,4)
);

DROP TABLE "FDQA_timestamp";

CREATE TABLE "FDQA_timestamp" (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  fnull timestamp(14) default CURRENT_TIMESTAMP
); 

DROP TABLE "FDQA_parambind";

CREATE TABLE "FDQA_parambind" (
  p1 varchar(50),
  p2 varchar(50),
  p3 varchar(50),
  p4 varchar(50)
); 

DROP TABLE "FDQA_ForAsync";

CREATE TABLE "FDQA_ForAsync" (
  id int,
  name varchar(20)
);

DROP VIEW "FDQA_V_Test";

CREATE VIEW "FDQA_V_Test" AS
SELECT p.ProductID, p.ProductName, p.UnitPrice * p.UnitsInStock as TotalPrice,
  c.CategoryID, c.CategoryID as CID, c.CategoryName
FROM "Products" p left join "Categories" c on p.CategoryID = c.CategoryID;

DROP TABLE "FDQA_LocalSQL";
CREATE TABLE "FDQA_LocalSQL" (
  ID int,
  IT int,
  RL double,
  CU money,
  DT datetime,
  CR varchar(30),
  SM smallint
);

DROP TABLE FDQA_Guid;

CREATE TABLE FDQA_Guid (
  id INTEGER PRIMARY KEY,
  G GUID
);

/*
REM -------------------
REM FireDAC Speed Tester
REM -------------------
*/

DROP TABLE FDQA_Products;

CREATE TABLE FDQA_Products (
  ProductID            INT NOT NULL PRIMARY KEY,
  ProductName          VARCHAR(100),
  FromDate             DATE,
  SupplierID           INT,
  CategoryID           INT,
  QuantityPerUnit      VARCHAR(20),
  UnitPrice            MONEY,
  UnitsInStock         INT,
  UnitsOnOrder         INT,
  OnDate               DATE
);

DROP TABLE FDQA_Categories;

CREATE TABLE FDQA_Categories (
  CategoryID           INT NOT NULL PRIMARY KEY,
  CategoryName         VARCHAR(15),
  Description          TEXT
);

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

DROP TABLE "FDQA_FK_tab";

CREATE TABLE "FDQA_FK_tab" (
 id int NOT NULL PRIMARY KEY,
 fk_id int NULL,
 CONSTRAINT FK_FDQA_FK_tab FOREIGN KEY (fk_id) REFERENCES "FDQA_FK_tab"(id)
);
