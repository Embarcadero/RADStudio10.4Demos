object EdCustForm: TEdCustForm
  Left = 344
  Top = 188
  HelpContext = 1
  ActiveControl = DBEdName
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Edit Customers'
  ClientHeight = 424
  ClientWidth = 437
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
  object Panel2: TPanel
    Left = 0
    Top = 54
    Width = 437
    Height = 318
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 356
      Top = 12
      Width = 51
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'CustNo'
    end
    object Label2: TLabel
      Left = 16
      Top = 12
      Width = 67
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Company'
    end
    object Label3: TLabel
      Left = 16
      Top = 68
      Width = 38
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Add1'
    end
    object Label4: TLabel
      Left = 16
      Top = 125
      Width = 38
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Add2'
    end
    object Label5: TLabel
      Left = 16
      Top = 180
      Width = 27
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'City'
    end
    object Label6: TLabel
      Left = 148
      Top = 180
      Width = 35
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'State'
    end
    object Label7: TLabel
      Left = 227
      Top = 180
      Width = 63
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Zip Code'
    end
    object Label8: TLabel
      Left = 321
      Top = 180
      Width = 56
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Country'
    end
    object Label9: TLabel
      Left = 321
      Top = 68
      Width = 44
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Phone'
    end
    object Label11: TLabel
      Left = 361
      Top = 262
      Width = 62
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Tax Rate'
    end
    object Label13: TLabel
      Left = 214
      Top = 262
      Width = 84
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Last Invoice'
    end
    object Label14: TLabel
      Left = 319
      Top = 125
      Width = 24
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Fax'
    end
    object Bevel2: TBevel
      Left = 8
      Top = 247
      Width = 417
      Height = 11
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Shape = bsTopLine
    end
    object Label10: TLabel
      Left = 16
      Top = 262
      Width = 53
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Contact'
    end
    object DBEdCustNo: TDBEdit
      Left = 356
      Top = 36
      Width = 69
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Color = clSilver
      DataField = 'CustNo'
      DataSource = MastData.CustSource
      Enabled = False
      ReadOnly = True
      TabOrder = 12
    end
    object DBEdName: TDBEdit
      Left = 16
      Top = 36
      Width = 336
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'Company'
      DataSource = MastData.CustSource
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 93
      Width = 299
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'Addr1'
      DataSource = MastData.CustSource
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 148
      Width = 299
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'Addr2'
      DataSource = MastData.CustSource
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 204
      Width = 128
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'City'
      DataSource = MastData.CustSource
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 148
      Top = 204
      Width = 62
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'State'
      DataSource = MastData.CustSource
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 227
      Top = 204
      Width = 90
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'Zip'
      DataSource = MastData.CustSource
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 321
      Top = 204
      Width = 104
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'Country'
      DataSource = MastData.CustSource
      TabOrder = 6
    end
    object DBEdit9: TDBEdit
      Left = 319
      Top = 92
      Width = 106
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'Phone'
      DataSource = MastData.CustSource
      TabOrder = 7
    end
    object DBEdit11: TDBEdit
      Left = 361
      Top = 286
      Width = 54
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'TaxRate'
      DataSource = MastData.CustSource
      TabOrder = 11
    end
    object DBEdit12: TDBEdit
      Left = 16
      Top = 286
      Width = 194
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'Contact'
      DataSource = MastData.CustSource
      TabOrder = 9
    end
    object DBEdInv: TDBEdit
      Left = 214
      Top = 286
      Width = 131
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'LastInvoiceDate'
      DataSource = MastData.CustSource
      TabOrder = 10
    end
    object DBEdit14: TDBEdit
      Left = 319
      Top = 148
      Width = 106
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'FAX'
      DataSource = MastData.CustSource
      TabOrder = 8
    end
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 437
    Height = 54
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 1
    object PrintBtn: TSpeedButton
      Left = 381
      Top = 5
      Width = 54
      Height = 41
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
      Left = 2
      Top = 50
      Width = 433
      Height = 2
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alBottom
      Shape = bsTopLine
      ExplicitTop = 35
      ExplicitWidth = 373
    end
    object DBNavigator: TDBNavigator
      Left = 16
      Top = 5
      Width = 310
      Height = 39
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataSource = MastData.CustSource
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 372
    Width = 437
    Height = 52
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 228
      Top = 5
      Width = 91
      Height = 35
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 334
      Top = 5
      Width = 91
      Height = 35
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
end
