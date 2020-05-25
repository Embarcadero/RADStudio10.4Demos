inherited frmConnectionDefinitions: TfrmConnectionDefinitions
  Left = 353
  Top = 81
  Width = 627
  Height = 607
  Caption = 'Connection Definitions'
  Constraints.MinWidth = 570
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 619
    inherited bvlTitle: TBevel
      Width = 561
    end
    inherited imgAnyDAC: TImage
      Left = 561
    end
    inherited lblTitle: TLabel
      Width = 236
      Caption = 'Connection Definitions'
      Font.Pitch = fpFixed
    end
  end
  inherited pnlMain: TPanel
    Width = 619
    Height = 483
    BorderWidth = 5
    object lblPInfo: TLabel
      Left = 8
      Top = 317
      Width = 62
      Height = 13
      Caption = 'Process Info:'
    end
    object Bevel1: TBevel
      Left = 5
      Top = 310
      Width = 609
      Height = 1
      Align = alTop
      Style = bsRaised
    end
    object memPInfo: TMemo
      Left = 8
      Top = 336
      Width = 607
      Height = 131
      Anchors = [akLeft, akTop, akRight, akBottom]
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object pcConnDefs: TPageControl
      Left = 5
      Top = 5
      Width = 609
      Height = 305
      ActivePage = tsOnFly
      Align = alTop
      Style = tsFlatButtons
      TabOrder = 1
      OnChange = pcConnDefsChange
      object tsOnFly: TTabSheet
        Caption = 'New private'
        ImageIndex = 5
        OnShow = tsOnFlyShow
        object btnTestConn1: TButton
          Left = 0
          Top = 247
          Width = 100
          Height = 21
          Caption = 'Test Connection'
          TabOrder = 0
          OnClick = btnTestConn1Click
        end
        object pnlProperties1: TPanel
          Left = 0
          Top = 0
          Width = 601
          Height = 208
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object tsAdd: TTabSheet
        Caption = 'New persistent'
        ImageIndex = 5
        OnShow = tsAddShow
        object pnlProperties2: TPanel
          Left = 0
          Top = 36
          Width = 601
          Height = 204
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 601
          Height = 36
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label1: TLabel
            Left = 139
            Top = 14
            Width = 120
            Height = 13
            Caption = 'Loaded connection Defs:'
          end
          object btnLoadConnectionDefs3: TButton
            Left = 0
            Top = 10
            Width = 122
            Height = 21
            Caption = 'Load ConnectionDefs'
            TabOrder = 0
            OnClick = btnLoadConnectionDefs3Click
          end
          object cbConnectionDefs4: TComboBox
            Left = 266
            Top = 11
            Width = 150
            Height = 21
            ItemHeight = 0
            TabOrder = 1
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 240
          Width = 601
          Height = 34
          Align = alBottom
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 2
          object btnTestConn4: TButton
            Left = 0
            Top = 7
            Width = 100
            Height = 21
            Caption = 'Test Connection'
            TabOrder = 0
            OnClick = btnTestConn4Click
          end
        end
      end
      object tsClone: TTabSheet
        Caption = 'New cloned'
        ImageIndex = 5
        object Label11: TLabel
          Left = 64
          Top = 83
          Width = 56
          Height = 13
          Caption = 'New Name:'
        end
        object btnLoadConnectionDefs4: TButton
          Left = 0
          Top = 50
          Width = 121
          Height = 21
          Caption = 'Load ConnectionDefs'
          TabOrder = 0
          OnClick = btnLoadConnDefs4Click
        end
        object cbConnectionDefs5: TComboBox
          Left = 135
          Top = 50
          Width = 150
          Height = 21
          ItemHeight = 0
          TabOrder = 1
        end
        object edtName: TEdit
          Left = 135
          Top = 80
          Width = 150
          Height = 21
          TabOrder = 2
        end
        object TMemo
          Left = 0
          Top = 0
          Width = 601
          Height = 33
          Align = alTop
          Color = clInfoBk
          Lines.Strings = (
            
              'To clone the connection definition you have to simple create the' +
              ' new one, assign the Name property and '
            'load the parameters of the cloned definition.')
          TabOrder = 3
        end
        object btnTestConn5: TButton
          Left = 136
          Top = 110
          Width = 100
          Height = 21
          Caption = 'Test Connection'
          TabOrder = 4
          OnClick = btnTestConn5Click
        end
      end
      object tsFromDefFile: TTabSheet
        Caption = 'Existing from default file'
        ImageIndex = 1
        object lblConnectionDefs1: TLabel
          Left = 0
          Top = 115
          Width = 121
          Height = 13
          Caption = 'Loaded Connection Defs:'
        end
        object lblPath: TLabel
          Left = 136
          Top = 59
          Width = 25
          Height = 13
          Caption = 'Path:'
        end
        object lblPath_ConnDef: TLabel
          Left = 167
          Top = 59
          Width = 12
          Height = 13
          Caption = '....'
        end
        object Memo1: TMemo
          Left = 0
          Top = 0
          Width = 601
          Height = 45
          Align = alTop
          Color = clInfoBk
          Lines.Strings = (
            
              'If file name is not assigned explicitly, then will be loaded def' +
              'ault connection definition file.'
            
              'It is a file named '#39'FDConnectionDefs.ini'#39' in the application dir' +
              'ectory, if exists. Otherwise,'
            
              'it is a global connection definition file, pointed by HKLM\Softw' +
              'are\Embarcadero\FireDAC\ConnectionDefFile.')
          TabOrder = 0
        end
        object btnLoadConnectionDefs1: TButton
          Left = 0
          Top = 55
          Width = 129
          Height = 21
          Caption = 'Load ConnectionDefs'
          TabOrder = 1
          OnClick = btnLoadConnectionDefs1Click
        end
        object cbConnectionDefs1: TComboBox
          Left = 136
          Top = 112
          Width = 150
          Height = 21
          ItemHeight = 0
          TabOrder = 2
        end
        object btnTestConn2: TButton
          Left = 136
          Top = 140
          Width = 100
          Height = 21
          Caption = 'Test Connection'
          TabOrder = 3
          OnClick = btnTestConn2Click
        end
      end
      object tsFromSpecFile: TTabSheet
        Caption = 'Existing from specified file'
        ImageIndex = 2
        object lblConnDefName: TLabel
          Left = 0
          Top = 53
          Width = 127
          Height = 13
          Caption = 'Connection Def File Name:'
        end
        object lblConnectionDefs2: TLabel
          Left = 0
          Top = 115
          Width = 120
          Height = 13
          Caption = 'Loaded connection Defs:'
        end
        object edtConnectionDefFileName: TEdit
          Left = 135
          Top = 50
          Width = 260
          Height = 21
          TabOrder = 0
        end
        object Memo2: TMemo
          Left = 0
          Top = 0
          Width = 601
          Height = 33
          Align = alTop
          Lines.Strings = (
            'Enter connection definition file name or full path.  ')
          TabOrder = 1
        end
        object btnBrowse: TButton
          Left = 396
          Top = 50
          Width = 18
          Height = 21
          Caption = '...'
          TabOrder = 2
          OnClick = btnBrowseClick
        end
        object btnLoadConnectionDefs2: TButton
          Left = 135
          Top = 77
          Width = 122
          Height = 21
          Caption = 'Load ConnectionDefs'
          TabOrder = 3
          OnClick = btnLoadConnectionDefs2Click
        end
        object cbConnectionDefs2: TComboBox
          Left = 135
          Top = 112
          Width = 150
          Height = 21
          ItemHeight = 0
          TabOrder = 4
        end
        object btnTestConn3: TButton
          Left = 136
          Top = 140
          Width = 100
          Height = 21
          Caption = 'Test Connection'
          TabOrder = 5
          OnClick = btnTestConn3Click
        end
      end
      object tsForceErrors: TTabSheet
        Caption = 'Force Errors'
        ImageIndex = 6
        object Label23: TLabel
          Left = 0
          Top = 48
          Width = 285
          Height = 13
          Caption = '1.) Generates two Connection Definition with the same name'
        end
        object Label24: TLabel
          Left = 0
          Top = 84
          Width = 299
          Height = 13
          Caption = 
            '2.) After creating an on fly connection tries to load a connecti' +
            'on'
        end
        object Label25: TLabel
          Left = 14
          Top = 100
          Width = 58
          Height = 13
          Caption = 'definition file'
        end
        object TMemo
          Left = 0
          Top = 0
          Width = 601
          Height = 33
          Align = alTop
          Color = clInfoBk
          Lines.Strings = (
            
              'There are example of possible errors working with connection def' +
              'initions.')
          TabOrder = 0
        end
        object btnGenerateConnDefs: TButton
          Left = 328
          Top = 48
          Width = 150
          Height = 21
          Caption = 'Generate Connection Defs'
          TabOrder = 1
          OnClick = btnGenerateConnDefsClick
        end
        object btnCreateAndLoad: TButton
          Left = 328
          Top = 84
          Width = 150
          Height = 21
          Caption = 'Create and Load Conn Defs'
          TabOrder = 2
          OnClick = btnCreateAndLoadClick
        end
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 536
    Width = 619
    inherited bvlButtons: TBevel
      Width = 619
    end
    inherited btnClose: TButton
      Left = 540
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 480
    Top = 136
  end
end
