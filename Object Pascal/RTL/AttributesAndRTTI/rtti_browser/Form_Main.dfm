object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Reflection Browser'
  ClientHeight = 636
  ClientWidth = 773
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
  object Splitter1: TSplitter
    Left = 0
    Top = 313
    Width = 773
    Height = 5
    Cursor = crVSplit
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    AutoSnap = False
    ExplicitTop = 129
    ExplicitWidth = 372
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 313
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object FObjTree: TTreeView
      Left = 0
      Top = 0
      Width = 773
      Height = 313
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      Indent = 27
      ReadOnly = True
      TabOrder = 0
      OnChange = FObjTreeChange
      ExplicitHeight = 130
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 318
    Width = 773
    Height = 318
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 134
    ExplicitWidth = 372
    ExplicitHeight = 183
    object FPropertyList: TListView
      Left = 0
      Top = 0
      Width = 773
      Height = 318
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      Columns = <
        item
          AutoSize = True
          Caption = 'Name'
        end>
      TabOrder = 0
      ViewStyle = vsReport
      ExplicitWidth = 372
      ExplicitHeight = 183
    end
  end
end
