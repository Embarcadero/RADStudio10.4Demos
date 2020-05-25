SET CMDSEP /

DROP PROCEDURE "FDQA_All_Values"/

CREATE PROCEDURE "FDQA_All_Values"(
out o_bigint bigint,
out o_binary binary(50),
out o_bit bit,
out o_char char(10),
out o_date date,
out o_time time,
out o_decimal decimal(19,4),
out o_double double,
out o_float float,
out o_longbinary long binary,
out o_int int,
out o_numeric numeric(10,8),
out o_real real,
out o_smallint smallint,
out o_longvarchar long varchar,
out o_timestamp timestamp,
out o_tinyint tinyint,
out o_varbinary varbinary(50),
out o_varchar varchar(50)
)
begin
  set o_bigint = -123456;
  set o_binary = cast ('klmno1' as binary(50));
  set o_bit = 0;
  set o_char = 'ABCDE';
  set o_date = convert(date, '1756/12/31', 111);
  set o_time = convert(time, '22:04:59', 8);
  set o_decimal = 8563434747.0343;
  set o_double = 1.234567;
  set o_float = -2.3456789;
  set o_longbinary = 0x6b6c6d6e6f;
  set o_int = -234567;
  set o_numeric = 34.56789;
  set o_real = 34.56789;
  set o_smallint = -456;
  set o_longvarchar = 'vuwxy1';
  set o_timestamp = convert(timestamp, '1970-10-05 23:59:59', 120);
  set o_tinyint = 1;
  set o_varbinary = cast ('klmno1' as binary(50));
  set o_varchar = 'pqrst';
end/

DROP PROCEDURE FDQA_Get_cursor/

CREATE PROCEDURE FDQA_Get_cursor()
begin
  DECLARE  OutCrsr  CURSOR FOR
  SELECT *
  FROM FDQA_All_types;

  OPEN OutCrsr;
end/

DROP PROCEDURE FDQA_Get_values/

CREATE PROCEDURE FDQA_Get_values()
begin
  select *  from FDQA_All_types
end/

DROP FUNCTION FDQA_Identity_return/

CREATE FUNCTION FDQA_Identity_return()
RETURNS INTEGER
NOT DETERMINISTIC
begin
  insert into FDQA_Identity_tab(descr) values('field');
  --select ID = @@Identity;
  RETURN @@Identity
end/

DROP PROCEDURE "FDQA_Set_Values"/

CREATE PROCEDURE "FDQA_Set_Values"(
in i_bigint bigint,
in i_binary binary(50),
in i_bit bit,
in i_char char(10),
in i_date date,
in i_time time,
in i_decimal decimal(19,4),
in i_double double,
in i_float float,
in i_longbinary long binary,
in i_int int,
in i_numeric numeric(10,8),
in i_real real,
in i_smallint smallint,
in i_longvarchar long varchar,
in i_timestamp timestamp,
in i_tinyint tinyint,
in i_varbinary varbinary(50),
in i_varchar varchar(50)
)
begin
  insert into FDQA_All_types(tbigint, tbinary, tbit, tchar, tdate, ttime, tdecimal,
                        tdouble, tfloat, tlongbinary, tint, tnumeric, treal,
                        tsmallint, tlongvarchar, ttimestamp, ttinyint, tvarbinary, tvarchar)
              values   (i_bigint, i_binary, i_bit, i_char, i_date, i_time, i_decimal, i_double,
                        i_float, i_longbinary, i_int, i_numeric, i_real, i_smallint,
                        i_longvarchar, i_timestamp, i_tinyint, i_varbinary, i_varchar)
end/

DROP PROCEDURE FDQA_MCRS/

CREATE PROCEDURE FDQA_MCRS(IN in_1 int, IN in_2 int, 
                           OUT out_1 int, OUT out_2 int,
                           INOUT inout_1 int, INOUT inout_2 int)
begin
  /* qweqwe qwe qwe qwe qew  */
  SELECT * FROM Categories;
  SELECT * FROM Territories;
  SET out_1 = in_1 * 10;
  SET out_2 = in_2 * 20;
  SET inout_1 = inout_1 * 30;
  SET inout_2 = inout_2 * 40;
end/

DROP PROCEDURE FDQA_inout/

CREATE PROCEDURE FDQA_inout(inout @p1 int, inout @p2 char(10))
as
begin
  insert into FDQA_All_types (tbigint, tchar) values (@p1, @p2)
  select * from FDQA_All_types
end/

DROP PROCEDURE FDQA_TestBinding/

CREATE PROCEDURE FDQA_TestBinding(
  in p1 int, in p2 varchar(10),
  out p3 int, out p4 varchar(10))
begin
  set p3 = p1 * 10;
  set p4 = p2 + '**';
end/
