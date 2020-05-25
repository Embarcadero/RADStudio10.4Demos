object frmUserInformation: TfrmUserInformation
  Left = 202
  Top = 135
  BorderStyle = bsDialog
  Caption = 'User Information'
  ClientHeight = 269
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 4
    Top = 4
    Width = 401
    Height = 117
    Caption = 'Required Information'
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 24
      Width = 53
      Height = 13
      Caption = 'User Name'
    end
    object Label2: TLabel
      Left = 12
      Top = 54
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Label3: TLabel
      Left = 12
      Top = 84
      Width = 84
      Height = 13
      Caption = 'Confirm Password'
    end
    object edtConfirmPassword: TEdit
      Left = 108
      Top = 80
      Width = 285
      Height = 21
      MaxLength = 31
      PasswordChar = '*'
      TabOrder = 2
      Text = 'Password'
    end
    object edtPassword: TEdit
      Left = 108
      Top = 50
      Width = 285
      Height = 21
      MaxLength = 31
      PasswordChar = '*'
      TabOrder = 1
      Text = 'Password'
    end
    object edtUser: TEdit
      Left = 108
      Top = 20
      Width = 285
      Height = 21
      MaxLength = 31
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 128
    Width = 401
    Height = 105
    Caption = 'Optional Information'
    TabOrder = 1
    object Label4: TLabel
      Left = 12
      Top = 21
      Width = 50
      Height = 13
      Caption = 'First Name'
    end
    object Label5: TLabel
      Left = 12
      Top = 51
      Width = 62
      Height = 13
      Caption = 'Middle Name'
    end
    object Label6: TLabel
      Left = 12
      Top = 81
      Width = 51
      Height = 13
      Caption = 'Last Name'
    end
    object edtFirstName: TEdit
      Left = 108
      Top = 21
      Width = 285
      Height = 21
      MaxLength = 31
      TabOrder = 0
    end
    object edtMiddleName: TEdit
      Left = 108
      Top = 47
      Width = 285
      Height = 21
      MaxLength = 31
      TabOrder = 1
    end
    object edtLastName: TEdit
      Left = 108
      Top = 77
      Width = 285
      Height = 21
      MaxLength = 31
      TabOrder = 2
    end
  end
  object btnOk: TButton
    Left = 249
    Top = 240
    Width = 75
    Height = 25
    Action = Ok
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 330
    Top = 240
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object ActionList1: TActionList
    Left = 380
    object Ok: TAction
      Caption = '&Ok'
      OnExecute = OkExecute
      OnUpdate = OkUpdate
    end
  end
end
