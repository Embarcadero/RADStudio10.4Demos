object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 271
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 110
    Width = 410
    Height = 124
    Lines.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10')
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 8
    Top = 8
    Width = 410
    Height = 96
    Color = clInfoBk
    Lines.Strings = (
      
        'The demo loads content of the memo into the array-parameter and ' +
        'executes'
      
        'the PL/SQL stored procedure. It appends the asterisks to each it' +
        'em in the array '
      
        'and returns the array back to the client. The client put a conte' +
        'nt of the array '
      'back to the memo. Pay attention to:'
      '1) The setup of FDStoredProc1 parameter.'
      '2) The code executing stored proc.')
    ReadOnly = True
    TabOrder = 2
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=Oracle_Demo')
    Left = 75
    Top = 165
  end
  object FDStoredProc1: TFDStoredProc
    Connection = FDConnection1
    PackageName = 'FDQA_TESTPACK'
    StoredProcName = 'TESTPLSQLARRAY'
    Left = 110
    Top = 165
    ParamData = <
      item
        Position = 1
        Name = 'ATABLE'
        ArrayType = atTable
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInputOutput
        Size = 50
      end>
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrHourGlass
    Left = 85
    Top = 220
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 120
    Top = 220
  end
end
