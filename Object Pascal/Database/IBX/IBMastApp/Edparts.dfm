object EdPartsForm: TEdPartsForm
  Left = 274
  Top = 90
  HelpContext = 6
  ActiveControl = DBEdit2
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edit Parts'
  ClientHeight = 380
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 19
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 422
    Height = 53
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object PrintBtn: TSpeedButton
      Left = 360
      Top = 5
      Width = 45
      Height = 42
      Hint = 'Print form image'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Glyph.Data = {
        2A010000424D2A010000000000007600000028000000130000000F0000000100
        040000000000B400000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333F0EFF3300000000000003333F00FF37877777777777703330000030F8
        8888888888870333003330F9988888888887703F11EE37FFFFFFFFFFFFF77039
        0910330888888888888F703865F03330870000000078F03765F03333000FFFFF
        F000033865F03333330F44448033333765F033333330FFFFFF03333865F03333
        3330F4444803333765F0333333330FFFFFF0333865F033333333000000003336
        66C0333333333333333333300000}
      OnClick = PrintBtnClick
    end
    object Bevel1: TBevel
      Left = 0
      Top = 51
      Width = 422
      Height = 2
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alBottom
      Shape = bsTopLine
      ExplicitTop = 34
      ExplicitWidth = 313
    end
    object Navigator: TDBNavigator
      Left = 8
      Top = 7
      Width = 300
      Height = 40
      HelpContext = 6
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataSource = PartsSource1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 53
    Width = 422
    Height = 268
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 48
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'PartNo'
    end
    object Label2: TLabel
      Left = 8
      Top = 49
      Width = 79
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Description'
    end
    object Label3: TLabel
      Left = 8
      Top = 92
      Width = 51
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Vendor'
    end
    object Label4: TLabel
      Left = 8
      Top = 139
      Width = 58
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'OnHand'
    end
    object Label5: TLabel
      Left = 223
      Top = 139
      Width = 62
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'OnOrder'
    end
    object Label7: TLabel
      Left = 8
      Top = 227
      Width = 31
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Cost'
    end
    object Label8: TLabel
      Left = 239
      Top = 227
      Width = 58
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'ListPrice'
    end
    object DBEdit2: TDBEdit
      Left = 95
      Top = 46
      Width = 313
      Height = 27
      HelpContext = 6
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'Description'
      DataSource = PartsSource1
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 95
      Top = 136
      Width = 82
      Height = 27
      HelpContext = 6
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'OnHand'
      DataSource = PartsSource1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 296
      Top = 136
      Width = 109
      Height = 27
      HelpContext = 6
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'OnOrder'
      DataSource = PartsSource1
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 63
      Top = 224
      Width = 102
      Height = 27
      HelpContext = 6
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'Cost'
      DataSource = PartsSource1
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 303
      Top = 224
      Width = 102
      Height = 27
      HelpContext = 6
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'ListPrice'
      DataSource = PartsSource1
      TabOrder = 7
    end
    object DBEdPartNo: TDBEdit
      Left = 80
      Top = 6
      Width = 102
      Height = 27
      HelpContext = 6
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'PartNo'
      DataSource = PartsSource1
      TabOrder = 0
    end
    object DataComboBox1: TDBLookupComboBox
      Left = 95
      Top = 87
      Width = 310
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'VendorNo'
      DataSource = PartsSource1
      KeyField = 'VENDORNO'
      ListField = 'VENDORNAME'
      ListSource = MastData.VendorSource
      TabOrder = 2
    end
    object DBCheckBox1: TDBCheckBox
      Left = 8
      Top = 181
      Width = 145
      Height = 17
      Caption = 'Backordered'
      DataField = 'BackOrd'
      DataSource = PartsSource1
      TabOrder = 5
      ValueChecked = 'Yes'
      ValueUnchecked = 'No'
    end
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 337
    Width = 91
    Height = 35
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 314
    Top = 337
    Width = 91
    Height = 35
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object PartsSource1: TDataSource
    DataSet = MastData.Parts
    Left = 24
    Top = 344
  end
end
