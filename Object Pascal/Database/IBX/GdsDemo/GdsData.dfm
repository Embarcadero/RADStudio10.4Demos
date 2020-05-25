inherited StdDataForm: TStdDataForm
  Caption = 'StdDataForm'
  ClientHeight = 430
  ClientWidth = 611
  OnCreate = FormCreate
  ExplicitWidth = 627
  ExplicitHeight = 468
  PixelsPerInch = 96
  TextHeight = 13
  inherited GDSStdPanel: TPanel
    Width = 611
    TabOrder = 1
    ExplicitWidth = 611
  end
  object StdCtrlPanel: TPanel
    Left = 0
    Top = 89
    Width = 611
    Height = 72
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object FilterOnRadioGroup: TRadioGroup
      Left = 11
      Top = 7
      Width = 95
      Height = 57
      Caption = 'Filter Field'
      Items.Strings = (
        'Sale &Date'
        'A&mount Due')
      TabOrder = 0
      OnClick = FilterOnRadioGroupClick
    end
    object GroupBox1: TGroupBox
      Left = 119
      Top = 7
      Width = 162
      Height = 57
      Caption = 'Filter/Search Critera'
      TabOrder = 1
      object FilterOnLabel: TLabel
        Left = 8
        Top = 14
        Width = 83
        Height = 13
        Caption = 'Show records >= '
      end
      object FilterCriteria: TEdit
        Left = 6
        Top = 30
        Width = 150
        Height = 21
        TabOrder = 0
        OnExit = FilterCriteriaExit
        OnKeyPress = FilterCriteriaKeyPress
      end
    end
    object FilterCheckBox: TCheckBox
      Left = 314
      Top = 14
      Width = 135
      Height = 17
      Caption = '&Filtered Records Only'
      TabOrder = 2
      OnClick = FilterCheckBoxClick
    end
    object NextBtn: TButton
      Left = 295
      Top = 37
      Width = 70
      Height = 25
      Caption = 'Find &Next'
      TabOrder = 3
      OnClick = NextBtnClick
    end
    object PriorBtn: TButton
      Left = 377
      Top = 37
      Width = 70
      Height = 25
      Caption = 'Find &Prior'
      TabOrder = 4
      OnClick = PriorBtnClick
    end
  end
  object OrdersSource: TDataSource
    DataSet = Orders
    Left = 228
    Top = 232
  end
  object IBTransaction1: TIBTransaction
    Left = 146
    Top = 232
  end
  object Database: TIBDatabase
    DatabaseName = 
      'C:\Users\Public\Documents\Embarcadero\Studio\19.0\Samples\Data\M' +
      'ASTSQL.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 64
    Top = 232
  end
  object Orders: TIBDataSet
    Database = Database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ORDERS'
      'where'
      '  ORDERNO = :OLD_ORDERNO')
    InsertSQL.Strings = (
      'insert into ORDERS'
      
        '  (AMOUNTPAID, CUSTNO, EMPNO, FREIGHT, ITEMSTOTAL, ORDERNO, PAYM' +
        'ENTMETHOD, '
      
        '   PO, SALEDATE, SHIPDATE, SHIPTOADDR1, SHIPTOADDR2, SHIPTOCITY,' +
        ' SHIPTOCONTACT, '
      
        '   SHIPTOCOUNTRY, SHIPTOPHONE, SHIPTOSTATE, SHIPTOZIP, SHIPVIA, ' +
        'TAXRATE, '
      '   TERMS)'
      'values'
      
        '  (:AMOUNTPAID, :CUSTNO, :EMPNO, :FREIGHT, :ITEMSTOTAL, :ORDERNO' +
        ', :PAYMENTMETHOD, '
      
        '   :PO, :SALEDATE, :SHIPDATE, :SHIPTOADDR1, :SHIPTOADDR2, :SHIPT' +
        'OCITY, '
      
        '   :SHIPTOCONTACT, :SHIPTOCOUNTRY, :SHIPTOPHONE, :SHIPTOSTATE, :' +
        'SHIPTOZIP, '
      '   :SHIPVIA, :TAXRATE, :TERMS)')
    RefreshSQL.Strings = (
      'Select '
      '  ORDERNO,'
      '  CUSTNO,'
      '  SALEDATE,'
      '  SHIPDATE,'
      '  EMPNO,'
      '  SHIPTOCONTACT,'
      '  SHIPTOADDR1,'
      '  SHIPTOADDR2,'
      '  SHIPTOCITY,'
      '  SHIPTOSTATE,'
      '  SHIPTOZIP,'
      '  SHIPTOCOUNTRY,'
      '  SHIPTOPHONE,'
      '  SHIPVIA,'
      '  PO,'
      '  TERMS,'
      '  PAYMENTMETHOD,'
      '  ITEMSTOTAL,'
      '  TAXRATE,'
      '  FREIGHT,'
      '  AMOUNTPAID'
      'from ORDERS '
      'where'
      '  ORDERNO = :ORDERNO')
    SelectSQL.Strings = (
      'select * from ORDERS')
    ModifySQL.Strings = (
      'update ORDERS'
      'set'
      '  AMOUNTPAID = :AMOUNTPAID,'
      '  CUSTNO = :CUSTNO,'
      '  EMPNO = :EMPNO,'
      '  FREIGHT = :FREIGHT,'
      '  ITEMSTOTAL = :ITEMSTOTAL,'
      '  ORDERNO = :ORDERNO,'
      '  PAYMENTMETHOD = :PAYMENTMETHOD,'
      '  PO = :PO,'
      '  SALEDATE = :SALEDATE,'
      '  SHIPDATE = :SHIPDATE,'
      '  SHIPTOADDR1 = :SHIPTOADDR1,'
      '  SHIPTOADDR2 = :SHIPTOADDR2,'
      '  SHIPTOCITY = :SHIPTOCITY,'
      '  SHIPTOCONTACT = :SHIPTOCONTACT,'
      '  SHIPTOCOUNTRY = :SHIPTOCOUNTRY,'
      '  SHIPTOPHONE = :SHIPTOPHONE,'
      '  SHIPTOSTATE = :SHIPTOSTATE,'
      '  SHIPTOZIP = :SHIPTOZIP,'
      '  SHIPVIA = :SHIPVIA,'
      '  TAXRATE = :TAXRATE,'
      '  TERMS = :TERMS'
      'where'
      '  ORDERNO = :OLD_ORDERNO')
    ParamCheck = True
    UniDirectional = False
    Left = 310
    Top = 232
    object OrdersORDERNO: TFloatField
      FieldName = 'ORDERNO'
      Origin = '"ORDERS"."ORDERNO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object OrdersCUSTNO: TFloatField
      FieldName = 'CUSTNO'
      Origin = '"ORDERS"."CUSTNO"'
    end
    object OrdersSALEDATE: TDateTimeField
      FieldName = 'SALEDATE'
      Origin = '"ORDERS"."SALEDATE"'
    end
    object OrdersSHIPDATE: TDateTimeField
      FieldName = 'SHIPDATE'
      Origin = '"ORDERS"."SHIPDATE"'
    end
    object OrdersEMPNO: TIntegerField
      FieldName = 'EMPNO'
      Origin = '"ORDERS"."EMPNO"'
    end
    object OrdersSHIPTOCONTACT: TIBStringField
      FieldName = 'SHIPTOCONTACT'
      Origin = '"ORDERS"."SHIPTOCONTACT"'
    end
    object OrdersSHIPTOADDR1: TIBStringField
      FieldName = 'SHIPTOADDR1'
      Origin = '"ORDERS"."SHIPTOADDR1"'
      Size = 30
    end
    object OrdersSHIPTOADDR2: TIBStringField
      FieldName = 'SHIPTOADDR2'
      Origin = '"ORDERS"."SHIPTOADDR2"'
      Size = 30
    end
    object OrdersSHIPTOCITY: TIBStringField
      FieldName = 'SHIPTOCITY'
      Origin = '"ORDERS"."SHIPTOCITY"'
      Size = 15
    end
    object OrdersSHIPTOSTATE: TIBStringField
      FieldName = 'SHIPTOSTATE'
      Origin = '"ORDERS"."SHIPTOSTATE"'
    end
    object OrdersSHIPTOZIP: TIBStringField
      FieldName = 'SHIPTOZIP'
      Origin = '"ORDERS"."SHIPTOZIP"'
      Size = 10
    end
    object OrdersSHIPTOCOUNTRY: TIBStringField
      FieldName = 'SHIPTOCOUNTRY'
      Origin = '"ORDERS"."SHIPTOCOUNTRY"'
    end
    object OrdersSHIPTOPHONE: TIBStringField
      FieldName = 'SHIPTOPHONE'
      Origin = '"ORDERS"."SHIPTOPHONE"'
      Size = 15
    end
    object OrdersSHIPVIA: TIBStringField
      FieldName = 'SHIPVIA'
      Origin = '"ORDERS"."SHIPVIA"'
      Size = 7
    end
    object OrdersPO: TIBStringField
      FieldName = 'PO'
      Origin = '"ORDERS"."PO"'
      Size = 15
    end
    object OrdersTERMS: TIBStringField
      FieldName = 'TERMS'
      Origin = '"ORDERS"."TERMS"'
      Size = 6
    end
    object OrdersPAYMENTMETHOD: TIBStringField
      FieldName = 'PAYMENTMETHOD'
      Origin = '"ORDERS"."PAYMENTMETHOD"'
      Size = 7
    end
    object OrdersITEMSTOTAL: TFloatField
      FieldName = 'ITEMSTOTAL'
      Origin = '"ORDERS"."ITEMSTOTAL"'
    end
    object OrdersTAXRATE: TFloatField
      FieldName = 'TAXRATE'
      Origin = '"ORDERS"."TAXRATE"'
    end
    object OrdersFREIGHT: TFloatField
      FieldName = 'FREIGHT'
      Origin = '"ORDERS"."FREIGHT"'
    end
    object OrdersAMOUNTPAID: TFloatField
      FieldName = 'AMOUNTPAID'
      Origin = '"ORDERS"."AMOUNTPAID"'
    end
    object OrdersAmountDue: TFloatField
      FieldKind = fkCalculated
      FieldName = 'AmountDue'
      Calculated = True
    end
    object OrdersTaxAmount: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TaxAmount'
      Calculated = True
    end
    object OrdersCustName: TStringField
      FieldKind = fkLookup
      FieldName = 'CustName'
      LookupDataSet = Cust
      LookupKeyFields = 'CUSTNO'
      LookupResultField = 'COMPANY'
      KeyFields = 'ORDERNO'
      Lookup = True
    end
  end
  object Cust: TIBDataSet
    Database = Database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CUSTOMER'
      'where'
      '  CUSTNO = :OLD_CUSTNO')
    InsertSQL.Strings = (
      'insert into CUSTOMER'
      
        '  (ADDR1, ADDR2, CITY, COMPANY, CONTACT, COUNTRY, CUSTNO, FAX, L' +
        'ASTINVOICEDATE, '
      '   PHONE, STATE, TAXRATE, ZIP)'
      'values'
      
        '  (:ADDR1, :ADDR2, :CITY, :COMPANY, :CONTACT, :COUNTRY, :CUSTNO,' +
        ' :FAX, '
      '   :LASTINVOICEDATE, :PHONE, :STATE, :TAXRATE, :ZIP)')
    RefreshSQL.Strings = (
      'Select '
      '  CUSTNO,'
      '  COMPANY,'
      '  ADDR1,'
      '  ADDR2,'
      '  CITY,'
      '  STATE,'
      '  ZIP,'
      '  COUNTRY,'
      '  PHONE,'
      '  FAX,'
      '  TAXRATE,'
      '  CONTACT,'
      '  LASTINVOICEDATE'
      'from CUSTOMER '
      'where'
      '  CUSTNO = :CUSTNO')
    SelectSQL.Strings = (
      'select * from CUSTOMER')
    ModifySQL.Strings = (
      'update CUSTOMER'
      'set'
      '  ADDR1 = :ADDR1,'
      '  ADDR2 = :ADDR2,'
      '  CITY = :CITY,'
      '  COMPANY = :COMPANY,'
      '  CONTACT = :CONTACT,'
      '  COUNTRY = :COUNTRY,'
      '  CUSTNO = :CUSTNO,'
      '  FAX = :FAX,'
      '  LASTINVOICEDATE = :LASTINVOICEDATE,'
      '  PHONE = :PHONE,'
      '  STATE = :STATE,'
      '  TAXRATE = :TAXRATE,'
      '  ZIP = :ZIP'
      'where'
      '  CUSTNO = :OLD_CUSTNO')
    ParamCheck = True
    UniDirectional = False
    Left = 392
    Top = 232
    object CustCUSTNO: TFloatField
      FieldName = 'CUSTNO'
      Origin = '"CUSTOMER"."CUSTNO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CustCOMPANY: TIBStringField
      FieldName = 'COMPANY'
      Origin = '"CUSTOMER"."COMPANY"'
      Required = True
      Size = 30
    end
    object CustADDR1: TIBStringField
      FieldName = 'ADDR1'
      Origin = '"CUSTOMER"."ADDR1"'
      Size = 30
    end
    object CustADDR2: TIBStringField
      FieldName = 'ADDR2'
      Origin = '"CUSTOMER"."ADDR2"'
      Size = 30
    end
    object CustCITY: TIBStringField
      FieldName = 'CITY'
      Origin = '"CUSTOMER"."CITY"'
      Size = 15
    end
    object CustSTATE: TIBStringField
      FieldName = 'STATE'
      Origin = '"CUSTOMER"."STATE"'
    end
    object CustZIP: TIBStringField
      FieldName = 'ZIP'
      Origin = '"CUSTOMER"."ZIP"'
      Size = 10
    end
    object CustCOUNTRY: TIBStringField
      FieldName = 'COUNTRY'
      Origin = '"CUSTOMER"."COUNTRY"'
    end
    object CustPHONE: TIBStringField
      FieldName = 'PHONE'
      Origin = '"CUSTOMER"."PHONE"'
      Size = 15
    end
    object CustFAX: TIBStringField
      FieldName = 'FAX'
      Origin = '"CUSTOMER"."FAX"'
      Size = 15
    end
    object CustTAXRATE: TFloatField
      FieldName = 'TAXRATE'
      Origin = '"CUSTOMER"."TAXRATE"'
    end
    object CustCONTACT: TIBStringField
      FieldName = 'CONTACT'
      Origin = '"CUSTOMER"."CONTACT"'
    end
    object CustLASTINVOICEDATE: TDateTimeField
      FieldName = 'LASTINVOICEDATE'
      Origin = '"CUSTOMER"."LASTINVOICEDATE"'
    end
  end
end
