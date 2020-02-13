object frmPharmacy: TfrmPharmacy
  Left = 0
  Top = 0
  Caption = 'Pharmacy Remote Software'
  ClientHeight = 570
  ClientWidth = 860
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 81
    Align = alTop
    BevelInner = bvLowered
    BevelKind = bkTile
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 852
      Height = 73
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitHeight = 95
      object edtCentralServer: TLabeledEdit
        Left = 250
        Top = 22
        Width = 327
        Height = 21
        EditLabel.Width = 70
        EditLabel.Height = 13
        EditLabel.Caption = 'Central Server'
        TabOrder = 0
        Text = '127.0.0.1:c:\data\MEDICINES.IB'
      end
    end
    object edtSite: TLabeledEdit
      Left = 58
      Top = 24
      Width = 121
      Height = 21
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = 'Pharmacy ID'
      TabOrder = 1
      Text = 'P1'
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 81
    Width = 860
    Height = 489
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 1
    ExplicitTop = 129
    ExplicitHeight = 441
    object TabSheet1: TTabSheet
      Caption = 'Medicines'
      ExplicitHeight = 413
      object Splitter1: TSplitter
        Left = 161
        Top = 0
        Width = 10
        Height = 461
        ExplicitLeft = 145
        ExplicitHeight = 411
      end
      object lvCategory: TListView
        Left = 0
        Top = 0
        Width = 161
        Height = 461
        Align = alLeft
        Columns = <
          item
            Caption = 'Category'
            Width = 150
          end
          item
            Caption = 'Description'
            Width = 200
          end>
        Items.ItemData = {
          05440100000500000000000000FFFFFFFFFFFFFFFF02000000FFFFFFFF010000
          000841006C006500720067006900650073000000000000000000000000000000
          FFFFFFFFFFFFFFFF02000000FFFFFFFF020000000E430061007200640069006F
          00760061007300630075006C00610072000000000000000000000000000000FF
          FFFFFFFFFFFFFF02000000FFFFFFFF0300000010470061007300740072006F00
          65006E007400650072006F006C006F0067007900000000000000000000000000
          0000FFFFFFFFFFFFFFFF02000000FFFFFFFF040000000949006E0066006C0075
          0065006E007A0061000000000000000000000000000000FFFFFFFFFFFFFFFF02
          000000FFFFFFFF050000000F4D0075007300630075006C006F0073006B006500
          6C006500740061006C0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF}
        TabOrder = 0
        ViewStyle = vsReport
      end
      object lvMedicine: TListView
        Left = 171
        Top = 0
        Width = 219
        Height = 461
        Align = alLeft
        Columns = <
          item
            Caption = 'Medicines'
            Width = 210
          end>
        Items.ItemData = {
          05290100000300000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF010000
          001C4100760061006D00790073002000280066006C0075007400690063006100
          73006F006E00650020006600750072006F006100740065002900000000000000
          000000FFFFFFFFFFFFFFFF01000000FFFFFFFF02000000254200650063006F00
          6E00610073006500200028006200650063006C006F006D006500740061007300
          6F006E006500200064006900700072006F00700069006F006E00610074006500
          2900000000000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF0300000022
          46006C00690078006F006E006100730065002000280066006C00750074006900
          6300610073006F006E0065002000700072006F00700069006F006E0061007400
          650029000000000000FFFFFFFFFFFF}
        TabOrder = 1
        ViewStyle = vsReport
        ExplicitHeight = 411
      end
      object PageControl2: TPageControl
        Left = 390
        Top = 0
        Width = 462
        Height = 461
        ActivePage = TabSheet5
        Align = alClient
        TabOrder = 2
        ExplicitHeight = 413
        object TabSheet4: TTabSheet
          Caption = 'Details'
          ExplicitHeight = 385
          object Splitter2: TSplitter
            Left = 0
            Top = 216
            Width = 454
            Height = 3
            Cursor = crVSplit
            Align = alTop
            ExplicitLeft = 1
            ExplicitTop = 211
            ExplicitWidth = 199
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 454
            Height = 216
            Align = alTop
            Caption = 'Patient Advice'
            TabOrder = 0
            object MemoPATIENT_ADVICE: TMemo
              Left = 2
              Top = 15
              Width = 450
              Height = 199
              Align = alClient
              TabOrder = 0
            end
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 219
            Width = 454
            Height = 214
            Align = alClient
            Caption = 'Special Precautions'
            TabOrder = 1
            ExplicitHeight = 166
            object MemoSPECIAL_WARNINGS: TMemo
              Left = 2
              Top = 15
              Width = 450
              Height = 197
              Align = alClient
              TabOrder = 0
              ExplicitHeight = 149
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Web'
          ImageIndex = 1
          ExplicitHeight = 385
          object lblURL: TLabel
            Left = 0
            Top = 420
            Width = 454
            Height = 13
            Align = alBottom
            Caption = ' - '
            ExplicitTop = 372
            ExplicitWidth = 10
          end
          object WebBrowser1: TWebBrowser
            Left = 0
            Top = 25
            Width = 454
            Height = 395
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 345
            ControlData = {
              4C000000EC2E0000D32800000000000000000000000000000000000000000000
              000000004C000000000000000000000001000000E0D057007335CF11AE690800
              2B2E126202000000000000004C0000000114020000000000C000000000000046
              8000000000000000000000000000000000000000000000000000000000000000
              00000000000000000100000000000000000000000000000000000000}
          end
          object btnWebdetailsLoad: TButton
            Left = 0
            Top = 0
            Width = 454
            Height = 25
            Align = alTop
            Caption = 'Load Current'
            TabOrder = 1
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Customers'
      ImageIndex = 1
      ExplicitHeight = 413
      object lvCustomers: TListView
        Left = 0
        Top = 0
        Width = 225
        Height = 461
        Align = alLeft
        Columns = <
          item
            Caption = 'Customer List'
            Width = 200
          end>
        Items.ItemData = {
          05520000000200000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF010000
          000342006F006200000000000000000000FFFFFFFFFFFFFFFF01000000FFFFFF
          FF02000000054A0061006D00650073000000000000FFFFFFFF}
        TabOrder = 0
        ViewStyle = vsReport
        ExplicitLeft = -3
        ExplicitTop = 1
        ExplicitHeight = 411
      end
      object Panel4: TPanel
        Left = 225
        Top = 0
        Width = 627
        Height = 461
        Align = alClient
        TabOrder = 1
        ExplicitHeight = 413
        object Splitter3: TSplitter
          Left = 1
          Top = 137
          Width = 625
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitWidth = 273
        end
        object gbCustomer: TGroupBox
          Left = 1
          Top = 1
          Width = 625
          Height = 136
          Align = alTop
          Caption = 'Customer'
          TabOrder = 0
          object Label1: TLabel
            Left = 160
            Top = 24
            Width = 39
            Height = 13
            Caption = 'Address'
          end
          object LabeledEditCUSTOMER_NAME: TLabeledEdit
            Left = 16
            Top = 40
            Width = 121
            Height = 21
            EditLabel.Width = 89
            EditLabel.Height = 13
            EditLabel.Caption = 'CUSTOMER_NAME'
            TabOrder = 0
            Text = 'Bob'
          end
          object MemoCUSTOMER_ADDRESS: TMemo
            Left = 160
            Top = 43
            Width = 216
            Height = 70
            TabOrder = 1
          end
          object NavigatorBindSourceDB3: TBindNavigator
            Left = 382
            Top = 44
            Width = 240
            Height = 25
            DataSource = bsCustomer
            Orientation = orHorizontal
            TabOrder = 2
          end
        end
        object GroupBox3: TGroupBox
          Left = 1
          Top = 140
          Width = 625
          Height = 320
          Align = alClient
          Caption = 'Orders'
          TabOrder = 1
          ExplicitHeight = 272
          object Panel5: TPanel
            Left = 2
            Top = 250
            Width = 621
            Height = 68
            Align = alBottom
            TabOrder = 0
            ExplicitTop = 202
            object Label2: TLabel
              Left = 14
              Top = 24
              Width = 140
              Height = 13
              Caption = 'Avamys (fluticasone furoate)'
            end
            object btnAddOrder: TButton
              Left = 358
              Top = 24
              Width = 98
              Height = 25
              Caption = 'New Order'
              TabOrder = 0
            end
            object seQuantity: TSpinEdit
              Left = 231
              Top = 24
              Width = 121
              Height = 22
              MaxValue = 100
              MinValue = 0
              TabOrder = 1
              Value = 20
            end
          end
          object BindNavigator1: TBindNavigator
            Left = 2
            Top = 225
            Width = 621
            Height = 25
            DataSource = bsOrder
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
            Align = alBottom
            Orientation = orHorizontal
            TabOrder = 1
            ExplicitTop = 177
          end
          object gridOrders: TDBGrid
            Left = 2
            Top = 15
            Width = 621
            Height = 210
            Align = alClient
            DataSource = dtmdLocalDB.dsOrders
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'DATE_TIME'
                Title.Caption = 'Order Date Time'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MEDICINE_NAME'
                Title.Caption = 'Medicine Name'
                Width = 370
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTITY'
                Title.Caption = 'Quantity'
                Visible = True
              end>
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Data Updates'
      ImageIndex = 2
      ExplicitHeight = 413
      object PageControl3: TPageControl
        Left = 0
        Top = 41
        Width = 852
        Height = 391
        ActivePage = TabSheet7
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 343
        object TabSheet7: TTabSheet
          Caption = 'Categories'
          ExplicitHeight = 315
          inline FrameCategory: TFrame1
            Left = 0
            Top = 0
            Width = 844
            Height = 363
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 844
            ExplicitHeight = 315
            inherited lblQry: TLabel
              Width = 844
            end
            inherited Splitter2: TSplitter
              Top = 226
              Width = 844
              ExplicitLeft = 0
              ExplicitTop = 205
              ExplicitWidth = 844
            end
            inherited GroupBox1: TGroupBox
              Width = 844
              Height = 213
              ExplicitWidth = 844
              ExplicitHeight = 165
              inherited DBGrid1: TDBGrid
                Width = 840
                Height = 196
              end
            end
            inherited GroupBox3: TGroupBox
              Top = 229
              Width = 844
              ExplicitTop = 181
              ExplicitWidth = 844
              inherited DBGrid2: TDBGrid
                Width = 840
              end
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'Medicine'
          ExplicitHeight = 315
          inline FrameMedicine: TFrame1
            Left = 0
            Top = 0
            Width = 844
            Height = 363
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 844
            ExplicitHeight = 315
            inherited lblQry: TLabel
              Width = 844
            end
            inherited Splitter2: TSplitter
              Top = 226
              Width = 844
              ExplicitLeft = 0
              ExplicitTop = 205
              ExplicitWidth = 844
            end
            inherited GroupBox1: TGroupBox
              Width = 844
              Height = 213
              ExplicitWidth = 844
              ExplicitHeight = 165
              inherited DBGrid1: TDBGrid
                Width = 840
                Height = 196
              end
            end
            inherited GroupBox3: TGroupBox
              Top = 229
              Width = 844
              ExplicitTop = 181
              ExplicitWidth = 844
              inherited DBGrid2: TDBGrid
                Width = 840
              end
            end
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'Medicine Categories'
          ImageIndex = 2
          ExplicitHeight = 315
          inline FrameLinks: TFrame1
            Left = 0
            Top = 0
            Width = 844
            Height = 363
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 844
            ExplicitHeight = 315
            inherited lblQry: TLabel
              Width = 844
            end
            inherited Splitter2: TSplitter
              Top = 226
              Width = 844
              ExplicitLeft = 0
              ExplicitTop = 205
              ExplicitWidth = 844
            end
            inherited GroupBox1: TGroupBox
              Width = 844
              Height = 213
              ExplicitWidth = 844
              ExplicitHeight = 165
              inherited DBGrid1: TDBGrid
                Width = 840
                Height = 196
              end
            end
            inherited GroupBox3: TGroupBox
              Top = 229
              Width = 844
              ExplicitTop = 181
              ExplicitWidth = 844
              inherited DBGrid2: TDBGrid
                Width = 840
              end
            end
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 852
        Height = 41
        Align = alTop
        TabOrder = 1
        object btnFetchDeltas: TButton
          Left = 6
          Top = 5
          Width = 99
          Height = 30
          Caption = 'Fetch Delta'
          TabOrder = 0
        end
        object btnPostDeltas: TButton
          Left = 111
          Top = 5
          Width = 99
          Height = 30
          Caption = 'Post Deltas'
          TabOrder = 1
        end
        object cbShowMerged: TCheckBox
          Left = 232
          Top = 8
          Width = 97
          Height = 17
          Caption = 'Show Merged'
          TabOrder = 2
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 432
        Width = 852
        Height = 29
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 384
        object Label3: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 100
          Height = 21
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = 'Insert'
          Color = clLime
          ParentColor = False
          Transparent = False
          ExplicitLeft = 1
          ExplicitTop = 1
          ExplicitHeight = 27
        end
        object Label4: TLabel
          AlignWithMargins = True
          Left = 110
          Top = 4
          Width = 100
          Height = 21
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = 'Updates'
          Color = clYellow
          ParentColor = False
          Transparent = False
          ExplicitLeft = 95
          ExplicitTop = 2
          ExplicitHeight = 27
        end
        object Label5: TLabel
          AlignWithMargins = True
          Left = 216
          Top = 4
          Width = 100
          Height = 21
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = 'Deletes'
          Color = clRed
          ParentColor = False
          Transparent = False
          ExplicitLeft = 121
          ExplicitTop = 1
          ExplicitHeight = 27
        end
        object Label6: TLabel
          AlignWithMargins = True
          Left = 322
          Top = 4
          Width = 526
          Height = 21
          Align = alClient
          Alignment = taCenter
          Caption = 'Updated Fields are in Bold'
          ExplicitWidth = 124
          ExplicitHeight = 13
        end
      end
    end
  end
  object bsCategory: TBindSourceDB
    DataSet = dtmdLocalDB.qryCategory
    ScopeMappings = <>
    Left = 816
    Top = 248
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 700
    Top = 21
    object LinkListControlToField2: TLinkListControlToField
      Category = 'Quick Bindings'
      DataSource = bsCategory
      FieldName = 'CATEGORY_NAME'
      Control = lvCategory
      FillExpressions = <
        item
          SourceMemberName = 'DESCRIPTION'
          ControlMemberName = 'SubItems[0]'
        end>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
    object LinkListControlToField1: TLinkListControlToField
      Category = 'Quick Bindings'
      DataSource = bsMedicines
      FieldName = 'MEDICINE_NAME'
      Control = lvMedicine
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
    object LinkControlToFieldPATIENT_ADVICE: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = bsMedicines
      FieldName = 'PATIENT_ADVICE'
      Control = MemoPATIENT_ADVICE
      Track = False
    end
    object LinkControlToFieldSPECIAL_WARNINGS: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = bsMedicines
      FieldName = 'SPECIAL_WARNINGS'
      Control = MemoSPECIAL_WARNINGS
      Track = False
    end
    object LinkListControlToField3: TLinkListControlToField
      Category = 'Quick Bindings'
      DataSource = bsCustomer
      FieldName = 'CUSTOMER_NAME'
      Control = lvCustomers
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
    object LinkControlToFieldCUSTOMER_ADDRESS: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = bsCustomer
      FieldName = 'CUSTOMER_ADDRESS'
      Control = MemoCUSTOMER_ADDRESS
      Track = False
    end
    object LinkControlToFieldCUSTOMER_NAME: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = bsCustomer
      FieldName = 'CUSTOMER_NAME'
      Control = LabeledEditCUSTOMER_NAME
      Track = True
    end
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = bsPharmacy
      FieldName = 'PHARMACY_NAME'
      Control = edtSite
      Track = True
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bsMedicines
      FieldName = 'MEDICINE_NAME'
      Component = Label2
      ComponentProperty = 'Caption'
    end
  end
  object bsMedicines: TBindSourceDB
    DataSet = dtmdLocalDB.qryMedicines
    ScopeMappings = <>
    Left = 784
    Top = 336
  end
  object bsCustomer: TBindSourceDB
    DataSet = dtmdLocalDB.qryCustomer
    ScopeMappings = <>
    Left = 776
    Top = 176
  end
  object bsOrder: TBindSourceDB
    DataSet = dtmdLocalDB.qryOrders
    ScopeMappings = <>
    Left = 776
    Top = 392
  end
  object bsPharmacy: TBindSourceDB
    DataSet = dtmdLocalDB.qryPharmacy
    ScopeMappings = <>
    Left = 776
    Top = 232
  end
end
