inherited RecViewForm: TRecViewForm
  Caption = 'Single Record View'
  ClientHeight = 322
  ClientWidth = 480
  ExplicitWidth = 496
  ExplicitHeight = 360
  PixelsPerInch = 96
  TextHeight = 13
  inherited GDSStdPanel: TPanel
    Width = 480
    ExplicitWidth = 480
  end
  inherited StdCtrlPanel: TPanel
    Width = 480
    ExplicitWidth = 480
    inherited PriorBtn: TButton
      Left = 385
      ExplicitLeft = 385
    end
  end
  object GroupBox2: TPanel [2]
    Left = 0
    Top = 161
    Width = 480
    Height = 161
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 42
      Width = 46
      Height = 13
      Caption = 'Order No:'
    end
    object Label2: TLabel
      Left = 8
      Top = 68
      Width = 47
      Height = 13
      Caption = 'Customer:'
    end
    object Label3: TLabel
      Left = 131
      Top = 41
      Width = 50
      Height = 13
      Caption = 'Sale Date:'
    end
    object Label4: TLabel
      Left = 300
      Top = 126
      Width = 62
      Height = 13
      Caption = 'Amount Due:'
    end
    object Label7: TLabel
      Left = 300
      Top = 19
      Width = 55
      Height = 13
      Caption = 'Items Total:'
      FocusControl = DBEdit3
    end
    object Label8: TLabel
      Left = 300
      Top = 92
      Width = 63
      Height = 13
      Caption = 'Amount Paid:'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 300
      Top = 67
      Width = 35
      Height = 13
      Caption = 'Freight:'
      FocusControl = DBEdit1
    end
    object Label9: TLabel
      Left = 300
      Top = 43
      Width = 21
      Height = 13
      Caption = 'Tax:'
      FocusControl = DBEdit5
    end
    object Bevel1: TBevel
      Left = 309
      Top = 115
      Width = 148
      Height = 2
      Shape = bsTopLine
    end
    object OrderNo: TDBEdit
      Left = 66
      Top = 39
      Width = 50
      Height = 21
      DataField = 'OrderNo'
      DataSource = OrdersSource
      TabOrder = 0
    end
    object CustName: TDBEdit
      Left = 66
      Top = 65
      Width = 187
      Height = 21
      DataField = 'CustName'
      DataSource = OrdersSource
      MaxLength = 30
      TabOrder = 1
    end
    object SaleDate: TDBEdit
      Left = 186
      Top = 39
      Width = 67
      Height = 21
      DataField = 'SaleDate'
      DataSource = OrdersSource
      TabOrder = 2
    end
    object AmountDue: TDBEdit
      Left = 376
      Top = 123
      Width = 81
      Height = 21
      DataField = 'AmountDue'
      DataSource = OrdersSource
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 376
      Top = 15
      Width = 81
      Height = 21
      DataField = 'ItemsTotal'
      DataSource = OrdersSource
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 376
      Top = 87
      Width = 81
      Height = 21
      DataField = 'AmountPaid'
      DataSource = OrdersSource
      TabOrder = 5
    end
    object DBEdit1: TDBEdit
      Left = 376
      Top = 63
      Width = 81
      Height = 21
      DataField = 'Freight'
      DataSource = OrdersSource
      TabOrder = 6
    end
    object DBEdit5: TDBEdit
      Left = 376
      Top = 39
      Width = 81
      Height = 21
      DataField = 'TaxAmount'
      DataSource = OrdersSource
      TabOrder = 7
    end
    object DBNavigator1: TDBNavigator
      Left = 107
      Top = 10
      Width = 88
      Height = 21
      DataSource = OrdersSource
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 8
    end
    object Panel1: TPanel
      Left = 71
      Top = 92
      Width = 177
      Height = 57
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 9
      object Label11: TLabel
        Left = 7
        Top = 34
        Width = 32
        Height = 13
        Caption = 'Terms:'
        FocusControl = DBEdit7
      end
      object Label12: TLabel
        Left = 23
        Top = 10
        Width = 18
        Height = 13
        Caption = 'PO:'
        FocusControl = DBEdit8
      end
      object OnCredit: TDBCheckBox
        Left = 96
        Top = 32
        Width = 77
        Height = 17
        Caption = 'On Credit'
        DataField = 'PaymentMethod'
        DataSource = OrdersSource
        TabOrder = 0
        ValueChecked = 'Credit'
        ValueUnchecked = 'Visa;Cash;Check;MC;Amex'
      end
      object DBEdit7: TDBEdit
        Left = 44
        Top = 30
        Width = 40
        Height = 21
        DataField = 'Terms'
        DataSource = OrdersSource
        TabOrder = 1
      end
      object DBEdit8: TDBEdit
        Left = 44
        Top = 6
        Width = 113
        Height = 21
        DataField = 'PO'
        DataSource = OrdersSource
        TabOrder = 2
      end
    end
  end
  inherited IBTransaction1: TIBTransaction
    Left = 154
  end
  inherited Database: TIBDatabase
    Left = 104
  end
  inherited Orders: TIBDataSet
    Left = 280
  end
end
