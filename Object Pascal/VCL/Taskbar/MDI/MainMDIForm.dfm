object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'MDI taskbar test'
  ClientHeight = 650
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 440
    Top = 328
    object Open1: TMenuItem
      Action = FileOpen1
    end
  end
  object ActionList1: TActionList
    Left = 640
    Top = 368
    object FileOpen1: TFileOpen
      Category = 'File'
      Caption = '&Open...'
      Hint = 'Open|Opens an existing file'
      ImageIndex = 7
      ShortCut = 16463
      OnAccept = FileOpen1Accept
    end
  end
end
