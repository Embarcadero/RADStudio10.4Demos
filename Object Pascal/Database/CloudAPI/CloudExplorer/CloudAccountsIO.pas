//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit CloudAccountsIO;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, StdCtrls,
 CloudPopulator, Generics.Collections, System.json;

procedure ImportConnections(Connections: TObjectDictionary<String,TCloudConnection>);
procedure ExportConnections(Connections: TObjectDictionary<String,TCloudConnection>);

implementation

uses DBXJSON;

const
  ACCOUNTS_FILE = 'CloudAccounts.json';

procedure ImportConnections(Connections: TObjectDictionary<String,TCloudConnection>);
var
  InputFile : TextFile;
  buffer : string;
  LJSONAccts: TJSONObject;
  LJSONAcctsV: TJSONValue;
  I, Count: Integer;
  LPair: TJSONPair;
  LAcctDispName, LAcctType, LAcctName, LAcctKey, LAcctRegion: String;
begin
  if Connections = nil then
    exit;

  Connections.Clear;

  if FileExists(ACCOUNTS_FILE) then
  begin
    buffer := EmptyStr;

    AssignFile(InputFile, ACCOUNTS_FILE);
    try
      Reset(InputFile);
      while not EOF(InputFile) do
      begin
        ReadLn(InputFile, buffer);
      end;
    finally
      CloseFile(InputFile);
    end;

    if buffer <> EmptyStr then
    begin
      try
        LJSONAccts := nil;
        LJSONAcctsV := TJSONObject.ParseJSONValue(buffer);
        try
          if LJSONAcctsV Is TJSONObject then
          begin
            LJSONAccts := TJSONObject(LJSONAcctsV);
            LJSONAcctsV := nil;

            Count := LJSONAccts.Count;
            for I := 0 to Count - 1 do
            begin
              LPair := LJSONAccts.Pairs[I];
              if (LPair.JsonValue Is TJSONArray) and (TJSONArray(LPair.JsonValue).Count >= 3) then
              begin
                LAcctDispName := LPair.JsonString.Value;
                LAcctType := TJSONArray(LPair.JsonValue).Items[0].Value;
                LAcctName := TJSONArray(LPair.JsonValue).Items[1].Value;
                LAcctKey := TJSONArray(LPair.JsonValue).Items[2].Value;
                if TJSONArray(LPair.JsonValue).Count > 3 then
                  LAcctRegion := TJSONArray(LPair.JsonValue).Items[3].Value
                else
                  LAcctRegion := '';

                Connections.Add(AnsiUpperCase(LAcctDispName),
                  TCloudConnection.Create(LAcctDispName, LAcctName, LAcctKey,
                  LAcctRegion, GetCloudTypeFromName(LAcctType)));
              end;
            end;
          end;
        finally
          FreeAndNil(LJSONAccts);
          FreeAndNil(LJSONAcctsV);
        end;
      except
      end;
    end;
  end;
end;

procedure ExportConnections(Connections: TObjectDictionary<String,TCloudConnection>);
var
  LAccts: TJSONObject;
  LConn: TCloudConnection;
  LAcctInfo: TJSONArray;
  OutputFile : TextFile;
begin
  if Connections = nil then
    exit;

  LAccts := TJSONObject.Create;

  for LConn In Connections.Values do
  begin
    LAcctInfo := TJSONArray.Create;
    LAcctInfo.Add(GetCloudTypeName(LConn.CloudType));
    LAcctInfo.Add(LConn.AccountName);
    LAcctInfo.Add(LConn.AccountKey);
    LAcctInfo.Add(LConn.Region);
    LAccts.AddPair(LConn.DisplayName, LAcctInfo);
  end;

  try
    AssignFile(OutputFile, ACCOUNTS_FILE);
    Rewrite(OutputFile);
    WriteLn(OutputFile, LAccts.ToString);
  finally
    CloseFile(OutputFile);
    FreeAndNil(LAccts);
  end;
end;

end.
