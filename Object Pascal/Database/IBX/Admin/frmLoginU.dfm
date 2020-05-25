object frmLogin: TfrmLogin
  Left = 215
  Top = 201
  Width = 323
  Height = 233
  Caption = 'Server login information'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 31
    Height = 13
    Caption = 'Server'
  end
  object Label2: TLabel
    Left = 32
    Top = 60
    Width = 39
    Height = 13
    Caption = 'Protocol'
  end
  object Label3: TLabel
    Left = 18
    Top = 96
    Width = 53
    Height = 13
    Caption = 'User Name'
  end
  object Label4: TLabel
    Left = 25
    Top = 132
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object edtServer: TEdit
    Left = 76
    Top = 20
    Width = 221
    Height = 21
    TabOrder = 0
    Text = 'localhost'
  end
  object btnOk: TButton
    Left = 104
    Top = 168
    Width = 75
    Height = 25
    Caption = '&Ok'
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object btnCancel: TButton
    Left = 208
    Top = 168
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object cbxProtocol: TComboBox
    Left = 76
    Top = 56
    Width = 225
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      'Local'
      'NamedPipe'
      'SPX'
      'TCP')
  end
  object edtUserName: TEdit
    Left = 76
    Top = 92
    Width = 221
    Height = 21
    TabOrder = 2
    Text = 'sysdba'
  end
  object edtPassword: TEdit
    Left = 76
    Top = 128
    Width = 221
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
    Text = 'masterkey'
  end
end
