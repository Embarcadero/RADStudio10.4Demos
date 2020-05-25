object InvoiceByOrderNoReport: TInvoiceByOrderNoReport
  Left = 0
  Top = 0
  Width = 653
  Height = 845
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  BeforePrint = InvoiceByOrderNoReportBeforePrint
  DataSet = MastData.Items
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE')
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Options = [FirstPageHeader, LastPageFooter]
  Page.Columns = 1
  Page.Orientation = poPortrait
  Page.PaperSize = Letter
  Page.Values = (
    100
    2794
    100
    2159
    100
    100
    0)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = First
  PrintIfEmpty = False
  SnapToGrid = True
  Units = MM
  Zoom = 80
  object DetailBand1: TQRBand
    Left = 30
    Top = 244
    Width = 593
    Height = 21
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      69.453125
      1961.22395833333)
    BandType = rbDetail
    object QRDBText3: TQRDBText
      Left = 445
      Top = 5
      Width = 42
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        1471.74479166667
        16.5364583333333
        138.90625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Items
      DataField = 'Discount'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText6: TQRDBText
      Left = 75
      Top = 5
      Width = 53
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        248.046875
        16.5364583333333
        175.286458333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Items
      DataField = 'Description'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText7: TQRDBText
      Left = 4
      Top = 5
      Width = 48
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        48.5069444444444
        13.2291666666667
        17.6388888888889
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Items
      DataField = 'PartNo'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText8: TQRDBText
      Left = 268
      Top = 5
      Width = 49
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        886.354166666667
        16.5364583333333
        162.057291666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Items
      DataField = 'Qty'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText9: TQRDBText
      Left = 361
      Top = 5
      Width = 48
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        48.5069444444444
        1195.03472222222
        17.6388888888889
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Items
      DataField = 'SellPrice'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText1: TQRDBText
      Left = 509
      Top = 5
      Width = 79
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        48.5069444444444
        1684.51388888889
        17.6388888888889
        260.173611111111)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Items
      DataField = 'ExtPrice'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object ColumnHeaderBand1: TQRBand
    Left = 30
    Top = 223
    Width = 593
    Height = 21
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      69.453125
      1961.22395833333)
    BandType = rbColumnHeader
    object QRLabel4: TQRLabel
      Left = 5
      Top = 3
      Width = 46
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        16.5364583333333
        9.921875
        152.135416666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Part No.'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object Description: TQRLabel
      Left = 75
      Top = 3
      Width = 66
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        248.046875
        9.921875
        218.28125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Description'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel7: TQRLabel
      Left = 276
      Top = 3
      Width = 44
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        912.8125
        9.921875
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Quanity'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel8: TQRLabel
      Left = 356
      Top = 3
      Width = 54
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        1177.39583333333
        9.921875
        178.59375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'List Price'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel11: TQRLabel
      Left = 437
      Top = 3
      Width = 51
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        1445.28645833333
        9.921875
        168.671875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Discount'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel12: TQRLabel
      Left = 504
      Top = 3
      Width = 88
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        1666.875
        9.921875
        291.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Extended Price'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
  end
  object TitleBand1: TQRBand
    Left = 30
    Top = 30
    Width = 593
    Height = 151
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      499.401041666667
      1961.22395833333)
    BandType = rbPageHeader
    object QRLabel1: TQRLabel
      Left = 0
      Top = 19
      Width = 151
      Height = 45
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        148.828125
        0
        62.8385416666667
        499.401041666667)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'M.A.S.T.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -48
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 36
    end
    object QRLabel2: TQRLabel
      Left = 263
      Top = 4
      Width = 67
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        869.817708333333
        13.2291666666667
        221.588541666667)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Invoice'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 18
    end
    object QRShape1: TQRShape
      Left = 1
      Top = 64
      Width = 228
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        69.453125
        3.30729166666667
        211.666666666667
        754.0625)
      Brush.Color = clBlue
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 11
      Top = 67
      Width = 52
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        36.3802083333333
        221.588541666667
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Send To:'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRExpr2: TQRExpr
      Left = 12
      Top = 103
      Width = 137
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        39.6875
        340.651041666667
        453.098958333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'Cust.Addr1 + '#39' '#39' + Cust.Addr2'
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 12
      Top = 88
      Width = 45
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        39.6875
        291.041666666667
        148.828125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Cust
      DataField = 'Company'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRExpr3: TQRExpr
      Left = 12
      Top = 118
      Width = 199
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        39.6875
        390.260416666667
        658.151041666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'Cust.City + '#39', '#39' + Cust.State + '#39' '#39' + Cust.Zip'
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 12
      Top = 133
      Width = 37
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        39.6875
        439.869791666667
        122.369791666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Cust
      DataField = 'Country'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object SummaryBand1: TQRBand
    Left = 30
    Top = 265
    Width = 593
    Height = 65
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      214.973958333333
      1961.22395833333)
    BandType = rbSummary
    object QRExpr1: TQRExpr
      Left = 477
      Top = 5
      Width = 111
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        1577.578125
        16.5364583333333
        367.109375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'FormatNumeric('#39'$##,###,###.00'#39', SUM(Items.ExtPrice))'
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 421
      Top = 5
      Width = 45
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        1392.36979166667
        16.5364583333333
        148.828125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sub Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 433
      Top = 19
      Width = 33
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        1432.05729166667
        62.8385416666667
        109.140625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Freight'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 444
      Top = 40
      Width = 23
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        1468.4375
        132.291666666667
        76.0677083333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape2: TQRShape
      Left = 487
      Top = 31
      Width = 103
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        1610.65104166667
        102.526041666667
        340.651041666667)
      Shape = qrsHorLine
    end
    object QRExpr5: TQRExpr
      Left = 477
      Top = 40
      Width = 111
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        1577.578125
        132.291666666667
        367.109375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 
        'FormatNumeric('#39'$##,###,###.00'#39', SUM(Items.ExtPrice) + Orders.Fre' +
        'ight)'
      FontSize = 10
    end
    object QRDBText15: TQRDBText
      Left = 477
      Top = 20
      Width = 111
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        1577.578125
        66.1458333333333
        367.109375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Orders
      DataField = 'Freight'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object ChildBand1: TQRChildBand
    Left = 30
    Top = 181
    Width = 593
    Height = 21
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      69.453125
      1961.22395833333)
    ParentBand = TitleBand1
    object QRLabel10: TQRLabel
      Left = 5
      Top = 3
      Width = 57
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        16.5364583333333
        9.921875
        188.515625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Order No.'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel13: TQRLabel
      Left = 75
      Top = 3
      Width = 53
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        248.046875
        9.921875
        175.286458333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cust. No.'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel14: TQRLabel
      Left = 276
      Top = 3
      Width = 55
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        912.8125
        9.921875
        181.901041666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sale Date'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel15: TQRLabel
      Left = 356
      Top = 3
      Width = 56
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        1177.39583333333
        9.921875
        185.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Ship Date'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel16: TQRLabel
      Left = 437
      Top = 3
      Width = 47
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        1445.28645833333
        9.921875
        155.442708333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Ship VIA'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel17: TQRLabel
      Left = 136
      Top = 3
      Width = 76
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        449.791666666667
        9.921875
        251.354166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sales Person'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
  end
  object ChildBand2: TQRChildBand
    Left = 30
    Top = 202
    Width = 593
    Height = 21
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      69.453125
      1961.22395833333)
    ParentBand = ChildBand1
    object QRDBText5: TQRDBText
      Left = 5
      Top = 4
      Width = 53
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        48.5069444444444
        17.6388888888889
        13.2291666666667
        176.388888888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Orders
      DataField = 'OrderNo'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText10: TQRDBText
      Left = 75
      Top = 4
      Width = 49
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        48.5069444444444
        246.944444444444
        13.2291666666667
        163.159722222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Orders
      DataField = 'CustNo'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText11: TQRDBText
      Left = 139
      Top = 4
      Width = 60
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        459.713541666667
        13.2291666666667
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Orders
      DataField = 'SalesPerson'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText12: TQRDBText
      Left = 276
      Top = 4
      Width = 43
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        912.8125
        13.2291666666667
        142.213541666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Orders
      DataField = 'SaleDate'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText13: TQRDBText
      Left = 356
      Top = 4
      Width = 43
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        48.5069444444444
        1177.39583333333
        13.2291666666667
        141.111111111111)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Orders
      DataField = 'ShipDate'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText14: TQRDBText
      Left = 437
      Top = 4
      Width = 37
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        48.5069444444444
        1446.38888888889
        13.2291666666667
        123.472222222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.Orders
      DataField = 'ShipVIA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
end
