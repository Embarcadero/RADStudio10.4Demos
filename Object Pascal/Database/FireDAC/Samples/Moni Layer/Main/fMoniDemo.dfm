inherited frmMoniDemo: TfrmMoniDemo
  Left = 344
  Top = 300
  Caption = 'Moni main demo'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
      inherited pnlTitle: TPanel
        inherited lblTitle: TLabel
          Width = 173
          Caption = 'Moni main demo'
        end
      end
      inherited pnlMain: TPanel
        object Button1: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Activate'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 96
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Destroy'
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 8
          Top = 32
          Width = 75
          Height = 25
          Caption = 'Activate'
          TabOrder = 2
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 8
          Top = 56
          Width = 75
          Height = 25
          Caption = 'Activate'
          TabOrder = 3
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 8
          Top = 80
          Width = 75
          Height = 25
          Caption = 'Activate'
          TabOrder = 4
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 8
          Top = 104
          Width = 75
          Height = 25
          Caption = 'Activate'
          TabOrder = 5
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 8
          Top = 128
          Width = 75
          Height = 25
          Caption = 'Activate'
          TabOrder = 6
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 96
          Top = 32
          Width = 75
          Height = 25
          Caption = 'Destroy'
          TabOrder = 7
          OnClick = Button8Click
        end
        object Button9: TButton
          Left = 96
          Top = 56
          Width = 75
          Height = 25
          Caption = 'Destroy'
          TabOrder = 8
          OnClick = Button9Click
        end
        object Button10: TButton
          Left = 96
          Top = 80
          Width = 75
          Height = 25
          Caption = 'Destroy'
          TabOrder = 9
          OnClick = Button10Click
        end
        object Button11: TButton
          Left = 96
          Top = 104
          Width = 75
          Height = 25
          Caption = 'Destroy'
          TabOrder = 10
          OnClick = Button11Click
        end
        object Button12: TButton
          Left = 96
          Top = 128
          Width = 75
          Height = 25
          Caption = 'Destroy'
          TabOrder = 11
          OnClick = Button12Click
        end
        object Button13: TButton
          Left = 184
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Pause'
          TabOrder = 12
          OnClick = Button13Click
        end
        object Button14: TButton
          Left = 8
          Top = 168
          Width = 75
          Height = 25
          Caption = 'Crach'
          TabOrder = 13
          OnClick = Button14Click
        end
      end
  object FDMoniRemoteClientLink1: TFDMoniRemoteClientLink
    Left = 196
    Top = 112
  end
end
