object DraftProposalForm: TDraftProposalForm
  Left = 0
  Top = 0
  Caption = 'Draft Proposal'
  ClientHeight = 631
  ClientWidth = 836
  Color = clBtnFace
  CustomTitleBar.Height = 0
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DraftCardPanel: TCardPanel
    Left = 0
    Top = 0
    Width = 836
    Height = 631
    Align = alClient
    ActiveCard = DraftCard
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 840
    ExplicitHeight = 657
    object DraftCard: TCard
      Left = 0
      Top = 0
      Width = 836
      Height = 631
      Caption = 'DraftCard'
      CardIndex = 0
      TabOrder = 0
      ExplicitWidth = 840
      ExplicitHeight = 657
      object DraftHeaderPanel: TPanel
        AlignWithMargins = True
        Left = 25
        Top = 3
        Width = 808
        Height = 67
        Margins.Left = 25
        Align = alTop
        BevelOuter = bvNone
        FullRepaint = False
        TabOrder = 0
        ExplicitWidth = 812
        object Label11: TLabel
          AlignWithMargins = True
          Left = 108
          Top = 10
          Width = 210
          Height = 47
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Caption = 'New Proposal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 45
        end
        object VirtualImage1: TVirtualImage
          Left = 0
          Top = 0
          Width = 105
          Height = 67
          Align = alLeft
          ImageCollection = MainForm.ImageCollection1
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 16
          ImageName = 'baseline_whatshot_white'
          ExplicitLeft = 40
        end
      end
      object RelativePanel1: TRelativePanel
        AlignWithMargins = True
        Left = 25
        Top = 282
        Width = 786
        Height = 223
        Margins.Left = 25
        Margins.Right = 25
        ControlCollection = <
          item
            Control = LineItemsStringGrid
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = BindNavigator1
            AlignBottomWithPanel = True
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
          end>
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 790
        object LineItemsStringGrid: TStringGrid
          Tag = 4
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 780
          Height = 184
          ColCount = 4
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          TabOrder = 0
          ColWidths = (
            64
            124
            64
            64)
        end
        object BindNavigator1: TBindNavigator
          AlignWithMargins = True
          Left = 3
          Top = 195
          Width = 780
          Height = 25
          DataSource = BindSourceDBLineItems
          Orientation = orHorizontal
          TabOrder = 1
        end
      end
      object RelativePanel2: TRelativePanel
        AlignWithMargins = True
        Left = 25
        Top = 511
        Width = 786
        Height = 117
        Margins.Left = 25
        Margins.Right = 25
        ControlCollection = <
          item
            Control = Panel1
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = Panel6
            AlignBottomWithPanel = True
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
          end>
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitWidth = 790
        ExplicitHeight = 143
        object Panel1: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 780
          Height = 37
          BevelOuter = bvNone
          TabOrder = 0
          object Total: TLabel
            Left = 611
            Top = 0
            Width = 42
            Height = 37
            Margins.Right = 6
            Align = alRight
            Alignment = taRightJustify
            Caption = 'Total:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = 615
            ExplicitHeight = 19
          end
          object TotalEdit: TEdit
            AlignWithMargins = True
            Left = 656
            Top = 3
            Width = 121
            Height = 31
            Align = alRight
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TextHint = 'Total'
            ExplicitLeft = 660
            ExplicitHeight = 27
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 76
          Width = 786
          Height = 41
          BevelOuter = bvNone
          TabOrder = 1
          object PreviewButton: TButton
            AlignWithMargins = True
            Left = 656
            Top = 3
            Width = 127
            Height = 35
            Align = alRight
            Caption = 'Preview'
            TabOrder = 0
            OnClick = PreviewButtonClick
            ExplicitLeft = 660
          end
          object CancelButton: TButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 133
            Height = 35
            Align = alLeft
            Cancel = True
            Caption = 'Cancel'
            TabOrder = 1
            OnClick = CancelButtonClick
          end
        end
      end
      object StackPanel1: TStackPanel
        AlignWithMargins = True
        Left = 25
        Top = 76
        Width = 786
        Margins.Left = 25
        Margins.Right = 25
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = Panel5
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpTop
          end
          item
            Control = Panel4
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpTop
          end
          item
            Control = Panel3
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpTop
          end
          item
            Control = Panel2
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpTop
          end>
        TabOrder = 3
        ExplicitWidth = 790
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 786
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          object Label1: TLabel
            AlignWithMargins = True
            Left = 676
            Top = 0
            Width = 107
            Height = 41
            Margins.Top = 0
            Margins.Bottom = 0
            Align = alRight
            Caption = 'Invoice'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -32
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = 680
            ExplicitHeight = 45
          end
          object CompanyEdit: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 8
            Width = 282
            Height = 25
            Margins.Top = 8
            Margins.Bottom = 8
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TextHint = 'Company Name'
            ExplicitHeight = 27
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 43
          Width = 786
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Address1Edit: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 8
            Width = 282
            Height = 25
            Margins.Top = 8
            Margins.Bottom = 8
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TextHint = 'Street Address'
            ExplicitHeight = 27
          end
          object DateEdit: TEdit
            AlignWithMargins = True
            Left = 660
            Top = 8
            Width = 123
            Height = 25
            Margins.Top = 8
            Margins.Bottom = 8
            Align = alRight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TextHint = 'Date'
            ExplicitLeft = 664
            ExplicitHeight = 27
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 86
          Width = 786
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Address2Edit: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 8
            Width = 282
            Height = 25
            Margins.Top = 8
            Margins.Bottom = 8
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TextHint = 'City, State, Zip'
            ExplicitHeight = 27
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 129
          Width = 786
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PhoneEdit: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 8
            Width = 282
            Height = 25
            Margins.Top = 8
            Margins.Bottom = 8
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TextHint = 'Phone'
            ExplicitHeight = 27
          end
        end
      end
      object ProposalCSSMemo: TMemo
        Left = 344
        Top = 37
        Width = 393
        Height = 23
        Lines.Strings = (
          '<style type="text/css">'
          'body {'
          '  font-family: "Helvetica Neue", '
          'Helvetica, Arial;'
          '  font-size: 14px;'
          '  line-height: 20px;'
          '  font-weight: 400;'
          '  color: #3b3b3b;'
          '  -webkit-font-smoothing: '
          'antialiased;'
          '  font-smoothing: antialiased;'
          '  background: #2b2b2b;'
          '}'
          ''
          '.container-fluid {'
          '  margin: 0 auto;'
          '  padding: 40px;'
          '  max-width: 100%;'
          '}'
          ''
          '.table {'
          '  margin: 0 0 40px 0;'
          '  width: 100%;'
          '  box-shadow: 0 1px 3px rgba(0, 0, '
          '0, 0.2);'
          '  display: table;'
          '}'
          '@media screen and (max-width: '
          '100%) {'
          '  .table {'
          '    display: block;'
          '  }'
          '}'
          ''
          '.row {'
          '  display: table-row;'
          '  background: #f6f6f6;'
          '}'
          '.row:nth-of-type(odd) {'
          '  background: #e9e9e9;'
          '}'
          '.row.header {'
          '  font-weight: 900;'
          '  color: #ffffff;'
          '  background: #ea6153;'
          '}'
          '.row.green {'
          '  background: #27ae60;'
          '}'
          '.row.blue {'
          '  background: #2980b9;'
          '}'
          '.row.ltblue {'
          '  background: #3792D1;'
          '}'
          '@media screen and (max-width: '
          '100%) {'
          '  .row {'
          '    padding: 8px 0;'
          '    display: block;'
          '  }'
          '}'
          ''
          '.col-xs-6 {'
          '  padding: 6px 12px;'
          '  display: table-cell;'
          '}'
          '@media screen and (max-width: '
          '100%) {'
          '  .col-xs-6 {'
          '    padding: 2px 12px;'
          '    display: block;'
          '  }'
          '}'
          ''
          '.col-xs-12 {'
          '  padding: 6px 12px;'
          '  display: table-cell;'
          '}'
          '@media screen and (max-width: '
          '100%) {'
          '  .col-xs-12 {'
          '    padding: 2px 12px;'
          '    display: block;'
          '  }'
          '}'
          '</style>')
        TabOrder = 4
        Visible = False
        WordWrap = False
      end
    end
    object PreviewCard: TCard
      Left = 0
      Top = 0
      Width = 836
      Height = 631
      Caption = 'PreviewCard'
      CardIndex = 1
      TabOrder = 1
      OnClick = PreviewCardClick
      ExplicitWidth = 840
      ExplicitHeight = 657
      object WebBrowser1: TWebBrowser
        AlignWithMargins = True
        Left = 25
        Top = 76
        Width = 790
        Height = 531
        Margins.Left = 25
        Margins.Right = 25
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 344
        ExplicitTop = 160
        ExplicitWidth = 300
        ExplicitHeight = 150
        ControlData = {
          4C000000A6510000E13600000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
      object PreviewHeaderPanel: TPanel
        AlignWithMargins = True
        Left = 25
        Top = 3
        Width = 812
        Height = 67
        Margins.Left = 25
        Align = alTop
        BevelOuter = bvNone
        FullRepaint = False
        TabOrder = 1
        object Label2: TLabel
          AlignWithMargins = True
          Left = 108
          Top = 15
          Width = 261
          Height = 37
          Margins.Top = 15
          Margins.Bottom = 15
          Align = alLeft
          Caption = 'Proposal Preview'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 45
        end
        object VirtualImage2: TVirtualImage
          Left = 0
          Top = 0
          Width = 105
          Height = 67
          Align = alLeft
          ImageCollection = MainForm.ImageCollection1
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 16
          ImageName = 'baseline_whatshot_white'
          ExplicitLeft = 8
        end
        object ReportMemo: TMemo
          Left = 712
          Top = 24
          Width = 25
          Height = 22
          Lines.Strings = (
            '')
          TabOrder = 0
          Visible = False
          WordWrap = False
        end
      end
      object NavPanel: TPanel
        AlignWithMargins = True
        Left = 25
        Top = 587
        Width = 786
        Height = 41
        Margins.Left = 25
        Margins.Right = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitTop = 613
        ExplicitWidth = 790
        object SaveProposalButton: TButton
          AlignWithMargins = True
          Left = 660
          Top = 3
          Width = 127
          Height = 35
          Align = alRight
          Caption = 'Save Proposal'
          TabOrder = 0
          OnClick = SaveProposalButtonClick
        end
        object BackButton: TButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 133
          Height = 35
          Align = alLeft
          Caption = 'Back'
          TabOrder = 1
          OnClick = BackButtonClick
        end
      end
    end
  end
  object BindSourceDBProposal: TBindSourceDB
    DataSet = DM.ProposalsFDTable
    ScopeMappings = <>
    Left = 560
    Top = 384
  end
  object BindSourceDBLineItems: TBindSourceDB
    DataSource.OnDataChange = BindSourceDBLineItemsSubDataSourceDataChange
    DataSet = DM.LineItemsFDMemTable
    ScopeMappings = <>
    Left = 400
    Top = 408
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 788
    Top = 29
    object LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDBLineItems
      GridControl = LineItemsStringGrid
      Columns = <>
    end
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDBDraftProposal
      FieldName = 'CompanyName'
      Control = CompanyEdit
      Track = True
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDBDraftProposal
      FieldName = 'Address1'
      Control = Address1Edit
      Track = True
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDBDraftProposal
      FieldName = 'Address2'
      Control = Address2Edit
      Track = True
    end
    object LinkControlToField4: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDBDraftProposal
      FieldName = 'Date'
      Control = DateEdit
      Track = True
    end
    object LinkControlToField5: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDBDraftProposal
      FieldName = 'Phone'
      Control = PhoneEdit
      Track = True
    end
    object LinkControlToField6: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDBDraftProposal
      FieldName = 'Total'
      Control = TotalEdit
      Track = True
    end
  end
  object BindSourceDBDraftProposal: TBindSourceDB
    DataSet = DM.DraftProposalFDMemTable
    ScopeMappings = <>
    Left = 416
    Top = 336
  end
  object BindSourceDBProposalQuery: TBindSourceDB
    DataSet = DM.FDProposalsQuery
    ScopeMappings = <>
    Left = 584
    Top = 440
  end
end
