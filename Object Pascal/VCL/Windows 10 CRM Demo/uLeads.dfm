object LeadsForm: TLeadsForm
  Left = 0
  Top = 0
  Caption = 'Lead Detail'
  ClientHeight = 631
  ClientWidth = 1069
  Color = clBtnFace
  CustomTitleBar.Height = 31
  Constraints.MinHeight = 575
  Constraints.MinWidth = 700
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Top = 31
  OldCreateOrder = False
  StyleElements = [seFont, seClient]
  PixelsPerInch = 96
  TextHeight = 13
  object Panel14: TPanel
    Left = 0
    Top = 0
    Width = 1069
    Height = 631
    Align = alClient
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 0
    object ScrollBox1: TScrollBox
      AlignWithMargins = True
      Left = 3
      Top = 106
      Width = 1063
      Height = 522
      Margins.Top = 33
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 0
      object DetailRelativePanel: TRelativePanel
        Left = 0
        Top = 0
        Width = 1046
        Height = 1206
        ControlCollection = <
          item
            Control = FormPanel
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = False
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = DocsPanel
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = False
            AlignRightWithPanel = True
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end>
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        FullRepaint = False
        TabOrder = 0
        OnResize = DetailRelativePanelResize
        DesignSize = (
          1046
          1206)
        object FormPanel: TPanel
          AlignWithMargins = True
          Left = 30
          Top = 3
          Width = 600
          Height = 1200
          Margins.Left = 30
          Margins.Right = 30
          Anchors = []
          BevelOuter = bvNone
          FullRepaint = False
          TabOrder = 0
          object DatesPanel: TPanel
            Left = 0
            Top = 113
            Width = 600
            Height = 80
            Align = alTop
            BevelOuter = bvNone
            FullRepaint = False
            TabOrder = 0
            object DateContactedPanel: TPanel
              Left = 150
              Top = 0
              Width = 150
              Height = 80
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object Label9: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 144
                Height = 30
                Align = alTop
                Caption = 'Date Contacted'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -21
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                ExplicitWidth = 145
              end
              object DateContactedPicker: TDateTimePicker
                AlignWithMargins = True
                Left = 3
                Top = 46
                Width = 144
                Height = 31
                Margins.Top = 10
                Align = alClient
                Date = 43916.000000000000000000
                Format = ' '
                Time = 0.506186122685903700
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = DateContactedPickerChange
              end
            end
            object DateCreatedPanel: TPanel
              Left = 0
              Top = 0
              Width = 150
              Height = 80
              Align = alLeft
              BevelOuter = bvNone
              FullRepaint = False
              TabOrder = 1
              object Label8: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 144
                Height = 30
                Align = alTop
                Caption = 'Date Created'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -21
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                ExplicitWidth = 122
              end
              object DateCreatedPicker: TDateTimePicker
                AlignWithMargins = True
                Left = 3
                Top = 46
                Width = 144
                Height = 31
                Margins.Top = 10
                Align = alClient
                Date = 43916.000000000000000000
                Format = ' '
                Time = 0.506186250000610000
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = DateContactedPickerChange
              end
            end
            object DateDraftedPanel: TPanel
              Left = 300
              Top = 0
              Width = 150
              Height = 80
              Align = alClient
              BevelOuter = bvNone
              FullRepaint = False
              TabOrder = 2
              object Label13: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 144
                Height = 30
                Align = alTop
                Caption = 'Date Drafted'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -21
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                ExplicitWidth = 120
              end
              object DateDraftedPicker: TDateTimePicker
                AlignWithMargins = True
                Left = 3
                Top = 46
                Width = 144
                Height = 31
                Margins.Top = 10
                Align = alClient
                Date = 43916.000000000000000000
                Format = ' '
                Time = 0.506186516206071200
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = DateContactedPickerChange
              end
            end
            object DateClosedPanel: TPanel
              Left = 450
              Top = 0
              Width = 150
              Height = 80
              Align = alRight
              BevelOuter = bvNone
              FullRepaint = False
              TabOrder = 3
              object Label12: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 144
                Height = 30
                Align = alTop
                Caption = 'Date Closed'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -21
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                ExplicitWidth = 112
              end
              object DateClosedPicker: TDateTimePicker
                AlignWithMargins = True
                Left = 3
                Top = 46
                Width = 144
                Height = 31
                Margins.Top = 10
                Align = alClient
                Date = 43916.000000000000000000
                Format = ' '
                Time = 0.506186446757055800
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = DateContactedPickerChange
              end
            end
          end
          object UserPanel: TPanel
            Left = 0
            Top = 513
            Width = 600
            Height = 80
            Align = alTop
            BevelOuter = bvNone
            FullRepaint = False
            TabOrder = 1
            object Label7: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 594
              Height = 30
              Align = alTop
              Caption = 'User'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 41
            end
            object UserEdit: TEdit
              AlignWithMargins = True
              Left = 3
              Top = 46
              Width = 594
              Height = 31
              Margins.Top = 10
              Align = alClient
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ExplicitHeight = 29
            end
          end
          object EmailPanel: TPanel
            Left = 0
            Top = 433
            Width = 600
            Height = 80
            Align = alTop
            BevelOuter = bvNone
            FullRepaint = False
            TabOrder = 2
            object Label6: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 594
              Height = 30
              Align = alTop
              Caption = 'Email'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 50
            end
            object EmailEdit: TEdit
              AlignWithMargins = True
              Left = 3
              Top = 46
              Width = 455
              Height = 31
              Margins.Top = 10
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ExplicitHeight = 29
            end
            object Button8: TButton
              AlignWithMargins = True
              Left = 464
              Top = 46
              Width = 133
              Height = 31
              Margins.Top = 10
              Align = alRight
              Caption = 'Email'
              TabOrder = 1
            end
          end
          object OfficePhonePanel: TPanel
            Left = 0
            Top = 353
            Width = 600
            Height = 80
            Align = alTop
            BevelOuter = bvNone
            FullRepaint = False
            TabOrder = 3
            object Label5: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 594
              Height = 30
              Align = alTop
              Caption = 'Office Phone'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 121
            end
            object OfficePhoneEdit: TEdit
              AlignWithMargins = True
              Left = 3
              Top = 46
              Width = 455
              Height = 31
              Margins.Top = 10
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              NumbersOnly = True
              ParentFont = False
              TabOrder = 0
              ExplicitHeight = 29
            end
            object Button7: TButton
              AlignWithMargins = True
              Left = 464
              Top = 46
              Width = 133
              Height = 31
              Margins.Top = 10
              Align = alRight
              Caption = 'Call'
              TabOrder = 1
            end
          end
          object AcctPanel: TPanel
            Left = 0
            Top = 273
            Width = 600
            Height = 80
            Align = alTop
            BevelOuter = bvNone
            FullRepaint = False
            TabOrder = 4
            object Label4: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 594
              Height = 30
              Align = alTop
              Caption = 'Account Name'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 139
            end
            object AccountNameComboBox: TComboBox
              AlignWithMargins = True
              Left = 3
              Top = 46
              Width = 594
              Height = 29
              Margins.Top = 10
              Align = alClient
              ExtendedUI = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = 'Example, Inc.'
            end
          end
          object NamePanel: TPanel
            Left = 0
            Top = 193
            Width = 600
            Height = 80
            Align = alTop
            BevelOuter = bvNone
            FullRepaint = False
            TabOrder = 5
            object Label3: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 594
              Height = 30
              Align = alTop
              Caption = 'Name'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 56
            end
            object NameEdit: TEdit
              AlignWithMargins = True
              Left = 3
              Top = 46
              Width = 594
              Height = 31
              Margins.Top = 10
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ExplicitHeight = 29
            end
          end
          object StatusPanel: TPanel
            Left = 0
            Top = 33
            Width = 600
            Height = 80
            Align = alTop
            BevelOuter = bvNone
            FullRepaint = False
            TabOrder = 6
            object Label2: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 594
              Height = 30
              Align = alTop
              Caption = 'Status'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 56
            end
            object StatusComboBox: TComboBox
              AlignWithMargins = True
              Left = 3
              Top = 46
              Width = 594
              Height = 29
              Margins.Top = 10
              Align = alClient
              ExtendedUI = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = 'New'
              Items.Strings = (
                'New'
                'Active'
                'Proposal Sent'
                'Closed'
                'Inactive')
            end
          end
          object NotesPanel: TPanel
            Left = 0
            Top = 593
            Width = 600
            Height = 185
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 7
            object Label10: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 594
              Height = 30
              Align = alTop
              AutoSize = False
              Caption = 'Notes'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitLeft = 0
              ExplicitWidth = 194
            end
            object NotesMemo: TMemo
              AlignWithMargins = True
              Left = 3
              Top = 39
              Width = 594
              Height = 143
              Align = alClient
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object LeadIdPanel: TPanel
            Left = 0
            Top = 0
            Width = 600
            Height = 33
            Align = alTop
            BevelOuter = bvNone
            FullRepaint = False
            TabOrder = 8
            object Label14: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 73
              Height = 27
              Align = alLeft
              Caption = 'Lead Id:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitHeight = 30
            end
            object LeadIdLabel: TLabel
              AlignWithMargins = True
              Left = 82
              Top = 3
              Width = 6
              Height = 27
              Align = alLeft
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitHeight = 30
            end
          end
        end
        object DocsPanel: TPanel
          AlignWithMargins = True
          Left = 743
          Top = 3
          Width = 300
          Height = 502
          Margins.Left = 33
          Anchors = []
          BevelOuter = bvNone
          TabOrder = 1
          object Label1: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 294
            Height = 30
            Align = alTop
            Caption = 'Documents'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 106
          end
          object Panel9: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 39
            Width = 294
            Height = 156
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            object AddDocButton: TButton
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 288
              Height = 46
              Align = alTop
              Caption = 'Add Document'
              Style = bsCommandLink
              TabOrder = 1
              OnClick = AddDocButtonClick
            end
            object ViewDocButton: TButton
              AlignWithMargins = True
              Left = 3
              Top = 55
              Width = 288
              Height = 46
              Align = alTop
              Caption = 'View Document'
              Style = bsCommandLink
              TabOrder = 2
              OnClick = ViewDocButtonClick
            end
            object DeleteDocButton: TButton
              AlignWithMargins = True
              Left = 3
              Top = 107
              Width = 288
              Height = 46
              Align = alTop
              Caption = 'Delete Document'
              Style = bsCommandLink
              TabOrder = 0
              OnClick = DeleteDocButtonClick
            end
          end
          object DocStringGrid: TStringGrid
            Tag = 2
            AlignWithMargins = True
            Left = 3
            Top = 201
            Width = 294
            Height = 298
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            ColCount = 2
            DefaultRowHeight = 48
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
            TabOrder = 1
            ColWidths = (
              64
              229)
          end
        end
      end
    end
    object Panel13: TPanel
      AlignWithMargins = True
      Left = 25
      Top = 3
      Width = 1041
      Height = 67
      Margins.Left = 25
      Align = alTop
      BevelOuter = bvNone
      FullRepaint = False
      TabOrder = 1
      object Label11: TLabel
        AlignWithMargins = True
        Left = 108
        Top = 15
        Width = 167
        Height = 37
        Margins.Top = 15
        Margins.Bottom = 15
        Align = alLeft
        Caption = 'Lead Detail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 3
        ExplicitHeight = 45
      end
      object VirtualImage3: TVirtualImage
        Left = 0
        Top = 0
        Width = 105
        Height = 67
        Align = alLeft
        ImageCollection = MainForm.ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 8
        ImageName = 'baseline_contact_mail_white'
        ExplicitLeft = 8
      end
      object LeadRelativePanel: TRelativePanel
        Left = 278
        Top = 0
        Width = 763
        Height = 67
        ControlCollection = <
          item
            Control = CreateProposalButton
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = False
            AlignRightWithPanel = True
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = True
          end
          item
            Control = ViewProposalButton
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            LeftOf = CreateProposalButton
          end
          item
            Control = CancelProposalButton
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            LeftOf = ViewProposalButton
          end
          item
            Control = CompleteProposalButton
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            LeftOf = CancelProposalButton
          end>
        Align = alClient
        BevelOuter = bvNone
        FullRepaint = False
        TabOrder = 0
        OnResize = LeadRelativePanelResize
        ExplicitLeft = 173
        ExplicitWidth = 868
        DesignSize = (
          763
          67)
        object CreateProposalButton: TSpeedButton
          Left = 578
          Top = 14
          Width = 185
          Height = 38
          Hint = 'Create Proposal'
          Anchors = []
          Caption = 'Create Proposal'
          ImageIndex = 9
          ImageName = 'baseline_create_white'
          Images = MainForm.VirtualImageList1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = CreateProposalButtonClick
        end
        object ViewProposalButton: TSpeedButton
          Left = 393
          Top = 14
          Width = 185
          Height = 38
          Hint = 'View Proposal'
          Anchors = []
          Caption = 'View Proposal'
          ImageIndex = 12
          ImageName = 'baseline_launch_white'
          Images = MainForm.VirtualImageList1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = ViewProposalButtonClick
        end
        object CancelProposalButton: TSpeedButton
          Left = 208
          Top = 14
          Width = 185
          Height = 38
          Hint = 'Cancel Proposal'
          Anchors = []
          Caption = 'Cancel Proposal'
          ImageIndex = 14
          ImageName = 'baseline_clear_white'
          Images = MainForm.VirtualImageList1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = CancelProposalButtonClick
        end
        object CompleteProposalButton: TSpeedButton
          Left = 23
          Top = 14
          Width = 185
          Height = 38
          Hint = 'Complete Proposal'
          Anchors = []
          Caption = 'Complete Proposal'
          ImageIndex = 1
          ImageName = 'baseline_account_balance_white'
          Images = MainForm.VirtualImageList1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = CompleteProposalButtonClick
        end
      end
    end
  end
  object LeadsBindSourceDB: TBindSourceDB
    DataSet = DM.LeadsFDTable
    ScopeMappings = <>
    Left = 248
    Top = 88
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = LeadsBindSourceDB
      FieldName = 'Name'
      Control = NameEdit
      Track = True
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = LeadsBindSourceDB
      FieldName = 'OfficePhone'
      Control = OfficePhoneEdit
      Track = True
    end
    object LinkControlToField4: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = LeadsBindSourceDB
      FieldName = 'Email'
      Control = EmailEdit
      Track = True
    end
    object LinkControlToField5: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = LeadsBindSourceDB
      FieldName = 'User'
      Control = UserEdit
      Track = True
    end
    object LinkFillControlToField1: TLinkFillControlToField
      Category = 'Quick Bindings'
      DataSource = LeadsBindSourceDB
      FieldName = 'Status'
      Control = StatusComboBox
      Track = True
      FillDataSource = StatusBindSourceDB
      FillValueFieldName = 'Status'
      FillDisplayFieldName = 'Status'
      AutoFill = True
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
    object LinkFillControlToField2: TLinkFillControlToField
      Category = 'Quick Bindings'
      DataSource = LeadsBindSourceDB
      FieldName = 'AccountName'
      Control = AccountNameComboBox
      Track = True
      FillDataSource = AcctBindSourceDB
      FillValueFieldName = 'AccountName'
      FillDisplayFieldName = 'AccountName'
      AutoFill = True
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
    object LinkControlToField6: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = LeadsBindSourceDB
      FieldName = 'DateCreated'
      Control = DateCreatedPicker
      OnAssignedValue = LinkControlToField6AssignedValue
      Track = True
    end
    object LinkControlToField7: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = LeadsBindSourceDB
      FieldName = 'Notes'
      Control = NotesMemo
      Track = False
    end
    object LinkGridToDataSourceBindSourceDB4: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = DocsBindSourceDB
      GridControl = DocStringGrid
      Columns = <
        item
          MemberName = 'DocId'
        end
        item
          MemberName = 'DocumentName'
          Width = 229
        end>
    end
    object LinkControlToField8: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = LeadsBindSourceDB
      FieldName = 'DateDrafted'
      Control = DateDraftedPicker
      OnAssignedValue = LinkControlToField8AssignedValue
      Track = True
    end
    object LinkControlToField9: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = LeadsBindSourceDB
      FieldName = 'DateClosed'
      Control = DateClosedPicker
      OnAssignedValue = LinkControlToField9AssignedValue
      Track = True
    end
    object LinkControlToField10: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = LeadsBindSourceDB
      FieldName = 'DateContacted'
      Control = DateContactedPicker
      OnAssignedValue = LinkControlToField10AssignedValue
      Track = True
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = LeadsBindSourceDB
      FieldName = 'LeadId'
      Component = LeadIdLabel
      ComponentProperty = 'Caption'
    end
  end
  object StatusBindSourceDB: TBindSourceDB
    DataSet = DM.StatusFDMemTable
    ScopeMappings = <>
    Left = 696
    Top = 80
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'pdf'
    Filter = 'Documents (*.pdf)|*.pdf'
    Left = 700
    Top = 402
  end
  object AcctBindSourceDB: TBindSourceDB
    DataSet = DM.AcctFDTable
    ScopeMappings = <>
    Left = 136
    Top = 88
  end
  object DocsBindSourceDB: TBindSourceDB
    DataSet = DM.FDDocsQuery
    ScopeMappings = <>
    Left = 376
    Top = 96
  end
  object UsersBindSourceDB: TBindSourceDB
    DataSet = DM.UsersFDTable
    ScopeMappings = <>
    Left = 480
    Top = 88
  end
  object ProposalBindSourceDB: TBindSourceDB
    DataSet = DM.ProposalsFDTable
    ScopeMappings = <>
    Left = 592
    Top = 80
  end
end
