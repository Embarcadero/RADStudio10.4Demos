object ProposalForm: TProposalForm
  Left = 0
  Top = 0
  Caption = 'Proposal'
  ClientHeight = 631
  ClientWidth = 840
  Color = clBtnFace
  CustomTitleBar.Height = 0
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser: TWebBrowser
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 834
    Height = 584
    Align = alClient
    TabOrder = 0
    ExplicitTop = 8
    ExplicitHeight = 656
    ControlData = {
      4C000000325600005C3C00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object NavPanel: TPanel
    Left = 0
    Top = 590
    Width = 840
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 667
    object CompleteButton: TButton
      AlignWithMargins = True
      Left = 710
      Top = 3
      Width = 127
      Height = 35
      Align = alRight
      Caption = 'Complete'
      TabOrder = 0
      OnClick = CompleteButtonClick
    end
    object CloseButton: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 133
      Height = 35
      Align = alLeft
      Cancel = True
      Caption = 'Close'
      TabOrder = 1
      OnClick = CloseButtonClick
    end
  end
end
