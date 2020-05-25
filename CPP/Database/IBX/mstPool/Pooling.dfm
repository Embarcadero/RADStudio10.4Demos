object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'MTS Pooling Sample'
  ClientHeight = 222
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 88
    Height = 13
    Caption = 'Open/Close &Count'
    FocusControl = Count
  end
  object Label2: TLabel
    Left = 176
    Top = 37
    Width = 49
    Height = 13
    Caption = 'Start Time'
  end
  object Label3: TLabel
    Left = 179
    Top = 79
    Width = 43
    Height = 13
    Caption = 'End Time'
  end
  object Label4: TLabel
    Left = 160
    Top = 121
    Width = 62
    Height = 13
    Caption = 'Elapsed Time'
  end
  object MTSPooling: TCheckBox
    Left = 24
    Top = 64
    Width = 97
    Height = 17
    Caption = '&MTS Pooling'
    TabOrder = 0
    OnClick = MTSPoolingClick
  end
  object TestBtn: TButton
    Left = 24
    Top = 96
    Width = 75
    Height = 25
    Caption = '&Test Pooling'
    TabOrder = 1
    OnClick = TestBtnClick
  end
  object StartTimeEdt: TEdit
    Left = 232
    Top = 32
    Width = 97
    Height = 21
    Color = clInactiveCaption
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object EndTimeEdt: TEdit
    Left = 232
    Top = 74
    Width = 97
    Height = 21
    Color = clInactiveCaption
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object ElpTimeEdt: TEdit
    Left = 232
    Top = 116
    Width = 97
    Height = 21
    Color = clInactiveCaption
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object Count: TEdit
    Left = 24
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '100'
  end
  object Database1: TIBDatabase
    DatabaseName = 
      'localhost:C:\Users\Public\Documents\Embarcadero\Studio\19.0\Samp' +
      'les\Data\EMPLOYEE.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 24
    Top = 136
  end
  object Query1: TIBQuery
    Database = Database1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from customer where cust_no = '#39'1010'#39)
    Left = 56
    Top = 136
  end
  object IBTransaction1: TIBTransaction
    Left = 136
    Top = 104
  end
end
