object Form30: TForm30
  Left = 0
  Top = 0
  Caption = 'Form30'
  ClientHeight = 286
  ClientWidth = 426
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
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Adapter = FDTableAdapter1
    Left = 25
    Top = 10
  end
  object FDTableAdapter1: TFDTableAdapter
    SelectCommand = FDCommand1
    Left = 65
    Top = 10
  end
  object FDCommand1: TFDCommand
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    CommandText.Strings = (
      'select * from Orders where EmployeeID = :ID')
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 100
    Top = 10
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_Demo')
    Left = 100
    Top = 50
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 15
    Top = 100
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    ScreenCursor = gcrHourGlass
    Left = 45
    Top = 100
  end
end
