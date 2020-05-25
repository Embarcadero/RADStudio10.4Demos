inherited frmMainDemo: TfrmMainDemo
  Left = 372
  Top = 334
  Caption = 'FireDAC FDMemTable Editor'
  ClientHeight = 542
  ClientWidth = 411
  Font.Name = 'MS Sans Serif'
  ShowHint = True
  OnCreate = FormCreate
  ExplicitWidth = 427
  ExplicitHeight = 580
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 411
    ExplicitWidth = 411
    inherited bvlTitle: TBevel
      Width = 353
      ExplicitWidth = 584
    end
    inherited imgAnyDAC: TImage
      Left = 353
      ExplicitLeft = 584
    end
    inherited lblTitle: TLabel
      Width = 205
      Caption = 'FDMemTable Editor'
      ExplicitWidth = 205
    end
  end
  inherited pnlMain: TPanel
    Width = 411
    Height = 452
    ExplicitWidth = 411
    ExplicitHeight = 452
    object Label2: TLabel
      Left = 8
      Top = 232
      Width = 32
      Height = 13
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 267
      Top = 104
      Width = 27
      Height = 13
      Caption = 'Fields'
    end
    object lblGroupState: TLabel
      Left = 370
      Top = 428
      Width = 33
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = '[FML]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 428
      Width = 33
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Aggs:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 248
      Width = 395
      Height = 169
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = DBGrid1TitleClick
    end
    object edtAggs: TEdit
      Left = 47
      Top = 425
      Width = 318
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
    end
    object PageControl1: TPageControl
      Left = 8
      Top = 8
      Width = 397
      Height = 217
      ActivePage = TabSheet7
      TabOrder = 2
      object TabSheet7: TTabSheet
        Caption = 'Content'
        ImageIndex = 6
        object btnLoadFromFile: TButton
          Left = 11
          Top = 11
          Width = 130
          Height = 25
          Caption = 'Load from file'
          TabOrder = 0
          OnClick = btnLoadFromFileClick
        end
        object btnSaveToFile: TButton
          Left = 11
          Top = 42
          Width = 130
          Height = 25
          Caption = 'Save to file'
          TabOrder = 1
          OnClick = btnSaveToFileClick
        end
        object btnReset: TButton
          Left = 12
          Top = 73
          Width = 129
          Height = 25
          Caption = 'Reset'
          TabOrder = 2
          OnClick = btnResetClick
        end
        object btnGetCustomers: TButton
          Left = 12
          Top = 104
          Width = 129
          Height = 25
          Caption = 'Get SQLite Customers'
          TabOrder = 3
          OnClick = btnGetCustomersClick
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Fields'
        ImageIndex = 5
        object Label18: TLabel
          Left = 2
          Top = 0
          Width = 38
          Height = 13
          Caption = 'Fields:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 128
          Top = 0
          Width = 28
          Height = 13
          Caption = 'Name'
        end
        object Label20: TLabel
          Left = 128
          Top = 36
          Width = 46
          Height = 13
          Caption = 'Data type'
        end
        object Label21: TLabel
          Left = 129
          Top = 75
          Width = 20
          Height = 13
          Caption = 'Size'
        end
        object Label22: TLabel
          Left = 191
          Top = 75
          Width = 43
          Height = 13
          Caption = 'Precision'
        end
        object lbFields: TListBox
          Left = 2
          Top = 14
          Width = 121
          Height = 171
          Hint = 'Field list'
          ItemHeight = 13
          TabOrder = 0
          OnClick = lbFieldsClick
        end
        object edtFldName: TEdit
          Left = 129
          Top = 14
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object edtFldSize: TEdit
          Left = 129
          Top = 89
          Width = 56
          Height = 21
          TabOrder = 2
        end
        object edtFldPrec: TEdit
          Left = 191
          Top = 89
          Width = 56
          Height = 21
          TabOrder = 3
        end
        object edtFldDataType: TComboBox
          Left = 129
          Top = 52
          Width = 145
          Height = 21
          Style = csDropDownList
          TabOrder = 4
        end
        object btnFldAdd: TButton
          Left = 129
          Top = 161
          Width = 41
          Height = 25
          Caption = 'Add'
          TabOrder = 5
          OnClick = btnFldAddClick
        end
        object btnFldDel: TButton
          Left = 169
          Top = 161
          Width = 41
          Height = 25
          Caption = 'Del'
          TabOrder = 6
          OnClick = btnFldDelClick
        end
        object btnFldMod: TButton
          Left = 209
          Top = 161
          Width = 41
          Height = 25
          Caption = 'Mod'
          TabOrder = 7
          OnClick = btnFldModClick
        end
        object cbxFldRequired: TCheckBox
          Left = 129
          Top = 116
          Width = 78
          Height = 17
          Caption = 'faRequired'
          TabOrder = 8
        end
        object cbxFldReadOnly: TCheckBox
          Left = 129
          Top = 132
          Width = 78
          Height = 17
          Caption = 'faReadonly'
          TabOrder = 9
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Indexes'
        object Label3: TLabel
          Left = 2
          Top = 0
          Width = 49
          Height = 13
          Caption = 'Indexes:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 128
          Top = 0
          Width = 28
          Height = 13
          Caption = 'Name'
        end
        object Label5: TLabel
          Left = 128
          Top = 36
          Width = 27
          Height = 13
          Caption = 'Fields'
        end
        object Label1: TLabel
          Left = 128
          Top = 72
          Width = 67
          Height = 13
          Caption = 'Case ins fields'
        end
        object Label14: TLabel
          Left = 256
          Top = 0
          Width = 52
          Height = 13
          Caption = 'Desc fields'
        end
        object Label15: TLabel
          Left = 256
          Top = 36
          Width = 51
          Height = 13
          Caption = 'Expression'
        end
        object Label17: TLabel
          Left = 256
          Top = 72
          Width = 22
          Height = 13
          Caption = 'Filter'
        end
        object lbIndexes: TListBox
          Left = 2
          Top = 14
          Width = 121
          Height = 171
          Hint = 'Index list'
          ItemHeight = 13
          TabOrder = 0
          OnClick = lbIndexesClick
          OnDblClick = lbIndexesDblClick
        end
        object edtIndName: TEdit
          Left = 128
          Top = 14
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object edtIndFields: TEdit
          Left = 128
          Top = 50
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object cbxIndPrimary: TCheckBox
          Left = 129
          Top = 109
          Width = 97
          Height = 17
          Caption = 'soPrimary'
          TabOrder = 7
        end
        object cbxIndDesc: TCheckBox
          Left = 129
          Top = 125
          Width = 112
          Height = 17
          Caption = 'soDescending'
          TabOrder = 8
        end
        object cbxIndUnique: TCheckBox
          Left = 129
          Top = 141
          Width = 97
          Height = 17
          Caption = 'soUnique'
          TabOrder = 9
        end
        object cbxIndNoCase: TCheckBox
          Left = 249
          Top = 109
          Width = 102
          Height = 17
          Caption = 'soNoCase'
          TabOrder = 10
        end
        object cbxIndNullFirst: TCheckBox
          Left = 249
          Top = 125
          Width = 101
          Height = 17
          Caption = 'soNullFirst'
          TabOrder = 11
        end
        object btnIndAdd: TButton
          Left = 129
          Top = 160
          Width = 41
          Height = 25
          Caption = 'Add'
          TabOrder = 12
          OnClick = btnIndAddClick
        end
        object btnIndDel: TButton
          Left = 169
          Top = 160
          Width = 41
          Height = 25
          Caption = 'Del'
          TabOrder = 13
          OnClick = btnIndDelClick
        end
        object btnIndMod: TButton
          Left = 209
          Top = 160
          Width = 41
          Height = 25
          Caption = 'Mod'
          TabOrder = 14
          OnClick = btnIndModClick
        end
        object btnIndClearAll: TButton
          Left = 265
          Top = 160
          Width = 49
          Height = 25
          Caption = 'Clear All'
          TabOrder = 15
          OnClick = btnIndClearAllClick
        end
        object edtIndInsFields: TEdit
          Left = 128
          Top = 86
          Width = 121
          Height = 21
          TabOrder = 3
        end
        object edtIndDescFields: TEdit
          Left = 256
          Top = 14
          Width = 121
          Height = 21
          TabOrder = 4
        end
        object edtIndExpression: TEdit
          Left = 256
          Top = 50
          Width = 121
          Height = 21
          TabOrder = 5
        end
        object edtIndFilter: TEdit
          Left = 256
          Top = 86
          Width = 121
          Height = 21
          TabOrder = 6
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Aggregates'
        ImageIndex = 1
        object Label6: TLabel
          Left = 8
          Top = 8
          Width = 69
          Height = 13
          Caption = 'Aggregates:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 136
          Top = 8
          Width = 28
          Height = 13
          Caption = 'Name'
        end
        object Label8: TLabel
          Left = 136
          Top = 48
          Width = 51
          Height = 13
          Caption = 'Expression'
        end
        object Label10: TLabel
          Left = 136
          Top = 88
          Width = 54
          Height = 13
          Caption = 'IndexName'
        end
        object Label11: TLabel
          Left = 240
          Top = 88
          Width = 69
          Height = 13
          Caption = 'GroupingLevel'
        end
        object lbAggregates: TListBox
          Left = 8
          Top = 24
          Width = 121
          Height = 145
          ItemHeight = 13
          TabOrder = 0
          OnClick = lbAggregatesClick
        end
        object edtAggName: TEdit
          Left = 136
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 1
          Text = 'InStateCount'
        end
        object cbxAggActive: TCheckBox
          Left = 264
          Top = 24
          Width = 57
          Height = 17
          Caption = 'Active'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object edtAggExp: TEdit
          Left = 135
          Top = 64
          Width = 186
          Height = 21
          TabOrder = 2
        end
        object edtAggIndexName: TEdit
          Left = 135
          Top = 104
          Width = 98
          Height = 21
          TabOrder = 3
          Text = 'ByState'
        end
        object edtAggGrpLevel: TEdit
          Left = 239
          Top = 104
          Width = 85
          Height = 21
          TabOrder = 4
          Text = '1'
        end
        object btnAggAdd: TButton
          Left = 136
          Top = 144
          Width = 41
          Height = 25
          Caption = 'Add'
          TabOrder = 6
          OnClick = btnAggAddClick
        end
        object btnAggDel: TButton
          Left = 176
          Top = 144
          Width = 41
          Height = 25
          Caption = 'Del'
          TabOrder = 7
          OnClick = btnAggDelClick
        end
        object btnAggMod: TButton
          Left = 216
          Top = 144
          Width = 41
          Height = 25
          Caption = 'Mod'
          TabOrder = 8
          OnClick = btnAggModClick
        end
        object btnAggClearAll: TButton
          Left = 272
          Top = 144
          Width = 49
          Height = 25
          Caption = 'Clear All'
          TabOrder = 9
          OnClick = btnAggClearAllClick
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Filter'
        ImageIndex = 2
        object Label12: TLabel
          Left = 8
          Top = 8
          Width = 29
          Height = 13
          Caption = 'Filter'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtFltExp: TEdit
          Left = 8
          Top = 24
          Width = 313
          Height = 21
          TabOrder = 0
        end
        object cbxFltNoPartial: TCheckBox
          Left = 8
          Top = 48
          Width = 65
          Height = 17
          Caption = 'NoPartial'
          TabOrder = 1
        end
        object cbxFltCaseIns: TCheckBox
          Left = 80
          Top = 48
          Width = 65
          Height = 17
          Caption = 'CaseIns'
          TabOrder = 2
        end
        object cbxFltActive: TCheckBox
          Left = 152
          Top = 48
          Width = 57
          Height = 17
          Caption = 'Active'
          TabOrder = 3
          OnClick = cbxFltActiveClick
        end
        object cbxFltFound: TCheckBox
          Left = 176
          Top = 72
          Width = 57
          Height = 17
          Caption = 'Found'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object btnFltFirst: TButton
          Left = 8
          Top = 68
          Width = 33
          Height = 25
          Caption = '<<'
          TabOrder = 5
          OnClick = btnFltFirstClick
        end
        object btnFltPrev: TButton
          Left = 40
          Top = 68
          Width = 33
          Height = 25
          Caption = '<'
          TabOrder = 6
          OnClick = btnFltPrevClick
        end
        object btnFltNext: TButton
          Left = 72
          Top = 68
          Width = 33
          Height = 25
          Caption = '>'
          TabOrder = 7
          OnClick = btnFltNextClick
        end
        object btnFltLast: TButton
          Left = 104
          Top = 68
          Width = 33
          Height = 25
          Caption = '>>'
          TabOrder = 8
          OnClick = btnFltLastClick
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Ranges'
        ImageIndex = 3
        object Label13: TLabel
          Left = 8
          Top = 8
          Width = 44
          Height = 13
          Caption = 'Ranges'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object bntRngSetStart: TButton
          Left = 8
          Top = 24
          Width = 33
          Height = 25
          Caption = 'SSt'
          TabOrder = 0
          OnClick = bntRngSetStartClick
        end
        object btnRngEditStart: TButton
          Left = 40
          Top = 24
          Width = 33
          Height = 25
          Caption = 'ESt'
          TabOrder = 1
          OnClick = btnRngEditStartClick
        end
        object btnRngSetEnd: TButton
          Left = 72
          Top = 24
          Width = 33
          Height = 25
          Caption = 'SEn'
          TabOrder = 2
          OnClick = btnRngSetEndClick
        end
        object btnRngEditEnd: TButton
          Left = 104
          Top = 24
          Width = 33
          Height = 25
          Caption = 'EEn'
          TabOrder = 3
          OnClick = btnRngEditEndClick
        end
        object btnRngApply: TButton
          Left = 152
          Top = 24
          Width = 33
          Height = 25
          Caption = 'Appl'
          TabOrder = 4
          OnClick = btnRngApplyClick
        end
        object btnRngClear: TButton
          Left = 184
          Top = 24
          Width = 33
          Height = 25
          Caption = 'Clear'
          TabOrder = 5
          OnClick = btnRngClearClick
        end
        object cbxRngStartExclusive: TCheckBox
          Left = 232
          Top = 16
          Width = 97
          Height = 17
          Caption = 'St KeyExlusive'
          TabOrder = 6
        end
        object cbxRngEndExclusive: TCheckBox
          Left = 232
          Top = 32
          Width = 97
          Height = 17
          Caption = 'En KeyExclusive'
          TabOrder = 7
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Cloning'
        ImageIndex = 4
        object cbxCloneReset: TCheckBox
          Left = 8
          Top = 8
          Width = 97
          Height = 17
          Caption = 'Reset'
          TabOrder = 0
        end
        object cbxCloneKeepSettings: TCheckBox
          Left = 8
          Top = 24
          Width = 97
          Height = 17
          Caption = 'KeepSettings'
          TabOrder = 1
        end
        object btnCloneDoit: TButton
          Left = 8
          Top = 48
          Width = 49
          Height = 25
          Caption = 'Clone'
          TabOrder = 2
          OnClick = btnCloneDoitClick
        end
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 505
    Width = 411
    ExplicitTop = 505
    ExplicitWidth = 411
    inherited bvlButtons: TBevel
      Width = 411
      ExplicitWidth = 642
    end
    inherited lblInfo: TLabel
      Hint = 
        'http://docwiki.embarcadero.com/RADStudio/en/Working_with_DataSet' +
        's_(FireDAC)'
    end
    inherited btnClose: TButton
      Left = 547
      ExplicitLeft = 547
    end
  end
  object DataSource1: TDataSource
    DataSet = MT
    OnDataChange = DataSource1DataChange
    Left = 128
    Top = 304
  end
  object MT: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmManual
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 80
    Top = 304
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 232
    Top = 240
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 232
    Top = 293
  end
  object OpenDialog1: TOpenDialog
    Filter = 
      'Binary files|*.fds|XML files|*.xml|JSON files|*.json|All files|*' +
      '.*'
    Left = 232
    Top = 192
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 312
    Top = 240
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 312
    Top = 285
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 312
    Top = 333
  end
  object FDTable1: TFDTable
    ConnectionName = 'SQLite_Demo'
    UpdateOptions.UpdateTableName = 'Customers'
    TableName = 'Customers'
    Left = 232
    Top = 344
  end
  object SaveDialog1: TSaveDialog
    Left = 304
    Top = 197
  end
end
