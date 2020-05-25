object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'VCL Sensors'
  ClientHeight = 466
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 48
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object GroupBox4: TGroupBox
    Left = 467
    Top = 0
    Width = 150
    Height = 466
    Align = alRight
    Caption = ' Manage '
    TabOrder = 1
    ExplicitLeft = 547
    ExplicitTop = 264
    object bSwitch: TButton
      Left = 18
      Top = 24
      Width = 111
      Height = 81
      Caption = 'Turn On'
      TabOrder = 0
      OnClick = bSwitchClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 467
    Height = 466
    Align = alClient
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 465
      Height = 145
      Align = alTop
      Caption = ' Location '
      TabOrder = 0
      object lCoordinates: TLabel
        Left = 16
        Top = 23
        Width = 3
        Height = 13
      end
      object lAddress: TLabel
        Left = 16
        Top = 60
        Width = 3
        Height = 13
      end
      object lGeoCoordinates: TLabel
        Left = 16
        Top = 99
        Width = 3
        Height = 13
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 146
      Width = 465
      Height = 162
      Align = alTop
      Caption = ' Motion '
      TabOrder = 1
      object lAccel: TLabel
        Left = 34
        Top = 45
        Width = 27
        Height = 13
        Caption = 'lAccel'
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 308
      Width = 465
      Height = 157
      Align = alClient
      Caption = ' Orientation '
      TabOrder = 2
      object lCompass: TLabel
        Left = 34
        Top = 31
        Width = 45
        Height = 13
        Caption = 'lCompass'
      end
      object lInclinometr: TLabel
        Left = 241
        Top = 31
        Width = 55
        Height = 13
        Caption = 'lInclinometr'
      end
    end
  end
  object lsLocation: TLocationSensor
    OnLocationChanged = lsLocationLocationChanged
    Left = 168
    Top = 40
  end
  object msAccelerometr: TMotionSensor
    OnSensorChoosing = msAccelerometrSensorChoosing
    Left = 128
    Top = 241
  end
  object osCompass: TOrientationSensor
    OnSensorChoosing = osCompassSensorChoosing
    Left = 176
    Top = 379
  end
  object osInclinometer: TOrientationSensor
    OnSensorChoosing = osInclinometerSensorChoosing
    Left = 288
    Top = 379
  end
  object tOrientation: TTimer
    Interval = 100
    OnTimer = tOrientationTimer
    Left = 48
    Top = 376
  end
  object tMotion: TTimer
    Interval = 100
    OnTimer = tMotionTimer
    Left = 32
    Top = 232
  end
end
