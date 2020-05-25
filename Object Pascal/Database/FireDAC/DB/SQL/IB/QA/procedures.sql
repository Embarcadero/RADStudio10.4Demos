SET CMDSEP /

DROP PROCEDURE "FDQA_Set_Values"
/
CREATE PROCEDURE "FDQA_Set_Values"(
  IN_smallint SMALLINT, IN_integer INTEGER, IN_float FLOAT, IN_double DOUBLE PRECISION,
  IN_date DATE, IN_time TIME, IN_timestamp TIMESTAMP, IN_decimal DECIMAL(18,6), 
  IN_binary CHAR(50) CHARACTER SET OCTETS, IN_varchar_cs VARCHAR(10921) CHARACTER SET UNICODE_FSS, 
  IN_varchar VARCHAR(15), IN_char CHAR(15), /*IN_memo BLOB(2000,1), IN_blob BLOB(2000,0),*/ 
  IN_boolean BOOLEAN, IN_varbinary VARCHAR(50) CHARACTER SET OCTETS) AS
BEGIN
  INSERT INTO "FDQA_All_types"(tsmallint, tinteger, tfloat, tdouble, tdate, ttime,
    ttimestamp, tdecimal, tbinary, tvarchar_cs, tvarchar, tchar, /*tmemo, tblob,*/
    tboolean, tvarbinary)
  VALUES(:IN_smallint, :IN_integer, :IN_float, :IN_double, :IN_date, :IN_time,
    :IN_timestamp, :IN_decimal, :IN_binary, :IN_varchar_cs, :IN_varchar, :IN_char,
    /*:IN_memo, :IN_blob,*/ :IN_boolean, :IN_varbinary);
END;
/

DROP PROCEDURE "FDQA_All_Values"
/
CREATE PROCEDURE "FDQA_All_Values"(
  i_smallint SMALLINT, i_integer INTEGER, i_float FLOAT, i_double DOUBLE PRECISION,
  i_date DATE, i_time TIME, i_timestamp TIMESTAMP, i_decimal DECIMAL(18,6), 
  i_binary CHAR(50) CHARACTER SET OCTETS, i_varchar_cs VARCHAR(10921) CHARACTER SET UNICODE_FSS, 
  i_varchar VARCHAR(15), i_char CHAR(15), /*i_memo BLOB(2000,1), i_blob BLOB(2000,0),*/ 
  i_boolean BOOLEAN, i_varbinary VARCHAR(50) CHARACTER SET OCTETS)
RETURNS (
  o_smallint SMALLINT, o_integer INTEGER, o_float FLOAT, o_double DOUBLE PRECISION,
  o_date DATE, o_time TIME, o_timestamp TIMESTAMP, o_decimal DECIMAL(18,6), 
  o_binary CHAR(50) CHARACTER SET OCTETS, o_varchar_cs VARCHAR(10921) CHARACTER SET UNICODE_FSS, 
  o_varchar VARCHAR(15), o_char CHAR(15), /*o_memo BLOB(2000,1), o_blob BLOB(2000,0),*/ 
  o_boolean BOOLEAN, o_varbinary VARCHAR(50) CHARACTER SET OCTETS) AS
BEGIN
  o_smallint = i_smallint;
  o_integer = i_integer;
  o_float = i_float;
  o_double = i_double;
  o_date = i_date;
  o_time = i_time;
  o_timestamp = i_timestamp;
  o_decimal = i_decimal;
  o_binary = i_binary;
  o_varchar_cs = i_varchar_cs;
  o_varchar = i_varchar;
  o_char = i_char;
  /*o_memo = i_memo;
  o_blob = i_blob; */
  o_boolean = i_boolean;
  o_varbinary = i_varbinary;
END;
/

DROP PROCEDURE FDQA_get_values
/
CREATE PROCEDURE FDQA_get_values
RETURNS (
  o_smallint SMALLINT, o_integer INTEGER, o_float FLOAT, o_double DOUBLE PRECISION,
  o_date DATE, o_time TIME, o_timestamp TIMESTAMP, o_decimal DECIMAL(18,6), 
  o_binary CHAR(50) CHARACTER SET OCTETS, o_varchar_cs VARCHAR(10921) CHARACTER SET UNICODE_FSS, 
  o_varchar VARCHAR(15), o_char CHAR(15), /*o_memo BLOB(2000,1), o_blob BLOB(2000,0),*/ 
  o_boolean BOOLEAN, o_varbinary VARCHAR(50) CHARACTER SET OCTETS) AS
BEGIN
  FOR SELECT tsmallint, tinteger, tfloat, tdouble, tdate, ttime,
    ttimestamp, tdecimal, tbinary, tvarchar_cs, tvarchar, tchar, /*tmemo, tblob,*/
    tboolean, tvarbinary
  FROM "FDQA_All_types"
  INTO   :o_smallint , :o_integer , :o_float , :o_double , :o_date , :o_time ,
    :o_timestamp , :o_decimal , :o_binary , :o_varchar_cs , :o_varchar , :o_char , /*:o_memo , :o_blob ,*/
    :o_boolean, :o_varbinary
  DO
    SUSPEND;
END;
/

DROP PROCEDURE FDQA_Zget_region
/
CREATE PROCEDURE FDQA_Zget_region
RETURNS (
  RegionID INTEGER, RegionDescription VARCHAR(50)) AS
BEGIN
  FOR SELECT RegionID, RegionDescription
  FROM "Region"
  INTO :RegionID, :RegionDescription
  DO
    SUSPEND;
END;
/

DROP PROCEDURE FDQA_batch
/
CREATE PROCEDURE FDQA_batch(
  i_smallint SMALLINT, i_integer INTEGER)
RETURNS (
  o_smallint SMALLINT, o_integer INTEGER) AS
BEGIN
  o_smallint = i_smallint;
  o_integer = i_integer;
END;
/

DROP PROCEDURE FDQA_TestBinding
/
CREATE PROCEDURE FDQA_TestBinding(
  p1 INTEGER, p2 VARCHAR(10))
RETURNS (
  p3 INTEGER, p4 VARCHAR(10)) AS
BEGIN
  p3 = p1 * 10;
  p4 = p2 || '**';
END;
/

