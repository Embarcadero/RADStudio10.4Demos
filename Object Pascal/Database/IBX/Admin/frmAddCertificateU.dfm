object frmAddCertificate: TfrmAddCertificate
  Left = 189
  Top = 270
  BorderStyle = bsDialog
  Caption = 'Add License Certificate'
  ClientHeight = 174
  ClientWidth = 269
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 17
    Width = 228
    Height = 39
    Caption = 
      'Please type in the Certficate ID and the Certificate Key exactly' +
      ' as they appear on your license agreement.'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 72
    Width = 68
    Height = 13
    Caption = 'Certificate ID:'
  end
  object Label3: TLabel
    Left = 8
    Top = 104
    Width = 75
    Height = 13
    Caption = 'Certificate Key:'
  end
  object edID: TEdit
    Left = 88
    Top = 67
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object OKBtn: TButton
    Left = 30
    Top = 139
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 2
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 142
    Top = 139
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object edKey: TEdit
    Left = 88
    Top = 104
    Width = 169
    Height = 21
    TabOrder = 1
  end
end
