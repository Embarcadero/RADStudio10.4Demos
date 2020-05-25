Dim oWorkspace
Dim oDatabase
Dim oTableDef
Dim oQueryDef
Dim oField
Dim oRelation
Dim oDAO
Dim sFile
Dim i

if WScript.Arguments.Count <> 1 then
  WScript.Echo "usage: tables.vbs <path to FDDemo.mdb>"
  WScript.Quit
end if

sFile = WScript.Arguments.Item(0) & "\" & "FDDemo.mdb"

Set oDAO=CreateObject("DAO.DbEngine.36")

Set oWorkspace = oDAO.WorkSpaces(0)
Set oDatabase = oWorkspace.OpenDatabase(sFile)

'  CREATE TABLE "All_types"

Set oTableDef = oDatabase.CreateTableDef("FDQA_All_types")
Set oField = oTableDef.CreateField("tint1", 2)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tint2", 3)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tint4", 4)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tsingle", 6)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tdouble", 7)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tbigint", 16)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ttext", 10)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tmemo", 12)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tdatetime", 8)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tcurrency", 5)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tboolean", 1)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tlongbinary", 11)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tGUID", 15)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tbinary", 9)
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef


Set oTableDef = oDatabase.CreateTableDef("FDQA_DB_types")
Set oField = oTableDef.CreateField("ftString", 10, 50)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ftSmallInt", 3)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ftInteger", 4)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ftWord", 3)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ftBoolean", 1)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ftFloat", 7)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ftCurrency", 5)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ftBCD", 16)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ftDate", 8)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ftTime", 8)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ftDateTime", 8)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ftBytes", 9)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ftBlob", 11)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ftMemo", 12)
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef

'Table Ascii_types
Set oTableDef = oDatabase.CreateTableDef("FDQA_Ascii_types")
Set oField = oTableDef.CreateField("atString", 10, 5)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("atFloat", 7)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("atNumber", 3)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("atBool", 1)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("atLongInt", 4)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("atDate", 8)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("atTime", 8)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("atDateTime", 8)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("atBlob", 11)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("atMemo", 12)
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef


Set oTableDef = oDatabase.CreateTableDef("FDQA_Numbers")
Set oField = oTableDef.CreateField("tByte", 2)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tSByte", 16)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tInt16", 3)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tInt32", 4)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tInt64", 16)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tUInt16", 16)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tUInt32", 16)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tUInt64", 16)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tDouble", 7)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tCurrency", 5)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tBCD", 16)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("tFmtBCD", 16)
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q1", "CREATE TABLE FDQA_master_autoinc(id1 counter constraint [PK_master_autoinc] primary key, name1 varchar(20) constraint [UK_master_autoinc] unique key);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q2", "CREATE TABLE FDQA_details_autoinc(id2 counter constraint [PK_details_autoinc] primary key, fk_id1 integer, name2 varchar(20));")
oQueryDef.Execute

'  CREATE RELATIONSHIP "FK_master_details_auto"
Set oRelation = oDatabase.CreateRelation("FK_detailsautoinc_masterautoinc", "FDQA_master_autoinc", "FDQA_details_autoinc")
Set oField = oRelation.CreateField("id1")
oField.ForeignName = "fk_id1"
oRelation.Fields.Append oField
oRelation.Attributes = &H1100
oDatabase.Relations.Append oRelation

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q3", "CREATE TABLE FDQA_LockTable (id int NOT NULL, name varchar (100) NOT NULL)")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q4", "CREATE TABLE FDQA_NoValsTable (id int, name varchar (100))")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q5", "CREATE TABLE FDQA_TransTable (id int constraint [PK_TransTable] primary key, name varchar (100))")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q6", "CREATE TABLE FDQA_TabWithPK(f1 int constraint [PK_TabWithPK] primary key, f2 varchar(200) NULL);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q7", "CREATE TABLE FDQA_Batch_test(tint int, tstring text, tblob OLEObject);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q8", "CREATE TABLE FDQA_MaxLength(str text, memos memo, widestr text, blobs OLEObject);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q9", "CREATE TABLE FDQA_Blob(id1 counter, blobdata OLEObject);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q10", "CREATE TABLE FDQA_ForAsync(id int NULL, name varchar (20) NULL);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q11", "CREATE TABLE FDQA_ParamBind(p1 varchar (50) NULL, p2 varchar (50) NULL, p3 varchar (50) NULL, p4 varchar (50) NULL);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q12", "CREATE TABLE FDQA_map1(id1 int, name1 varchar (20) NULL);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q13", "CREATE TABLE FDQA_map2(id2 int, name2 varchar (20) NULL);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q14", "CREATE TABLE FDQA_map3(id3 int, name3 varchar (20) NULL);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("FDQA_q15", "CREATE TABLE FDQA_map4(id4 int, name4 varchar (20) NULL);")
oQueryDef.Execute

i = 1
Do While i < 15
 oDatabase.QueryDefs.Delete("FDQA_q" & i)
 i = i + 1
Loop
