object frmDMLArrayTest: TfrmDMLArrayTest
  Left = 0
  Top = 0
  BorderWidth = 7
  Caption = 'Array DML Test'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panTop: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 133
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblDMLArraySize: TLabel
      Left = 16
      Top = 53
      Width = 69
      Height = 13
      Caption = 'DML ArraySize'
    end
    object lblNoOfRecords: TLabel
      Left = 17
      Top = 80
      Width = 68
      Height = 13
      Caption = 'No of Records'
    end
    object lblHeader: TLabel
      Left = 16
      Top = 16
      Width = 162
      Height = 13
      Caption = 'Input for the DML Array Test'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDMLArraySize: TEdit
      Left = 120
      Top = 50
      Width = 81
      Height = 21
      TabOrder = 0
      Text = '100'
    end
    object edtNoOfRecords: TEdit
      Left = 120
      Top = 75
      Width = 81
      Height = 21
      TabOrder = 1
      Text = '100000'
    end
    object butDeleteAllRows: TButton
      Left = 416
      Top = 44
      Width = 105
      Height = 25
      Caption = 'Delete all Rows'
      TabOrder = 2
      OnClick = butDeleteAllRowsClick
    end
    object butRunSingleTest: TButton
      Left = 264
      Top = 44
      Width = 113
      Height = 25
      Caption = 'Run Single Test'
      TabOrder = 3
      OnClick = butRunSingleTestClick
    end
    object butRunArraySizeTest: TButton
      Left = 264
      Top = 75
      Width = 113
      Height = 25
      Caption = 'Run Array Size Test'
      TabOrder = 4
      OnClick = butRunArraySizeTestClick
    end
    object cbUseTransactions: TCheckBox
      Left = 16
      Top = 104
      Width = 185
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Use Transactions'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
  end
  object memLog: TMemo
    Left = 0
    Top = 133
    Width = 618
    Height = 116
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    Lines.Strings = (
      'Log of the Test Run ...')
    ParentCtl3D = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
end
