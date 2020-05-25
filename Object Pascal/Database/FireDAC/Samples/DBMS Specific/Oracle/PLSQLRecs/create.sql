create or replace package ClientPack is

  type t_clnt_data is record (
       client_id numeric,
       name varchar2(10),
       act boolean
  );
  type t_ord_data is record (
       ord_id numeric,
       client_data t_clnt_data,
       summa numeric
  );
  type t_result is record (
       rate numeric,
       discount numeric
  );
  function ClntProc(p_ord_data in t_ord_data, p_test in out boolean) return t_result;

end ClientPack;
/

create or replace package body ClientPack is

  function ClntProc(p_ord_data in t_ord_data, p_test in out boolean) return t_result is
    r t_result; 
  begin
    p_test := False;
    r.rate := 1;
    r.discount := 0;
    return r;
  end;

end ClientPack;
/
