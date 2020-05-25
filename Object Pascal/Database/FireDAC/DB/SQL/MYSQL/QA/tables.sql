SET CMDSEP ;

DROP TABLE `FDQA_all_types`;    

CREATE TABLE `FDQA_all_types` (
  `ttinyint` tinyint,
  `tbit` bit,
  `tbool` bool,
  `tsmallint` smallint(6),
  `tmediumint` mediumint(9),
  `tint` int,
  `tinteger` int,
  `tbigint` bigint,
  `treal` real,
  `tdouble` double,
  `tfloat` float,
  `tdecimal` decimal(19,4),
  `tnumeric` decimal(18,0),
  `tchar` varchar(100),
  `tvarchar` varchar(100),
  `tdate` date,
  `ttime` time,
  `tyear` year,
  `ttimestamp` timestamp null,
  `tdatetime` datetime null,
  `ttinyblob` tinyblob,
  `tblob` blob,
  `tmediumblob` mediumblob,
  `tlongblob` longblob,
  `ttinytext` tinytext,
  `ttext` text,
  `tmediumtext` mediumtext,
  `tlongtext` longtext,
  `tbinary` binary(100),
  `tset` set('a', 'b', 'c'),
  `tvarbinary` varbinary(100)
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_tabwithpk`;

CREATE TABLE `FDQA_tabwithpk` (
  `f1` int(11) NOT NULL,
  `f2` varchar(2000),
  CONSTRAINT `PK_tabwithpk` PRIMARY KEY  (`f1`)
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_numbers`;

CREATE TABLE `FDQA_numbers` (
  `dtByte` tinyint(3) unsigned,
  `dtSByte` tinyint(3),
  `dtInt16` smallint(5),
  `dtInt32` int(10),
  `dtInt64` decimal(19,0),
  `dtUInt16` smallint(5) unsigned,
  `dtUInt32` int(10) unsigned,
  `dtUInt64` decimal(20,0) unsigned,
  `dtDouble` double,
  `dtCurrency` double,
  `dtBCD` decimal(18,4),
  `dtFmtBCD` decimal(18,4)
) ENGINE=InnoDB, CHARACTER SET = utf8; 

DROP TABLE `FDQA_novalstable`;

CREATE TABLE `FDQA_novalstable` (
  `id` int(11) default 2000,
  `name` varchar(100) default 'hello'
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_WString`;

CREATE TABLE `FDQA_WString` (
  `widestring` varchar(2000)
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_transtable`;

CREATE TABLE `FDQA_transtable` (
  `id` int(11) default 2000,
  `name` varchar(100) default 'hello',
  CONSTRAINT `PK_transtable` PRIMARY KEY  (`id`)
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_map1`;

CREATE TABLE `FDQA_map1` (
  `id1` int(11) NOT NULL,
  `name1` varchar(20) NOT NULL,
  CONSTRAINT `PK_map1` PRIMARY KEY  (`id1`)
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_map2`;

CREATE TABLE `FDQA_map2` (
  `id2` int(11) NOT NULL,
  `name2` varchar(20) NOT NULL
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_map3`;

CREATE TABLE `FDQA_map3` (
  `id3` int(11) NOT NULL,
  `name3` varchar(20) NOT NULL
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_map4`;

CREATE TABLE `FDQA_map4` (
  `id4` int(11) NOT NULL,
  `name4` varchar(20) NOT NULL
) ENGINE=InnoDB, CHARACTER SET = utf8; 

DROP TABLE `FDQA_locktable`;

CREATE TABLE `FDQA_locktable` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_batch_test`;

CREATE TABLE `FDQA_batch_test` (
  `tint` int(11),
  `tstring` varchar(100),
  `tblob` blob
) ENGINE=InnoDB, CHARACTER SET = utf8; 

DROP TABLE `FDQA_MaxLength`;

CREATE TABLE `FDQA_MaxLength` (
  `str` varchar(255),
  `memos` text,
  `widestr` text,
  `blobs` blob
) ENGINE=InnoDB, CHARACTER SET = utf8; 

DROP TABLE `FDQA_blob`;

CREATE TABLE `FDQA_blob` (
  `id` int(11) NOT NULL auto_increment,
  `blobdata` longblob,
  CONSTRAINT `PK_blob` PRIMARY KEY  (`id`)
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_details_autoinc`;

DROP TABLE `FDQA_master_autoinc`;

CREATE TABLE `FDQA_master_autoinc` (
  `id1` int(11) NOT NULL auto_increment,
  `name1` varchar(20),
  CONSTRAINT `PK_master_autoinc` PRIMARY KEY  (`id1`),
  CONSTRAINT `UK_master_autoinc` UNIQUE (`name1`)
) ENGINE=InnoDB, CHARACTER SET = utf8;

CREATE TABLE `FDQA_details_autoinc` (
  `id2` int(11) NOT NULL auto_increment,
  `fk_id1` int(11) NOT NULL,
  `name2` varchar(20) NOT NULL,
  CONSTRAINT `PK_details_autoinc` PRIMARY KEY  (`id2`),
  KEY `I_detautoinc_fkid1` (`fk_id1`),
  CONSTRAINT `FK_detautoinc_mastautoinc`
  FOREIGN KEY (`fk_id1`)
  REFERENCES `FDQA_master_autoinc` (`id1`) ON DELETE CASCADE
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_identity_tab`;
 
CREATE TABLE `FDQA_identity_tab` (
  `auto` int(11) NOT NULL auto_increment,
  `descr` varchar(50),
  CONSTRAINT `FK_identity_tab` PRIMARY KEY  (`auto`)
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_ascii_types`;

CREATE TABLE `FDQA_ascii_types` (
  `atString` varchar(5),
  `atFloat` double,
  `atNumber` smallint(4),
  `atBool` tinyint(1),
  `atLongInt` int(11),
  `atDate` date,
  `atTime` time,
  `atDateTime` datetime,
  `atBlob` blob,
  `atMemo` text
) ENGINE=InnoDB, CHARACTER SET = utf8; 

DROP TABLE `FDQA_db_types`;

CREATE TABLE `FDQA_db_types` (
  `ftString` varchar(100),
  `ftSmallInt` smallint(6),
  `ftInteger` int(11),
  `ftWord` smallint(5) unsigned,
  `ftBoolean` tinyint(1),
  `ftFloat` double,
  `ftCurrency` decimal(19,4),
  `ftBCD` decimal(19,4),
  `ftDate` date,
  `ftTime` time,
  `ftDateTime` datetime,
  `ftBytes` tinyblob,
  `ftBlob` blob,
  `ftMemo` text
) ENGINE=InnoDB, CHARACTER SET = utf8; 

DROP TABLE `FDQA_bcd`;

CREATE TABLE `FDQA_bcd` (
  `ftCurrency` decimal(19,4),
  `ftBCD` decimal(19,4),
  `ftFmtBCD` decimal(22,4)
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_timestamp`;

CREATE TABLE `FDQA_timestamp` (
  `id` int (11) NOT NULL PRIMARY KEY auto_increment,
  `fnull` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB, CHARACTER SET = utf8; 

DROP TABLE `FDQA_parambind`;

CREATE TABLE `FDQA_parambind` (
  `p1` varchar(50),
  `p2` varchar(50),
  `p3` varchar(50),
  `p4` varchar(50)
) ENGINE=InnoDB, CHARACTER SET = utf8; 

DROP TABLE `FDQA_ForAsync`;

CREATE TABLE `FDQA_ForAsync` (
  `id` int,
  `name` varchar (20)
) ENGINE=InnoDB, CHARACTER SET = utf8; 

DROP TABLE `FDQA_FK_tab`;

CREATE TABLE `FDQA_FK_tab` (
 id int NOT NULL PRIMARY KEY,
 fk_id int,
 CONSTRAINT FK_FDQA_FK_tab FOREIGN KEY (fk_id) REFERENCES `FDQA_FK_tab`(id)
) ENGINE=InnoDB, CHARACTER SET = utf8; 

DROP VIEW `FDQA_V_Test`;

CREATE VIEW `FDQA_V_Test` AS
SELECT p.ProductID, p.ProductName, p.UnitPrice * p.UnitsInStock as TotalPrice,
  c.CategoryID, c.CategoryID as CID, c.CategoryName
FROM `Products` p left join `Categories` c on p.CategoryID = c.CategoryID;

DROP TABLE `FDQA_time`;

CREATE TABLE `FDQA_time` (
  `ttime` time(6) null,
  `ttimestamp` timestamp(6) null,
  `tdatetime` datetime(6) null
) ENGINE=InnoDB, CHARACTER SET = utf8; 

-- FireDAC Speed Tester

DROP TABLE `FDQA_Products`;

CREATE TABLE `FDQA_Products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100),
  `FromDate` datetime,
  `SupplierID` int(11),
  `CategoryID` int(11),
  `QuantityPerUnit` varchar(20),
  `UnitPrice` decimal(19,4),
  `UnitsInStock` smallint(6),
  `UnitsOnOrder` smallint(6),
  `OnDate` datetime,
  PRIMARY KEY  (`ProductID`)
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_Categories`;

CREATE TABLE `FDQA_Categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(15),
  `Description` mediumtext,
  PRIMARY KEY  (`CategoryID`)
) ENGINE=InnoDB, CHARACTER SET = utf8;

DROP TABLE `FDQA_OrderDetails`;

CREATE TABLE `FDQA_OrderDetails` (
  `OrderID` int(11) NOT NULL,
  `OnDate` datetime,
  `ProductID` int(11),
  `UnitPrice` decimal(19,4),
  `Quantity` smallint(6),
  `Discount` float,
  `Notes` varchar(100),
  PRIMARY KEY  (`OrderID`)
) ENGINE=InnoDB, CHARACTER SET = utf8;

