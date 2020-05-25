drop table vc2_num_tab;

create global temporary table vc2_num_tab (
  f1 varchar2(50), 
  f2 number
) on commit delete rows;  

create or replace package ADQA_Collections as

  type TVC2Tbl is table of varchar2(50) index by binary_integer;
  type TNumTbl is table of number index by binary_integer;
  
  procedure Array2Cursor(AVC2Tab in TVC2Tbl, ANumTab in TNumTbl,
                         ACrs in out sys_refcursor);
    
end;
/

create or replace package body ADQA_Collections as

  procedure Array2Cursor(AVC2Tab in TVC2Tbl, ANumTab in TNumTbl,
                         ACrs in out sys_refcursor) as
  begin
    forall i in AVC2Tab.First .. AVC2Tab.Last
      insert into vc2_num_tab values (AVC2Tab(i), ANumTab(i));
    open ACrs for select * from vc2_num_tab;
  end;
    
end;
/
