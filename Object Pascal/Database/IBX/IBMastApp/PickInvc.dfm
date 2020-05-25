object PickOrderNoDlg: TPickOrderNoDlg
  Left = 236
  Top = 124
  Caption = 'Order No.'
  ClientHeight = 232
  ClientWidth = 217
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 3
    Top = 1
    Width = 113
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = '&Select an Order No.'
    FocusControl = DBLookupListBox1
  end
  object DBLookupListBox1: TDBLookupListBox
    Left = 5
    Top = 18
    Width = 205
    Height = 148
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    KeyField = 'OrderNo'
    ListField = 'OrderNo'
    ListSource = MastData.OrdersSource
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 105
    Top = 184
    Width = 80
    Height = 37
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 23
    Top = 184
    Width = 78
    Height = 37
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
end
