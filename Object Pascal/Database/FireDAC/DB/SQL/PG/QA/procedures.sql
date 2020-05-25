set ignore on
CREATE LANGUAGE plpgsql;
set ignore off

DROP FUNCTION "FDQA_Set_Values"(
  IN_smallint SMALLINT, IN_integer INTEGER, IN_real REAL, IN_double DOUBLE PRECISION,
  IN_date DATE, IN_time TIME, IN_timestamp TIMESTAMP, IN_decimal DECIMAL(18,6),   
  IN_varchar VARCHAR(15), IN_char CHAR(15), IN_memo TEXT, IN_blob BYTEA, IN_boolean BOOLEAN); 

CREATE FUNCTION "FDQA_Set_Values" (
  IN_smallint SMALLINT, IN_integer INTEGER, IN_real REAL, IN_double DOUBLE PRECISION,
  IN_date DATE, IN_time TIME, IN_timestamp TIMESTAMP, IN_decimal DECIMAL(18,6),   
  IN_varchar VARCHAR(15), IN_char CHAR(15), IN_memo TEXT, IN_blob BYTEA, IN_boolean BOOLEAN) 
RETURNS VOID AS $$
BEGIN
  INSERT INTO "FDQA_All_types"(tsmallint, tinteger, treal, tdouble, tdate, ttime,
    ttimestamp, tdecimal, tvarchar, tchar, tmemo, tblob,tboolean)
  VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13);
END;
$$ LANGUAGE plpgsql;
/

DROP FUNCTION "FDQA_All_Values"(
  IN i_smallint SMALLINT, IN i_integer INTEGER, IN i_real REAL, IN i_double DOUBLE PRECISION,
  IN i_date DATE, IN i_time TIME, IN i_timestamp TIMESTAMP, IN i_decimal DECIMAL(18,6), 
  IN i_varchar VARCHAR(15), IN i_char CHAR(15), IN i_memo TEXT, IN i_blob BYTEA, IN i_boolean BOOLEAN,
  OUT o_smallint SMALLINT, OUT o_integer INTEGER, OUT o_REAL REAL, OUT o_double DOUBLE PRECISION,
  OUT o_date DATE, OUT o_time TIME, OUT o_timestamp TIMESTAMP, OUT o_decimal DECIMAL(18,6), 
  OUT o_varchar VARCHAR(15), OUT o_char CHAR(15), OUT o_memo TEXT, OUT o_blob BYTEA, OUT o_boolean BOOLEAN); 

CREATE FUNCTION "FDQA_All_Values"(
  IN i_smallint SMALLINT, IN i_integer INTEGER, IN i_real REAL, IN i_double DOUBLE PRECISION,
  IN i_date DATE, IN i_time TIME, IN i_timestamp TIMESTAMP, IN i_decimal DECIMAL(18,6), 
  IN i_varchar VARCHAR(15), IN i_char CHAR(15), IN i_memo TEXT, IN i_blob BYTEA, IN i_boolean BOOLEAN,
  OUT o_smallint SMALLINT, OUT o_integer INTEGER, OUT o_real REAL, OUT o_double DOUBLE PRECISION,
  OUT o_date DATE, OUT o_time TIME, OUT o_timestamp TIMESTAMP, OUT o_decimal DECIMAL(18,6), 
  OUT o_varchar VARCHAR(15), OUT o_char CHAR(15), OUT o_memo TEXT, OUT o_blob BYTEA, OUT o_boolean BOOLEAN) 
RETURNS RECORD AS $$
BEGIN
  o_smallint = i_smallint;
  o_integer = i_integer;
  o_real = i_real;
  o_double = i_double;
  o_date = i_date;
  o_time = i_time;
  o_timestamp = i_timestamp;
  o_decimal = i_decimal;
  o_varchar = i_varchar;
  o_char = i_char;
  o_blob = i_blob;
  o_memo = i_memo;
  o_boolean = i_boolean;
END;
$$ LANGUAGE plpgsql;
/

DROP FUNCTION FDQA_get_values();

CREATE FUNCTION FDQA_get_values() 
RETURNS SETOF "FDQA_All_types" AS $$
DECLARE
  Rec "FDQA_All_types"%ROWTYPE;
BEGIN 
  FOR Rec IN SELECT * FROM "FDQA_All_types" LOOP
    RETURN NEXT Rec;
  END LOOP;
  RETURN;
END;
$$ LANGUAGE plpgsql;
/

DROP FUNCTION FDQA_zget_region(OUT RegionID INTEGER, OUT RegionDescription VARCHAR(50));

CREATE FUNCTION FDQA_Zget_region (OUT RegionID INTEGER, OUT RegionDescription VARCHAR(50))
RETURNS SETOF RECORD AS $$
DECLARE
  Rec "Region"%ROWTYPE;
BEGIN
  FOR Rec IN SELECT * FROM "Region" LOOP
    RegionID = Rec.RegionID;
    RegionDescription = Rec.RegionDescription;
    RETURN NEXT;
  END LOOP;
  RETURN;
END;
$$ LANGUAGE plpgsql;
/

DROP FUNCTION FDQA_batch(in i_smallint SMALLINT, in i_integer INTEGER,
  out o_smallint SMALLINT, out o_integer INTEGER);

CREATE FUNCTION FDQA_batch(in i_smallint SMALLINT, in i_integer INTEGER,
  out o_smallint SMALLINT, out o_integer INTEGER)
RETURNS RECORD AS $$
BEGIN
  o_smallint = i_smallint;
  o_integer = i_integer;
END;
$$ LANGUAGE plpgsql;
/

DROP FUNCTION FDQA_ref_cursors1(out t1 varchar, out t2 varchar, out t3 refcursor, out t4 refcursor);

CREATE FUNCTION FDQA_ref_cursors1(out t1 varchar, out t2 varchar, out t3 refcursor, out t4 refcursor) 
RETURNS RECORD AS $$
BEGIN
  $1 = '"Customers"';
  $2 = '"Orders"';
  OPEN $3 FOR SELECT * FROM "Customers" ORDER BY CustomerID;
  OPEN $4 FOR SELECT * FROM "Orders" ORDER BY OrderID;
END;
$$ LANGUAGE plpgsql;
/

DROP FUNCTION FDQA_ref_cursors2 (out t1 refcursor);

CREATE FUNCTION FDQA_ref_cursors2 (out t1 refcursor) 
RETURNS REFCURSOR AS $$
BEGIN
  OPEN $1 FOR SELECT * FROM "Customers" ORDER BY CustomerID;
END;
$$ LANGUAGE plpgsql;
/

DROP FUNCTION FDQA_ref_cursors3 ();

CREATE FUNCTION FDQA_ref_cursors3 () 
RETURNS REFCURSOR AS $$
DECLARE 
  ref REFCURSOR;
BEGIN
  OPEN ref FOR SELECT * FROM "Customers" ORDER BY CustomerID;
  RETURN ref;
END;
$$ LANGUAGE plpgsql;
/

DROP FUNCTION FDQA_TestBinding(in p1 INTEGER, in p2 VARCHAR(10),
  out p3 INTEGER, out p4 VARCHAR(10));

CREATE FUNCTION FDQA_TestBinding(in p1 INTEGER, in p2 VARCHAR(10),
  out p3 INTEGER, out p4 VARCHAR(10))
RETURNS RECORD AS $$
BEGIN
  p3 = p1 * 10;
  p4 = p2 || '**';
END;
$$ LANGUAGE plpgsql;
/

DROP FUNCTION FDQA_TestUnnamed(INTEGER, INTEGER);

CREATE OR REPLACE FUNCTION FDQA_TestUnnamed(INTEGER, INTEGER) RETURNS INTEGER AS
$$
  SELECT $1 + $2
$$ LANGUAGE SQL;
/

DROP FUNCTION FDQA_TestInOut(IN p1 integer, INOUT p2 integer, INOUT p3 integer);

CREATE FUNCTION FDQA_TestInOut(IN p1 integer, INOUT p2 integer, INOUT p3 integer)
RETURNS RECORD AS $$
BEGIN
p2 := p1 + 1;
p3 := p1 + 2;
END;
$$ LANGUAGE plpgsql;
/
