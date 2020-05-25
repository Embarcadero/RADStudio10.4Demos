inherited frmNested: TfrmNested
  Left = 332
  Top = 321
  Caption = 'FDMemTable nested dataset'
  ClientHeight = 393
  ClientWidth = 517
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = True
  OnCreate = FormCreate
  ExplicitWidth = 533
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 517
    ExplicitWidth = 517
    inherited bvlTitle: TBevel
      Width = 459
      ExplicitWidth = 467
    end
    inherited imgAnyDAC: TImage
      Left = 459
      ExplicitLeft = 467
    end
    inherited lblTitle: TLabel
      Width = 164
      Caption = 'Nested DataSet'
      ExplicitWidth = 164
    end
  end
  inherited pnlMain: TPanel
    Width = 517
    Height = 303
    ExplicitWidth = 517
    ExplicitHeight = 303
    object DBGrid1: TDBGrid
      Left = 0
      Top = 41
      Width = 517
      Height = 262
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 517
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
    end
  end
  inherited pnlButtons: TPanel
    Top = 356
    Width = 517
    ExplicitTop = 356
    ExplicitWidth = 517
    inherited bvlButtons: TBevel
      Width = 517
      ExplicitWidth = 525
    end
    inherited lblInfo: TLabel
      Hint = 
        'http://docwiki.embarcadero.com/RADStudio/en/Working_with_DataSet' +
        's_(FireDAC)'
    end
    inherited btnClose: TButton
      Left = 434
      Top = 6
      ExplicitLeft = 434
      ExplicitTop = 6
    end
  end
  object Button1: TButton
    Left = 8
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Save to file'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 89
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Read a file'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 170
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Show copy'
    TabOrder = 5
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 
      'Binary files|*.fds|XML files|*.xml|JSON files|*.json|All files|*' +
      '.*'
    Left = 240
    Top = 144
  end
  object SaveDialog1: TSaveDialog
    Filter = 
      'Binary files|*.fds|XML files|*.xml|JSON files|*.json|All files|*' +
      '.*'
    Left = 328
    Top = 144
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 304
    Top = 280
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 240
    Top = 192
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 240
    Top = 237
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 240
    Top = 285
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 72
    Top = 160
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 72
    Top = 216
  end
  object FDMemTable2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 152
    Top = 160
  end
end
