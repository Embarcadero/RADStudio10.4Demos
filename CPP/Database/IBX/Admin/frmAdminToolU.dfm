object frmAdminTool: TfrmAdminTool
  Left = 290
  Top = 112
  Caption = 'InterBase Admin Tool'
  ClientHeight = 386
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 551
    Height = 386
    ActivePage = tabRestore
    Align = alClient
    TabOrder = 0
    object tabUsers: TTabSheet
      Caption = 'Users'
      object lstUsers: TListView
        Left = 0
        Top = 0
        Width = 350
        Height = 358
        Align = alLeft
        Columns = <
          item
            Caption = 'Username'
            Width = 150
          end
          item
            Caption = 'User'
            Width = 180
          end>
        HideSelection = False
        SortType = stText
        TabOrder = 0
        ViewStyle = vsReport
      end
      object btnAdd: TButton
        Left = 376
        Top = 16
        Width = 75
        Height = 25
        Action = AddUser
        TabOrder = 1
      end
      object btnEdit: TButton
        Left = 376
        Top = 52
        Width = 75
        Height = 25
        Action = EditUser
        TabOrder = 2
      end
      object btnDelete: TButton
        Left = 376
        Top = 88
        Width = 75
        Height = 25
        Action = DeleteUser
        TabOrder = 3
      end
    end
    object tabBackup: TTabSheet
      Caption = 'Backup'
      ImageIndex = 1
      object Label1: TLabel
        Left = 20
        Top = 8
        Width = 77
        Height = 13
        Caption = 'Database Name'
      end
      object Label2: TLabel
        Left = 276
        Top = 8
        Width = 36
        Height = 13
        Caption = 'Options'
      end
      object sgBackupOptions: TStringGrid
        Left = 279
        Top = 27
        Width = 201
        Height = 278
        Color = clSilver
        ColCount = 2
        DefaultColWidth = 90
        DefaultRowHeight = 21
        FixedCols = 0
        RowCount = 10
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing]
        TabOrder = 0
        OnDrawCell = sgBackupOptionsDrawCell
        OnSelectCell = sgBackupOptionsSelectCell
        ColWidths = (
          110
          85)
      end
      object btnOK: TButton
        Left = 390
        Top = 303
        Width = 75
        Height = 25
        Action = Backup
        TabOrder = 1
      end
      object sgBackupFiles: TStringGrid
        Left = 0
        Top = 60
        Width = 273
        Height = 221
        ColCount = 2
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 12
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goEditing]
        TabOrder = 2
        OnDrawCell = sgFilesDrawCell
        OnKeyDown = sgFilesKeyDown
        ColWidths = (
          182
          73)
      end
      object cbBackupOptions: TComboBox
        Left = 391
        Top = 28
        Width = 88
        Height = 21
        TabOrder = 3
        TabStop = False
        OnExit = cbBackupOptionsExit
      end
      object pnlBackupOption: TPanel
        Left = 278
        Top = 26
        Width = 110
        Height = 20
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 4
      end
      object edtBackupName: TEdit
        Left = 20
        Top = 24
        Width = 225
        Height = 21
        TabOrder = 5
      end
      object btnDatabaseLookup: TButton
        Left = 248
        Top = 24
        Width = 17
        Height = 21
        Caption = '...'
        TabOrder = 6
        OnClick = btnDatabaseLookupClick
      end
    end
    object tabRestore: TTabSheet
      Caption = 'Restore'
      ImageIndex = 2
      object lblOptions: TLabel
        Left = 277
        Top = 4
        Width = 39
        Height = 13
        Caption = 'O&ptions:'
      end
      object Label3: TLabel
        Left = 4
        Top = 4
        Width = 67
        Height = 13
        Caption = 'Backup File(s)'
      end
      object Label4: TLabel
        Left = 0
        Top = 152
        Width = 76
        Height = 13
        Caption = 'Database File(s)'
      end
      object Button2: TButton
        Left = 342
        Top = 307
        Width = 75
        Height = 25
        Action = Restore
        TabOrder = 0
      end
      object sgRestoreOptions: TStringGrid
        Left = 279
        Top = 20
        Width = 201
        Height = 281
        Color = clSilver
        ColCount = 2
        DefaultColWidth = 90
        DefaultRowHeight = 21
        FixedCols = 0
        RowCount = 10
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing]
        TabOrder = 1
        OnDrawCell = sgBackupOptionsDrawCell
        OnSelectCell = sgRestoreOptionsSelectCell
        ColWidths = (
          120
          75)
      end
      object pnlRestoreOptionName: TPanel
        Left = 277
        Top = 22
        Width = 120
        Height = 20
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 2
      end
      object cbRestoreOptions: TComboBox
        Left = 396
        Top = 21
        Width = 79
        Height = 21
        TabOrder = 3
        TabStop = False
        OnExit = cbRestoreOptionsExit
      end
      object sgRestoreFiles: TStringGrid
        Left = 0
        Top = 20
        Width = 273
        Height = 109
        Hint = 'Double Click to browse'
        ColCount = 1
        DefaultColWidth = 254
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 12
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goEditing]
        TabOrder = 4
        OnDblClick = sgRestoreFilesDblClick
        OnDrawCell = sgFilesDrawCell
        OnKeyDown = sgFilesKeyDown
      end
      object sgRestore: TStringGrid
        Left = 0
        Top = 164
        Width = 273
        Height = 137
        ColCount = 2
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 12
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goEditing]
        TabOrder = 5
        OnDrawCell = sgFilesDrawCell
        OnKeyDown = sgFilesKeyDown
        ColWidths = (
          182
          73)
      end
    end
    object tabValidate: TTabSheet
      Caption = 'Validate'
      ImageIndex = 3
      object lblDatabaseName: TLabel
        Left = 75
        Top = 71
        Width = 67
        Height = 16
        AutoSize = False
        Caption = 'Database:'
      end
      object bvlLine1: TBevel
        Left = 75
        Top = 98
        Width = 319
        Height = 8
        Shape = bsTopLine
      end
      object Label5: TLabel
        Left = 75
        Top = 115
        Width = 75
        Height = 16
        AutoSize = False
        Caption = 'O&ptions:'
        FocusControl = sgValidateOptions
      end
      object Panel1: TPanel
        Left = 76
        Top = 138
        Width = 170
        Height = 28
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 0
      end
      object sgValidateOptions: TStringGrid
        Left = 76
        Top = 137
        Width = 319
        Height = 88
        Color = clSilver
        ColCount = 2
        DefaultColWidth = 90
        DefaultRowHeight = 21
        FixedCols = 0
        RowCount = 3
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing]
        ScrollBars = ssNone
        TabOrder = 1
        OnDrawCell = sgBackupOptionsDrawCell
        OnSelectCell = sgValidateOptionsSelectCell
        ColWidths = (
          168
          145)
      end
      object cbValidateOptions: TComboBox
        Left = 247
        Top = 138
        Width = 143
        Height = 21
        TabOrder = 2
        OnExit = cbValidateOptionsExit
      end
      object Button3: TButton
        Left = 319
        Top = 236
        Width = 75
        Height = 25
        Action = Validate
        Default = True
        TabOrder = 3
      end
      object edtValidate: TEdit
        Left = 132
        Top = 68
        Width = 261
        Height = 21
        TabOrder = 4
      end
      object pnlValidate: TPanel
        Left = 76
        Top = 138
        Width = 170
        Height = 23
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 5
      end
    end
    object tabCertificates: TTabSheet
      Caption = 'Certificates'
      ImageIndex = 4
      object lstCertificates: TListView
        Left = 0
        Top = 0
        Width = 257
        Height = 358
        Align = alLeft
        BorderStyle = bsNone
        Columns = <
          item
            AutoSize = True
            Caption = 'Certificate ID'
            MaxWidth = 115
            MinWidth = 115
          end
          item
            AutoSize = True
            Caption = 'Certificate Key'
            MaxWidth = 80
            MinWidth = 80
          end>
        ColumnClick = False
        HideSelection = False
        ReadOnly = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object Button1: TButton
        Left = 343
        Top = 31
        Width = 64
        Height = 25
        Action = AddCertificate
        TabOrder = 1
      end
      object btnRemove: TButton
        Left = 343
        Top = 67
        Width = 64
        Height = 25
        Action = RemoveCertificate
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 260
        Top = 124
        Width = 217
        Height = 217
        Caption = 'Description'
        TabOrder = 3
        object lblCertificate: TLabel
          Left = 2
          Top = 15
          Width = 213
          Height = 200
          Align = alClient
          WordWrap = True
          ExplicitWidth = 3
          ExplicitHeight = 13
        end
      end
    end
    object tabStatistics: TTabSheet
      Caption = 'Statistics'
      ImageIndex = 5
      object Label6: TLabel
        Left = 71
        Top = 147
        Width = 75
        Height = 16
        AutoSize = False
        Caption = 'O&ption:'
        FocusControl = sgStats
      end
      object Label7: TLabel
        Left = 71
        Top = 103
        Width = 67
        Height = 16
        AutoSize = False
        Caption = 'Database:'
      end
      object Bevel1: TBevel
        Left = 71
        Top = 130
        Width = 319
        Height = 8
        Shape = bsTopLine
      end
      object sgStats: TStringGrid
        Left = 71
        Top = 169
        Width = 319
        Height = 25
        Color = clSilver
        ColCount = 2
        DefaultColWidth = 90
        DefaultRowHeight = 21
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goEditing]
        ScrollBars = ssNone
        TabOrder = 0
        OnDrawCell = sgBackupOptionsDrawCell
        ColWidths = (
          137
          116)
      end
      object pnlStats: TPanel
        Left = 72
        Top = 170
        Width = 171
        Height = 23
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 1
      end
      object cbStats: TComboBox
        Left = 244
        Top = 171
        Width = 144
        Height = 21
        TabOrder = 2
        OnExit = cbStatsExit
      end
      object Button4: TButton
        Left = 313
        Top = 225
        Width = 75
        Height = 25
        Action = Statistics
        Default = True
        TabOrder = 3
      end
      object edtStatistics: TEdit
        Left = 128
        Top = 100
        Width = 261
        Height = 21
        TabOrder = 4
      end
    end
    object tabProperties: TTabSheet
      Caption = 'Properties'
      ImageIndex = 6
      object Label8: TLabel
        Left = 3
        Top = 223
        Width = 75
        Height = 16
        AutoSize = False
        Caption = 'O&ptions:'
        FocusControl = sgProperties
      end
      object Label9: TLabel
        Left = 8
        Top = 12
        Width = 52
        Height = 13
        Caption = 'Database :'
      end
      object gbSummaryInfo: TGroupBox
        Left = 3
        Top = 31
        Width = 391
        Height = 186
        Caption = ' Summary Information '
        TabOrder = 0
        object lblDBOwner: TLabel
          Left = 15
          Top = 22
          Width = 53
          Height = 16
          AutoSize = False
          Caption = 'Owner:'
        end
        object lblDBPages: TLabel
          Left = 15
          Top = 155
          Width = 134
          Height = 16
          AutoSize = False
          Caption = 'Allocated DB Pages:'
        end
        object lblPageSize: TLabel
          Left = 258
          Top = 155
          Width = 68
          Height = 16
          AutoSize = False
          Caption = 'Page Size:'
        end
        object lvSecondaryFiles: TListView
          Left = 15
          Top = 52
          Width = 363
          Height = 97
          Color = clSilver
          Columns = <
            item
              Caption = 'Secondary Files'
              Width = 235
            end
            item
              Caption = 'Start Page'
              Width = 123
            end>
          ColumnClick = False
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
        object stxDBOwner: TStaticText
          Left = 66
          Top = 22
          Width = 312
          Height = 21
          AutoSize = False
          TabOrder = 1
        end
        object stxDBPages: TStaticText
          Left = 140
          Top = 155
          Width = 112
          Height = 21
          AutoSize = False
          TabOrder = 2
        end
        object stxPageSize: TStaticText
          Left = 325
          Top = 155
          Width = 53
          Height = 21
          AutoSize = False
          TabOrder = 3
        end
      end
      object sgProperties: TStringGrid
        Left = 3
        Top = 244
        Width = 392
        Height = 92
        Color = clSilver
        ColCount = 2
        DefaultColWidth = 90
        DefaultRowHeight = 21
        FixedCols = 0
        RowCount = 4
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing]
        ScrollBars = ssNone
        TabOrder = 1
        OnDrawCell = sgBackupOptionsDrawCell
        OnSelectCell = sgPropertiesSelectCell
        ColWidths = (
          223
          162)
      end
      object cbProperties: TComboBox
        Left = 229
        Top = 245
        Width = 163
        Height = 21
        TabOrder = 2
        OnChange = cbPropertiesChange
        OnExit = cbPropertiesExit
      end
      object pnlProperties: TPanel
        Left = 4
        Top = 245
        Width = 223
        Height = 21
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 3
      end
      object edtProperties: TEdit
        Left = 68
        Top = 8
        Width = 325
        Height = 21
        TabOrder = 4
      end
      object Button5: TButton
        Left = 400
        Top = 40
        Width = 75
        Height = 25
        Action = Lookup
        TabOrder = 5
      end
      object Button6: TButton
        Left = 400
        Top = 80
        Width = 75
        Height = 25
        Action = Apply
        TabOrder = 6
      end
    end
    object tabLog: TTabSheet
      Caption = 'Log'
      ImageIndex = 7
      object edLog: TRichEdit
        Left = 0
        Top = 0
        Width = 543
        Height = 358
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'edLog')
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        Zoom = 100
      end
    end
    object tabAliases: TTabSheet
      Caption = 'Aliases'
      ImageIndex = 8
      DesignSize = (
        543
        358)
      object Label10: TLabel
        Left = 16
        Top = 20
        Width = 22
        Height = 13
        Caption = 'Alias'
      end
      object Label11: TLabel
        Left = 16
        Top = 47
        Width = 22
        Height = 13
        Caption = 'Path'
      end
      object lstAliases: TListView
        Left = 0
        Top = 88
        Width = 543
        Height = 270
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            AutoSize = True
            Caption = 'Alias'
          end
          item
            AutoSize = True
            Caption = 'Path'
          end>
        ReadOnly = True
        RowSelect = True
        SortType = stText
        TabOrder = 0
        ViewStyle = vsReport
        OnSelectItem = lstAliasesSelectItem
      end
      object edtAlias: TEdit
        Left = 44
        Top = 17
        Width = 400
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object edtPath: TEdit
        Left = 44
        Top = 44
        Width = 400
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object btnAddAlias: TButton
        Left = 465
        Top = 15
        Width = 75
        Height = 25
        Action = actAddAlias
        Anchors = [akTop, akRight]
        TabOrder = 3
      end
      object btnDeleteAlias: TButton
        Left = 465
        Top = 46
        Width = 75
        Height = 25
        Action = actDeleteAlias
        Anchors = [akTop, akRight]
        TabOrder = 4
      end
    end
  end
  object ActionList1: TActionList
    Left = 172
    Top = 244
    object Login: TAction
      Caption = 'Login'
      OnExecute = LoginExecute
      OnUpdate = LoginUpdate
    end
    object Logout: TAction
      Caption = 'Logout'
      OnExecute = LogoutExecute
      OnUpdate = LogoutUpdate
    end
    object AddUser: TAction
      Category = 'Users'
      Caption = 'Add User'
      OnExecute = AddUserExecute
      OnUpdate = LoggedInUpdate
    end
    object EditUser: TAction
      Category = 'Users'
      Caption = 'Edit User'
      OnExecute = EditUserExecute
      OnUpdate = EditUserUpdate
    end
    object DeleteUser: TAction
      Category = 'Users'
      Caption = 'Delete User'
      OnExecute = DeleteUserExecute
      OnUpdate = DeleteUserUpdate
    end
    object AddCertificate: TAction
      Category = 'Certificate'
      Caption = '&Add'
      OnExecute = AddCertificateExecute
      OnUpdate = LoggedInUpdate
    end
    object RemoveCertificate: TAction
      Category = 'Certificate'
      Caption = '&Remove'
      OnExecute = RemoveCertificateExecute
      OnUpdate = LoggedInUpdate
    end
    object Backup: TAction
      Category = 'Backup'
      Caption = '&Backup'
      OnExecute = BackupExecute
      OnUpdate = LoggedInUpdate
    end
    object Restore: TAction
      Caption = '&Restore'
      OnExecute = RestoreExecute
      OnUpdate = LoggedInUpdate
    end
    object Validate: TAction
      Caption = '&Validate'
      OnExecute = ValidateExecute
      OnUpdate = ValidateUpdate
    end
    object Statistics: TAction
      Caption = '&Statistics'
      OnExecute = StatisticsExecute
      OnUpdate = StatisticsUpdate
    end
    object Lookup: TAction
      Caption = '&Lookup'
      OnExecute = LookupExecute
      OnUpdate = LookupUpdate
    end
    object Apply: TAction
      Caption = '&Apply'
      Enabled = False
      OnExecute = ApplyExecute
    end
    object actAddAlias: TAction
      Category = 'Aliases'
      Caption = 'Add'
      OnExecute = actAddAliasExecute
      OnUpdate = actAddAliasUpdate
    end
    object actDeleteAlias: TAction
      Category = 'Aliases'
      Caption = 'Delete'
      OnExecute = actDeleteAliasExecute
      OnUpdate = actDeleteAliasUpdate
    end
  end
  object MainMenu1: TMainMenu
    Left = 260
    Top = 254
    object Login1: TMenuItem
      Action = Login
    end
    object Logout1: TMenuItem
      Action = Logout
    end
  end
  object srvUsers: TIBSecurityService
    Protocol = TCP
    LoginPrompt = False
    TraceFlags = []
    ServerType = 'IBServer'
    Left = 24
    Top = 192
  end
  object srvProperties: TIBServerProperties
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    TraceFlags = []
    ServerType = 'IBServer'
    Options = [Database, LicenseMask, ConfigParameters, Version, DBAlias]
    Left = 96
    Top = 192
  end
  object srvBackup: TIBBackupService
    LoginPrompt = False
    TraceFlags = []
    ServerType = 'IBServer'
    BlockingFactor = 0
    Options = []
    PreAllocate = 0
    Left = 100
    Top = 256
  end
  object dlgBackupRestore: TOpenDialog
    DefaultExt = '*.gdb'
    Filter = '(*.gdb) InterBase Database|*.gdb|(*.*) All Files|*.*'
    Options = [ofHideReadOnly, ofNoNetworkButton, ofEnableSizing]
    Left = 260
    Top = 184
  end
  object srvRestore: TIBRestoreService
    LoginPrompt = False
    TraceFlags = []
    ServerType = 'IBServer'
    PageBuffers = 0
    PreAllocate = 0
    ReadOnly = False
    Left = 24
    Top = 252
  end
  object srvValidate: TIBValidationService
    LoginPrompt = False
    TraceFlags = []
    ServerType = 'IBServer'
    Options = []
    GlobalAction = CommitGlobal
    Left = 100
    Top = 308
  end
  object srvStats: TIBStatisticalService
    LoginPrompt = False
    TraceFlags = []
    ServerType = 'IBServer'
    Options = []
    Left = 176
    Top = 308
  end
  object srvLog: TIBLogService
    LoginPrompt = False
    TraceFlags = []
    ServerType = 'IBServer'
    Left = 244
    Top = 316
  end
  object srvConfig: TIBConfigService
    LoginPrompt = False
    TraceFlags = []
    ServerType = 'IBServer'
    Left = 176
    Top = 184
  end
  object dbProperties: TIBDatabase
    LoginPrompt = False
    DefaultTransaction = trProperties
    ServerType = 'IBServer'
    SQLDialect = 1
    Left = 392
    Top = 248
  end
  object trProperties: TIBTransaction
    DefaultDatabase = dbProperties
    Left = 460
    Top = 200
  end
  object sqlFiles: TIBSQL
    Database = dbProperties
    SQL.Strings = (
      'SELECT RDB$FILE_NAME, RDB$FILE_START FROM RDB$FILES '
      'WHERE RDB$SHADOW_NUMBER IS NULL OR RDB$SHADOW_NUMBER < 1 '
      'ORDER BY RDB$FILE_SEQUENCE ASC')
    Transaction = trProperties
    Left = 424
    Top = 300
  end
  object sqlOwner: TIBSQL
    Database = dbProperties
    SQL.Strings = (
      'SELECT RDB$OWNER_NAME FROM RDB$RELATIONS '
      'WHERE RDB$RELATION_NAME = '#39'RDB$DATABASE'#39)
    Transaction = trProperties
    Left = 460
    Top = 244
  end
  object infoDB: TIBDatabaseInfo
    Database = dbProperties
    Left = 392
    Top = 196
  end
end
