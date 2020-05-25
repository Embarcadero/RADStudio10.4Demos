//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit dmAdmin;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.UI.Intf, FireDAC.FMXUI.Wait, FireDAC.Phys,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Def,
  FireDAC.Phys.IBWrapper, FireDAC.Phys.IBDef;

type
  TAdminDM = class(TDataModule)
    FDIBSecurity1: TFDIBSecurity;
    FDIBBackup1: TFDIBBackup;
    FDIBValidate1: TFDIBValidate;
    FDIBRestore1: TFDIBRestore;
    FDMemTableUsers: TFDMemTable;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    procedure FDIBBackup1Progress(ASender: TFDPhysDriverService;
      const AMessage: string);
    procedure FDIBBackup1Error(ASender, AInitiator: TObject; 
      var AException: Exception);
    procedure FDIBBackup1AfterExecute(Sender: TObject);
    procedure FDIBRestore1AfterExecute(Sender: TObject);
    procedure FDIBRestore1Error(ASender, AInitiator: TObject; 
      var AException: Exception);
    procedure FDIBRestore1Progress(ASender: TFDPhysDriverService;
      const AMessage: string);
    procedure FDIBValidate1AfterExecute(Sender: TObject);
    procedure FDIBValidate1Error(ASender, AInitiator: TObject; 
      var AException: Exception);
    procedure FDIBValidate1Progress(ASender: TFDPhysDriverService;
      const AMessage: string);
    procedure DataModuleCreate(Sender: TObject);
  strict private
    { Private declarations }
    FLogBackup,
    FLogRestore,
    FLogValidate : TStrings;

    FIsBackingUp, FIsRestoring, FIsValidating : Boolean;

    procedure Log(aLogMessage : string; LogTo : TStrings);
    procedure BackupInterBaseDB(Host, UserName, Password, aDatabase, aBackupFile,
                                SEPassword : string;
                                aIgnoreCheckSum,
                                aIgnoreLimboTransactions,
                                aMetaDataOnly,
                                aNoGarbageCollection,
                                aOldDescriptions,
                                aNonTransportable,
                                aConvert,
                                aExpand : Boolean; VerboseTo : TStrings);

    procedure RestoreInterBaseDB(Host, UserName, Password, aBackupFile, aRestoreToFile,
                                 SEPassword : string;
                                 aReplaceDB,
                                 aDeactivateIdx,
                                 aFixFSSData,
                                 aNoValidity,
                                 aNoShadow,
                                 aOneAtATime,
                                 aUseAllSpace,
                                 aFixFSSMetaData,
                                 aValidate,
                                 aMetaDataOnly : Boolean; VerboseTo : TStrings);

    procedure ValidateInterBaseDB(Host, UserName, Password, aDatabase,
                                  SEPassword : string;
                                  aValidateFull,
                                  aValidatePages,
                                  aIgnoreCheckSum,
                                  aMendRecords,
                                  aKillShadows : Boolean; VerboseTo : TStrings);
  private
    function GetIsProcessing: Boolean;

  public
    { Public declarations }
    procedure LoadInterBaseUsers(Host, UserName, Password, EUADatabase, SEPassword : string);
    procedure StartBackupInterBaseDB(Host, UserName, Password, aDatabase, aBackupFile,
                                     SEPassword : string;
                                     aIgnoreCheckSum,
                                     aIgnoreLimboTransactions,
                                     aMetaDataOnly,
                                     aNoGarbageCollection,
                                     aOldDescriptions,
                                     aNonTransportable,
                                     aConvert,
                                     aExpand : Boolean; VerboseTo : TStrings);

    procedure StartRestoreInterBaseDB(Host, UserName, Password, aBackupFile, aRestoreToFile,
                                      SEPassword : string;
                                      aReplaceDB,
                                      aDeactivateIdx,
                                      aFixFSSData,
                                      aNoValidity,
                                      aNoShadow,
                                      aOneAtATime,
                                      aUseAllSpace,
                                      aFixFSSMetaData,
                                      aValidate,
                                      aMetaDataOnly : Boolean; VerboseTo : TStrings);

    procedure StartValidateInterBaseDB(Host, UserName, Password, aDatabase,
                                       SEPassword : string;
                                       aValidateFull,
                                       aValidatePages,
                                       aIgnoreCheckSum,
                                       aMendRecords,
                                       aKillShadows : Boolean; VerboseTo : TStrings);
    property IsProcessing : Boolean read GetIsProcessing;
  end;

var
  AdminDM: TAdminDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDataModule2 }

procedure TAdminDM.BackupInterBaseDB(Host, UserName, Password, aDatabase, aBackupFile,
  SEPassword: string; aIgnoreCheckSum, aIgnoreLimboTransactions, aMetaDataOnly,
  aNoGarbageCollection, aOldDescriptions, aNonTransportable, aConvert,
  aExpand: Boolean; VerboseTo: TStrings);

  procedure AddOptions(IsSelected : Boolean; Option : TIBBackupOptions);
  begin
    if IsSelected then
      FDIBBackup1.Options := AdminDM.FDIBBackup1.Options + Option;
  end;
begin
//  if Self.FIsBackingUp then // Ensure its a single process at a time
//    Exit;
  Assert(not FIsBackingUp,'Backup is already running'); // Ensure its a single process at a time

  FIsBackingUp := True;
  try
    FDIBBackup1.UserName := UserName;
    FDIBBackup1.Password := Password;
    FDIBBackup1.Host := Host;
    FDIBBackup1.SEPassword := SEPassword;

    FDIBBackup1.Database := aDatabase;
    FDIBBackup1.BackupFiles.Text := aBackupFile;
    FLogBackup := VerboseTo;
    FDIBBackup1.Verbose := Assigned(FLogBackup);
    if Assigned(FLogBackup) then
      FLogBackup.Clear;

    AddOptions(aIgnoreCheckSum, [boIgnoreCheckSum]);
    AddOptions(aIgnoreLimboTransactions, [boIgnoreLimbo]);
    AddOptions(aMetaDataOnly, [boMetadataOnly]);
    AddOptions(aNoGarbageCollection, [boNoGarbageCollect]);
    AddOptions(aOldDescriptions, [boOldDescriptions]);
    AddOptions(aNonTransportable, [boNonTransportable]);
    AddOptions(aConvert, [boConvert]);
    AddOptions(aExpand, [boExpand]);

    FDIBBackup1.Backup;
  finally
    FIsBackingUp := False;
  end;
end;

procedure TAdminDM.Log(aLogMessage : string; LogTo : TStrings);
begin
  TThread.Synchronize(nil, procedure begin
                             if Assigned(LogTo) then
                               LogTo.Insert(0, Format('%s - %s', [DateTimeToStr(Now),aLogMessage]));
                           end);
end;

procedure TAdminDM.RestoreInterBaseDB(Host, UserName, Password, aBackupFile,
  aRestoreToFile, SEPassword: string; aReplaceDB, aDeactivateIdx,
  aFixFSSData, aNoValidity, aNoShadow, aOneAtATime, aUseAllSpace,
  aFixFSSMetaData, aValidate, aMetaDataOnly: Boolean; VerboseTo: TStrings);

  procedure AddOptions(IsSelected : Boolean; Option : TIBRestoreOptions);
  begin
    if IsSelected then
      FDIBRestore1.Options := AdminDM.FDIBRestore1.Options + Option;
  end;
begin
  Assert(not FIsRestoring,'Restore is already running'); // Ensure its a single process at a time
  FIsRestoring := True;
  try
    FDIBRestore1.UserName := UserName;
    FDIBRestore1.Password := Password;
    FDIBRestore1.Host := Host;
    FDIBRestore1.SEPassword := SEPassword;

    FDIBRestore1.Database := aRestoreToFile;
    FDIBRestore1.BackupFiles.Text := aBackupFile;

    FLogRestore := VerboseTo;
    FDIBRestore1.Verbose := Assigned(FLogRestore);
    if Assigned(FLogRestore) then
      FLogRestore.Clear;

    AddOptions(aReplaceDB, [roReplace]);
    AddOptions(aDeactivateIdx, [roDeactivateIdx]);
    AddOptions(aFixFSSData, [roFixFSSData]);
    AddOptions(aNoValidity, [roNoValidity]);
    AddOptions(aNoShadow, [roNoShadow]);
    AddOptions(aOneAtATime, [roOneAtATime]);
    AddOptions(aUseAllSpace, [roUseAllSpace]);
    AddOptions(aFixFSSMetaData, [roFixFSSMetaData]);
    AddOptions(aValidate, [roValidate]);
    AddOptions(aMetaDataOnly, [roMetaDataOnly]);

    FDIBRestore1.Restore;
  finally
    FIsRestoring := False;
  end;
end;

procedure TAdminDM.StartBackupInterBaseDB(Host, UserName, Password, aDatabase,
  aBackupFile, SEPassword: string; aIgnoreCheckSum, aIgnoreLimboTransactions,
  aMetaDataOnly, aNoGarbageCollection, aOldDescriptions, aNonTransportable,
  aConvert, aExpand: Boolean; VerboseTo: TStrings);
var
  Thread : TThread;
begin
  Thread := TThread.CreateAnonymousThread(procedure begin
              self.BackupInterBaseDB(Host,
                                    UserName,
                                    Password,
                                    aDatabase,
                                    aBackupFile,
                                    SEPassword,
                                    aIgnoreCheckSum,
                                    aIgnoreLimboTransactions,
                                    aMetaDataOnly,
                                    aNoGarbageCollection,
                                    aOldDescriptions,
                                    aNonTransportable,
                                    aConvert,
                                    aExpand,
                                    VerboseTo);
            end);
  Thread.FreeOnTerminate := True;
  Thread.Start;
end;

procedure TAdminDM.StartRestoreInterBaseDB(Host, UserName, Password,
  aBackupFile, aRestoreToFile, SEPassword: string; aReplaceDB,
  aDeactivateIdx, aFixFSSData, aNoValidity, aNoShadow, aOneAtATime,
  aUseAllSpace, aFixFSSMetaData, aValidate, aMetaDataOnly: Boolean;
  VerboseTo: TStrings);
var
  Thread : TThread;
begin
  Thread := TThread.CreateAnonymousThread(procedure begin
              Self.RestoreInterBaseDB(Host,
                                      UserName,
                                      Password,
                                      aBackupFile,
                                      aRestoreToFile,
                                      SEPassword,
                                      aReplaceDB,
                                      aDeactivateIdx,
                                      aFixFSSData,
                                      aNoValidity,
                                      aNoShadow,
                                      aOneAtATime,
                                      aUseAllSpace,
                                      aFixFSSMetaData,
                                      aValidate,
                                      aMetaDataOnly,
                                      VerboseTo);
            end);
  Thread.FreeOnTerminate := True;
  Thread.Start;
end;

procedure TAdminDM.StartValidateInterBaseDB(Host, UserName, Password, aDatabase,
  SEPassword: string; aValidateFull, aValidatePages, aIgnoreCheckSum,
  aMendRecords, aKillShadows: Boolean; VerboseTo: TStrings);
var
  Thread : TThread;
begin
  Thread := TThread.CreateAnonymousThread(procedure begin
              Self.ValidateInterBaseDB(Host,
                                       UserName,
                                       Password,
                                       aDatabase,
                                       SEPassword,
                                       aValidateFull,
                                       aValidatePages,
                                       aIgnoreCheckSum,
                                       aMendRecords,
                                       aKillShadows,
                                       VerboseTo);
            end);
  Thread.FreeOnTerminate := True;
  Thread.Start;
end;

procedure TAdminDM.ValidateInterBaseDB(Host, UserName, Password, aDatabase,
  SEPassword: string; aValidateFull, aValidatePages, aIgnoreCheckSum,
  aMendRecords, aKillShadows: Boolean; VerboseTo: TStrings);

  procedure AddOptions(IsSelected : Boolean; Option : TIBRepairOptions);
  begin
    if IsSelected then
      FDIBValidate1.Options := AdminDM.FDIBValidate1.Options + Option;
  end;
begin
//  if Self.FIsValidating then // Ensure its a single process at a time
//    Exit;
  Assert(not FIsValidating,'Validation is already running'); // Ensure its a single process at a time
  FIsValidating := True;
  try
    FDIBValidate1.UserName := UserName;
    FDIBValidate1.Password := Password;
    FDIBValidate1.Host := Host;
    FDIBValidate1.SEPassword := SEPassword;

    FDIBValidate1.Database := aDatabase;

    FLogValidate := VerboseTo;
    if Assigned(FLogValidate) then
      FLogValidate.Clear;

    AddOptions(aValidateFull, [roValidateFull]);
    AddOptions(aValidatePages, [roValidatePages]);
    AddOptions(aIgnoreCheckSum, [roIgnoreCheckSum]);
    AddOptions(aMendRecords, [roMendRecords]);
    AddOptions(aKillShadows, [roKillShadows]);

    FDIBValidate1.Repair;
  finally
    FIsValidating := False;
  end;
end;

procedure TAdminDM.DataModuleCreate(Sender: TObject);
begin
  FIsBackingUp := False;
  FIsRestoring := False;
  FIsValidating := False;
end;

procedure TAdminDM.FDIBBackup1AfterExecute(Sender: TObject);
begin
  Log('End', FLogBackup);
end;

procedure TAdminDM.FDIBBackup1Error(ASender, AInitiator: TObject; 
  var AException: Exception);
begin
  Log(Format('** ERROR - %s **',[aException.Message]), FLogBackup);
end;

procedure TAdminDM.FDIBBackup1Progress(ASender: TFDPhysDriverService;
  const AMessage: string);
begin
  Log(aMessage, FLogBackup);
end;

procedure TAdminDM.FDIBRestore1AfterExecute(Sender: TObject);
begin
  Log('End', FLogRestore);
end;

procedure TAdminDM.FDIBRestore1Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  Log(Format('** ERROR - %s **',[aException.Message]), FLogRestore);
end;

procedure TAdminDM.FDIBRestore1Progress(ASender: TFDPhysDriverService;
  const AMessage: string);
begin
  Log(aMessage, FLogRestore);
end;

procedure TAdminDM.FDIBValidate1AfterExecute(Sender: TObject);
begin
  Log('End', FLogValidate);
end;

procedure TAdminDM.FDIBValidate1Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  Log(Format('** ERROR - %s **',[aException.Message]), FLogValidate);
end;

procedure TAdminDM.FDIBValidate1Progress(ASender: TFDPhysDriverService;
  const AMessage: string);
begin
  Log(aMessage, FLogValidate);
end;

function TAdminDM.GetIsProcessing: Boolean;
begin
  Result := FIsBackingUp or FIsRestoring or FIsValidating;
end;

procedure TAdminDM.LoadInterBaseUsers(Host, UserName, Password, EUADatabase, SEPassword : string);
begin
  FDIBSecurity1.UserName := UserName;
  FDIBSecurity1.Password := Password;
  FDIBSecurity1.Host := Host;
  if EUADatabase > '' then begin
    FDIBSecurity1.SEPassword := SEPassword;
    FDIBSecurity1.EUADatabase := EUADatabase;
  end else begin
    FDIBSecurity1.SEPassword := '';
    FDIBSecurity1.EUADatabase := '';
  end;

  FDMemTableUsers.Close;
  FDIBSecurity1.DisplayUsers;
  FDMemTableUsers.AttachTable(FDIBSecurity1.Users, nil);
  FDMemTableUsers.Open;
end;

end.
