SET CMDSEP GO

DROP PROCEDURE [FDQA_All_Values]
GO

CREATE PROCEDURE [FDQA_All_Values]
@o_bigint bigint output,
@o_binary binary(50) output,
@o_bit bit output,
@o_char char(10) output,
@o_datetime datetime output,
@o_float float output,
@o_int int output,
@o_money money output,
@o_nchar nchar(10) output,
@o_numeric numeric(10,8) output,
@o_nvarchar nvarchar(50) output,
@o_real real output,
@o_smalldatetime smalldatetime output,
@o_smallint smallint output,
@o_smallmoney smallmoney output,
@o_tinyint tinyint output,
@o_uniqueidentifier uniqueidentifier output,
@o_varbinary varbinary(50) output,
@o_varchar varchar(50) output
AS
SET DATEFORMAT mdy
select @o_bigint = 123456789012345678;
select @o_binary = cast ('klmnoklmnoklmnoklmnoklmnoklmnoklmnoklmno' as binary(50));
select @o_bit = 0;
select @o_char = 'ABCDE';
select @o_datetime = cast('10/05/1970 23:59:59' as datetime);
select @o_float = 1.234567;
select @o_int = 123456;
select @o_money = -45.6789;
select @o_nchar = cast('ÃÄÅ12' as nchar(5));
select @o_numeric = 1.234567;
select @o_nvarchar = cast('ÅÆÇ12' as nvarchar(5));
select @o_real = 34.56789;
select @o_smalldatetime = cast('07/12/1957 18:45:00' as smalldatetime);
select @o_smallint = 23;
select @o_smallmoney = -2.3456;
select @o_tinyint = 1;
select @o_uniqueidentifier = '{3966D41F-0B84-4F5A-8538-ABD4109BFD18}';
select @o_varbinary = cast ('abcde' as binary(50));
select @o_varchar = 'klmno1';
GO

DROP PROCEDURE FDQA_Get_cursor1
GO

CREATE PROCEDURE FDQA_Get_cursor1
@OutCrsr CURSOR VARYING OUTPUT
AS
SET @OutCrsr = CURSOR FOR SELECT * FROM FDQA_All_types
OPEN @OutCrsr
GO

DROP PROCEDURE FDQA_Get_cursor2
GO

CREATE PROCEDURE FDQA_Get_cursor2
AS
DECLARE OutCrsr CURSOR FOR SELECT * FROM FDQA_All_types
OPEN OutCrsr
GO

DROP PROCEDURE FDQA_Get_values
GO

CREATE PROCEDURE FDQA_Get_values
AS
select *  from FDQA_All_types
GO

DROP PROCEDURE FDQA_Identity_return
GO

CREATE PROCEDURE FDQA_Identity_return
@ID int output
 AS
insert into FDQA_Identity_tab(descr) values('field');
select @ID = @@Identity;
return 1;
GO

DROP PROCEDURE [FDQA_Set_Values]
GO

CREATE PROCEDURE [FDQA_Set_Values]
@i_bigint bigint,
@i_binary binary(50),
@i_bit bit,
@i_char char(10),
@i_datetime datetime,
@i_float float,
@i_image image,
@i_int int,
@i_money money,
@i_nchar nchar(10),
@i_ntext ntext,
@i_numeric numeric(10,8),
@i_nvarchar nvarchar(50),
@i_real real,
@i_smalldatetime smalldatetime,
@i_smallint smallint,
@i_smallmoney smallmoney,
@i_sql_variant sql_variant,
@i_text text,
--@i_timestamp timestamp,
@i_tinyint tinyint,
@i_uniqueidentifier uniqueidentifier,
@i_varbinary varbinary(50),
@i_varchar varchar(50)
AS
insert into FDQA_All_types(tbigint, tbinary, tbit, tchar, tdatetime, tfloat, timage,
                      tint, tmoney, tnchar, tntext, tnumeric, tnvarchar, treal,
                      tsmalldatetime, tsmallint, tsmallmoney, tsql_variant, ttext/*,
                      ttimestamp*/, ttinyint, tuniqueidentifier, tvarbinary, tvarchar)
            values   (@i_bigint, @i_binary, @i_bit, @i_char, @i_datetime, @i_float, @i_image,
                      @i_int, @i_money, @i_nchar, @i_ntext, @i_numeric, @i_nvarchar, @i_real,
                      @i_smalldatetime, @i_smallint, @i_smallmoney, @i_sql_variant, @i_text/*,
                      @i_timestamp*/, @i_tinyint, @i_uniqueidentifier, @i_varbinary, @i_varchar)
GO

DROP PROCEDURE FDQA_TestOutCounting
GO

CREATE PROCEDURE FDQA_TestOutCounting (@P INT OUT) AS
BEGIN
UPDATE FDQA_All_types SET tbigint = 123 WHERE tbigint = 56456456;
SELECT @P = 5;
END;
GO

DROP PROCEDURE FDQA_TestInsCount
GO

CREATE PROCEDURE FDQA_TestInsCount
@ID1 int output,
@ID2 int output,
@ID3 int output 
AS
insert into FDQA_Identity_tab(descr) values('field');
select @ID1 = @@Identity;
insert into FDQA_Identity_tab(descr) values('field');
select @ID2 = @@Identity;
insert into FDQA_Identity_tab(descr) values('field');
select @ID3 = @@Identity;
select * from FDQA_Identity_tab;
return 1;
GO

DROP PROCEDURE FDQA_VarcharMax
GO

CREATE PROCEDURE FDQA_VarcharMax 
@Vcm varchar(max) output
AS
select @Vcm = replicate('abc', 20000);
GO

DROP PROCEDURE FDQA_InBlobOutVals
GO

CREATE PROCEDURE FDQA_InBlobOutVals
@i_blob text,
@i_some int,
@o_other int
as
select @o_other = @i_some
GO

DROP PROCEDURE FDQA_LongRun
GO

CREATE PROCEDURE FDQA_LongRun
AS
SELECT Count(*)
FROM FDQA_ForAsync a, FDQA_ForAsync b
GROUP BY a.name, b.name
GO

DROP PROCEDURE FDQA_PrnRecNo3
GO

CREATE PROCEDURE FDQA_PrnRecNo3
AS
  set nocount on
  declare
    @ID INTEGER
  print '333'
  insert into FDQA_PrnRecNo2 (name)
    select 'aaa'
    union all
    select 'bbb'
    union all
    select 'ccc'
    union all
    select 'ddd'
    union all
    select 'eee'
  DECLARE crMine SCROLL CURSOR FOR SELECT MAX(id) FROM FDQA_PrnRecNo2
  OPEN crmine
  FETCH FIRST From crmine INTO @ID
  CLOSE crmine
  DEALLOCATE crmine
  print '444'
  set nocount on
GO

DROP PROCEDURE [FDQA_TestBinding]
GO

CREATE PROCEDURE [FDQA_TestBinding]
@p1 int,
@p2 varchar(10),
@p3 int output,
@p4 varchar(10) output
AS
select @p3 = @p1 * 10;
select @p4 = @p2 + '**';
GO
