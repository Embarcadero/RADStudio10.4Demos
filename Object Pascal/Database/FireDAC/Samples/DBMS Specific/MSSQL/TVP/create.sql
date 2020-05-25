set cmdsep go

drop procedure TVPProc
go

drop table TVPTab
go

drop type TVPType
go

create type TVPType as table(Code integer, Name varchar(100), RegDate datetime, Notes varchar(max))
go

create table TVPTab(Code integer, Name varchar(100), RegDate datetime, Notes varchar(max))
go

create procedure TVPProc(@Items TVPType readonly)
as
  delete from TVPTab;
  insert into TVPTab (Code, Name, RegDate, Notes)
  select Code, Name, RegDate, Notes
  from @Items;
go
