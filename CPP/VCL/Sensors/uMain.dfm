object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'VCL Sensors'
  ClientHeight = 405
  ClientWidth = 647
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
    Left = 497
    Top = 0
    Width = 150
    Height = 405
    Align = alRight
    Caption = ' Manage '
    TabOrder = 1
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
    Width = 497
    Height = 405
    Align = alClient
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 495
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
      Width = 495
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
      Width = 495
      Height = 96
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
    Top = 327
  end
  object osInclinometer: TOrientationSensor
    OnSensorChoosing = osInclinometerSensorChoosing
    Left = 328
    Top = 239
  end
  object tOrientation: TTimer
    Interval = 100
    OnTimer = tOrientationTimer
    Left = 224
    Top = 207
  end
  object tMotion: TTimer
    Interval = 100
    OnTimer = tMotionTimer
    Left = 32
    Top = 232
  end
end
