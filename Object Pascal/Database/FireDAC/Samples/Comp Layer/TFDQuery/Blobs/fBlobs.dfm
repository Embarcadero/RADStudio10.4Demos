inherited frmMain: TfrmMain
  Left = 378
  Top = 188
  Caption = 'Blobs'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 57
      Caption = 'Blobs'
      ExplicitWidth = 57
    end
  end
  inherited pnlMain: TPanel
    inherited pnlSubPageControl: TPanel
      inherited pcMain: TPageControl
        ActivePage = tsData
        inherited tsData: TTabSheet
          object Image1: TImage
            Left = 260
            Top = 228
            Width = 360
            Height = 179
            Align = alClient
            Center = True
            ExplicitHeight = 183
          end
          object Splitter1: TSplitter
            Left = 0
            Top = 225
            Width = 620
            Height = 3
            Cursor = crVSplit
            Align = alTop
          end
          object Splitter2: TSplitter
            Left = 257
            Top = 228
            Height = 179
            ExplicitHeight = 183
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 41
            Width = 620
            Height = 184
            Align = alTop
            DataSource = dsCategories
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object DBMemo1: TDBMemo
            Left = 0
            Top = 228
            Width = 257
            Height = 179
            Align = alLeft
            DataField = 'Description'
            DataSource = dsCategories
            TabOrder = 2
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 620
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object btnClrPic: TButton
              Left = 247
              Top = 7
              Width = 68
              Height = 25
              Caption = 'Clear Picture'
              TabOrder = 1
              OnClick = btnClrPicClick
            end
            object btnSavePic: TButton
              Left = 320
              Top = 7
              Width = 68
              Height = 25
              Caption = 'Save Picture'
              TabOrder = 2
              OnClick = btnSavePicClick
            end
            object btnLoadPic: TButton
              Left = 393
              Top = 7
              Width = 73
              Height = 25
              Caption = 'Load Picture'
              TabOrder = 3
              OnClick = btnLoadPicClick
            end
            object DBNavigator1: TDBNavigator
              Left = 1
              Top = 7
              Width = 240
              Height = 25
              DataSource = dsCategories
              Flat = True
              TabOrder = 0
            end
          end
        end
        inherited tsOptions: TTabSheet
          inherited FDGUIxFormsPanelTree1: TFDGUIxFormsPanelTree
            inherited frmUpdateOptions: TfrmFDGUIxFormsUpdateOptions
              Width = 616
            end
            inherited frmResourceOptions: TfrmFDGUIxFormsResourceOptions
              Width = 616
            end
            inherited frmFormatOptions: TfrmFDGUIxFormsFormatOptions
              Width = 616
            end
            inherited frmFetchOptions: TfrmFDGUIxFormsFetchOptions
              Width = 616
            end
          end
        end
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 551
    ExplicitTop = 551
  end
  inherited StatusBar1: TStatusBar
    Top = 588
    ExplicitTop = 588
  end
  object qCategories: TFDQuery
    Connection = dmlMainComp.dbMain
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    SQL.Strings = (
      'select * from {id Categories}')
    Left = 312
    Top = 256
    object qCategoriesCategoryID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CategoryID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qCategoriesCategoryName: TStringField
      FieldName = 'CategoryName'
      Required = True
      Size = 15
    end
    object qCategoriesDescription: TMemoField
      FieldName = 'Description'
      BlobType = ftMemo
    end
    object qCategoriesPicture: TBlobField
      FieldName = 'Picture'
    end
  end
  object dsCategories: TDataSource
    DataSet = qCategories
    OnDataChange = dsCategoriesDataChange
    Left = 344
    Top = 256
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'bmp'
    Filter = 'Bitmap files (*.bmp)|*.bmp|All files (*.*)|*.*'
    Left = 311
    Top = 296
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'bmp'
    Filter = 'Bitmap files (*.bmp)|*.bmp|All files (*.*)|*.*'
    Left = 344
    Top = 296
  end
end
