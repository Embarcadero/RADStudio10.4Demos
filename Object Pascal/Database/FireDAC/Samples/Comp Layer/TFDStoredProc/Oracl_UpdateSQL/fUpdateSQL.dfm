inherited frmUpdateSQL: TfrmUpdateSQL
  Left = 322
  Top = 251
  Caption = 'Posting updates using TFDUpdateSQL & StoredProc'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 123
      Caption = 'Update SQL'
    end
  end
  inherited pnlMain: TPanel
    inherited pnlConnection: TPanel
      Height = 46
    end
    object DBNavigator1: TDBNavigator
      Left = 7
      Top = 46
      Width = 270
      Height = 25
      DataSource = dsSel
      Flat = True
      TabOrder = 1
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 76
      Width = 617
      Height = 214
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsSel
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object spSel: TFDStoredProc
    Connection = dmlMainComp.dbMain
    UpdateOptions.CountUpdatedRecords = False
    UpdateObject = FDUpdateSQL1
    PackageName = 'DEMO_TESTUPDSQL'
    StoredProcName = 'SEL'
    Left = 26
    Top = 190
    object spSelREGIONID: TIntegerField
      FieldName = 'REGIONID'
      Origin = 'REGIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object spSelREGIONDESCRIPTION: TStringField
      FieldName = 'REGIONDESCRIPTION'
      Origin = 'REGIONDESCRIPTION'
      Required = True
      Size = 100
    end
  end
  object dsSel: TDataSource
    DataSet = spSel
    Left = 58
    Top = 190
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = dmlMainComp.dbMain
    InsertSQL.Strings = (
      'begin'
      '  DEMO_TESTUPDSQL.Ins(:NEW_REGIONID, :NEW_REGIONDESCRIPTION);'
      'end;')
    ModifySQL.Strings = (
      'begin'
      
        '  DEMO_TESTUPDSQL.Upd(:OLD_REGIONID, :NEW_REGIONID, :NEW_REGIOND' +
        'ESCRIPTION);'
      'end;')
    DeleteSQL.Strings = (
      'begin'
      '  DEMO_TESTUPDSQL.Del(:OLD_REGIONID);'
      'end;')
    Left = 26
    Top = 222
  end
end
