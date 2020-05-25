inherited frmFilter: TfrmFilter
  Left = 363
  Top = 105
  Width = 530
  Height = 644
  Caption = 'Filter in FDQuery'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 522
    inherited bvlTitle: TBevel
      Width = 464
    end
    inherited imgAnyDAC: TImage
      Left = 464
    end
    inherited lblTitle: TLabel
      Width = 54
      Caption = 'Filter'
    end
  end
  inherited pnlMain: TPanel
    Width = 522
    Height = 501
    inherited pnlConnection: TPanel
      Width = 522
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
    end
    inherited pnlSubPageControl: TPanel
      Width = 522
      Height = 442
      inherited pcMain: TPageControl
        Width = 522
        Height = 441
        ActivePage = tsData
        inherited tsData: TTabSheet
          object DBGrid1: TDBGrid
            Left = 0
            Top = 94
            Width = 514
            Height = 316
            Align = alClient
            DataSource = DataSource1
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 514
            Height = 94
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object btnFilter1: TButton
              Left = 1
              Top = 33
              Width = 94
              Height = 25
              Caption = 'Using date field 1'
              TabOrder = 2
              OnClick = btnFilter1Click
            end
            object btnFilter2: TButton
              Left = 1
              Top = 63
              Width = 94
              Height = 25
              Caption = 'Using date field 2'
              TabOrder = 3
              OnClick = btnFilter2Click
            end
            object btnFilter3: TButton
              Left = 99
              Top = 33
              Width = 92
              Height = 25
              Caption = 'Using BETWEEN'
              TabOrder = 4
              OnClick = btnFilter3Click
            end
            object btnFilter4: TButton
              Left = 194
              Top = 33
              Width = 76
              Height = 25
              Caption = 'Using LIKE'
              TabOrder = 5
              OnClick = btnFilter4Click
            end
            object btnFilter6: TButton
              Left = 278
              Top = 5
              Width = 35
              Height = 25
              Caption = 'Set'
              TabOrder = 6
              OnClick = btnFilter6Click
            end
            object btnFilter5: TButton
              Left = 99
              Top = 63
              Width = 171
              Height = 25
              Caption = 'Using OnFilterRecord'
              TabOrder = 7
              OnClick = btnFilter5Click
            end
            object edtExample: TEdit
              Left = 1
              Top = 6
              Width = 270
              Height = 21
              TabOrder = 0
            end
            object mmInfo: TMemo
              Left = 320
              Top = 5
              Width = 191
              Height = 83
              Color = clInfoBk
              Lines.Strings = (
                'You can see the filter examples '
                'pushing the buttons '#39'Using ...'#39' or type '
                'filter property value by hands in the '
                'Edit and press '#39'Set'#39' button')
              TabOrder = 1
            end
          end
        end
        inherited tsOptions: TTabSheet
          inherited FDGUIxFormsPanelTree1: TFDGUIxFormsPanelTree
            Width = 514
            Height = 369
            inherited frmUpdateOptions: TfrmFDGUIxFormsUpdateOptions
              Width = 510
              Height = 365
            end
            inherited frmResourceOptions: TfrmFDGUIxFormsResourceOptions
              Width = 510
              Height = 365
            end
            inherited frmFormatOptions: TfrmFDGUIxFormsFormatOptions
              Width = 510
              Height = 365
            end
            inherited frmFetchOptions: TfrmFDGUIxFormsFetchOptions
              Width = 510
              Height = 365
            end
          end
          inherited pnlDataSet: TPanel
            Width = 514
            inherited lblDataSet: TLabel
              Left = 7
              Width = 40
            end
          end
        end
      end
      inherited pnlMainSep: TPanel
        Width = 522
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 554
    Width = 522
    inherited bvlButtons: TBevel
      Width = 522
    end
    inherited btnClose: TButton
      Left = 443
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 591
    Width = 522
  end
  object qryWithFilter: TFDQuery
    Filtered = True
    Connection = dmlMainComp.dbMain
    FetchOptions.Items = [fiBlobs, fiDetails]
    SQL.Strings = (
      'select * from {id Orders}')
    Left = 320
    Top = 328
  end
  object DataSource1: TDataSource
    DataSet = qryWithFilter
    Left = 360
    Top = 328
  end
end
