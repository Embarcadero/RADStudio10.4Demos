SET CMDSEP /

DROP PROCEDURE FDQA_All_Values/

CREATE PROCEDURE FDQA_All_Values(
o_short short output,
o_integer integer output,
o_double double output,
o_curdouble curdouble output,
o_logical logical output,
o_blob blob output,
o_raw raw(10) output,
o_char char(10) output,
o_cichar cichar(10) output,
o_memo memo output,
o_numeric numeric(12,8) output,
o_date date output,
o_time time output,
o_timestamp timestamp output,
o_money money output,
o_varchar varchar(50) output,
o_varbinary varbinary(50) output,
o_nvarchar nvarchar(50) output,
o_nmemo nmemo output,
o_nchar nchar(10) output
)
begin
  insert into __output (o_short, o_integer, o_double, o_curdouble, 
    o_logical, o_blob, o_raw, o_char, o_cichar, o_memo, o_numeric,
    o_date, o_time, o_timestamp, o_money, o_varchar, o_varbinary,
    o_nvarchar, o_nmemo, o_nchar) values (-126, -234567, 1.234567,
    8563434747.0343, True, cast ('abcde1' as sql_binary),
    cast ('klmno1' as sql_binary), 'ABCDE', 'fghij', 'abcde1', 1.234567,
    cast ('1756-12-31' as sql_date), cast ('22:04:59' as sql_time),
    cast ('1970-10-05 23:59:59' as sql_timestamp), -45.6789, 'pqrst',
    cast ('klmno1' as sql_binary), 'ÀÁÂ12', 'abcde1', 'ÃÄÅ12');
end/

DROP PROCEDURE FDQA_Get_values/

CREATE PROCEDURE FDQA_Get_values(
o_short short output,
o_integer integer output,
o_double double output,
o_curdouble curdouble output,
o_logical logical output,
o_blob blob output,
o_raw raw(10) output,
o_char char(10) output,
o_cichar cichar(10) output,
o_memo memo output,
o_numeric numeric(12,8) output,
o_date date output,
o_time time output,
o_timestamp timestamp output,
o_money money output,
o_varchar varchar(50) output,
o_varbinary varbinary(50) output,
o_nvarchar nvarchar(50) output,
o_nmemo nmemo output,
o_nchar nchar(10) output
)
begin
  insert into __output
  select *  from "FDQA_All_types";
end/

DROP FUNCTION FDQA_Identity_return/

CREATE FUNCTION FDQA_Identity_return()
RETURNS INTEGER
begin
  insert into "FDQA_Identity_tab"(descr) values('field');
  RETURN LASTAUTOINC(CONNECTION);
end/

DROP PROCEDURE FDQA_Set_Values/

CREATE PROCEDURE FDQA_Set_Values(
i_short short,
i_integer integer,
i_double double,
i_curdouble curdouble,
i_logical logical,
i_blob blob,
i_raw raw(10),
i_char char(10),
i_cichar cichar(10),
i_memo memo,
i_numeric numeric(12,8),
i_date date,
i_time time,
i_timestamp timestamp,
i_money money,
i_varchar varchar(50),
i_varbinary varbinary(50),
i_nvarchar nvarchar(50),
i_nmemo nmemo,
i_nchar nchar(10)
)
begin
  insert into "FDQA_All_types" (tshort, tinteger, tdouble, tcurdouble, 
    tlogical, tblob, traw, tchar, tcichar, tmemo, tnumeric,
    tdate, ttime, ttimestamp, tmoney, tvarchar, tvarbinary,
    tnvarchar, tnmemo, tnchar) 
  select i_short, i_integer, i_double, i_curdouble, 
    i_logical, i_blob, i_raw, i_char, i_cichar, i_memo, i_numeric,
    i_date, i_time, i_timestamp, i_money, i_varchar, i_varbinary,
    i_nvarchar, i_nmemo, i_nchar from __input;
end/

DROP PROCEDURE FDQA_TestBinding/

CREATE PROCEDURE FDQA_TestBinding(
  p1 integer, p2 varchar(10),
  p3 integer output, p4 varchar(10) output)
begin
  insert into __output (p3, p4)
  select p1 * 10, p2 + '**' from __input;
end/

drop package FDQA_TestPack/

create package FDQA_TestPack/

create function FDQA_TestPack.f1 (pint1 integer, pint2 integer)
returns integer
begin
  return pint * pint2;
end;/

create function FDQA_TestPack.f2 (pvc1 varchar(10), pvc2 varchar(10))
returns varchar(20)
begin
  return pvc + pvc2;
end;/
