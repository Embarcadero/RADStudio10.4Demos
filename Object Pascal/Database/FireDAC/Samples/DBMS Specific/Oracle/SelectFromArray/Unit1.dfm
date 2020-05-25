object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 286
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    426
    286)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 39
    Width = 186
    Height = 239
    Anchors = [akLeft, akTop, akBottom]
    Lines.Strings = (
      'Demo=1'
      'Select=2'
      'From=3'
      'Assocciative=4'
      'Arrays=5')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 200
    Top = 39
    Width = 218
    Height = 239
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = FDStoredProc1
    Left = 304
    Top = 168
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=Oracle_Demo')
    Left = 240
    Top = 168
  end
  object FDStoredProc1: TFDStoredProc
    Connection = FDConnection1
    PackageName = 'ADDEMO.FDQA_COLLECTIONS'
    StoredProcName = 'ARRAY2CURSOR'
    Left = 272
    Top = 168
    ParamData = <
      item
        Position = 1
        Name = 'AVC2TAB'
        ArrayType = atTable
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 2
        Name = 'ANUMTAB'
        ArrayType = atTable
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'ACRS'
        ArrayType = atTable
        DataType = ftCursor
        FDDataType = dtCursorRef
        ParamType = ptInputOutput
      end>
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrHourGlass
    Left = 248
    Top = 224
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 280
    Top = 224
  end
end
