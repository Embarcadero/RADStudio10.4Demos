inherited frmCalculatedColumnsFuncs: TfrmCalculatedColumnsFuncs
  Left = 302
  Top = 209
  Width = 712
  Height = 417
  Caption = 'Calculated columns with functions'
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 704
    inherited bvlTitle: TBevel
      Width = 646
    end
    inherited imgAnyDAC: TImage
      Left = 646
    end
    inherited lblTitle: TLabel
      Width = 318
      Caption = 'Calculated columns with funcs'
    end
  end
  inherited pnlMain: TPanel
    Width = 704
    Height = 293
    inherited pnlControlButtons: TPanel
      Width = 704
      Height = 113
      BorderWidth = 11
      object edtExpr: TLabeledEdit
        Left = 65
        Top = 7
        Width = 542
        Height = 21
        Hint = 'Click right button for look popup menu'
        EditLabel.Width = 56
        EditLabel.Height = 13
        EditLabel.Caption = 'Expression:'
        LabelPosition = lpLeft
        ParentShowHint = False
        PopupMenu = pmnFunc
        ShowHint = True
        TabOrder = 0
        OnKeyPress = edtExprKeyPress
      end
      object edtStr: TLabeledEdit
        Left = 43
        Top = 83
        Width = 564
        Height = 21
        EditLabel.Width = 34
        EditLabel.Height = 13
        EditLabel.Caption = 'Result:'
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object rgDataType: TRadioGroup
        Left = 6
        Top = 33
        Width = 602
        Height = 39
        Caption = 'Set data type of Result'
        Columns = 6
        ItemIndex = 4
        Items.Strings = (
          'AnsiString'
          'WideString'
          'DateTime'
          'Integer'
          'Double')
        TabOrder = 2
      end
    end
    inherited Console: TMemo
      Top = 113
      Width = 704
      Height = 180
      Color = clInfoBk
      Lines.Strings = (
        
          'Click right mouse button on the "Expression" edit box for popup ' +
          'menu and select any '
        
          'function. In the "Result" edit box it will be shown a result of ' +
          'the selected function. '
        
          'If you wish try input a function by hands you must set data type' +
          ' of the result value. '
        
          'For example: you wish know current time, then you input '#39'curtime' +
          #39' and select result '
        
          'data type DateTime in the radio buttons group. After inputing pr' +
          'ess Enter in '
        'Expression Edit for submiting your function.'
        ''
        ''
        
          'Note: If the specified data type does not match to an actual exp' +
          'ression result data '
        
          'type, then "[FireDAC][Stan][Eval]-104. Type mismatch in expressio' +
          'n." will be raised.')
      ScrollBars = ssNone
    end
  end
  inherited pnlButtons: TPanel
    Top = 346
    Width = 704
    inherited bvlButtons: TBevel
      Width = 704
    end
    inherited btnClose: TButton
      Left = 625
    end
  end
  object pmnFunc: TPopupMenu
    MenuAnimation = [maLeftToRight]
    Left = 512
    Top = 56
    object Numeric1: TMenuItem
      Caption = 'Numeric'
      object ABS1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'ABS(-259)'
        OnClick = MenuItemClick
      end
      object COS1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'COS(3.1415926535)'
        OnClick = MenuItemClick
      end
      object CEIL1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'CEIL(-2.8)'
        OnClick = MenuItemClick
      end
      object COSH1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'COSH(2)'
        OnClick = MenuItemClick
      end
      object EXP1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'EXP(3)'
        OnClick = MenuItemClick
      end
      object FLOOR1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'FLOOR(-2.8)'
        OnClick = MenuItemClick
      end
      object LN1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'LN(4)'
        OnClick = MenuItemClick
      end
      object LOG1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'LOG(3, 45)'
        OnClick = MenuItemClick
      end
      object MOD1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'MOD(6, 4)'
        OnClick = MenuItemClick
      end
      object POWER1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'POWER(2, 5)'
        OnClick = MenuItemClick
      end
      object ROUND1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'ROUND(2.345)'
        OnClick = MenuItemClick
      end
      object SIGN1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'SIGN(-25)'
        OnClick = MenuItemClick
      end
      object SIN1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'SIN(-3.1415926535)'
        OnClick = MenuItemClick
      end
      object SINH1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'SINH(3)'
        OnClick = MenuItemClick
      end
      object SQRT1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'SQRT(9)'
        OnClick = MenuItemClick
      end
      object AN1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'TAN(1)'
        OnClick = MenuItemClick
      end
      object ANH1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'TANH(2)'
        OnClick = MenuItemClick
      end
      object RUNC1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'TRUNC(3563.224)'
        OnClick = MenuItemClick
      end
      object CHR1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'CHR(45)'
        OnClick = MenuItemClick
      end
      object ONUMBER1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'TO_NUMBER('#39'2598125'#39')'
        OnClick = MenuItemClick
      end
      object GREATEST1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'GREATEST(11, 2, 3, 10)'
        OnClick = MenuItemClick
      end
      object LEAST1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'LEAST(11, 2, 3, 10)'
        OnClick = MenuItemClick
      end
      object ACOS1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'ACOS(1)'
        OnClick = MenuItemClick
      end
      object ASIN1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'ASIN(0)'
        OnClick = MenuItemClick
      end
      object ATAN1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'ATAN(1)'
        OnClick = MenuItemClick
      end
      object ATAN21: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'ATAN2(1)'
        OnClick = MenuItemClick
      end
      object CEILING1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'CEILING(-3.4)'
        OnClick = MenuItemClick
      end
      object COT1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'COT(1)'
        OnClick = MenuItemClick
      end
      object DEGREES1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'DEGREES(PI)'
        OnClick = MenuItemClick
      end
      object LOG101: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'LOG10(100)'
        OnClick = MenuItemClick
      end
      object LOG102: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'PI'
        OnClick = MenuItemClick
      end
      object RADIANS1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'RADIANS(180)'
        OnClick = MenuItemClick
      end
      object RAND1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'RAND'
        OnClick = MenuItemClick
      end
      object RUNCATE1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'TRUNCATE(435.25)'
        OnClick = MenuItemClick
      end
    end
    object Character1: TMenuItem
      Caption = 'Character'
      object UPPERstr1: TMenuItem
        AutoCheck = True
        Caption = 'UPPER('#39'abcde'#39')'
        OnClick = MenuItemClick
      end
      object LOWERstr1: TMenuItem
        AutoCheck = True
        Caption = 'LOWER('#39'ABcdE'#39')'
        OnClick = MenuItemClick
      end
      object SUBSTRINGstrstartlen1: TMenuItem
        AutoCheck = True
        Caption = 'SUBSTRING('#39'Abcde'#39', 2, 3)'
        OnClick = MenuItemClick
      end
      object RIMstr1: TMenuItem
        AutoCheck = True
        Caption = 'TRIM('#39'    ABCDE  '#39')'
        OnClick = MenuItemClick
      end
      object RIMLEFTstr1: TMenuItem
        AutoCheck = True
        Caption = 'TRIMLEFT('#39'  ABC'#39')'
        OnClick = MenuItemClick
      end
      object RIMRIGHTstr1: TMenuItem
        AutoCheck = True
        Caption = 'TRIMRIGHT('#39'ABC   '#39')'
        OnClick = MenuItemClick
      end
      object CONCATstr1str21: TMenuItem
        AutoCheck = True
        Caption = 'CONCAT('#39'Hello '#39', '#39'world'#39')'
        OnClick = MenuItemClick
      end
      object INITCAPstr1: TMenuItem
        AutoCheck = True
        Caption = 'INITCAP('#39'hello'#39')'
        OnClick = MenuItemClick
      end
      object LPADstrpadlenpadstring1: TMenuItem
        AutoCheck = True
        Caption = 'LPAD('#39'abcde'#39', 8, '#39'R'#39')'
        OnClick = MenuItemClick
      end
      object LTRIMstr1: TMenuItem
        AutoCheck = True
        Caption = 'LTRIM('#39'  ABCDE'#39')'
        OnClick = MenuItemClick
      end
      object REPLACEstrstrtoreplreplstr1: TMenuItem
        AutoCheck = True
        Caption = 'REPLACE('#39'222abcd'#39', '#39'2'#39', '#39'3'#39')'
        OnClick = MenuItemClick
      end
      object RPADstrpadlenpadstr1: TMenuItem
        AutoCheck = True
        Caption = 'RPAD('#39'abcde'#39', 8, '#39'R'#39')'
        OnClick = MenuItemClick
      end
      object RTRIMstr1: TMenuItem
        AutoCheck = True
        Caption = 'RTRIM('#39'ABCDE   '#39')'
        OnClick = MenuItemClick
      end
      object SOUNDEXstr1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'SOUNDEX('#39'Apple'#39')'
        OnClick = MenuItemClick
      end
      object SUBSTRstrstartlen1: TMenuItem
        AutoCheck = True
        Caption = 'SUBSTR('#39'abcdef'#39', 3, 2)'
        OnClick = MenuItemClick
      end
      object RANSLATEstrstrtoreplreplstr1: TMenuItem
        AutoCheck = True
        Caption = 'TRANSLATE('#39'1abcd24'#39', '#39'124'#39', '#39'567'#39')'
        OnClick = MenuItemClick
      end
      object ASCIIsinglecharacter1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'ASCII('#39'A'#39')'
        OnClick = MenuItemClick
      end
      object INSTRstr1str2startnthapp1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'INSTR('#39'abecdefeh'#39', '#39'e'#39', 4, 2)'
        OnClick = MenuItemClick
      end
      object LENGTH1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'LENGTH('#39'ABCDE g'#39')'
        OnClick = MenuItemClick
      end
      object OCHAR1: TMenuItem
        AutoCheck = True
        Caption = 'TO_CHAR(1210.73, '#39'0.0'#39')'
        OnClick = MenuItemClick
      end
      object NVL1: TMenuItem
        AutoCheck = True
        Caption = 'NVL('#39#39', '#39'orange'#39')'
        OnClick = MenuItemClick
      end
      object CHAR1: TMenuItem
        AutoCheck = True
        Caption = 'CHAR(34)'
        OnClick = MenuItemClick
      end
      object CHARLENGTH1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'CHAR_LENGTH('#39'ABCDE'#39')'
        OnClick = MenuItemClick
      end
      object CHARACTERLENGTH1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'CHARACTER_LENGTH('#39'abc'#39')'
        OnClick = MenuItemClick
      end
      object DIFFERENCE1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'DIFFERENCE('#39'apples'#39', '#39'trees'#39')'
        OnClick = MenuItemClick
      end
      object INSERT1: TMenuItem
        AutoCheck = True
        Caption = 'INSERT('#39'apple tree'#39', 1, 5, '#39'orange'#39')'
        OnClick = MenuItemClick
      end
      object LCASE1: TMenuItem
        AutoCheck = True
        Caption = 'LCASE('#39'ABcdER'#39')'
        OnClick = MenuItemClick
      end
      object LEFT1: TMenuItem
        AutoCheck = True
        Caption = 'LEFT('#39'AbcDE'#39', 2)'
        OnClick = MenuItemClick
      end
      object LOCATE1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'LOCATE('#39'g'#39', '#39'aggregate'#39', 4)'
        OnClick = MenuItemClick
      end
      object OCTETLENGTH1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'OCTET_LENGTH('#39'abcdef'#39')'
        OnClick = MenuItemClick
      end
      object POSITIONstr1str21: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'POSITION('#39'agree'#39', '#39'disagree'#39')'
        OnClick = MenuItemClick
      end
      object REPEATstrcount1: TMenuItem
        AutoCheck = True
        Caption = 'REPEAT('#39'bla'#39', 4)'
        OnClick = MenuItemClick
      end
      object RIGHTstrlength1: TMenuItem
        AutoCheck = True
        Caption = 'RIGHT('#39'ABCDEF'#39', 3)'
        OnClick = MenuItemClick
      end
      object SPACEintexp1: TMenuItem
        AutoCheck = True
        Caption = 'SPACE(5)'
        OnClick = MenuItemClick
      end
      object UCASEstr1: TMenuItem
        AutoCheck = True
        Caption = 'UCASE('#39'abcDe'#39')'
        OnClick = MenuItemClick
      end
      object CONVERTvalueexpdatatype1: TMenuItem
        AutoCheck = True
        Caption = 'CONVERT('#39'CHAR'#39', 124)'
        OnClick = MenuItemClick
      end
    end
    object Dateandtime1: TMenuItem
      Caption = 'Date and time'
      object YEARdateexp1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'YEAR(NOW)'
        OnClick = MenuItemClick
      end
      object MONTHdateexp1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'MONTH(NOW)'
        OnClick = MenuItemClick
      end
      object DAYdateexp1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'DAY(NOW)'
        OnClick = MenuItemClick
      end
      object HOURdatetimeexp1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'HOUR(NOW)'
        OnClick = MenuItemClick
      end
      object MINUTEdatetimeexp1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'MINUTE(NOW)'
        OnClick = MenuItemClick
      end
      object SECONDdatetimeexp1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'SECOND(NOW)'
        OnClick = MenuItemClick
      end
      object GETDATE1: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'GETDATE'
        OnClick = MenuItemClick
      end
      object DATE1: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'DATE(NOW)'
        OnClick = MenuItemClick
      end
      object IME1: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'TIME(NOW)'
        OnClick = MenuItemClick
      end
      object daADDMONTHS1: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'ADD_MONTHS(Date(Now), 3)'
        OnClick = MenuItemClick
      end
      object MONTHSBETWEEN1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 
          'MONTHS_BETWEEN(TO_DATE('#39'2003-01-01'#39', '#39'yyyy/mm/dd'#39'), TO_DATE('#39'200' +
          '4-03-01'#39', '#39'yyyy/mm/dd'#39'))'
        OnClick = MenuItemClick
      end
      object LASTDAY1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'LAST_DAY(TO_DATE('#39'2003-01-01'#39', '#39'yyyy/mm/dd'#39'))'
        OnClick = MenuItemClick
      end
      object FIRSTDAY1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'FIRST_DAY(TO_DATE('#39'2003-01-02'#39', '#39'yyyy/mm/dd'#39'))'
        OnClick = MenuItemClick
      end
      object NEXTDAY1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'NEXT_DAY(TO_DATE('#39'2003-01-02'#39', '#39'yyyy/mm/dd'#39'), '#39#39')'
        OnClick = MenuItemClick
      end
      object SYSDATE1: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'SYSDATE'
        OnClick = MenuItemClick
      end
      object ODATE1: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'TO_DATE('#39'2003-01-01'#39', '#39'yyyy/mm/dd'#39')'
        OnClick = MenuItemClick
      end
      object CURRENTDATE1: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'CURRENT_DATE'
        OnClick = MenuItemClick
      end
      object CURRENTTIME1: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'CURRENT_TIME'
        OnClick = MenuItemClick
      end
      object CURRENTTIMESTAMP1: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'CURRENT_TIMESTAMP'
        OnClick = MenuItemClick
      end
      object CURDATE1: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'CURDATE'
        OnClick = MenuItemClick
      end
      object CURTIME1: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'CURTIME'
        OnClick = MenuItemClick
      end
      object DAYNAMEdateexp1: TMenuItem
        AutoCheck = True
        Caption = 'DAYNAME(TO_DATE('#39'2003-01-01'#39', '#39'yyyy/mm/dd'#39'))'
        OnClick = MenuItemClick
      end
      object DAYOFMONTHdateexp1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'DAYOFMONTH(TO_DATE('#39'2003-01-01'#39', '#39'yyyy/mm/dd'#39'))'
        OnClick = MenuItemClick
      end
      object DAYOFWEEKdateexp1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'DAYOFWEEK(TO_DATE('#39'2003-01-01'#39', '#39'yyyy/mm/dd'#39'))'
        OnClick = MenuItemClick
      end
      object DAYOFYEARdateexp1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'DAYOFYEAR(TO_DATE('#39'2003-02-01'#39', '#39'yyyy/mm/dd'#39'))'
        OnClick = MenuItemClick
      end
      object EXTRACTextractintervdateexp1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'EXTRACT('#39'year'#39', TO_DATE('#39'2003-01-01'#39', '#39'yyyy/mm/dd'#39'))'
        OnClick = MenuItemClick
      end
      object MONTHNAMEdateexp1: TMenuItem
        AutoCheck = True
        Caption = 'MONTHNAME(TO_DATE('#39'2003-01-01'#39', '#39'yyyy/mm/dd'#39'))'
        OnClick = MenuItemClick
      end
      object MONTHNAMEdateexp2: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'NOW'
        OnClick = MenuItemClick
      end
      object QUARTERdateexp1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'QUARTER(TO_DATE('#39'2003-01-02'#39', '#39'yyyy/mm/dd'#39'))'
        OnClick = MenuItemClick
      end
      object IMESTAMPADD1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'TIMESTAMPADD('#39'day'#39', 1, TO_DATE('#39'2003-01-02'#39', '#39'yyyy/mm/dd'#39'))'
        OnClick = MenuItemClick
      end
      object IMESTAMPDIFF1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 
          'TIMESTAMPDIFF('#39'day'#39', TO_DATE('#39'2003-01-01'#39', '#39'yyyy/mm/dd'#39'), TO_DAT' +
          'E('#39'2003-01-02'#39', '#39'yyyy/mm/dd'#39'))'
        OnClick = MenuItemClick
      end
      object WEEKdateexp1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'WEEK(TO_DATE('#39'2003-01-02'#39', '#39'yyyy/mm/dd'#39'))'
        OnClick = MenuItemClick
      end
    end
    object System1: TMenuItem
      Caption = 'System'
      object DECODE1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'DECODE(2, 3, 1, 2, 4)'
        OnClick = MenuItemClick
      end
      object IIF1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'IIF(1>2, 3, 4)'
        OnClick = MenuItemClick
      end
      object IF1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'IF(1<2, 3, 4)'
        OnClick = MenuItemClick
      end
    end
  end
end
