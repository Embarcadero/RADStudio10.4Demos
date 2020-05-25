object CustomerByInvoiceReport: TCustomerByInvoiceReport
  Left = 0
  Top = 0
  Width = 653
  Height = 845
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = MastData.CustByLastInvQuery
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Arial'
  Font.Style = []
  Options = [FirstPageHeader, LastPageFooter]
  Page.Columns = 1
  Page.Orientation = poPortrait
  Page.PaperSize = Letter
  Page.Values = (
    127
    2794
    127
    2159
    127
    127
    0)
  PrintIfEmpty = False
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = First
  SnapToGrid = True
  Units = Native
  Zoom = 80
  object DetailBand1: TQRBand
    Left = 38
    Top = 139
    Width = 576
    Height = 35
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
      115.755208333333
      1905)
    BandType = rbDetail
    object QRExpr1: TQRExpr
      Left = 82
      Top = 20
      Width = 279
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        271.197916666667
        66.1458333333333
        922.734375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 
        'Addr1 + if(Addr2 <> '#39#39','#39' '#39' + Addr2, '#39#39') + if(City <> '#39#39','#39', '#39' + C' +
        'ity, '#39#39')'
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 82
      Top = 3
      Width = 60
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        271.197916666667
        9.921875
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.CustByLastInvQuery
      DataField = 'Company'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRDBText3: TQRDBText
      Left = 386
      Top = 5
      Width = 30
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        1276.61458333333
        16.5364583333333
        99.21875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.CustByLastInvQuery
      DataField = 'Phone'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 386
      Top = 20
      Width = 20
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        1276.61458333333
        66.1458333333333
        66.1458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.CustByLastInvQuery
      DataField = 'FAX'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText5: TQRDBText
      Left = 527
      Top = 20
      Width = 35
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        1742.94270833333
        66.1458333333333
        115.755208333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.CustByLastInvQuery
      DataField = 'CustNo'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText1: TQRDBText
      Left = 6
      Top = 20
      Width = 69
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        46.3020833333333
        19.84375
        66.1458333333333
        228.203125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = MastData.CustByLastInvQuery
      DataField = 'LastInvoiceDate'
      OnPrint = QRDBText1Print
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object ColumnHeaderBand1: TQRBand
    Left = 38
    Top = 104
    Width = 576
    Height = 35
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
      115.755208333333
      1905)
    BandType = rbColumnHeader
    object QRLabel4: TQRLabel
      Left = 5
      Top = 16
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        16.5364583333333
        52.9166666666667
        231.510416666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Last Invoice'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel5: TQRLabel
      Left = 82
      Top = 1
      Width = 56
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        271.197916666667
        3.30729166666667
        185.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Customer'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel6: TQRLabel
      Left = 82
      Top = 16
      Width = 47
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        271.197916666667
        52.9166666666667
        155.442708333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Address'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel7: TQRLabel
      Left = 386
      Top = 1
      Width = 38
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        1276.61458333333
        3.30729166666667
        125.677083333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Phone'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel8: TQRLabel
      Left = 386
      Top = 16
      Width = 23
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        1276.61458333333
        52.9166666666667
        76.0677083333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'FAX'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel9: TQRLabel
      Left = 493
      Top = 16
      Width = 78
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        1630.49479166667
        52.9166666666667
        257.96875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Customer No.'
      Color = clBlue
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
  end
  object TitleBand1: TQRBand
    Left = 38
    Top = 38
    Width = 576
    Height = 66
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
      218.28125
      1905)
    BandType = rbPageHeader
    object QRLabel1: TQRLabel
      Left = 0
      Top = 26
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
        85.9895833333333
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
      Left = 231
      Top = 7
      Width = 114
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        763.984375
        23.1510416666667
        377.03125)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Customer List'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 16
    end
    object QRLabel3: TQRLabel
      Left = 246
      Top = 24
      Width = 84
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        49.609375
        813.59375
        79.375
        277.8125)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'By Last Invoice'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
  end
end
