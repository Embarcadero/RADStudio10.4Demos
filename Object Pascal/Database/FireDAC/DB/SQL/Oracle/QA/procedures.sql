SET CMDSEP / DEFINE ON

CREATE OR REPLACE PROCEDURE "FDQA_Set_Values"(
  IN_nvarchar2 IN NVARCHAR2, IN_varchar2 IN VARCHAR2, IN_number IN NUMBER, IN_float IN FLOAT,
  IN_long IN LONG, IN_varchar IN VARCHAR2, IN_date IN DATE, IN_raw IN RAW, IN_rowid IN ROWID,
  IN_nchar IN NCHAR, IN_char IN CHAR, /*IN_nclob IN NCLOB,*/ IN_clob IN CLOB, IN_blob IN BLOB) IS
BEGIN
  INSERT INTO "FDQA_All_types"(tnvarchar2, tvarchar2, tnumber, tfloat, tlong, tvarchar, tdate, traw, trowid,
    tnchar, tchar, /*tnclob,*/ tclob, tblob/*, tbfile, turowid*/)
  VALUES(IN_nvarchar2, IN_varchar2, IN_number, IN_float, IN_long, IN_varchar, IN_date, IN_raw, IN_rowid,
    IN_nchar, IN_char, /*IN_nclob,*/ IN_clob, IN_blob/*, IN_bfile, IN_urowid*/);
END;
/

CREATE OR REPLACE PROCEDURE "FDQA_All_Values"(
  i_nvarchar2 IN NVARCHAR2, i_varchar2 IN VARCHAR2, i_number IN NUMBER, i_float IN FLOAT,
  /*i_long IN LONG,*/ i_varchar IN VARCHAR2, i_date IN DATE, i_raw IN RAW, i_rowid IN ROWID,
  i_nchar IN NCHAR, i_char IN CHAR, /*i_nclob IN NCLOB,*/ i_clob IN CLOB, i_blob IN BLOB, --i_bfile IN BFILE, i_urowid IN UROWID,
  o_nvarchar2 OUT NVARCHAR2, o_varchar2 OUT VARCHAR2, o_number OUT NUMBER, o_float OUT FLOAT, --o_long OUT LONG,
  o_varchar OUT VARCHAR2, o_date OUT DATE, o_raw OUT RAW, o_rowid OUT ROWID, o_nchar OUT NCHAR, o_char OUT CHAR, --o_nclob OUT NCLOB,
  o_clob OUT CLOB, o_blob OUT BLOB /*,o_bfile OUT BFILE, o_urowid OUT UROWID*/) IS
BEGIN
  o_nvarchar2 := i_nvarchar2;
  o_varchar2 := i_varchar2;
  o_number := i_number;
  o_float := i_float;
  --o_long := i_long;
  o_varchar := i_varchar;
  o_date := i_date;
  o_raw := i_raw;
  o_rowid := i_rowid;
  o_nchar := i_nchar;
  o_char := i_char;
  --o_nclob := i_nclob;
  o_clob := i_clob;
  o_blob := i_blob;
  --o_bfile := i_bfile;
  --o_urowid := i_urowid;
END;
/

CREATE OR REPLACE PROCEDURE FDQA_All_Vals(
  i_nvarchar2 IN NVARCHAR2, i_varchar2 IN VARCHAR2, i_number IN NUMBER, i_float IN FLOAT,
  i_long IN LONG, i_varchar IN VARCHAR2, i_date IN DATE, i_raw IN RAW, i_rowid IN ROWID,
  i_nchar IN NCHAR, i_char IN CHAR, i_nclob IN NCLOB, i_clob IN CLOB, i_blob IN BLOB,
  i_bfile IN BFILE, i_urowid IN !_ora_UROWID, o_nvarchar2 OUT NVARCHAR2, o_varchar2 OUT VARCHAR2,
  o_number OUT NUMBER, o_float OUT FLOAT, o_long OUT LONG, o_varchar OUT VARCHAR2, o_date OUT DATE,
  o_raw OUT RAW, o_rowid OUT ROWID, o_nchar OUT NCHAR, o_char OUT CHAR, o_nclob OUT NCLOB,
  o_clob OUT CLOB, o_blob OUT BLOB ,o_bfile OUT BFILE, o_urowid OUT !_ora_UROWID) IS
BEGIN 
  o_nvarchar2 := i_nvarchar2;
  o_varchar2  := i_varchar2;
  o_number    := i_number;
  o_float     := i_float;
  o_long      := i_long;
  o_varchar   := i_varchar;
  o_date      := i_date;
  o_raw       := i_raw;
  o_rowid     := i_rowid;
  o_nchar     := i_nchar;
  o_char      := i_char;
  o_nclob     := i_nclob;
  o_clob      := i_clob;
  o_blob      := i_blob;
  o_bfile     := i_bfile;
  o_urowid    := i_urowid;
END;
/

CREATE OR REPLACE PROCEDURE FDQA_SetnGet_Values(
  io_nvarchar2 IN OUT NVARCHAR2, io_varchar2 IN OUT VARCHAR2, io_number IN OUT NUMBER, io_float IN OUT FLOAT,
  io_long IN OUT LONG, io_varchar IN OUT VARCHAR2, io_date IN OUT DATE, io_raw IN OUT RAW, io_rowid IN OUT ROWID,
  io_nchar IN OUT NCHAR, io_char IN OUT CHAR, /*io_nclob IN OUT NCLOB,*/ io_clob IN OUT CLOB, io_blob IN OUT BLOB) IS
BEGIN
  INSERT INTO "FDQA_All_types"(tnvarchar2, tvarchar2, tnumber, tfloat, tlong, tvarchar, tdate, traw,
      trowid, tnchar, tchar, /*tnclob,*/ tclob, tblob/*, tbfile, turowid*/)
  VALUES(io_nvarchar2, io_varchar2, io_number, io_float, io_long, io_varchar, io_date, io_raw, io_rowid,
      io_nchar, io_char, /*io_nclob,*/ io_clob, io_blob/*, io_bfile, io_urowid*/);
  SELECT tnvarchar2, tvarchar2, tnumber, tfloat, tlong, tvarchar, tdate, traw, trowid,
      tnchar, tchar, /*tnclob,*/ tclob, tblob --tbfile, turowid
  INTO io_nvarchar2, io_varchar2, io_number, io_float, io_long, io_varchar, io_date, io_raw, io_rowid,
      io_nchar, io_char, /*io_nclob,*/ io_clob, io_blob /*io_bfile, io_urowid*/ FROM "FDQA_All_types"
  WHERE ROWNUM = 1;
END;
/

CREATE OR REPLACE PROCEDURE FDQA_Get_Values(
  out_nvarchar2 OUT NVARCHAR2, out_varchar2 OUT VARCHAR2, out_number OUT NUMBER, out_float OUT FLOAT,
  out_long OUT LONG, out_varchar OUT VARCHAR2, out_date OUT DATE, out_raw OUT RAW, out_rowid OUT ROWID,
  out_nchar OUT NCHAR, out_char OUT CHAR, /*out_nclob OUT NCLOB,*/ out_clob OUT CLOB, out_blob OUT BLOB) IS
BEGIN
  SELECT tnvarchar2, tvarchar2, tnumber, tfloat, tlong, tvarchar, tdate, traw, trowid,
         tnchar, tchar, /*tnclob,*/ tclob, tblob --tbfile, turowid
  INTO   out_nvarchar2, out_varchar2, out_number, out_float, out_long, out_varchar, out_date, out_raw, out_rowid,
         out_nchar, out_char, /*out_nclob,*/ out_clob, out_blob --out_bfile, out_urowid
  FROM "FDQA_All_types"
  WHERE ROWNUM = 1;
END;
/

CREATE OR REPLACE PROCEDURE FDQA_outparam(tchar OUT CHAR, tlong IN OUT LONG) IS BEGIN
  tchar := 'ABCDE';
  INSERT INTO "FDQA_MaxLength"(memos) VALUES(tlong);
  tlong := CONCAT(tlong, 'abcde');
END;
/

CREATE OR REPLACE PACKAGE FDQA_TestPack AS
  TYPE TAllTypesCursor IS REF CURSOR RETURN "FDQA_All_types"%Rowtype;
  TYPE TShippersCursor IS REF Cursor RETURN "Shippers"%Rowtype;
  TYPE TCategoriesCursor IS REF CURSOR RETURN "Categories"%Rowtype;
  TYPE TSuppliersCursor IS REF CURSOR RETURN "Suppliers"%Rowtype;
  TYPE TVC2Tbl IS TABLE OF VARCHAR2(50) INDEX BY BINARY_INTEGER;
  FUNCTION Get_Valuesf RETURN TAllTypesCursor;
  PROCEDURE Get_Valuesp (Cur OUT TAllTypesCursor);
  PROCEDURE SelectShippers(Cur IN OUT TShippersCursor);
  PROCEDURE GetCursors(Cur1 IN OUT TShippersCursor, 
    Cur2 IN OUT TCategoriesCursor, Cur3 IN OUT TSuppliersCursor);
  PROCEDURE TestPLSQLArray(ATable in out TVC2Tbl);
END FDQA_testpack;
/

CREATE OR REPLACE PACKAGE BODY FDQA_TestPack AS
  FUNCTION Get_Valuesf RETURN TAllTypesCursor IS
    Cur TAllTypesCursor;
  BEGIN
    OPEN Cur FOR SELECT * FROM "FDQA_All_types";
    RETURN Cur;
  END;

  PROCEDURE Get_Valuesp (Cur OUT TAllTypesCursor) IS
  BEGIN
    OPEN Cur FOR SELECT * FROM "FDQA_All_types";
  END;

  PROCEDURE SelectShippers(Cur IN OUT TShippersCursor) IS
  BEGIN
    OPEN Cur FOR SELECT * FROM "Shippers";
  END;

  PROCEDURE GetCursors(Cur1 IN OUT TShippersCursor, 
    Cur2 IN OUT TCategoriesCursor, Cur3 IN OUT TSuppliersCursor) IS
  BEGIN
    OPEN Cur1 FOR SELECT * FROM "Shippers";
    OPEN Cur2 FOR SELECT * FROM "Categories";
    OPEN Cur3 FOR SELECT * FROM "Suppliers";
  END;

  PROCEDURE TestPLSQLArray(ATable IN OUT TVC2Tbl) IS
  BEGIN
    if ATable.First is null then
      dbms_output.put_line('first null');
    else
      dbms_output.put_line('first ' || to_char(ATable.First));
    end if;
    if ATable.Last is null then
      dbms_output.put_line('last null');
    else
      dbms_output.put_line('last ' || to_char(ATable.Last));
    end if;
    if ATable.First is not null and ATable.Last is not null then
      for i in ATable.First .. ATable.Last loop
        ATable(i) := '*' || ATable(i) || '*';
      end loop;
    end if;
  END;
END FDQA_testpack;
/

CREATE OR REPLACE PROCEDURE FDQA_TestBinding(p1 NUMBER, p2 VARCHAR,
  p3 OUT NUMBER, p4 OUT VARCHAR) IS
BEGIN
  p3 := p1 * 10;
  p4 := p2 || '**';
END;
/
