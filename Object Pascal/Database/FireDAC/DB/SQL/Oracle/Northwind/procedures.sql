SET CMDSEP /

CREATE OR REPLACE PACKAGE DEMO_TestPrc IS

    TYPE TCrs1 IS REF CURSOR RETURN "Categories"%RowType;
    TYPE TCrs2 IS REF CURSOR RETURN "Products"%RowType;

    F1 NUMBER;

    PROCEDURE RefCrs(C1 IN OUT TCrs1, C2 IN OUT TCrs2);
    PROCEDURE InOutPars(pin1 IN NUMBER, pin2 IN VARCHAR2, pout1 OUT NUMBER, pout2 OUT VARCHAR2);

END;
/

CREATE OR REPLACE PACKAGE BODY DEMO_TestPrc IS

    PROCEDURE RefCrs(C1 IN OUT TCrs1, C2 IN OUT TCrs2) IS
    BEGIN
      OPEN C1 FOR SELECT * FROM "Categories";
      OPEN C2 FOR SELECT * FROM "Products";
    END;

    PROCEDURE InOutPars(pin1 IN NUMBER, pin2 IN VARCHAR2, pout1 OUT NUMBER, pout2 OUT VARCHAR2) IS
    BEGIN
      f1 := 100;
      pout1 := pin1 * 10;
      pout2 := '<' || pin2 || '>';
    END;

END;
/

CREATE OR REPLACE PACKAGE DEMO_TestUpdSQL IS

  TYPE TCrs IS ref CURSOR;

  PROCEDURE Sel(C1 IN OUT TCrs);
  PROCEDURE Del(AOldID IN "Region".RegionID%Type);
  PROCEDURE Upd(AOldID IN "Region".RegionID%Type,
    ANewID IN "Region".RegionID%Type,
    ANewDesc IN "Region".RegionDescription%Type);
  PROCEDURE Ins(ANewID IN "Region".RegionID%Type,
    ANewDesc IN "Region".RegionDescription%Type);

END;
/

CREATE OR REPLACE PACKAGE BODY DEMO_TestUpdSQL IS

  PROCEDURE Sel(C1 IN OUT TCrs) IS
  BEGIN
    OPEN C1 FOR SELECT * FROM "Region";
  END;

  PROCEDURE Del(AOldID IN "Region".RegionID%Type) IS
  BEGIN
    DELETE FROM "Region" WHERE RegionID = AOldID;
  END;

  PROCEDURE Upd(AOldID IN "Region".RegionID%Type,
    ANewID IN "Region".RegionID%Type,
    ANewDesc IN "Region".RegionDescription%Type) IS
  BEGIN
    UPDATE "Region"
      SET RegionID = ANewID, RegionDescription = ANewDesc
      WHERE RegionID = AOldID;
  END;

  PROCEDURE Ins(ANewID IN "Region".RegionID%Type,
    ANewDesc IN "Region".RegionDescription%Type) IS
  BEGIN
    INSERT INTO "Region" (RegionID, RegionDescription)
      VALUES (ANewID, ANewDesc);
  END;

END;
/
