object frmPharmacy: TfrmPharmacy
  Left = 0
  Top = 0
  Caption = 'Pharmacy Remote Software'
  ClientHeight = 568
  ClientWidth = 860
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 73
    Align = alTop
    BevelInner = bvLowered
    BevelKind = bkTile
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 852
      Height = 65
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 194
      ExplicitWidth = 660
      ExplicitHeight = 121
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
      Left = 66
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
    Top = 73
    Width = 860
    Height = 495
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 1
    ExplicitTop = 129
    ExplicitHeight = 439
    object TabSheet1: TTabSheet
      Caption = 'Medicines'
      ExplicitHeight = 411
      object Splitter1: TSplitter
        Left = 161
        Top = 0
        Width = 10
        Height = 467
        ExplicitLeft = 145
        ExplicitHeight = 411
      end
      object lvCategory: TListView
        Left = 0
        Top = 0
        Width = 161
        Height = 467
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
          05460100000500000000000000FFFFFFFFFFFFFFFF02000000FFFFFFFF010000
          000641006C0065007200670079000346006F006F000000000000000000000000
          0000FFFFFFFFFFFFFFFF02000000FFFFFFFF020000000E430061007200640069
          006F00760061007300630075006C006100720000000000000000000000000000
          00FFFFFFFFFFFFFFFF02000000FFFFFFFF030000001047006100730074007200
          6F0065006E007400650072006F006C006F006700790000000000000000000000
          00000000FFFFFFFFFFFFFFFF02000000FFFFFFFF040000000949006E0066006C
          00750065006E007A0061000000000000000000000000000000FFFFFFFFFFFFFF
          FF02000000FFFFFFFF050000000F4D0075007300630075006C006F0073006B00
          65006C006500740061006C0000000000000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        TabOrder = 0
        ViewStyle = vsReport
        ExplicitHeight = 411
      end
      object lvMedicine: TListView
        Left = 171
        Top = 0
        Width = 219
        Height = 467
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
        Height = 467
        ActivePage = TabSheet5
        Align = alClient
        TabOrder = 2
        ExplicitHeight = 411
        object TabSheet4: TTabSheet
          Caption = 'Details'
          ExplicitHeight = 383
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
              Lines.Strings = (
                'For intranasal use only.'
                ''
                ''
                'Adults and adolescents (12 years and older)'
                ''
                
                  'Two sprays per nostril once daily (total daily dose, 110 microgr' +
                  'ams).'
                
                  'Once symptoms controlled, use maintenance dose of one spray per ' +
                  'nostril once daily (total '
                'daily dose, 55 micrograms).'
                
                  'Reduce to lowest dose at which effective control of symptoms is ' +
                  'maintained.'
                ''
                'Children aged 6 to 11 years'
                ''
                
                  'One spray per nostril once daily (total daily dose, 55 microgram' +
                  's).'
                
                  'If patient is not adequately responding, increase daily dose to ' +
                  '110 micrograms (two sprays '
                
                  'per nostril, once daily) and reduce back down to 55 micrograms d' +
                  'aily dose once control is '
                'achieved.')
              TabOrder = 0
            end
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 219
            Width = 454
            Height = 220
            Align = alClient
            Caption = 'Special Precautions'
            TabOrder = 1
            ExplicitHeight = 164
            object MemoSPECIAL_WARNINGS: TMemo
              Left = 2
              Top = 15
              Width = 450
              Height = 203
              Align = alClient
              Lines.Strings = (
                'Special Warnings and Precautions'
                ''
                
                  'Systemic effects of nasal corticosteroids may occur, particularl' +
                  'y when prescribed at high '
                
                  'doses for prolonged periods. These effects are much less likely ' +
                  'to occur than with oral '
                
                  'corticosteroids and may vary in individual patients and between ' +
                  'different corticosteroid '
                
                  'preparations. Potential systemic effects may include Cushing'#8217's s' +
                  'yndrome, Cushingoid '
                
                  'features, adrenal suppression, growth retardation in children an' +
                  'd adolescents, cataract, '
                
                  'glaucoma and more rarely, a range of psychological or behavioura' +
                  'l effects including '
                
                  'psychomotor hyperactivity, sleep disorders, anxiety, depression ' +
                  'or aggression (particularly '
                
                  'in children). Treatment with higher than recommended doses of na' +
                  'sal corticosteroids may '
                
                  'result in clinically significant adrenal suppression. Consider a' +
                  'dditional systemic '
                
                  'corticosteroid cover during periods of stress or elective surger' +
                  'y. Caution when prescribing '
                
                  'concurrently with other corticosteroids. A reduction in growth v' +
                  'elocity has been observed '
                
                  'in children treated with fluticasone furoate 110 micrograms dail' +
                  'y for one year. Therefore, '
                
                  'children should be maintained on the lowest possible efficacious' +
                  ' dose which delivers '
                
                  'adequate symptom control. It is recommended that growth of child' +
                  'ren receiving prolonged '
                
                  'treatment with nasal corticosteroids is regularly monitored. Con' +
                  'sider referring to a '
                
                  'paediatric specialist. May cause irritation of the nasal mucosa.' +
                  ' Caution when treating '
                
                  'patients with severe liver disease, systemic exposure likely to ' +
                  'be increased. Nasal and '
                
                  'inhaled corticosteroids may result in the development of glaucom' +
                  'a and/or cataracts. Close '
                
                  'monitoring is warranted in patients with a change in vision or w' +
                  'ith a history of increased '
                'intraocular pressure, glaucoma and/or cataracts.'
                ''
                'Drug Interactions'
                ''
                
                  'Caution is recommended when co-administering with potent CYP3A4 ' +
                  'inhibitors e.g. '
                
                  'ketoconazole and co-administration with ritonavir is not recomme' +
                  'nded because of the risk '
                'of increased systemic exposure of fluticasone furoate.'
                ''
                'Pregnancy and Lactation'
                ''
                'No adequate data available.'
                'Recommended nasal doses result in minimal systemic exposure.'
                
                  'It is unknown if fluticasone furoate nasal spray is excreted in ' +
                  'breast milk.'
                
                  'Only use if the expected benefits to the mother outweigh the pos' +
                  'sible risks to the foetus '
                'or child.')
              TabOrder = 0
              ExplicitHeight = 147
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Web'
          ImageIndex = 1
          ExplicitHeight = 383
          object lblURL: TLabel
            Left = 0
            Top = 426
            Width = 454
            Height = 13
            Align = alBottom
            Caption = ' - '
            ExplicitTop = 370
            ExplicitWidth = 10
          end
          object WebBrowser1: TWebBrowser
            Left = 0
            Top = 25
            Width = 454
            Height = 401
            Align = alClient
            TabOrder = 0
            ExplicitLeft = 2
            ExplicitTop = 19
            ExplicitHeight = 345
            ControlData = {
              4C000000EC2E0000722900000000000000000000000000000000000000000000
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
      ExplicitHeight = 411
      object lvCustomers: TListView
        Left = 0
        Top = 0
        Width = 225
        Height = 467
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
        Height = 467
        Align = alClient
        TabOrder = 1
        ExplicitHeight = 411
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
          Height = 326
          Align = alClient
          Caption = 'Orders'
          TabOrder = 1
          ExplicitHeight = 270
          object Panel5: TPanel
            Left = 2
            Top = 256
            Width = 621
            Height = 68
            Align = alBottom
            TabOrder = 0
            ExplicitTop = 200
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
            Top = 231
            Width = 621
            Height = 25
            DataSource = bsOrder
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
            Align = alBottom
            Orientation = orHorizontal
            TabOrder = 1
            ExplicitTop = 175
          end
          object gridOrders: TDBGrid
            Left = 2
            Top = 15
            Width = 621
            Height = 216
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
      ExplicitHeight = 411
      object PageControl3: TPageControl
        Left = 0
        Top = 41
        Width = 852
        Height = 397
        ActivePage = TabSheet7
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 341
        object TabSheet7: TTabSheet
          Caption = 'Categories'
          ExplicitHeight = 313
          inline FrameCategory: TFrame1
            Left = 0
            Top = 0
            Width = 844
            Height = 369
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 844
            ExplicitHeight = 313
            inherited lblQry: TLabel
              Width = 844
            end
            inherited Splitter2: TSplitter
              Top = 232
              Width = 844
              ExplicitTop = 205
              ExplicitWidth = 844
            end
            inherited GroupBox1: TGroupBox
              Width = 844
              Height = 219
              ExplicitWidth = 844
              ExplicitHeight = 163
              inherited DBGrid1: TDBGrid
                Width = 840
                Height = 202
              end
            end
            inherited GroupBox3: TGroupBox
              Top = 235
              Width = 844
              ExplicitTop = 179
              ExplicitWidth = 844
              inherited DBGrid2: TDBGrid
                Width = 840
              end
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'Medicine'
          ExplicitHeight = 313
          inline FrameMedicine: TFrame1
            Left = 0
            Top = 0
            Width = 844
            Height = 369
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 844
            ExplicitHeight = 313
            inherited lblQry: TLabel
              Width = 844
            end
            inherited Splitter2: TSplitter
              Top = 232
              Width = 844
              ExplicitTop = 205
              ExplicitWidth = 844
            end
            inherited GroupBox1: TGroupBox
              Width = 844
              Height = 219
              ExplicitWidth = 844
              ExplicitHeight = 163
              inherited DBGrid1: TDBGrid
                Width = 840
                Height = 202
              end
            end
            inherited GroupBox3: TGroupBox
              Top = 235
              Width = 844
              ExplicitTop = 179
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
          ExplicitHeight = 313
          inline FrameLinks: TFrame1
            Left = 0
            Top = 0
            Width = 844
            Height = 369
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 844
            ExplicitHeight = 313
            inherited lblQry: TLabel
              Width = 844
            end
            inherited Splitter2: TSplitter
              Top = 232
              Width = 844
              ExplicitTop = 205
              ExplicitWidth = 844
            end
            inherited GroupBox1: TGroupBox
              Width = 844
              Height = 219
              ExplicitWidth = 844
              ExplicitHeight = 163
              inherited DBGrid1: TDBGrid
                Width = 840
                Height = 202
              end
            end
            inherited GroupBox3: TGroupBox
              Top = 235
              Width = 844
              ExplicitTop = 179
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
        Top = 438
        Width = 852
        Height = 29
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 382
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
    Left = 20
    Top = 5
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
