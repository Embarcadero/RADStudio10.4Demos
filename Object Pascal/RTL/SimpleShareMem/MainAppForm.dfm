object fMainAppForm: TfMainAppForm
  Left = 336
  Top = 128
  BorderStyle = bsSingle
  Caption = 'Main Application'
  ClientHeight = 58
  ClientWidth = 276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object bLoadDLL: TButton
    Left = 12
    Top = 12
    Width = 253
    Height = 37
    Caption = 'Load DLL'
    TabOrder = 0
    OnClick = bLoadDLLClick
  end
end
