inherited frmMainLayers: TfrmMainLayers
  Left = 466
  Top = 279
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    object Console: TMemo
      Left = 6
      Top = 46
      Width = 617
      Height = 260
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
    end
  end
end
