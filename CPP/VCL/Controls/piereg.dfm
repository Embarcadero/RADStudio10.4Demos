object AngleEditorDlg: TAngleEditorDlg
  Left = 373
  Top = 210
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Pie Angles Editor'
  ClientHeight = 138
  ClientWidth = 185
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object EAngleLabel: TLabel
    Left = 12
    Top = 54
    Width = 157
    Height = 13
    AutoSize = False
    Caption = 'EndAngle = 0'
  end
  object SAngleLabel: TLabel
    Left = 12
    Top = 6
    Width = 157
    Height = 13
    AutoSize = False
    Caption = 'StartAngle = 0'
  end
  object OKButton: TButton
    Left = 7
    Top = 104
    Width = 77
    Height = 27
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelButton: TButton
    Left = 99
    Top = 104
    Width = 77
    Height = 27
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = CancelClick
  end
  object STrackBar: TTrackBar
    Left = 5
    Top = 24
    Width = 176
    Height = 25
    Max = 360
    PageSize = 10
    TabOrder = 2
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = STrackBarChange
  end
  object ETrackBar: TTrackBar
    Left = 5
    Top = 69
    Width = 176
    Height = 25
    Max = 360
    PageSize = 10
    TabOrder = 3
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = ETrackBarChange
  end
end
