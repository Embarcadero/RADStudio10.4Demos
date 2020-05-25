object RelativePanelForm: TRelativePanelForm
  Left = 0
  Top = 0
  Caption = 'TRelativePanel'
  ClientHeight = 661
  ClientWidth = 588
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    588
    661)
  PixelsPerInch = 96
  TextHeight = 15
  object Label2: TLabel
    Left = 16
    Top = 20
    Width = 49
    Height = 15
    Caption = 'VCL Style'
  end
  object Label32: TLabel
    Left = 332
    Top = 417
    Width = 240
    Height = 15
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = '* Drag and drop the controls to relocate them'
    ExplicitLeft = 265
    ExplicitTop = 280
  end
  object cbxVclStyles: TComboBox
    Left = 80
    Top = 17
    Width = 181
    Height = 23
    Style = csDropDownList
    TabOrder = 0
    OnChange = cbxVclStylesChange
  end
  object RelativePanel1: TRelativePanel
    Left = 16
    Top = 52
    Width = 556
    Height = 285
    ControlCollection = <
      item
        Control = Edit1
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = Button1
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = Shape1
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end>
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    OnDragDrop = RelativePanel1DragDrop
    OnDragOver = RelativePanel1DragOver
    DesignSize = (
      556
      285)
    object Edit1: TEdit
      Left = 93
      Top = 132
      Width = 121
      Height = 23
      Anchors = []
      TabOrder = 0
      Text = 'Edit1'
      OnMouseDown = SampleControlMouseDown
    end
    object Button1: TButton
      Tag = 1
      Left = 266
      Top = 131
      Width = 75
      Height = 25
      Anchors = []
      Caption = 'Button1'
      TabOrder = 1
      OnMouseDown = SampleControlMouseDown
    end
    object Shape1: TShape
      Tag = 2
      Left = 404
      Top = 108
      Width = 65
      Height = 65
      Anchors = []
      OnMouseDown = SampleControlMouseDown
    end
  end
  object PageControl1: TPageControl
    Left = 16
    Top = 354
    Width = 556
    Height = 296
    ActivePage = TabSheet1
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = '  Edit1  '
      object Label1: TLabel
        Left = 32
        Top = 97
        Width = 33
        Height = 15
        Caption = 'LeftOf'
      end
      object Label3: TLabel
        Left = 32
        Top = 129
        Width = 73
        Height = 15
        Caption = 'AlignLeftWith'
      end
      object Label4: TLabel
        Left = 32
        Top = 161
        Width = 143
        Height = 15
        Caption = 'AlighHorizontalCenterWith'
      end
      object Label5: TLabel
        Left = 32
        Top = 193
        Width = 81
        Height = 15
        Caption = 'AlignRightWith'
      end
      object Label6: TLabel
        Left = 32
        Top = 225
        Width = 41
        Height = 15
        Caption = 'RightOf'
      end
      object Label7: TLabel
        Left = 303
        Top = 97
        Width = 34
        Height = 15
        Caption = 'Above'
      end
      object Label8: TLabel
        Left = 303
        Top = 129
        Width = 74
        Height = 15
        Caption = 'AlignTopWith'
      end
      object Label9: TLabel
        Left = 303
        Top = 161
        Width = 127
        Height = 15
        Caption = 'AlighVerticalCenterWith'
      end
      object Label10: TLabel
        Left = 303
        Top = 193
        Width = 93
        Height = 15
        Caption = 'AlignBottomWith'
      end
      object Label11: TLabel
        Left = 303
        Top = 225
        Width = 32
        Height = 15
        Caption = 'Below'
      end
      object Bevel1: TBevel
        Left = 273
        Top = 15
        Width = 11
        Height = 177
        Shape = bsLeftLine
      end
      object cb1AlignLeftWithPanel: TCheckBox
        Left = 16
        Top = 15
        Width = 243
        Height = 17
        Caption = 'AlignLeftWithPanel'
        TabOrder = 0
        OnClick = cbAlignLeftWithPanelClick
      end
      object cb1AlignHorizontalCenterWithPanel: TCheckBox
        Left = 16
        Top = 41
        Width = 243
        Height = 17
        Caption = 'AlignHorizontalCenterWithPanel'
        TabOrder = 1
        OnClick = cbAlignHorizontalCenterWithPanelClick
      end
      object cb1AlignRightWithPanel: TCheckBox
        Left = 16
        Top = 67
        Width = 243
        Height = 17
        Caption = 'AlignRightWithPanel'
        TabOrder = 2
        OnClick = cbAlignRightWithPanelClick
      end
      object cb1AlignTopWithPanel: TCheckBox
        Left = 287
        Top = 15
        Width = 227
        Height = 17
        Caption = 'AlignTopWithPanel'
        TabOrder = 3
        OnClick = cbAlignTopWithPanelClick
      end
      object cb1AlignVerticalCenterWithPanel: TCheckBox
        Left = 287
        Top = 41
        Width = 227
        Height = 17
        Caption = 'AlignVerticalCenterWithPanel'
        TabOrder = 4
        OnClick = cbAlignVerticalCenterWithPanelClick
      end
      object cb1AlignBottomWithPanel: TCheckBox
        Left = 287
        Top = 67
        Width = 227
        Height = 17
        Caption = 'AlignBottomWithPanel'
        TabOrder = 5
        OnClick = cbAlignBottomWithPanelClick
      end
      object cbx1LeftOf: TComboBox
        Left = 189
        Top = 94
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 6
        Text = '(none)'
        OnChange = cbxLeftOfChange
        Items.Strings = (
          '(none)'
          'Button1'
          'Shape1')
      end
      object cbx1AlignLeftWith: TComboBox
        Left = 189
        Top = 126
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 7
        Text = '(none)'
        OnChange = cbxAlignLeftWithChange
        Items.Strings = (
          '(none)'
          'Button1'
          'Shape1')
      end
      object cbx1AlignHorizontalCenterWith: TComboBox
        Left = 189
        Top = 158
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 8
        Text = '(none)'
        OnChange = cbxAlignHorizontalCenterWithChange
        Items.Strings = (
          '(none)'
          'Button1'
          'Shape1')
      end
      object cbx1AlignRightWith: TComboBox
        Left = 189
        Top = 190
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 9
        Text = '(none)'
        OnChange = cbxAlignRightWithChange
        Items.Strings = (
          '(none)'
          'Button1'
          'Shape1')
      end
      object cbx1RightOf: TComboBox
        Left = 189
        Top = 222
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 10
        Text = '(none)'
        OnChange = cbxRightOfChange
        Items.Strings = (
          '(none)'
          'Button1'
          'Shape1')
      end
      object cbx1Above: TComboBox
        Left = 448
        Top = 94
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 11
        Text = '(none)'
        OnChange = cbxAboveChange
        Items.Strings = (
          '(none)'
          'Button1'
          'Shape1')
      end
      object cbx1AlignTopWith: TComboBox
        Left = 448
        Top = 126
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 12
        Text = '(none)'
        OnChange = cbxAlignTopWithChange
        Items.Strings = (
          '(none)'
          'Button1'
          'Shape1')
      end
      object cbx1AlignVerticalCenterWith: TComboBox
        Left = 448
        Top = 158
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 13
        Text = '(none)'
        OnChange = cbxAlignVerticalCenterWithChange
        Items.Strings = (
          '(none)'
          'Button1'
          'Shape1')
      end
      object cbx1AlignBottomWith: TComboBox
        Left = 448
        Top = 190
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 14
        Text = '(none)'
        OnChange = cbxAlignBottomWithChange
        Items.Strings = (
          '(none)'
          'Button1'
          'Shape1')
      end
      object cbx1Below: TComboBox
        Left = 448
        Top = 222
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 15
        Text = '(none)'
        OnChange = cbxBelowChange
        Items.Strings = (
          '(none)'
          'Button1'
          'Shape1')
      end
    end
    object TabSheet2: TTabSheet
      Caption = '  Button1  '
      ImageIndex = 1
      object Label12: TLabel
        Left = 32
        Top = 97
        Width = 33
        Height = 15
        Caption = 'LeftOf'
      end
      object Label13: TLabel
        Left = 32
        Top = 129
        Width = 73
        Height = 15
        Caption = 'AlignLeftWith'
      end
      object Label14: TLabel
        Left = 32
        Top = 161
        Width = 143
        Height = 15
        Caption = 'AlighHorizontalCenterWith'
      end
      object Label15: TLabel
        Left = 32
        Top = 193
        Width = 81
        Height = 15
        Caption = 'AlignRightWith'
      end
      object Label16: TLabel
        Left = 32
        Top = 225
        Width = 41
        Height = 15
        Caption = 'RightOf'
      end
      object Label17: TLabel
        Left = 303
        Top = 97
        Width = 34
        Height = 15
        Caption = 'Above'
      end
      object Label18: TLabel
        Left = 303
        Top = 129
        Width = 74
        Height = 15
        Caption = 'AlignTopWith'
      end
      object Label19: TLabel
        Left = 303
        Top = 161
        Width = 127
        Height = 15
        Caption = 'AlighVerticalCenterWith'
      end
      object Label20: TLabel
        Left = 303
        Top = 193
        Width = 93
        Height = 15
        Caption = 'AlignBottomWith'
      end
      object Label21: TLabel
        Left = 303
        Top = 225
        Width = 32
        Height = 15
        Caption = 'Below'
      end
      object Bevel2: TBevel
        Left = 273
        Top = 15
        Width = 11
        Height = 177
        Shape = bsLeftLine
      end
      object cb2AlignLeftWithPanel: TCheckBox
        Tag = 1
        Left = 16
        Top = 15
        Width = 243
        Height = 17
        Caption = 'AlignLeftWithPanel'
        TabOrder = 0
        OnClick = cbAlignLeftWithPanelClick
      end
      object cb2AlignHorizontalCenterWithPanel: TCheckBox
        Tag = 1
        Left = 16
        Top = 41
        Width = 243
        Height = 17
        Caption = 'AlignHorizontalCenterWithPanel'
        TabOrder = 1
        OnClick = cbAlignHorizontalCenterWithPanelClick
      end
      object cb2AlignRightWithPanel: TCheckBox
        Tag = 1
        Left = 16
        Top = 67
        Width = 243
        Height = 17
        Caption = 'AlignRightWithPanel'
        TabOrder = 2
        OnClick = cbAlignRightWithPanelClick
      end
      object cb2AlignTopWithPanel: TCheckBox
        Tag = 1
        Left = 287
        Top = 15
        Width = 227
        Height = 17
        Caption = 'AlignTopWithPanel'
        TabOrder = 3
        OnClick = cbAlignTopWithPanelClick
      end
      object cb2AlignVerticalCenterWithPanel: TCheckBox
        Tag = 1
        Left = 287
        Top = 41
        Width = 227
        Height = 17
        Caption = 'AlignVerticalCenterWithPanel'
        TabOrder = 4
        OnClick = cbAlignVerticalCenterWithPanelClick
      end
      object cb2AlignBottomWithPanel: TCheckBox
        Tag = 1
        Left = 287
        Top = 67
        Width = 227
        Height = 17
        Caption = 'AlignBottomWithPanel'
        TabOrder = 5
        OnClick = cbAlignBottomWithPanelClick
      end
      object cbx2LeftOf: TComboBox
        Tag = 1
        Left = 189
        Top = 94
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 6
        Text = '(none)'
        OnChange = cbxLeftOfChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Shape1')
      end
      object cbx2AlignLeftWith: TComboBox
        Tag = 1
        Left = 189
        Top = 126
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 7
        Text = '(none)'
        OnChange = cbxAlignLeftWithChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Shape1')
      end
      object cbx2AlignHorizontalCenterWith: TComboBox
        Tag = 1
        Left = 189
        Top = 158
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 8
        Text = '(none)'
        OnChange = cbxAlignHorizontalCenterWithChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Shape1')
      end
      object cbx2AlignRightWith: TComboBox
        Tag = 1
        Left = 189
        Top = 190
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 9
        Text = '(none)'
        OnChange = cbxAlignRightWithChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Shape1')
      end
      object cbx2RightOf: TComboBox
        Tag = 1
        Left = 189
        Top = 222
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 10
        Text = '(none)'
        OnChange = cbxRightOfChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Shape1')
      end
      object cbx2Above: TComboBox
        Tag = 1
        Left = 448
        Top = 94
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 11
        Text = '(none)'
        OnChange = cbxAboveChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Shape1')
      end
      object cbx2AlignTopWith: TComboBox
        Tag = 1
        Left = 448
        Top = 126
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 12
        Text = '(none)'
        OnChange = cbxAlignTopWithChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Shape1')
      end
      object cbx2AlignVerticalCenterWith: TComboBox
        Tag = 1
        Left = 448
        Top = 158
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 13
        Text = '(none)'
        OnChange = cbxAlignVerticalCenterWithChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Shape1')
      end
      object cbx2AlignBottomWith: TComboBox
        Tag = 1
        Left = 448
        Top = 190
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 14
        Text = '(none)'
        OnChange = cbxAlignBottomWithChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Shape1')
      end
      object cbx2Below: TComboBox
        Tag = 1
        Left = 448
        Top = 222
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 15
        Text = '(none)'
        OnChange = cbxBelowChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Shape1')
      end
    end
    object TabSheet3: TTabSheet
      Caption = '  Shape1  '
      ImageIndex = 2
      object Label22: TLabel
        Left = 32
        Top = 97
        Width = 33
        Height = 15
        Caption = 'LeftOf'
      end
      object Label23: TLabel
        Left = 32
        Top = 129
        Width = 73
        Height = 15
        Caption = 'AlignLeftWith'
      end
      object Label24: TLabel
        Left = 32
        Top = 161
        Width = 143
        Height = 15
        Caption = 'AlighHorizontalCenterWith'
      end
      object Label25: TLabel
        Left = 32
        Top = 193
        Width = 81
        Height = 15
        Caption = 'AlignRightWith'
      end
      object Label26: TLabel
        Left = 32
        Top = 225
        Width = 41
        Height = 15
        Caption = 'RightOf'
      end
      object Label27: TLabel
        Left = 303
        Top = 97
        Width = 34
        Height = 15
        Caption = 'Above'
      end
      object Label28: TLabel
        Left = 303
        Top = 129
        Width = 74
        Height = 15
        Caption = 'AlignTopWith'
      end
      object Label29: TLabel
        Left = 303
        Top = 161
        Width = 127
        Height = 15
        Caption = 'AlighVerticalCenterWith'
      end
      object Label30: TLabel
        Left = 303
        Top = 193
        Width = 93
        Height = 15
        Caption = 'AlignBottomWith'
      end
      object Label31: TLabel
        Left = 303
        Top = 225
        Width = 32
        Height = 15
        Caption = 'Below'
      end
      object Bevel3: TBevel
        Left = 273
        Top = 15
        Width = 11
        Height = 177
        Shape = bsLeftLine
      end
      object cb3AlignLeftWithPanel: TCheckBox
        Tag = 2
        Left = 16
        Top = 15
        Width = 243
        Height = 17
        Caption = 'AlignLeftWithPanel'
        TabOrder = 0
        OnClick = cbAlignLeftWithPanelClick
      end
      object cb3AlignHorizontalCenterWithPanel: TCheckBox
        Tag = 2
        Left = 16
        Top = 41
        Width = 243
        Height = 17
        Caption = 'AlignHorizontalCenterWithPanel'
        TabOrder = 1
        OnClick = cbAlignHorizontalCenterWithPanelClick
      end
      object cb3AlignRightWithPanel: TCheckBox
        Tag = 2
        Left = 16
        Top = 67
        Width = 243
        Height = 17
        Caption = 'AlignRightWithPanel'
        TabOrder = 2
        OnClick = cbAlignRightWithPanelClick
      end
      object cb3AlignTopWithPanel: TCheckBox
        Tag = 2
        Left = 287
        Top = 15
        Width = 231
        Height = 17
        Caption = 'AlignTopWithPanel'
        TabOrder = 3
        OnClick = cbAlignTopWithPanelClick
      end
      object cb3AlignVerticalCenterWithPanel: TCheckBox
        Tag = 2
        Left = 287
        Top = 41
        Width = 231
        Height = 17
        Caption = 'AlignVerticalCenterWithPanel'
        TabOrder = 4
        OnClick = cbAlignVerticalCenterWithPanelClick
      end
      object cb3AlignBottomWithPanel: TCheckBox
        Tag = 2
        Left = 287
        Top = 67
        Width = 231
        Height = 17
        Caption = 'AlignBottomWithPanel'
        TabOrder = 5
        OnClick = cbAlignBottomWithPanelClick
      end
      object cbx3LeftOf: TComboBox
        Tag = 2
        Left = 189
        Top = 94
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 6
        Text = '(none)'
        OnChange = cbxLeftOfChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Button1')
      end
      object cbx3AlignLeftWith: TComboBox
        Tag = 2
        Left = 189
        Top = 126
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 7
        Text = '(none)'
        OnChange = cbxAlignLeftWithChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Button1')
      end
      object cbx3AlignHorizontalCenterWith: TComboBox
        Tag = 2
        Left = 189
        Top = 158
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 8
        Text = '(none)'
        OnChange = cbxAlignHorizontalCenterWithChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Button1')
      end
      object cbx3AlignRightWith: TComboBox
        Tag = 2
        Left = 189
        Top = 190
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 9
        Text = '(none)'
        OnChange = cbxAlignRightWithChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Button1')
      end
      object cbx3RightOf: TComboBox
        Tag = 2
        Left = 189
        Top = 222
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 10
        Text = '(none)'
        OnChange = cbxRightOfChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Button1')
      end
      object cbx3Above: TComboBox
        Tag = 2
        Left = 448
        Top = 94
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 11
        Text = '(none)'
        OnChange = cbxAboveChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Button1')
      end
      object cbx3AlignTopWith: TComboBox
        Tag = 2
        Left = 448
        Top = 126
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 12
        Text = '(none)'
        OnChange = cbxAlignTopWithChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Button1')
      end
      object cbx3AlignVerticalCenterWith: TComboBox
        Tag = 2
        Left = 448
        Top = 158
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 13
        Text = '(none)'
        OnChange = cbxAlignVerticalCenterWithChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Button1')
      end
      object cbx3AlignBottomWith: TComboBox
        Tag = 2
        Left = 448
        Top = 190
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 14
        Text = '(none)'
        OnChange = cbxAlignBottomWithChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Button1')
      end
      object cbx3Below: TComboBox
        Tag = 2
        Left = 448
        Top = 222
        Width = 70
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 15
        Text = '(none)'
        OnChange = cbxBelowChange
        Items.Strings = (
          '(none)'
          'Edit1'
          'Button1')
      end
    end
  end
end
