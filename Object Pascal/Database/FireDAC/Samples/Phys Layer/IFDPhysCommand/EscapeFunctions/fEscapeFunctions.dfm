inherited frmEscapeFunctions: TfrmEscapeFunctions
  Left = 344
  Top = 177
  Caption = 'Escape functions'
  ClientHeight = 412
  ClientWidth = 1043
  ExplicitWidth = 1061
  ExplicitHeight = 457
  PixelsPerInch = 120
  TextHeight = 17
  inherited pnlTitle: TPanel
    Width = 1043
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    ExplicitWidth = 552
    inherited bvlTitle: TBevel
      Width = 967
      Margins.Left = 9
      Margins.Top = 9
      Margins.Right = 9
      Margins.Bottom = 9
      ExplicitWidth = 659
    end
    inherited imgAnyDAC: TImage
      Left = 967
      Margins.Left = 9
      Margins.Top = 9
      Margins.Right = 9
      Margins.Bottom = 9
      ExplicitLeft = 659
    end
    inherited lblTitle: TLabel
      Width = 237
      Margins.Left = 9
      Margins.Top = 9
      Margins.Right = 9
      Margins.Bottom = 9
      Caption = 'Escape functions'
      ExplicitWidth = 237
    end
  end
  inherited pnlMain: TPanel
    Width = 1043
    Height = 295
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    ExplicitWidth = 552
    ExplicitHeight = 227
    inherited pnlConnection: TPanel
      Width = 1043
      Height = 200
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitWidth = 552
      ExplicitHeight = 200
      inherited lblUseConnectionDef: TLabel
        Margins.Left = 7
        Margins.Top = 7
        Margins.Right = 7
        Margins.Bottom = 7
      end
      inherited cbDB: TComboBox
        Margins.Left = 7
        Margins.Top = 7
        Margins.Right = 7
        Margins.Bottom = 7
        TabOrder = 3
      end
      object edtFunctions: TLabeledEdit
        Left = 85
        Top = 73
        Width = 564
        Height = 25
        Hint = 'Click right button for look popup menu'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        EditLabel.Width = 58
        EditLabel.Height = 17
        EditLabel.Margins.Left = 4
        EditLabel.Margins.Top = 4
        EditLabel.Margins.Right = 4
        EditLabel.Margins.Bottom = 4
        EditLabel.Caption = 'Function:'
        Enabled = False
        LabelPosition = lpLeft
        ParentShowHint = False
        PopupMenu = pmnFunc
        ShowHint = True
        TabOrder = 0
        Text = 'INSERT('#39'apple tree'#39', 1, 5, '#39'orange'#39')'
        OnKeyPress = edtFunctionsKeyPress
      end
      object edtResult: TLabeledEdit
        Left = 85
        Top = 152
        Width = 301
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        EditLabel.Width = 42
        EditLabel.Height = 17
        EditLabel.Margins.Left = 4
        EditLabel.Margins.Top = 4
        EditLabel.Margins.Right = 4
        EditLabel.Margins.Bottom = 4
        EditLabel.Caption = 'Result:'
        Enabled = False
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object edtSQLstr: TLabeledEdit
        Left = 85
        Top = 112
        Width = 564
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        EditLabel.Width = 68
        EditLabel.Height = 17
        EditLabel.Margins.Left = 4
        EditLabel.Margins.Top = 4
        EditLabel.Margins.Right = 4
        EditLabel.Margins.Bottom = 4
        EditLabel.Caption = 'SQL string:'
        Enabled = False
        LabelPosition = lpLeft
        ReadOnly = True
        TabOrder = 2
        Text = 
          'select distinct {fn INSERT('#39'apple tree'#39', 1, 5, '#39'orange'#39')} from {' +
          'id Shippers}'
      end
    end
    inherited Console: TMemo
      Top = 190
      Width = 1212
      Height = 215
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Color = clInfoBk
      Lines.Strings = (
        
          'Press right mouse button in "Function" edit box and choose escap' +
          'e '
        
          'function example. Also, you can enter text by hands into "Functi' +
          'on" '
        'edit box and press Enter.')
      ScrollBars = ssNone
      ExplicitTop = 190
      ExplicitWidth = 721
      ExplicitHeight = 147
    end
  end
  inherited pnlButtons: TPanel
    Top = 364
    Width = 1043
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    ExplicitTop = 296
    ExplicitWidth = 552
    inherited bvlButtons: TBevel
      Width = 1043
      Margins.Left = 9
      Margins.Top = 9
      Margins.Right = 9
      Margins.Bottom = 9
      ExplicitWidth = 735
    end
    inherited lblInfo: TLabel
      Margins.Left = 9
      Margins.Top = 9
      Margins.Right = 9
      Margins.Bottom = 9
    end
    inherited imgInfo: TImage
      Margins.Left = 9
      Margins.Top = 9
      Margins.Right = 9
      Margins.Bottom = 9
    end
    inherited btnClose: TButton
      Left = 1121
      Margins.Left = 9
      Margins.Top = 9
      Margins.Right = 9
      Margins.Bottom = 9
      ExplicitLeft = 630
    end
  end
  object pmnFunc: TPopupMenu
    MenuAnimation = [maLeftToRight]
    Left = 320
    Top = 184
    object C1: TMenuItem
      Caption = 'Character'
      object ASCIIA1: TMenuItem
        Caption = 'ASCII('#39'A'#39')'
        OnClick = MenuItemClick
      end
      object BITLENGTHabcde1: TMenuItem
        Caption = 'BIT_LENGTH('#39'abcde'#39')'
        OnClick = MenuItemClick
      end
      object CHAR451: TMenuItem
        Caption = 'CHAR(45)'
        OnClick = MenuItemClick
      end
      object CHARLENGTHabc1: TMenuItem
        Caption = 'CHAR_LENGTH('#39'abc'#39')'
        OnClick = MenuItemClick
      end
      object CONCATabcde1: TMenuItem
        Caption = 'CONCAT('#39'abc'#39', '#39'de'#39')'
        OnClick = MenuItemClick
      end
      object DIFFERENCEapplestrees1: TMenuItem
        Caption = 'DIFFERENCE('#39'apples'#39', '#39'trees'#39')'
        OnClick = MenuItemClick
      end
      object INSERTappletree15orange1: TMenuItem
        Caption = 'INSERT('#39'apple tree'#39', 1, 5, '#39'orange'#39')'
        OnClick = MenuItemClick
      end
      object LCASEAbCde1: TMenuItem
        Caption = 'LCASE('#39'AbCde'#39')'
        OnClick = MenuItemClick
      end
      object LEFTAbCde31: TMenuItem
        Caption = 'LEFT('#39'AbCde'#39', 3)'
        OnClick = MenuItemClick
      end
      object LENGTHabc1: TMenuItem
        Caption = 'LENGTH('#39'abc'#39')'
        OnClick = MenuItemClick
      end
      object LOCATEgaggregate41: TMenuItem
        Caption = 'LOCATE('#39'g'#39', '#39'aggregate'#39', 4)'
        OnClick = MenuItemClick
      end
      object LTRIMabcde1: TMenuItem
        Caption = 'LTRIM('#39' abcde'#39')'
        OnClick = MenuItemClick
      end
      object POSITIONagreedisagree1: TMenuItem
        Caption = 'POSITION('#39'agree'#39', '#39'disagree'#39')'
        OnClick = MenuItemClick
      end
      object OCTETLENGTHabcde1: TMenuItem
        Caption = 'OCTET_LENGTH('#39'abcde'#39')'
        OnClick = MenuItemClick
      end
      object REPEATbla31: TMenuItem
        Caption = 'REPEAT('#39'bla'#39', 3)'
        OnClick = MenuItemClick
      end
      object REPLACE222abcd231: TMenuItem
        Caption = 'REPLACE('#39'222abcd'#39', '#39'2'#39', '#39'3'#39')'
        OnClick = MenuItemClick
      end
      object RIGHTAbCde31: TMenuItem
        Caption = 'RIGHT('#39'AbCde'#39', 3)'
        OnClick = MenuItemClick
      end
      object RTRIMabcde1: TMenuItem
        Caption = 'RTRIM('#39'abcde '#39')'
        OnClick = MenuItemClick
      end
      object SOUNDEXapples1: TMenuItem
        Caption = 'SOUNDEX('#39'apples'#39')'
        OnClick = MenuItemClick
      end
      object SPACE41: TMenuItem
        Caption = 'SPACE(4)'#39', '#39'    '#39')'
        OnClick = MenuItemClick
      end
      object SUBSTRINGAbcde231: TMenuItem
        Caption = 'SUBSTRING('#39'Abcde'#39', 2, 3)'
        OnClick = MenuItemClick
      end
      object UCASEabcde1: TMenuItem
        Caption = 'UCASE('#39'abcde'#39')'
        OnClick = MenuItemClick
      end
    end
    object N1: TMenuItem
      Caption = 'Numeric'
      object ABS351: TMenuItem
        Caption = 'ABS(-35)'
        OnClick = MenuItemClick
      end
      object ACOS051: TMenuItem
        Caption = 'ACOS(0.5)'
        OnClick = MenuItemClick
      end
      object ASIN051: TMenuItem
        Caption = 'ASIN(0.5)'
        OnClick = MenuItemClick
      end
      object ATAN051: TMenuItem
        Caption = 'ATAN(0.5)'
        OnClick = MenuItemClick
      end
      object CEILING281: TMenuItem
        Caption = 'CEILING(-2.8)'
        OnClick = MenuItemClick
      end
      object COS21: TMenuItem
        Caption = 'COS(2)'
        OnClick = MenuItemClick
      end
      object DEGREESfnPI1: TMenuItem
        Caption = 'DEGREES({fn PI()})'
        OnClick = MenuItemClick
      end
      object EXP21: TMenuItem
        Caption = 'EXP(2)'
        OnClick = MenuItemClick
      end
      object FLOOR281: TMenuItem
        Caption = 'FLOOR(-2.8)'
        OnClick = MenuItemClick
      end
      object LOG101001: TMenuItem
        Caption = 'LOG10(100)'
        OnClick = MenuItemClick
      end
      object MOD641: TMenuItem
        Caption = 'MOD(6, 4)'
        OnClick = MenuItemClick
      end
      object LOG451: TMenuItem
        Caption = 'LOG(45)'
        OnClick = MenuItemClick
      end
      object PI1: TMenuItem
        Caption = 'PI()'
        OnClick = MenuItemClick
      end
      object POWER251: TMenuItem
        Caption = 'POWER(2, 5)'
        OnClick = MenuItemClick
      end
      object RADIANS1801: TMenuItem
        Caption = 'RADIANS(180)'
        OnClick = MenuItemClick
      end
      object ROUND1511: TMenuItem
        Caption = 'ROUND(1.51)'
        OnClick = MenuItemClick
      end
      object SIGN51: TMenuItem
        Caption = 'SIGN(-5)'
        OnClick = MenuItemClick
      end
      object SIN31: TMenuItem
        Caption = 'SIN(3)'
        OnClick = MenuItemClick
      end
      object SQRT91: TMenuItem
        Caption = 'SQRT(9)'
        OnClick = MenuItemClick
      end
      object AN81: TMenuItem
        Caption = 'TAN(8)'
        OnClick = MenuItemClick
      end
      object RUNCATE12241: TMenuItem
        Caption = 'TRUNCATE(12.24)'
        OnClick = MenuItemClick
      end
    end
    object D1: TMenuItem
      Caption = 'Date and time'
      object DAYNAMEd200301011: TMenuItem
        Caption = 'DAYNAME({d '#39'2003-01-01'#39'})'
        OnClick = MenuItemClick
      end
      object DAYOFMONTHd200301011: TMenuItem
        Caption = 'DAYOFMONTH({d '#39'2003-01-01'#39'})'
        OnClick = MenuItemClick
      end
      object DAYOFWEEKd200401011: TMenuItem
        Caption = 'DAYOFWEEK({d '#39'2004-01-01'#39'})'
        OnClick = MenuItemClick
      end
      object DAYOFYEARd200302011: TMenuItem
        Caption = 'DAYOFYEAR({d '#39'2003-02-01'#39'})'
        OnClick = MenuItemClick
      end
      object EXTRACTdayd200301021: TMenuItem
        Caption = 'EXTRACT('#39'day'#39', {d '#39'2003-01-02'#39'})'
        OnClick = MenuItemClick
      end
      object EXTRACTmonthd200301011: TMenuItem
        Caption = 'EXTRACT('#39'month'#39', {d '#39'2003-01-01'#39'})'
        OnClick = MenuItemClick
      end
      object EXTRACTyeard200301011: TMenuItem
        Caption = 'EXTRACT('#39'year'#39', {d '#39'2003-01-01'#39'})'
        OnClick = MenuItemClick
      end
      object HOURt1120051: TMenuItem
        Caption = 'HOUR({t '#39'11:20:05'#39'})'
        OnClick = MenuItemClick
      end
      object MINUTEt1120051: TMenuItem
        Caption = 'MINUTE({t '#39'11:20:05'#39'})'
        OnClick = MenuItemClick
      end
      object MONTHd200310011: TMenuItem
        Caption = 'MONTH({d '#39'2003-10-01'#39'})'
        OnClick = MenuItemClick
      end
      object MONTHNAMEd200301011: TMenuItem
        Caption = 'MONTHNAME({d '#39'2003-01-01'#39'})'
        OnClick = MenuItemClick
      end
      object QUARTERd200301021: TMenuItem
        Caption = 'QUARTER({d '#39'2003-01-02'#39'})'
        OnClick = MenuItemClick
      end
      object SECONDt1120051: TMenuItem
        Caption = 'SECOND({t '#39'11:20:05'#39'})'
        OnClick = MenuItemClick
      end
      object IMESTAMPADDday1d200301021: TMenuItem
        Caption = 'TIMESTAMPADD('#39'day'#39', 1, {d '#39'2003-01-02'#39'})'
        OnClick = MenuItemClick
      end
      object IMESTAMPADDmonth1d200301021: TMenuItem
        Caption = 'TIMESTAMPADD('#39'month'#39', 1, {d '#39'2003-01-02'#39'})'
        OnClick = MenuItemClick
      end
      object IMESTAMPADDweek1d200301021: TMenuItem
        Caption = 'TIMESTAMPADD('#39'week'#39', 1, {d '#39'2003-01-02'#39'})'
        OnClick = MenuItemClick
      end
      object IMESTAMPADDyear1d200301021: TMenuItem
        Caption = 'TIMESTAMPADD('#39'year'#39', 1, {d '#39'2003-01-02'#39'})'
        OnClick = MenuItemClick
      end
      object IMESTAMPDIFFdayd20030101d200301021: TMenuItem
        Caption = 'TIMESTAMPDIFF('#39'day'#39', {d '#39'2003-01-01'#39'}, {d '#39'2003-01-02'#39'})'
        OnClick = MenuItemClick
      end
      object IMESTAMPDIFFmonthd20030102d200302021: TMenuItem
        Caption = 'TIMESTAMPDIFF('#39'month'#39', {d '#39'2003-01-02'#39'}, {d '#39'2003-02-02'#39'})'
        OnClick = MenuItemClick
      end
      object IMESTAMPDIFFweekd20030102d200301091: TMenuItem
        Caption = 'TIMESTAMPDIFF('#39'week'#39', {d '#39'2003-01-02'#39'}, {d '#39'2003-01-09'#39'})'
        OnClick = MenuItemClick
      end
      object IMESTAMPDIFFyeard20030102d200501021: TMenuItem
        Caption = 'TIMESTAMPDIFF('#39'year'#39', {d '#39'2003-01-02'#39'}, {d '#39'2005-01-02'#39'})'
        OnClick = MenuItemClick
      end
      object WEEKd200301021: TMenuItem
        Caption = 'WEEK({d '#39'2003-01-02'#39'})'
        OnClick = MenuItemClick
      end
      object YEARd200310011: TMenuItem
        Caption = 'YEAR({d '#39'2003-10-01'#39'})'
        OnClick = MenuItemClick
      end
    end
    object S1: TMenuItem
      Caption = 'System'
      object DECODE231241: TMenuItem
        Caption = 'DECODE(2, 3, 1, 2, 4)'
        OnClick = MenuItemClick
      end
      object IF12341: TMenuItem
        Caption = 'IF(1>2, 3, 4)'
        OnClick = MenuItemClick
      end
      object IF12342: TMenuItem
        Caption = 'IF(1<2, 3, 4)'
        OnClick = MenuItemClick
      end
      object IFNULLNULLorange1: TMenuItem
        Caption = 'IFNULL(NULL, '#39'orange'#39')'
        OnClick = MenuItemClick
      end
    end
  end
end
