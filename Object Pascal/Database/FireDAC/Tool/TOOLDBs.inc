  FireDAC.Stan.Def,
  FireDAC.Stan.Async,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Expr,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.StorageBin,
  FireDAC.Stan.StorageXML,
  FireDAC.Stan.StorageJSON,

  FireDAC.DApt,

{$IFDEF FireDAC_MONITOR}
  FireDAC.Moni.FlatFile,
  {$IFNDEF POSIX}
  FireDAC.Moni.RemoteClient,
  {$ENDIF}
{$ENDIF}  

  FireDAC.Phys,
  FireDAC.Phys.TDBX,
  FireDAC.Phys.DS,
  FireDAC.Phys.ODBC,
  FireDAC.Phys.Oracle,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSAcc,
  FireDAC.Phys.DB2,
  FireDAC.Phys.ASA,
  FireDAC.Phys.IB,
  FireDAC.Phys.FB,
  FireDAC.Phys.PG,
  FireDAC.Phys.ADS,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.Infx,
  FireDAC.Phys.TData,
