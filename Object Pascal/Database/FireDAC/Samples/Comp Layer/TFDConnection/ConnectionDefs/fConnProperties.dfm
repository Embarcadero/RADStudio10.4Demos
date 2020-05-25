object frmProperties: TfrmProperties
  Left = 0
  Top = 0
  Width = 443
  Height = 270
  VertScrollBar.Style = ssFlat
  Align = alClient
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 217
    Height = 270
    Align = alLeft
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object Label3: TLabel
      Left = 26
      Top = 41
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'DriverID:'
    end
    object Bevel1: TBevel
      Left = 6
      Top = 135
      Width = 207
      Height = 9
      Shape = bsBottomLine
    end
    object cbDriverID: TComboBox
      Left = 71
      Top = 35
      Width = 137
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 0
      Text = 'MSSQL'
      OnClick = cbDriverIDClick
      Items.Strings = (
        'DB2'
        'MSSQL'
        'MSAcc'
        'MySQL'
        'Ora'
        'ASA')
    end
    object edtNewName: TLabeledEdit
      Left = 71
      Top = 8
      Width = 137
      Height = 21
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Caption = 'New name:'
      LabelPosition = lpLeft
      TabOrder = 1
      Text = 'NewMSSQL'
    end
    object edtUserName: TLabeledEdit
      Left = 71
      Top = 89
      Width = 137
      Height = 21
      EditLabel.Width = 57
      EditLabel.Height = 13
      EditLabel.Caption = 'User_name:'
      LabelPosition = lpLeft
      TabOrder = 2
      Text = 'sa'
    end
    object edtPassword: TLabeledEdit
      Left = 71
      Top = 116
      Width = 137
      Height = 21
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = 'Password:'
      LabelPosition = lpLeft
      TabOrder = 3
    end
    object edtSrvHost: TLabeledEdit
      Left = 71
      Top = 149
      Width = 137
      Height = 21
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = 'Server/Host:'
      LabelPosition = lpLeft
      TabOrder = 4
      Text = 'APP\APPMS'
    end
    object edtPort: TLabeledEdit
      Left = 71
      Top = 176
      Width = 137
      Height = 21
      EditLabel.Width = 22
      EditLabel.Height = 13
      EditLabel.Caption = 'Port:'
      Enabled = False
      LabelPosition = lpLeft
      TabOrder = 5
    end
    object edtDatabase: TLabeledEdit
      Left = 71
      Top = 62
      Width = 137
      Height = 21
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = 'Database:'
      LabelPosition = lpLeft
      TabOrder = 6
      Text = 'Northwind'
    end
  end
  object Panel2: TPanel
    Left = 217
    Top = 0
    Width = 226
    Height = 270
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 8
    ParentColor = True
    TabOrder = 0
    object mmInfo: TMemo
      Left = 8
      Top = 8
      Width = 210
      Height = 49
      Align = alTop
      Color = clInfoBk
      Lines.Strings = (
        'Select FireDAC driver id in combo box and '
        'type the needed properties. Than click '
        #39'Test Connection'#39' button.')
      ReadOnly = True
      TabOrder = 0
    end
  end
end
