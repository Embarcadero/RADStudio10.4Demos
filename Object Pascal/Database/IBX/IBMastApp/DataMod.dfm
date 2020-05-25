object MastData: TMastData
  OldCreateOrder = True
  OnCreate = MastDataCreate
  Height = 479
  Width = 741
  object Database: TIBDatabase
    DatabaseName = 
      'localhost:C:\Users\Public\Documents\Embarcadero\Studio\19.0\Samp' +
      'les\Data\MASTSQL.GDB'
    Params.Strings = (
      'USER_NAME=sysdba'
      'PASSWORD=masterkey')
    LoginPrompt = False
    DefaultTransaction = Transaction
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    Left = 16
    Top = 200
  end
  object PartsQuery: TIBQuery
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM PARTS'
      ' WHERE (PARTS.ONORDER > PARTS.ONHAND)'
      '')
    Left = 336
    Top = 136
    object PartsQueryPartNo: TFloatField
      Alignment = taLeftJustify
      DisplayWidth = 8
      FieldName = 'PARTNO'
    end
    object PartsQueryDescription: TIBStringField
      DisplayWidth = 21
      FieldName = 'DESCRIPTION'
      Size = 30
    end
    object PartsQueryVendorNo: TFloatField
      FieldName = 'VENDORNO'
    end
    object PartsQueryOnHand: TFloatField
      DisplayWidth = 9
      FieldName = 'ONHAND'
    end
    object PartsQueryOnOrder: TFloatField
      DisplayWidth = 10
      FieldName = 'ONORDER'
    end
    object PartsQueryBackOrd: TBooleanField
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'BACKORD'
      DisplayValues = 'Yes;No'
      Calculated = True
    end
    object PartsQueryCost: TCurrencyField
      FieldName = 'COST'
    end
    object PartsQueryListPrice: TCurrencyField
      FieldName = 'LISTPRICE'
    end
  end
  object LastItemQuery: TIBQuery
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = OrdersSource
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ITEMNO) FROM ITEMS'
      '  WHERE ORDERNO = :ORDERNO')
    Left = 176
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'OrderNo'
        ParamType = ptUnknown
        Size = 8
      end>
  end
  object CustQuery: TIBQuery
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT CUSTOMER.CUSTNO, CUSTOMER.COMPANY,'
      '             CUSTOMER.LASTINVOICEDATE, CUSTOMER.PHONE'
      ' FROM CUSTOMER'
      ' WHERE'
      '   (CUSTOMER.LASTINVOICEDATE >= :FromDate) AND'
      '   (CUSTOMER.LASTINVOICEDATE <= :ToDate)')
    Left = 96
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    object CustQueryCustNo: TFloatField
      Alignment = taLeftJustify
      DisplayWidth = 6
      FieldName = 'CUSTNO'
    end
    object CustQueryCompany: TIBStringField
      DisplayWidth = 26
      FieldName = 'COMPANY'
      Size = 30
    end
    object CustQueryPhone: TIBStringField
      DisplayWidth = 15
      FieldName = 'PHONE'
      Size = 15
    end
    object CustQueryLastInvoiceDate: TDateTimeField
      DisplayLabel = 'LastInvoice'
      DisplayWidth = 10
      FieldName = 'LASTINVOICEDATE'
      DisplayFormat = 'DDDDD'
    end
  end
  object CustByLastInvQuery: TIBQuery
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM CUSTOMER'
      'ORDER BY'
      'LASTINVOICEDATE DESC')
    Left = 256
    Top = 136
    object CustByLastInvQueryCustNo: TFloatField
      FieldName = 'CUSTNO'
      Origin = '"CUSTOMER.DB".CustNo'
    end
    object CustByLastInvQueryCompany: TIBStringField
      FieldName = 'COMPANY'
      Origin = '"CUSTOMER.DB".Company'
      Size = 30
    end
    object CustByLastInvQueryAddr1: TIBStringField
      FieldName = 'ADDR1'
      Origin = '"CUSTOMER.DB".Addr1'
      Size = 30
    end
    object CustByLastInvQueryAddr2: TIBStringField
      FieldName = 'ADDR2'
      Origin = '"CUSTOMER.DB".Addr2'
      Size = 30
    end
    object CustByLastInvQueryCity: TIBStringField
      FieldName = 'CITY'
      Origin = '"CUSTOMER.DB".City'
      Size = 15
    end
    object CustByLastInvQueryState: TIBStringField
      FieldName = 'STATE'
      Origin = '"CUSTOMER.DB".State'
    end
    object CustByLastInvQueryZip: TIBStringField
      FieldName = 'ZIP'
      Origin = '"CUSTOMER.DB".Zip'
      Size = 10
    end
    object CustByLastInvQueryCountry: TIBStringField
      FieldName = 'COUNTRY'
      Origin = '"CUSTOMER.DB".Country'
    end
    object CustByLastInvQueryPhone: TIBStringField
      FieldName = 'PHONE'
      Origin = '"CUSTOMER.DB".Phone'
      Size = 15
    end
    object CustByLastInvQueryFAX: TIBStringField
      FieldName = 'FAX'
      Origin = '"CUSTOMER.DB".FAX'
      Size = 15
    end
    object CustByLastInvQueryTaxRate: TFloatField
      FieldName = 'TAXRATE'
      Origin = '"CUSTOMER.DB".TaxRate'
    end
    object CustByLastInvQueryContact: TIBStringField
      FieldName = 'CONTACT'
      Origin = '"CUSTOMER.DB".Contact'
    end
    object CustByLastInvQueryLastInvoiceDate: TDateTimeField
      FieldName = 'LASTINVOICEDATE'
      Origin = '"CUSTOMER.DB".LastInvoiceDate'
    end
  end
  object OrdersByDateQuery: TIBQuery
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM ORDERS'
      'WHERE'
      '  (SALEDATE >= :FromDate) AND'
      '  (SALEDATE <= :ToDate)'
      'ORDER BY'
      '  SALEDATE')
    Left = 16
    Top = 136
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FromDate'
        ParamType = ptUnknown
        Value = 34700d
      end
      item
        DataType = ftDateTime
        Name = 'ToDate'
        ParamType = ptUnknown
        Value = 35488d
      end>
    object OrdersByDateQueryOrderNo: TFloatField
      FieldName = 'ORDERNO'
      Origin = '"ORDERS.DB".OrderNo'
    end
    object OrdersByDateQueryCustNo: TFloatField
      FieldName = 'CUSTNO'
      Origin = '"ORDERS.DB".CustNo'
    end
    object OrdersByDateQuerySaleDate: TDateTimeField
      FieldName = 'SALEDATE'
      Origin = '"ORDERS.DB".SaleDate'
    end
    object OrdersByDateQueryShipDate: TDateTimeField
      FieldName = 'SHIPDATE'
      Origin = '"ORDERS.DB".ShipDate'
    end
    object OrdersByDateQueryEmpNo: TIntegerField
      FieldName = 'EMPNO'
      Origin = '"ORDERS.DB".EmpNo'
    end
    object OrdersByDateQueryShipToContact: TIBStringField
      FieldName = 'SHIPTOCONTACT'
      Origin = '"ORDERS.DB".ShipToContact'
    end
    object OrdersByDateQueryShipToAddr1: TIBStringField
      FieldName = 'SHIPTOADDR1'
      Origin = '"ORDERS.DB".ShipToAddr1'
      Size = 30
    end
    object OrdersByDateQueryShipToAddr2: TIBStringField
      FieldName = 'SHIPTOADDR2'
      Origin = '"ORDERS.DB".ShipToAddr2'
      Size = 30
    end
    object OrdersByDateQueryShipToCity: TIBStringField
      FieldName = 'SHIPTOCITY'
      Origin = '"ORDERS.DB".ShipToCity'
      Size = 15
    end
    object OrdersByDateQueryShipToState: TIBStringField
      FieldName = 'SHIPTOSTATE'
      Origin = '"ORDERS.DB".ShipToState'
    end
    object OrdersByDateQueryShipToZip: TIBStringField
      FieldName = 'SHIPTOZIP'
      Origin = '"ORDERS.DB".ShipToZip'
      Size = 10
    end
    object OrdersByDateQueryShipToCountry: TIBStringField
      FieldName = 'SHIPTOCOUNTRY'
      Origin = '"ORDERS.DB".ShipToCountry'
    end
    object OrdersByDateQueryShipToPhone: TIBStringField
      FieldName = 'SHIPTOPHONE'
      Origin = '"ORDERS.DB".ShipToPhone'
      Size = 15
    end
    object OrdersByDateQueryShipVIA: TIBStringField
      FieldName = 'SHIPVIA'
      Origin = '"ORDERS.DB".ShipVIA'
      Size = 7
    end
    object OrdersByDateQueryPO: TIBStringField
      FieldName = 'PO'
      Origin = '"ORDERS.DB".PO'
      Size = 15
    end
    object OrdersByDateQueryTerms: TIBStringField
      FieldName = 'TERMS'
      Origin = '"ORDERS.DB".Terms'
      Size = 6
    end
    object OrdersByDateQueryPaymentMethod: TIBStringField
      FieldName = 'PAYMENTMETHOD'
      Origin = '"ORDERS.DB".PaymentMethod'
      Size = 7
    end
    object OrdersByDateQueryItemsTotal: TCurrencyField
      FieldName = 'ITEMSTOTAL'
      Origin = '"ORDERS.DB".ItemsTotal'
    end
    object OrdersByDateQueryTaxRate: TFloatField
      FieldName = 'TAXRATE'
      Origin = '"ORDERS.DB".TaxRate'
    end
    object OrdersByDateQueryFreight: TCurrencyField
      FieldName = 'FREIGHT'
      Origin = '"ORDERS.DB".Freight'
    end
    object OrdersByDateQueryAmountPaid: TCurrencyField
      FieldName = 'AMOUNTPAID'
      Origin = '"ORDERS.DB".AmountPaid'
    end
    object OrdersByDateQueryCompany: TIBStringField
      FieldKind = fkLookup
      FieldName = 'COMPANY'
      LookupKeyFields = 'CustNo'
      LookupResultField = 'Company'
      KeyFields = 'CustNo'
      Size = 40
      Lookup = True
    end
  end
  object Transaction: TIBTransaction
    DefaultDatabase = Database
    Left = 80
    Top = 200
  end
  object OpenDialog: TOpenDialog
    Filter = 'Interbase Files (*.gdb)|*.gdb|All Files (*.*)|*.*'
    Left = 144
    Top = 200
  end
  object OrdersSource: TDataSource
    DataSet = Orders
    Left = 16
    Top = 80
  end
  object CustByOrdSrc: TDataSource
    DataSet = CustByOrd
    Left = 80
    Top = 80
  end
  object ItemsSource: TDataSource
    DataSet = Items
    Left = 144
    Top = 80
  end
  object PartsSource: TDataSource
    DataSet = Parts
    Left = 208
    Top = 80
  end
  object EmpsSource: TDataSource
    DataSet = Emps
    Left = 272
    Top = 80
  end
  object VendorSource: TDataSource
    DataSet = Vendors
    Left = 336
    Top = 80
  end
  object CustSource: TDataSource
    DataSet = Cust
    Left = 592
    Top = 80
  end
  object CustMasterSrc: TDataSource
    DataSet = Cust
    Left = 592
    Top = 136
  end
  object OrdByCustSrc: TDataSource
    DataSet = OrdByCust
    Left = 656
    Top = 80
  end
  object CustByCompSrc: TDataSource
    DataSet = CustByComp
    Left = 528
    Top = 80
  end
  object Orders: TIBDataSet
    Database = Database
    Transaction = Transaction
    AfterCancel = OrdersAfterCancel
    AfterDelete = OrdersAfterDelete
    AfterPost = OrdersAfterPost
    BeforeCancel = OrdersBeforeCancel
    BeforeClose = OrdersBeforeClose
    BeforeDelete = OrdersBeforeDelete
    BeforeEdit = OrdersBeforeEdit
    BeforeInsert = OrdersBeforeInsert
    BeforeOpen = OrdersBeforeOpen
    OnCalcFields = OrdersCalcFields
    OnNewRecord = OrdersNewRecord
    BufferChunks = 1000
    CachedUpdates = True
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
    GeneratorField.Generator = 'ORDERSGEN'
    Left = 16
    Top = 24
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
      OnValidate = OrdersSALEDATEValidate
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
      OnValidate = OrdersFREIGHTValidate
    end
    object OrdersAMOUNTPAID: TFloatField
      FieldName = 'AMOUNTPAID'
      Origin = '"ORDERS"."AMOUNTPAID"'
    end
    object OrdersTAXTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TAXTOTAL'
      Calculated = True
    end
    object OrdersAMOUNTDUE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'AMOUNTDUE'
      Calculated = True
    end
    object OrdersSALESPERSON: TStringField
      FieldKind = fkLookup
      FieldName = 'SALESPERSON'
      LookupDataSet = Emps
      LookupKeyFields = 'EMPNO'
      LookupResultField = 'FULLNAME'
      KeyFields = 'EMPNO'
      Lookup = True
    end
  end
  object CustByOrd: TIBDataSet
    Database = Database
    Transaction = Transaction
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
    Left = 80
    Top = 24
    object CustByOrdCUSTNO: TFloatField
      FieldName = 'CUSTNO'
      Origin = '"CUSTOMER"."CUSTNO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CustByOrdCOMPANY: TIBStringField
      FieldName = 'COMPANY'
      Origin = '"CUSTOMER"."COMPANY"'
      Required = True
      Size = 30
    end
    object CustByOrdADDR1: TIBStringField
      FieldName = 'ADDR1'
      Origin = '"CUSTOMER"."ADDR1"'
      Size = 30
    end
    object CustByOrdADDR2: TIBStringField
      FieldName = 'ADDR2'
      Origin = '"CUSTOMER"."ADDR2"'
      Size = 30
    end
    object CustByOrdCITY: TIBStringField
      FieldName = 'CITY'
      Origin = '"CUSTOMER"."CITY"'
      Size = 15
    end
    object CustByOrdSTATE: TIBStringField
      FieldName = 'STATE'
      Origin = '"CUSTOMER"."STATE"'
    end
    object CustByOrdZIP: TIBStringField
      FieldName = 'ZIP'
      Origin = '"CUSTOMER"."ZIP"'
      Size = 10
    end
    object CustByOrdCOUNTRY: TIBStringField
      FieldName = 'COUNTRY'
      Origin = '"CUSTOMER"."COUNTRY"'
    end
    object CustByOrdPHONE: TIBStringField
      FieldName = 'PHONE'
      Origin = '"CUSTOMER"."PHONE"'
      Size = 15
    end
    object CustByOrdFAX: TIBStringField
      FieldName = 'FAX'
      Origin = '"CUSTOMER"."FAX"'
      Size = 15
    end
    object CustByOrdTAXRATE: TFloatField
      FieldName = 'TAXRATE'
      Origin = '"CUSTOMER"."TAXRATE"'
    end
    object CustByOrdCONTACT: TIBStringField
      FieldName = 'CONTACT'
      Origin = '"CUSTOMER"."CONTACT"'
    end
    object CustByOrdLASTINVOICEDATE: TDateTimeField
      FieldName = 'LASTINVOICEDATE'
      Origin = '"CUSTOMER"."LASTINVOICEDATE"'
    end
  end
  object Items: TIBDataSet
    Database = Database
    Transaction = Transaction
    AfterDelete = ItemsAfterDelete
    AfterPost = ItemsAfterPost
    BeforeDelete = EnsureOrdersEdit
    BeforeEdit = ItemsBeforeEdit
    BeforeInsert = EnsureOrdersEdit
    BeforeOpen = ItemsBeforeOpen
    BeforePost = ItemsBeforePost
    OnCalcFields = ItemsCalcFields
    OnNewRecord = ItemsNewRecord
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from ITEMS'
      'where'
      '  ITEMNO = :OLD_ITEMNO and'
      '  ORDERNO = :OLD_ORDERNO')
    InsertSQL.Strings = (
      'insert into ITEMS'
      '  (DISCOUNT, ITEMNO, ORDERNO, PARTNO, QTY)'
      'values'
      '  (:DISCOUNT, :ITEMNO, :ORDERNO, :PARTNO, :QTY)')
    RefreshSQL.Strings = (
      'Select '
      '  ITEMNO,'
      '  ORDERNO,'
      '  PARTNO,'
      '  QTY,'
      '  DISCOUNT'
      'from ITEMS '
      'where'
      '  ITEMNO = :ITEMNO and'
      '  ORDERNO = :ORDERNO')
    SelectSQL.Strings = (
      'select *  from ITEMS WHERE ORDERNO = :ORDERNO')
    ModifySQL.Strings = (
      'update ITEMS'
      'set'
      '  DISCOUNT = :DISCOUNT,'
      '  ITEMNO = :ITEMNO,'
      '  ORDERNO = :ORDERNO,'
      '  PARTNO = :PARTNO,'
      '  QTY = :QTY'
      'where'
      '  ITEMNO = :OLD_ITEMNO and'
      '  ORDERNO = :OLD_ORDERNO')
    ParamCheck = True
    UniDirectional = False
    DataSource = OrdersSource
    Left = 144
    Top = 24
    object ItemsITEMNO: TFloatField
      FieldName = 'ITEMNO'
      Origin = '"ITEMS"."ITEMNO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ItemsORDERNO: TFloatField
      FieldName = 'ORDERNO'
      Origin = '"ITEMS"."ORDERNO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ItemsPARTNO: TFloatField
      FieldName = 'PARTNO'
      Origin = '"ITEMS"."PARTNO"'
    end
    object ItemsQTY: TIntegerField
      FieldName = 'QTY'
      Origin = '"ITEMS"."QTY"'
    end
    object ItemsDISCOUNT: TFloatField
      FieldName = 'DISCOUNT'
      Origin = '"ITEMS"."DISCOUNT"'
    end
    object ItemsEXTPRICE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EXTPRICE'
      Calculated = True
    end
    object ItemsDESCRIPTION: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRIPTION'
      LookupDataSet = Parts
      LookupKeyFields = 'PARTNO'
      LookupResultField = 'DESCRIPTION'
      KeyFields = 'PARTNO'
      Lookup = True
    end
    object ItemsSELLPRICE: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'SELLPRICE'
      LookupDataSet = Parts
      LookupKeyFields = 'PARTNO'
      LookupResultField = 'LISTPRICE'
      KeyFields = 'PARTNO'
      Lookup = True
    end
  end
  object Parts: TIBDataSet
    Database = Database
    Transaction = Transaction
    BeforeOpen = PartsBeforeOpen
    OnCalcFields = PartsCalcFields
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PARTS'
      'where'
      '  PARTNO = :OLD_PARTNO')
    InsertSQL.Strings = (
      'insert into PARTS'
      
        '  (COST, DESCRIPTION, LISTPRICE, ONHAND, ONORDER, PARTNO, VENDOR' +
        'NO)'
      'values'
      
        '  (:COST, :DESCRIPTION, :LISTPRICE, :ONHAND, :ONORDER, :PARTNO, ' +
        ':VENDORNO)')
    RefreshSQL.Strings = (
      'Select '
      '  PARTNO,'
      '  VENDORNO,'
      '  DESCRIPTION,'
      '  ONHAND,'
      '  ONORDER,'
      '  COST,'
      '  LISTPRICE'
      'from PARTS '
      'where'
      '  PARTNO = :PARTNO')
    SelectSQL.Strings = (
      'select *  from PARTS')
    ModifySQL.Strings = (
      'update PARTS'
      'set'
      '  COST = :COST,'
      '  DESCRIPTION = :DESCRIPTION,'
      '  LISTPRICE = :LISTPRICE,'
      '  ONHAND = :ONHAND,'
      '  ONORDER = :ONORDER,'
      '  PARTNO = :PARTNO,'
      '  VENDORNO = :VENDORNO'
      'where'
      '  PARTNO = :OLD_PARTNO')
    ParamCheck = True
    UniDirectional = False
    Left = 208
    Top = 24
    object PartsPARTNO: TFloatField
      FieldName = 'PARTNO'
      Origin = '"PARTS"."PARTNO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PartsVENDORNO: TFloatField
      FieldName = 'VENDORNO'
      Origin = '"PARTS"."VENDORNO"'
      Required = True
    end
    object PartsDESCRIPTION: TIBStringField
      FieldName = 'DESCRIPTION'
      Origin = '"PARTS"."DESCRIPTION"'
      Required = True
      Size = 30
    end
    object PartsONHAND: TFloatField
      FieldName = 'ONHAND'
      Origin = '"PARTS"."ONHAND"'
    end
    object PartsONORDER: TFloatField
      FieldName = 'ONORDER'
      Origin = '"PARTS"."ONORDER"'
    end
    object PartsCOST: TFloatField
      FieldName = 'COST'
      Origin = '"PARTS"."COST"'
    end
    object PartsLISTPRICE: TFloatField
      FieldName = 'LISTPRICE'
      Origin = '"PARTS"."LISTPRICE"'
    end
    object PartsBACKORD: TBooleanField
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'BACKORD'
      DisplayValues = 'Yes;No'
      Calculated = True
    end
  end
  object Emps: TIBDataSet
    Database = Database
    Transaction = Transaction
    OnCalcFields = EmpsCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from EMPLOYEE'
      'where'
      '  EMPNO = :OLD_EMPNO')
    InsertSQL.Strings = (
      'insert into EMPLOYEE'
      '  (EMPNO, FIRSTNAME, HIREDATE, LASTNAME, PHONEEXT, SALARY)'
      'values'
      '  (:EMPNO, :FIRSTNAME, :HIREDATE, :LASTNAME, :PHONEEXT, :SALARY)')
    RefreshSQL.Strings = (
      'Select '
      '  EMPNO,'
      '  LASTNAME,'
      '  FIRSTNAME,'
      '  PHONEEXT,'
      '  HIREDATE,'
      '  SALARY'
      'from EMPLOYEE '
      'where'
      '  EMPNO = :EMPNO')
    SelectSQL.Strings = (
      'select * from EMPLOYEE')
    ModifySQL.Strings = (
      'update EMPLOYEE'
      'set'
      '  EMPNO = :EMPNO,'
      '  FIRSTNAME = :FIRSTNAME,'
      '  HIREDATE = :HIREDATE,'
      '  LASTNAME = :LASTNAME,'
      '  PHONEEXT = :PHONEEXT,'
      '  SALARY = :SALARY'
      'where'
      '  EMPNO = :OLD_EMPNO')
    ParamCheck = True
    UniDirectional = False
    Left = 272
    Top = 24
    object EmpsEMPNO: TIntegerField
      FieldName = 'EMPNO'
      Origin = '"EMPLOYEE"."EMPNO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object EmpsLASTNAME: TIBStringField
      FieldName = 'LASTNAME'
      Origin = '"EMPLOYEE"."LASTNAME"'
    end
    object EmpsFIRSTNAME: TIBStringField
      FieldName = 'FIRSTNAME'
      Origin = '"EMPLOYEE"."FIRSTNAME"'
      Size = 15
    end
    object EmpsPHONEEXT: TIBStringField
      FieldName = 'PHONEEXT'
      Origin = '"EMPLOYEE"."PHONEEXT"'
      Size = 4
    end
    object EmpsHIREDATE: TDateTimeField
      FieldName = 'HIREDATE'
      Origin = '"EMPLOYEE"."HIREDATE"'
    end
    object EmpsSALARY: TFloatField
      FieldName = 'SALARY'
      Origin = '"EMPLOYEE"."SALARY"'
    end
    object EmpsFULLNAME: TIBStringField
      FieldKind = fkCalculated
      FieldName = 'FULLNAME'
      Calculated = True
    end
  end
  object Vendors: TIBDataSet
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from VENDORS'
      'where'
      '  VENDORNO = :OLD_VENDORNO')
    InsertSQL.Strings = (
      'insert into VENDORS'
      
        '  (ADDRESS1, ADDRESS2, CITY, COUNTRY, FAX, PHONE, PREFERRED, STA' +
        'TE, VENDORNAME, '
      '   VENDORNO, ZIP)'
      'values'
      
        '  (:ADDRESS1, :ADDRESS2, :CITY, :COUNTRY, :FAX, :PHONE, :PREFERR' +
        'ED, :STATE, '
      '   :VENDORNAME, :VENDORNO, :ZIP)')
    RefreshSQL.Strings = (
      'Select '
      '  VENDORNO,'
      '  VENDORNAME,'
      '  ADDRESS1,'
      '  ADDRESS2,'
      '  CITY,'
      '  STATE,'
      '  ZIP,'
      '  COUNTRY,'
      '  PHONE,'
      '  FAX,'
      '  PREFERRED'
      'from VENDORS '
      'where'
      '  VENDORNO = :VENDORNO')
    SelectSQL.Strings = (
      'select * from VENDORS')
    ModifySQL.Strings = (
      'update VENDORS'
      'set'
      '  ADDRESS1 = :ADDRESS1,'
      '  ADDRESS2 = :ADDRESS2,'
      '  CITY = :CITY,'
      '  COUNTRY = :COUNTRY,'
      '  FAX = :FAX,'
      '  PHONE = :PHONE,'
      '  PREFERRED = :PREFERRED,'
      '  STATE = :STATE,'
      '  VENDORNAME = :VENDORNAME,'
      '  VENDORNO = :VENDORNO,'
      '  ZIP = :ZIP'
      'where'
      '  VENDORNO = :OLD_VENDORNO')
    ParamCheck = True
    UniDirectional = False
    Left = 336
    Top = 24
    object VendorsVENDORNO: TFloatField
      FieldName = 'VENDORNO'
      Origin = '"VENDORS"."VENDORNO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object VendorsVENDORNAME: TIBStringField
      FieldName = 'VENDORNAME'
      Origin = '"VENDORS"."VENDORNAME"'
      Size = 30
    end
    object VendorsADDRESS1: TIBStringField
      FieldName = 'ADDRESS1'
      Origin = '"VENDORS"."ADDRESS1"'
      Size = 30
    end
    object VendorsADDRESS2: TIBStringField
      FieldName = 'ADDRESS2'
      Origin = '"VENDORS"."ADDRESS2"'
      Size = 30
    end
    object VendorsCITY: TIBStringField
      FieldName = 'CITY'
      Origin = '"VENDORS"."CITY"'
    end
    object VendorsSTATE: TIBStringField
      FieldName = 'STATE'
      Origin = '"VENDORS"."STATE"'
    end
    object VendorsZIP: TIBStringField
      FieldName = 'ZIP'
      Origin = '"VENDORS"."ZIP"'
      Size = 10
    end
    object VendorsCOUNTRY: TIBStringField
      FieldName = 'COUNTRY'
      Origin = '"VENDORS"."COUNTRY"'
      Size = 15
    end
    object VendorsPHONE: TIBStringField
      FieldName = 'PHONE'
      Origin = '"VENDORS"."PHONE"'
      Size = 15
    end
    object VendorsFAX: TIBStringField
      FieldName = 'FAX'
      Origin = '"VENDORS"."FAX"'
      Size = 15
    end
    object VendorsPREFERRED: TIBStringField
      FieldName = 'PREFERRED'
      Origin = '"VENDORS"."PREFERRED"'
      Size = 1
    end
  end
  object NextCust: TIBDataSet
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from NEXTCUST'
      'where'
      '  NEWCUST = :OLD_NEWCUST')
    InsertSQL.Strings = (
      'insert into NEXTCUST'
      '  (NEWCUST)'
      'values'
      '  (:NEWCUST)')
    RefreshSQL.Strings = (
      'Select '
      '  NEWCUST'
      'from NEXTCUST '
      'where'
      '  NEWCUST = :NEWCUST')
    SelectSQL.Strings = (
      'select * from NEXTCUST')
    ModifySQL.Strings = (
      'update NEXTCUST'
      'set'
      '  NEWCUST = :NEWCUST'
      'where'
      '  NEWCUST = :OLD_NEWCUST')
    ParamCheck = True
    UniDirectional = False
    Left = 400
    Top = 24
    object NextCustNEWCUST: TFloatField
      FieldName = 'NEWCUST'
      Origin = '"NEXTCUST"."NEWCUST"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object NextOrd: TIBDataSet
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from NEXTORD'
      'where'
      '  NEWKEY = :OLD_NEWKEY')
    InsertSQL.Strings = (
      'insert into NEXTORD'
      '  (NEWKEY)'
      'values'
      '  (:NEWKEY)')
    RefreshSQL.Strings = (
      'Select '
      '  NEWKEY'
      'from NEXTORD '
      'where'
      '  NEWKEY = :NEWKEY')
    SelectSQL.Strings = (
      'select * from NEXTORD')
    ModifySQL.Strings = (
      'update NEXTORD'
      'set'
      '  NEWKEY = :NEWKEY'
      'where'
      '  NEWKEY = :OLD_NEWKEY')
    ParamCheck = True
    UniDirectional = False
    Left = 464
    Top = 24
    object NextOrdNEWKEY: TFloatField
      FieldName = 'NEWKEY'
      Origin = '"NEXTORD"."NEWKEY"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object CustByComp: TIBDataSet
    Database = Database
    Transaction = Transaction
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
      'select * from CUSTOMER'
      'order by company')
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
    Left = 528
    Top = 24
    object CustByCompCUSTNO: TFloatField
      FieldName = 'CUSTNO'
      Origin = '"CUSTOMER"."CUSTNO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CustByCompCOMPANY: TIBStringField
      FieldName = 'COMPANY'
      Origin = '"CUSTOMER"."COMPANY"'
      Required = True
      Size = 30
    end
    object CustByCompADDR1: TIBStringField
      FieldName = 'ADDR1'
      Origin = '"CUSTOMER"."ADDR1"'
      Size = 30
    end
    object CustByCompADDR2: TIBStringField
      FieldName = 'ADDR2'
      Origin = '"CUSTOMER"."ADDR2"'
      Size = 30
    end
    object CustByCompCITY: TIBStringField
      FieldName = 'CITY'
      Origin = '"CUSTOMER"."CITY"'
      Size = 15
    end
    object CustByCompSTATE: TIBStringField
      FieldName = 'STATE'
      Origin = '"CUSTOMER"."STATE"'
    end
    object CustByCompZIP: TIBStringField
      FieldName = 'ZIP'
      Origin = '"CUSTOMER"."ZIP"'
      Size = 10
    end
    object CustByCompCOUNTRY: TIBStringField
      FieldName = 'COUNTRY'
      Origin = '"CUSTOMER"."COUNTRY"'
    end
    object CustByCompPHONE: TIBStringField
      FieldName = 'PHONE'
      Origin = '"CUSTOMER"."PHONE"'
      Size = 15
    end
    object CustByCompFAX: TIBStringField
      FieldName = 'FAX'
      Origin = '"CUSTOMER"."FAX"'
      Size = 15
    end
    object CustByCompTAXRATE: TFloatField
      FieldName = 'TAXRATE'
      Origin = '"CUSTOMER"."TAXRATE"'
    end
    object CustByCompCONTACT: TIBStringField
      FieldName = 'CONTACT'
      Origin = '"CUSTOMER"."CONTACT"'
    end
    object CustByCompLASTINVOICEDATE: TDateTimeField
      FieldName = 'LASTINVOICEDATE'
      Origin = '"CUSTOMER"."LASTINVOICEDATE"'
    end
  end
  object Cust: TIBDataSet
    Database = Database
    Transaction = Transaction
    BeforeOpen = CustBeforeOpen
    BeforePost = CustBeforePost
    BufferChunks = 1000
    CachedUpdates = True
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
    Left = 592
    Top = 24
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
  object OrdByCust: TIBDataSet
    Database = Database
    Transaction = Transaction
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
      'select * from ORDERS'
      'where CUSTNO = :CUSTNO')
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
    DataSource = CustMasterSrc
    Left = 656
    Top = 24
    object OrdByCustORDERNO: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Order No'
      DisplayWidth = 10
      FieldName = 'ORDERNO'
    end
    object OrdByCustCUSTNO: TFloatField
      DisplayLabel = 'Cust No'
      FieldName = 'CUSTNO'
      Visible = False
    end
    object OrdByCustSALEDATE: TDateTimeField
      DisplayLabel = 'Sale Date'
      DisplayWidth = 9
      FieldName = 'SALEDATE'
      DisplayFormat = 'DDDDD'
    end
    object OrdByCustSHIPDATE: TDateTimeField
      DisplayLabel = 'Ship Date'
      DisplayWidth = 9
      FieldName = 'SHIPDATE'
      DisplayFormat = 'DDDDD'
    end
    object OrdByCustITEMSTOTAL: TCurrencyField
      DisplayLabel = 'Items Total'
      FieldName = 'ITEMSTOTAL'
      Visible = False
    end
    object OrdByCustTAXRATE: TFloatField
      DisplayLabel = 'Tax Rate'
      FieldName = 'TAXRATE'
      Visible = False
    end
    object OrdByCustFREIGHT: TCurrencyField
      DisplayLabel = 'Freight'
      FieldName = 'FREIGHT'
      Visible = False
    end
    object OrdByCustAMOUNTPAID: TCurrencyField
      DisplayLabel = 'Amount Paid'
      DisplayWidth = 14
      FieldName = 'AMOUNTPAID'
    end
    object OrdByCustAMOUNTDUE: TCurrencyField
      DisplayLabel = 'Amont Due'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'AMOUNTDUE'
      Calculated = True
    end
  end
end
