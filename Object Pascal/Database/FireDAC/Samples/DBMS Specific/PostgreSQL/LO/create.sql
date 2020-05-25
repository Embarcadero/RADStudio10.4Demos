drop table lo_table;
drop domain lo; 
create domain lo oid;
create table lo_table (id integer primary key, name varchar(10), val lo) with oids;
