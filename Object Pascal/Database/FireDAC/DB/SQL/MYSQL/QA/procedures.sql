SET CMDSEP GO

DROP PROCEDURE `FDQA_All_Values`
GO

CREATE PROCEDURE `FDQA_All_Values` (
  out `o_ttinyint` tinyint(4),
  out `o_tbit` tinyint(1),
  out `o_tbool` tinyint(1),
  out `o_tsmallint` smallint(6),
  out `o_tmediumint` mediumint(9),
  out `o_tint` int(11),
  out `o_tinteger` int(11),
  out `o_tbigint` bigint(20),
  out `o_treal` real,
  out `o_tdouble` double,
  out `o_tfloat` float,
  out `o_tdecimal` decimal(19,4),
  out `o_tnumeric` numeric(10,0),
  out `o_tchar` char(100),
  out `o_tvarchar` varchar(100),
  out `o_tdate` date,
  out `o_ttime` time,
  out `o_tyear` year(4),
  out `o_ttimestamp` timestamp,
  out `o_tdatetime` datetime,
  out `o_ttinyblob` tinyblob,
  out `o_tblob` blob,
  out `o_tmediumblob` mediumblob,
  out `o_tlongblob` longblob,
  out `o_ttinytext` tinytext,
  out `o_ttext` text,
  out `o_tmediumtext` mediumtext,
  out `o_tlongtext` longtext,
  out `o_tbinary` binary(100),
  out `o_tset` set('a', 'b', 'c'),
  out `o_tvarbinary` varbinary(100))
  DETERMINISTIC NO SQL
BEGIN
  /* qweqwe qwe qwe qwe qew  */
  set `o_ttinyint` = 23;
  set `o_tbit` = 1;
  set `o_tbool` = 0;
  set `o_tsmallint` = 1;
  set `o_tmediumint` = 123456;
  set `o_tint` = -234567;
  set `o_tinteger` = -345678;
  set `o_tbigint` = 123456789012345678;
  set `o_treal` = 1.234567;
  set `o_tdouble` = -2.3456789;
  set `o_tfloat` = 34.56789;
  set `o_tdecimal` = -4567890123.4568;
  set `o_tnumeric` = -123456;
  set `o_tchar` = 'ABCDE';
  set `o_tvarchar` = 'fghij';
  set `o_tdate` = CAST('1756-12-31' AS DATE);
  set `o_ttime` = CAST('00:00:00' AS TIME);
  set `o_tyear` = 0;
  set `o_ttimestamp` = CAST('1970-10-05 23:59:59' AS DATETIME);
  set `o_tdatetime` = CAST('1970-10-05 23:59:59' AS DATETIME);
  set `o_ttinyblob` = 'klmno';
  set `o_tblob` = 'abcde1';
  set `o_tmediumblob` = 'ABCDE';
  set `o_tlongblob` = 'fghij';
  set `o_ttinytext` = 'abcde1';
  set `o_ttext` = 'ABCDE';
  set `o_tmediumtext` = 'vuwxy1';
  set `o_tlongtext` = 'fghij';
  set `o_tbinary` = 'fghij';
  set `o_tset` = 'b';
  set `o_tvarbinary` = 'fghij';
END;
GO

DROP PROCEDURE `FDQA_MCRS`
GO

CREATE PROCEDURE `FDQA_MCRS`(IN `in_1` int, IN in_2 int, 
                             OUT `out_1` int, OUT out_2 int,
                             INOUT `inout_1` int, INOUT inout_2 int)
  DETERMINISTIC READS SQL DATA 
BEGIN
  /* qweqwe qwe qwe qwe qew  */
  SET `out_1` = `in_1` * 10;
  SET out_2 = in_2 * 20;
  SET `inout_1` = `inout_1` * 30;
  SET inout_2 = inout_2 * 40;
  SELECT * FROM `Categories`;
  SELECT * FROM `Territories`;
END;
GO

DROP PROCEDURE `FDQA_NoPars`
GO

CREATE PROCEDURE `FDQA_NoPars`()
  DETERMINISTIC NO SQL
BEGIN
  /* qweqwe qwe qwe qwe qew  */
END;
GO

DROP FUNCTION `FDQA_Func`
GO

CREATE FUNCTION `FDQA_Func`(`in_1` int) RETURNS int
  DETERMINISTIC NO SQL
BEGIN
  /* qweqwe qwe qwe qwe qew  */
  RETURN in_1 * 10;
END;
GO

DROP PROCEDURE `FDQA_BlobOnly`
GO

CREATE PROCEDURE `FDQA_BlobOnly`(`in_1` LONGBLOB) 
  DETERMINISTIC NO SQL
BEGIN
  /* qweqwe qwe qwe qwe qew  */
END;
GO

DROP PROCEDURE `FDQA_TestBinding`
GO

CREATE PROCEDURE `FDQA_TestBinding`(
  in `p1` int, in `p2` varchar(10),
  out `p3` int, out `p4` varchar(10)
)
  DETERMINISTIC NO SQL
BEGIN
  set `p3` = `p1` * 10;
  set `p4` = concat(`p2`, '**');
END;
GO
