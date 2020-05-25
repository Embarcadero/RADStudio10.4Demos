object CMServerForm: TCMServerForm
  Left = 0
  Top = 0
  ActiveControl = ConnectionsList
  Caption = 'Monitor Connections Server'
  ClientHeight = 249
  ClientWidth = 487
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 450
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    487
    249)
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 39
    Width = 151
    Height = 14
    Caption = 'Active TCP/IP Connections:'
  end
  object Label2: TLabel
    Left = 279
    Top = 39
    Width = 87
    Height = 14
    Anchors = [akTop, akRight]
    Caption = 'Active Sessions:'
  end
  object KAIdleLabel: TLabel
    Left = 279
    Top = 227
    Width = 138
    Height = 14
    Anchors = [akRight, akBottom]
    Caption = 'KeepAlive Idle time (ms):'
    Enabled = False
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 159
    Height = 14
    Caption = 'Hit count window (minutes):'
  end
  object Label4: TLabel
    Left = 240
    Top = 8
    Width = 125
    Height = 14
    Caption = 'Max. allowed requests:'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 31
    Width = 471
    Height = 2
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object Label6: TLabel
    Left = 8
    Top = 222
    Width = 137
    Height = 19
    Anchors = [akLeft, akBottom]
    Caption = 'DataSnap Server'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ConnectionsList: TListBox
    Left = 8
    Top = 56
    Width = 265
    Height = 152
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 14
    PopupMenu = KeepAlivePopup
    TabOrder = 0
    OnClick = ConnectionsListClick
    OnContextPopup = ConnectionsListContextPopup
  end
  object SessionIdList: TListBox
    Left = 279
    Top = 56
    Width = 200
    Height = 152
    Anchors = [akTop, akRight, akBottom]
    ItemHeight = 14
    TabOrder = 1
    OnClick = SessionIdListClick
  end
  object useKeepAliveCheck: TCheckBox
    Left = 173
    Top = 224
    Width = 100
    Height = 17
    Alignment = taLeftJustify
    Anchors = [akRight, akBottom]
    BiDiMode = bdLeftToRight
    Caption = 'Use KeepAlive'
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = useKeepAliveCheckClick
  end
  object KAIdleMS: TEdit
    Left = 423
    Top = 221
    Width = 56
    Height = 22
    Anchors = [akRight, akBottom]
    Enabled = False
    NumbersOnly = True
    TabOrder = 3
    Text = '5000'
  end
  object thrashCountEdit: TEdit
    Left = 173
    Top = 5
    Width = 41
    Height = 22
    Alignment = taCenter
    NumbersOnly = True
    TabOrder = 4
    Text = '1'
    OnChange = thrashCountEditChange
  end
  object maxRequestsEdit: TEdit
    Left = 371
    Top = 5
    Width = 48
    Height = 22
    NumbersOnly = True
    TabOrder = 5
    Text = '50'
    OnChange = maxRequestsEditChange
  end
  object thrashUpdate: TButton
    Left = 425
    Top = 5
    Width = 54
    Height = 23
    Caption = 'update'
    Enabled = False
    TabOrder = 6
    OnClick = thrashUpdateClick
  end
  object KeepAlivePopup: TPopupMenu
    Left = 224
    Top = 96
    object EnableKAItem: TMenuItem
      Caption = 'Enable keep-alive'
      OnClick = EnableKAItemClick
    end
    object DisableKAItem: TMenuItem
      Caption = 'Disable keep-alive'
      OnClick = DisableKAItemClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object closeConnItem: TMenuItem
      Caption = 'Close Connection'
      OnClick = closeConnItemClick
    end
  end
end
