object ClientUIForm: TClientUIForm
  Left = 867
  Top = 0
  Caption = 'Monitor Connections Client'
  ClientHeight = 227
  ClientWidth = 384
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  DesignSize = (
    384
    227)
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 116
    Height = 14
    Caption = 'Hammer server every'
  end
  object Label2: TLabel
    Left = 187
    Top = 40
    Width = 66
    Height = 14
    Caption = 'milliseconds.'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 83
    Height = 14
    Caption = 'HOST SERVER:'
  end
  object Label4: TLabel
    Left = 208
    Top = 8
    Width = 69
    Height = 14
    Caption = 'TCP/IP Port:'
  end
  object ReqCountLabel: TLabel
    Left = 8
    Top = 208
    Width = 96
    Height = 14
    Anchors = [akLeft, akBottom]
    Caption = 'Request count: 0'
  end
  object Label6: TLabel
    Left = 231
    Top = 208
    Width = 145
    Height = 19
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'Client Application'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object HammerEdit: TEdit
    Left = 128
    Top = 37
    Width = 53
    Height = 22
    Alignment = taCenter
    NumbersOnly = True
    TabOrder = 3
    Text = '1000'
  end
  object IOMemo: TMemo
    Left = 8
    Top = 66
    Width = 368
    Height = 136
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Hello world, this is a line of text to reverse.')
    PopupMenu = CMPopupMenu
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object startButton: TButton
    Left = 278
    Top = 35
    Width = 98
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'START'
    TabOrder = 0
    OnClick = startButtonClick
  end
  object HostEdit: TEdit
    Left = 97
    Top = 5
    Width = 105
    Height = 22
    TabOrder = 1
    Text = '127.0.0.1'
  end
  object PortEdit: TEdit
    Left = 278
    Top = 5
    Width = 49
    Height = 22
    NumbersOnly = True
    TabOrder = 2
    Text = '211'
  end
  object CMPopupMenu: TPopupMenu
    Left = 288
    Top = 128
    object ClearLogItem: TMenuItem
      Caption = 'Clear'
      OnClick = ClearLogItemClick
    end
  end
end
