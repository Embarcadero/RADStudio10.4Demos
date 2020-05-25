inherited frmGetFieldNames: TfrmGetFieldNames
  Left = 320
  Top = 156
  Width = 561
  Height = 594
  Caption = 'GetFieldName and GetTableNames'
  Font.Name = 'MS Sans Serif'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 553
    inherited bvlTitle: TBevel
      Width = 495
    end
    inherited imgAnyDAC: TImage
      Left = 495
    end
    inherited lblTitle: TLabel
      Width = 170
      Caption = 'Get Field Names'
    end
  end
  inherited pnlMain: TPanel
    Width = 553
    Height = 451
    BorderWidth = 1
    object Label1: TLabel [0]
      Left = 5
      Top = 48
      Width = 32
      Height = 13
      Alignment = taCenter
      Caption = 'Tables'
    end
    object Label2: TLabel [1]
      Left = 270
      Top = 48
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fields'
    end
    object Label3: TLabel [2]
      Left = 7
      Top = 332
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Key Fields'
    end
    inherited pnlConnection: TPanel
      Left = 1
      Top = 1
      Width = 551
      Height = 44
      TabOrder = 2
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
    end
    object lbxTables: TListBox
      Left = 7
      Top = 64
      Width = 257
      Height = 262
      Anchors = [akLeft, akTop, akBottom]
      ItemHeight = 13
      Items.Strings = (
        '')
      Sorted = True
      TabOrder = 1
      OnClick = lbxTablesClick
    end
    object lbxFields: TListBox
      Left = 269
      Top = 64
      Width = 278
      Height = 262
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      Items.Strings = (
        '')
      TabOrder = 3
    end
    object lbxKeyFields: TListBox
      Left = 7
      Top = 351
      Width = 539
      Height = 91
      Anchors = [akLeft, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 0
    end
  end
  inherited pnlButtons: TPanel
    Top = 504
    Width = 553
    inherited bvlButtons: TBevel
      Width = 553
    end
    inherited btnClose: TButton
      Left = 474
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 541
    Width = 553
  end
end
