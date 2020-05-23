object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Demo TitlebarPanel'
  ClientHeight = 365
  ClientWidth = 768
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Enabled = True
  CustomTitleBar.Height = 80
  CustomTitleBar.SystemHeight = False
  CustomTitleBar.BackgroundColor = 11625216
  CustomTitleBar.ForegroundColor = clWhite
  CustomTitleBar.InactiveBackgroundColor = clWhite
  CustomTitleBar.InactiveForegroundColor = 10066329
  CustomTitleBar.ButtonForegroundColor = clWhite
  CustomTitleBar.ButtonBackgroundColor = 11625216
  CustomTitleBar.ButtonHoverForegroundColor = clWhite
  CustomTitleBar.ButtonHoverBackgroundColor = 8801024
  CustomTitleBar.ButtonPressedForegroundColor = clWhite
  CustomTitleBar.ButtonPressedBackgroundColor = 4663296
  CustomTitleBar.ButtonInactiveForegroundColor = 10066329
  CustomTitleBar.ButtonInactiveBackgroundColor = clWhite
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  GlassFrame.Enabled = True
  GlassFrame.Top = 80
  OldCreateOrder = False
  Position = poScreenCenter
  StyleElements = [seFont, seClient]
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 79
    OnPaint = TitleBarPanel1Paint
    CustomButtons = <
      item
        ButtonType = sbCustom
        Enabled = True
        Width = 32
        Visible = True
        OnPaint = SystemTitlebarButton1Paint
        OnClick = SystemTitlebarButton1Click
      end>
    ExplicitWidth = 729
    DesignSize = (
      768
      79)
    object ActionMainMenuBar1: TActionMainMenuBar
      Left = 32
      Top = 0
      Width = 217
      Height = 24
      UseSystemFont = False
      ActionManager = ActionManager1
      Align = alNone
      Caption = 'ActionMainMenuBar1'
      Color = clMenuBar
      ColorMap.DisabledFontColor = 7171437
      ColorMap.HighlightColor = clWhite
      ColorMap.BtnSelectedFont = clBlack
      ColorMap.UnusedColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Spacing = 0
      OnPaint = ActionMainMenuBar1Paint
    end
    object ToolBar16: TToolBar
      Left = 478
      Top = 3
      Width = 105
      Height = 25
      Align = alNone
      Anchors = [akTop, akRight]
      ButtonHeight = 24
      Caption = 'ToolBar16'
      DoubleBuffered = False
      DrawingStyle = dsGradient
      Images = VirtualImageList16
      ParentDoubleBuffered = False
      TabOrder = 1
      ExplicitLeft = 439
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Caption = 'ToolButton1'
        ImageIndex = 0
        ImageName = 'AboutBox'
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Caption = 'ToolButton2'
        ImageIndex = 1
        ImageName = 'FireMonkey-Metropolis-UI'
      end
      object ToolButton3: TToolButton
        Left = 46
        Top = 0
        Caption = 'ToolButton3'
        ImageIndex = 2
        ImageName = 'Type'
      end
      object ToolButton4: TToolButton
        Left = 69
        Top = 0
        Caption = 'ToolButton4'
        ImageIndex = 3
        ImageName = 'Unit32'
      end
    end
    object ToolBar32: TToolBar
      Left = 3
      Top = 33
      Width = 161
      Height = 43
      Align = alNone
      ButtonHeight = 38
      ButtonWidth = 39
      Caption = 'ToolBar1'
      DoubleBuffered = False
      DrawingStyle = dsGradient
      Images = VirtualImageList32
      ParentDoubleBuffered = False
      TabOrder = 2
      Transparent = True
      object ToolButton5: TToolButton
        Left = 0
        Top = 0
        Caption = 'ToolButton1'
        ImageIndex = 0
        ImageName = 'AboutBox'
      end
      object ToolButton6: TToolButton
        Left = 39
        Top = 0
        Caption = 'ToolButton2'
        ImageIndex = 1
        ImageName = 'FireMonkey-Metropolis-UI'
      end
      object ToolButton7: TToolButton
        Left = 78
        Top = 0
        Caption = 'ToolButton3'
        ImageIndex = 2
        ImageName = 'Type'
      end
      object ToolButton8: TToolButton
        Left = 117
        Top = 0
        Caption = 'ToolButton4'
        ImageIndex = 3
        ImageName = 'Unit32'
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 79
    Width = 768
    Height = 286
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 729
    object Label3: TLabel
      Tag = 1
      Left = 12
      Top = 52
      Width = 56
      Height = 13
      Caption = 'Background'
    end
    object Label4: TLabel
      Left = 12
      Top = 80
      Width = 56
      Height = 13
      Caption = 'Foreground'
    end
    object Label5: TLabel
      Tag = 1
      Left = 288
      Top = 52
      Width = 98
      Height = 13
      Caption = 'Inactive Background'
    end
    object Label6: TLabel
      Left = 288
      Top = 80
      Width = 98
      Height = 13
      Caption = 'Inactive Foreground'
    end
    object Label7: TLabel
      Tag = 1
      Left = 12
      Top = 164
      Width = 56
      Height = 13
      Caption = 'Background'
    end
    object Label8: TLabel
      Tag = 1
      Left = 12
      Top = 192
      Width = 56
      Height = 13
      Caption = 'Foreground'
    end
    object Label1: TLabel
      Tag = 1
      Left = 288
      Top = 164
      Width = 98
      Height = 13
      Caption = 'Inactive Background'
    end
    object Label2: TLabel
      Tag = 1
      Left = 288
      Top = 192
      Width = 98
      Height = 13
      Caption = 'Inactive Foreground'
    end
    object Label9: TLabel
      Tag = 1
      Left = 12
      Top = 128
      Width = 37
      Height = 13
      Caption = 'Buttons'
    end
    object ColorBoxActive: TColorBox
      Tag = 1
      Left = 136
      Top = 48
      Width = 120
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
      TabOrder = 0
      OnSelect = ColorBoxActiveSelect
    end
    object ColorBoxActiveText: TColorBox
      Left = 136
      Top = 77
      Width = 121
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
      TabOrder = 1
      OnSelect = ColorBoxActiveTextSelect
    end
    object ColorBoxInActive: TColorBox
      Tag = 1
      Left = 408
      Top = 49
      Width = 120
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
      TabOrder = 2
      OnSelect = ColorBoxInActiveSelect
    end
    object ColorBoxInActiveText: TColorBox
      Left = 408
      Top = 77
      Width = 120
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
      TabOrder = 3
      OnSelect = ColorBoxInActiveTextSelect
    end
    object CheckBoxCustomColors: TCheckBox
      Left = 12
      Top = 14
      Width = 141
      Height = 17
      Caption = 'Customize titlebar colors'
      TabOrder = 4
      OnClick = CheckBoxCustomColorsClick
    end
    object CheckBoxOnPaint: TCheckBox
      Left = 12
      Top = 248
      Width = 97
      Height = 17
      Caption = 'OnPaint event'
      TabOrder = 5
      OnClick = CheckBoxOnPaintClick
    end
    object ColorBoxButtonBackground: TColorBox
      Tag = 1
      Left = 136
      Top = 161
      Width = 120
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
      TabOrder = 6
      OnSelect = ColorBoxButtonBackgroundSelect
    end
    object ColorBoxButtonForeground: TColorBox
      Tag = 1
      Left = 136
      Top = 189
      Width = 120
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
      TabOrder = 7
      OnSelect = ColorBoxButtonForegroundSelect
    end
    object ColorBoxButtonInactiveBackground: TColorBox
      Tag = 1
      Left = 408
      Top = 161
      Width = 120
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
      TabOrder = 8
      OnSelect = ColorBoxButtonInactiveBackgroundSelect
    end
    object ColorBoxButtonInactiveForeground: TColorBox
      Tag = 1
      Left = 408
      Top = 189
      Width = 120
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
      TabOrder = 9
      OnSelect = ColorBoxButtonInactiveForegroundSelect
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = FileOpen1
                ImageIndex = 7
                ShortCut = 16463
              end
              item
                Action = FileOpenWith1
                Caption = 'O&pen with...'
              end
              item
                Action = FileSaveAs1
                ImageIndex = 30
              end
              item
                Action = FilePrintSetup1
              end
              item
                Action = FilePageSetup1
                Caption = 'Pa&ge Setup...'
              end
              item
                Action = FileRun1
              end
              item
                Action = FileExit1
                ImageIndex = 43
              end
              item
                Action = BrowseForFolder1
                Caption = '&BrowseForFolder1'
              end>
            Caption = '&File'
          end
          item
            Items = <
              item
                Action = EditCut1
                ImageIndex = 0
                ShortCut = 16472
              end
              item
                Action = EditCopy1
                ImageIndex = 1
                ShortCut = 16451
              end
              item
                Action = EditPaste1
                ImageIndex = 2
                ShortCut = 16470
              end
              item
                Action = EditSelectAll1
                ShortCut = 16449
              end
              item
                Action = EditUndo1
                ImageIndex = 3
                ShortCut = 16474
              end
              item
                Action = EditDelete1
                ImageIndex = 5
                ShortCut = 46
              end>
            Caption = '&Edit'
          end
          item
            Items = <
              item
                Action = SearchFind1
                ImageIndex = 34
                ShortCut = 16454
              end
              item
                Action = SearchFindNext1
                ImageIndex = 33
                ShortCut = 114
              end
              item
                Action = SearchReplace1
                ImageIndex = 32
              end
              item
                Action = SearchFindFirst1
              end>
            Caption = '&Search'
          end
          item
            Items = <
              item
                Action = DialogOpenPicture1
                ShortCut = 16463
              end
              item
                Action = DialogSavePicture1
                ShortCut = 16467
              end
              item
                Action = DialogColorSelect1
              end
              item
                Action = DialogFontEdit1
              end
              item
                Action = DialogPrintDlg1
                ImageIndex = 14
                ShortCut = 16464
              end>
            Caption = '&Dialog'
          end
          item
            Items = <
              item
                Action = InternetBrowseURL1
              end
              item
                Action = InternetDownLoadURL1
              end
              item
                Action = InternetSendMail1
              end>
            Caption = '&Internet'
          end>
        ActionBar = ActionMainMenuBar1
      end>
    Left = 600
    Top = 270
    StyleName = 'Platform Default'
    object DialogOpenPicture1: TOpenPicture
      Category = 'Dialog'
      Caption = '&Open Picture...'
      Hint = 'Open Picture'
      ShortCut = 16463
    end
    object DialogSavePicture1: TSavePicture
      Category = 'Dialog'
      Caption = '&Save Picture...'
      Hint = 'Save Picture'
      ShortCut = 16467
    end
    object DialogColorSelect1: TColorSelect
      Category = 'Dialog'
      Caption = 'Select &Color...'
      Hint = 'Color Select'
    end
    object DialogFontEdit1: TFontEdit
      Category = 'Dialog'
      Caption = 'Select &Font...'
      Dialog.Font.Charset = DEFAULT_CHARSET
      Dialog.Font.Color = clWindowText
      Dialog.Font.Height = -11
      Dialog.Font.Name = 'Tahoma'
      Dialog.Font.Style = []
      Hint = 'Font Select'
    end
    object DialogPrintDlg1: TPrintDlg
      Category = 'Dialog'
      Caption = '&Print...'
      ImageIndex = 14
      ShortCut = 16464
    end
    object EditCut1: TEditCut
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 0
      ShortCut = 16472
    end
    object EditCopy1: TEditCopy
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 1
      ShortCut = 16451
    end
    object EditPaste1: TEditPaste
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 2
      ShortCut = 16470
    end
    object EditSelectAll1: TEditSelectAll
      Category = 'Edit'
      Caption = 'Select &All'
      Hint = 'Select All|Selects the entire document'
      ShortCut = 16449
    end
    object EditUndo1: TEditUndo
      Category = 'Edit'
      Caption = '&Undo'
      Hint = 'Undo|Reverts the last action'
      ImageIndex = 3
      ShortCut = 16474
    end
    object EditDelete1: TEditDelete
      Category = 'Edit'
      Caption = '&Delete'
      Hint = 'Delete|Erases the selection'
      ImageIndex = 5
      ShortCut = 46
    end
    object FileOpen1: TFileOpen
      Category = 'File'
      Caption = '&Open...'
      Hint = 'Open|Opens an existing file'
      ImageIndex = 7
      ShortCut = 16463
    end
    object FileOpenWith1: TFileOpenWith
      Category = 'File'
      Caption = 'Open with...'
      FileName = ''
    end
    object FileSaveAs1: TFileSaveAs
      Category = 'File'
      Caption = 'Save &As...'
      Hint = 'Save As|Saves the active file with a new name'
      ImageIndex = 30
    end
    object FilePrintSetup1: TFilePrintSetup
      Category = 'File'
      Caption = 'Print Set&up...'
      Hint = 'Print Setup'
    end
    object FilePageSetup1: TFilePageSetup
      Category = 'File'
      Caption = 'Page Set&up...'
      Dialog.MinMarginLeft = 0
      Dialog.MinMarginTop = 0
      Dialog.MinMarginRight = 0
      Dialog.MinMarginBottom = 0
      Dialog.MarginLeft = 1000
      Dialog.MarginTop = 1000
      Dialog.MarginRight = 1000
      Dialog.MarginBottom = 1000
      Dialog.PageWidth = 8500
      Dialog.PageHeight = 11000
    end
    object FileRun1: TFileRun
      Category = 'File'
      Browse = False
      BrowseDlg.Title = 'Run'
      Caption = '&Run...'
      Hint = 'Run|Runs an application'
      Operation = 'open'
      ShowCmd = scShowNormal
    end
    object FileExit1: TFileExit
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Exit|Quits the application'
      ImageIndex = 43
    end
    object BrowseForFolder1: TBrowseForFolder
      Category = 'File'
      Caption = 'BrowseForFolder1'
      DialogCaption = 'BrowseForFolder1'
      BrowseOptions = []
      BrowseOptionsEx = []
    end
    object InternetBrowseURL1: TBrowseURL
      Category = 'Internet'
      Caption = '&Browse URL'
      Hint = 'Browse URL'
    end
    object InternetDownLoadURL1: TDownLoadURL
      Category = 'Internet'
      Caption = '&Download URL'
      Hint = 'Download from URL'
    end
    object InternetSendMail1: TSendMail
      Category = 'Internet'
      Caption = '&Send Mail...'
      Hint = 'Send email'
    end
    object SearchFind1: TSearchFind
      Category = 'Search'
      Caption = '&Find...'
      Hint = 'Find|Finds the specified text'
      ImageIndex = 34
      ShortCut = 16454
    end
    object SearchFindNext1: TSearchFindNext
      Category = 'Search'
      Caption = 'Find &Next'
      Hint = 'Find Next|Repeats the last find'
      ImageIndex = 33
      ShortCut = 114
    end
    object SearchReplace1: TSearchReplace
      Category = 'Search'
      Caption = '&Replace'
      Hint = 'Replace|Replaces specific text with different text'
      ImageIndex = 32
    end
    object SearchFindFirst1: TSearchFindFirst
      Category = 'Search'
      Caption = 'F&ind First'
      Hint = 'Find First|Finds the first occurance of specified text'
    end
  end
  object VirtualImageList16: TVirtualImageList
    AutoFill = True
    DisabledGrayscale = False
    DisabledSuffix = '_Disabled'
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'AboutBox'
        Disabled = False
        Name = 'AboutBox'
      end
      item
        CollectionIndex = 1
        CollectionName = 'FireMonkey-Metropolis-UI'
        Disabled = False
        Name = 'FireMonkey-Metropolis-UI'
      end
      item
        CollectionIndex = 2
        CollectionName = 'Type'
        Disabled = False
        Name = 'Type'
      end
      item
        CollectionIndex = 3
        CollectionName = 'Unit32'
        Disabled = False
        Name = 'Unit32'
      end
      item
        CollectionIndex = 4
        CollectionName = 'VCL-Metropolis-UI'
        Disabled = False
        Name = 'VCL-Metropolis-UI'
      end
      item
        CollectionIndex = 5
        CollectionName = 'Web-Server'
        Disabled = False
        Name = 'Web-Server'
      end>
    ImageCollection = ImageCollection1
    Left = 600
    Top = 216
  end
  object ImageCollection1: TImageCollection
    Images = <
      item
        Name = 'AboutBox'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000001047D4A
              620000001974455874536F6674776172650041646F626520496D616765526561
              647971C9653C000003254944415478DA6260201AFC070210CD842E011040F841
              454585030B88615BB1E93F44E89823DC401000A90008204654150860A824CC70
              FEDE5B88AD873BFC184118C84C84CA0B4E4AB366B4061A097716D0140720357F
              5BBD0788FB1E26CE08754D030E87CA03041041AF30A23BF050BB2F9C6D57B9D9
              1164FC7F7C0181127620D380F83DB218B22FFE838C07FA5F00D95A14130E5F7B
              C12021C885620D0B92E30C81D4795B2D0986AA504346B82FA08E6CC4E1CE0300
              0184332E88048E4C0C1402B01F8091CAD0D1D1C1486A62430904B4F03E0FA40C
              727DB41942AD95403106931204A6AA0F5843112D551980D893B75C6538020C7A
              24F01E96C0701A00B4E100D010943403021780893B6FF6B10358C3008B218C8C
              1DE0AC034AC6FA40BCD050596403032D004000510C284A4820AF124C48D01C82
              4153CD050C040A0D7C29919CD212475EC0919CEF03290528B711E85CACAE64C2
              A119E43C055080B5C69A8284EAA106123600A61056F4804A18285000CA2910E3
              05B0A217EFBF31244D3AC870E7F92764B904206E20E80558EDD006743ED40B38
              0136031680CA8189A956606F80BC00CB99D80292094BE2480416221FB0A4C844
              A2A39191915110989541854A3E103F04F21BF0662660AADA0FA40E929886EA49
              2D47B102800063448AFF063A17250B80E1FD00390CEBC93529D1451D4C6F3FFB
              189CFE90F920E0692C8B220FAB1581F8010B35BC62A808299F0E5F7D4E141F6B
              1444574CFDFF8D81EBC01B06E183B40C771E862FF2420CEF4139D2716947F601
              7808C8328083EBE0FA8E0E9AA605688D9E40B0382404A00513AC70FA004C5017
              A85A1E63B1500048AD0762079818A8A8E1E160011778A0C600AC0D004A97C43A
              888548CB1B9073090F072B03B4410C07F9B38F819BD6D066CD79A01E50364B24
              64361311961BA067D12F3F7EC3B318088042006A394AD10FD49B408D1010C026
              D8BEE6021813000AD470008A2D952106F0820543213014AA169F068710146CA0
              380AA0ED59451315D10FA07A0D97E5E0C80756A2A0B40155E3484C42242A1182
              CAECC3C0C6755F32B88AEB47CE0968E0012807007B2907A89E0DA1F52CC8478E
              D42C98D01D500F2CA9EA1946120000F2E635301752B7F90000000049454E44AE
              426082}
          end>
      end
      item
        Name = 'FireMonkey-Metropolis-UI'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000001047D4A
              620000001974455874536F6674776172650041646F626520496D616765526561
              647971C9653C0000028A4944415478DA626040038C20C2777EEDFFAEDD671102
              40F0DFB662138335C33106269852100704000208033182F48318203334976D63
              6400EA050BC06886175B53FEC394575454FC070820B8B5304198F52000328205
              C4F870D394E170871FC3F5282F06C16829848DCB1820CE5A6DBB09AE0344871E
              F663987058042C065620E13D8711E6299004D03498071900028820624476E0E6
              C466B03B901DC944C80416900F4060D6A3190C9B8134565FC00028C4613E0039
              1C1C50B090034980BCFBE02B3FC38673AC704D282680745A84F53262C43072D8
              A33B12208028461891890CD0C30D19C0A28D892A2E8027362080A59A85727AC4
              1B004AF5D8E46AFBA7FE3FF0529661C293F90C053289583302237A2A07462038
              4241290E591C3DFEB046133A408EB68E8E0E46181FC446C9528434E303000134
              F008E485FFC084845512B984404B44F0F0A338210DBC01F0820F064045070CA0
              141FC860199A01E8009E0F0EE34C23E0E40F4A502CB89C7694C10A850F4ADAE8
              29111E06A01C08C3D02802836CB5F30C5CFF7E813313AE54CA02CD4C704950E1
              C700CC75A21CDF181CC41F83C58E29025DB3643DEE40C406BA0D0F82699821B9
              F862011B987D9C9F01DDBFF80A148239115B76263A21A1BB02D902464ACA0290
              C1000136288A035C8532ADED444D05B8CA245C005FA5870B206712AA9526035E
              9C0D9F3400AACCB1015853035B7C229761C40050A381E8A20857398F9C77B119
              482C00951578EB037C00B9310602A022BFEDD952301BD48622A5210E7700ACB9
              8F116C1D0C0C69721918BD9406BD630CDAFC6F18408DB7A9B70CC116935D2793
              0A1294AE802D875537B02A07044ACFD9E3AA89A9E780E4B42A3C414C5EBAF84F
              0CA666831366160B31CD6434870EAF9270C001008C9E0DE397B01A7100000000
              49454E44AE426082}
          end>
      end
      item
        Name = 'Type'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000001047D4A
              620000001974455874536F6674776172650041646F626520496D616765526561
              647971C9653C000002264944415478DA6260C0056C2B36FD8773AE477981392F
              B6A6FC67820902390A201A208070EBC73003A41FC466027250F4020410BA5601
              14AD201D688ADEA3BB9111D99D2020182D05572DE13D87918110000820D210D0
              EEFB40DC8FD59140099003415E2CC0E58B0DD84C85F902A45B00880D81BED80F
              63037D718105AA50004A9F47D20C6233A207D4071C6CDC00208028468C38C20B
              141CF7D19D77B8C34F105D2D130E83EF631113C0A610AB01409B18B10482215E
              2F00E3623E904A4057008C9705D8C461290DD9050138BC13802F10E106682EDB
              060A204524A72F008A31026DC210A76A3A0708A081478C78321F2C561E80A210
              18B51F484989EFB1241C45A0210F884D89D852DD79A2532209869264C002520C
              30C492131309E50503347F7E00A54E60A98E210E4D9D182E400F24016806C310
              071ADA4F6C1824E0102F20D6005C05E3036C067CC011981FF005327A765E8064
              982250EC0134C090C50581621F064F6E0408B0514452D90A2C6640B9623FAE8C
              0D8D644760B6BB40AC994C24580ECB5502044A9CF350B5D475009E5C49915A52
              1CF081166A4971802191067FC0D50C21291142DBD4F5D096052CDE3F3C6315BC
              304BC48D01481B208BCB727DBE50A479864186EB338A38B46DDA082C7D1E10E5
              00A8C584121BDCA7D09639B1EA15D18B41161C95AF0011A1278054D790A25E91
              9003044848170224963B0AC424C20524361448513F81A844086D1F102CF180D5
              DD0568079228F5A07ECF68E533E800004691B3FFFCA1412B0000000049454E44
              AE426082}
          end>
      end
      item
        Name = 'Unit32'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000001047D4A
              620000001974455874536F6674776172650041646F626520496D616765526561
              647971C9653C000001084944415478DA6260C0062A2A2AFEC3D84CE8124CE8AA
              010208374236073F000820F2CD84F1C1CEBA1EE5759E6C9301028872C48CCDB1
              3636360F8F1C39728161A8008000A23EC2960E4062409C804D3D09498C613E3E
              83884E89E8F270170053D47F206E80B1B1019038C579015D9E855E190A270008
              A0919C3A494E89B80C61A2964B86038065145C19896066024A1A0C4DAF33921A
              D71D1D1D8C83CB0B0001368A18A99C81138191BC80EA0E2026E5A03994688730
              D1286489ABC569E8001487E053C042AB021D166D84F4300D742E60C1522A835A
              DD899ACBB65D402FEA191E5D22DAE078A89E8564A40150B5701ED650A37B0800
              7DCE884B8CBC34A037C4D2C0685536E2000072E2AC52A234157D000000004945
              4E44AE426082}
          end>
      end
      item
        Name = 'VCL-Metropolis-UI'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000001047D4A
              620000001974455874536F6674776172650041646F626520496D616765526561
              647971C9653C0000028A4944415478DA626040038C20C2777EEDFFAEDD671102
              40F0DFB662138335C33106269852100704000208033182F48318203334976D63
              6400EA050BC06886175B53FEC394575454FC070820B8B5304198F52000328205
              C4F870D394E170871FC3F5282F06C16829848DCB1820CE5A6DBB09AE0344871E
              F663987058042C065620E13D8711E6299004D03498071900028820624476E0E6
              C466B03B901DC944C80416900F4060D6A3190C9B8134565FC00028C4613E0039
              1C1C50B090034980BCFBE02B3FC38673AC704D282680745A84F53262C43072D8
              A33B12208028461891890CD0C30D19C0A28D892A2E8027362080A59A85727AC4
              1B004AF5D8E46AFBA7FE3FF0529661C293F90C053289583302237A2A07462038
              4241290E591C3DFEB046133A408EB68E8E0E46181FC446C9528434E303000134
              F008E485FFC084845512B984404B44F0F0A338210DBC01F0820F064045070CA0
              141FC860199A01E8009E0F0EE34C23E0E40F4A502CB89C7694C10A850F4ADAE8
              29111E06A01C08C3D02802836CB5F30C5CFF7E813313AE54CA02CD4C704950E1
              C700CC75A21CDF181CC41F83C58E29025DB3643DEE40C406BA0D0F82699821B9
              F862011B987D9C9F01DDBFF80A148239115B76263A21A1BB02D902464ACA0290
              C1000136288A035C8532ADED444D05B8CA245C005FA5870B206712AA9526035E
              9C0D9F3400AACCB1015853035B7C229761C40050A381E8A20857398F9C77B119
              482C00951578EB037C00B9310602A022BFEDD952301BD48622A5210E7700ACB9
              8F116C1D0C0C69721918BD9406BD630CDAFC6F18408DB7A9B70CC116935D2793
              0A1294AE802D875537B02A07044ACFD9E3AA89A9E780E4B42A3C414C5EBAF84F
              0CA666831366160B31CD6434870EAF9270C001008C9E0DE397B01A7100000000
              49454E44AE426082}
          end>
      end
      item
        Name = 'Web-Server'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000001047D4A
              620000001974455874536F6674776172650041646F626520496D616765526561
              647971C9653C000003394944415478DA6260C0065E6C4DF99FD13EFF3F88CD04
              22420FFB3128F07C64B0ADD8E4C008535551510156011040D8516CF3E2FF40E5
              F7416C1620E3FF83AF607105100136032468CD700C2C0A104004114C47FF34D3
              3D05A21CDFC04E0281C31D7E8C7005306319C801000144396284069E00907A7F
              E0A52CC3827B3A0C3B5A82E16E8305E67B100D92FCFA8795E1F2DABCFF280A60
              21DE6D7810CCCE3AEDC280A1005D02E66D26A440990062838218C4273AA80102
              883AC180254DF53FF8CA5FB0EAA13A83AEC0EB079E52F71D25BCE73C206800C8
              63AB6D37A1284838EE090E3A1068D03B76C039AAC311599E053D5440C10954C8
              70FAAD04C3D6A74A288669F3BF71C0E9025092035205C892D96AE719A6DE32C4
              E97F5068A37B019C2490C540D1D1D1D1811156A05C0512674133F1037AB858E3
              CD7E54000001341C1130152A9C5B53701E54C281D2062855129D94818ACF0329
              0350CAEBBE66064C812C0C61F23719BA806C203004C6D20574039053E2FC075F
              0F1A28707F64E066F90D4C8D471980F981A1F49C3D4CC9796C790739C327345C
              B282735EFFE042D60C3614E8C2F9F80C00671A505E00D98C5C7A80CB23CBED60
              4BF0E505941407F23B0880B2347AFAC7E90264B01F5844E6669662F8196411B2
              65C8062C4056080A03924B24A0C9E068C4E55CA28A34A021A09A6C3DC8209801
              E81522B6EC3D840140808DA201078C04CA36502D530FAAAEAE7E14018B3DF8C2
              C7006A8880EA3E507B0358D73138883F06CBDDFB22B0A0FCBC5D21B47221DF01
              A0EACD5FE6CEFE18C56B06E885CDEA47EA0CA0220F6429885F7ADE1E5BAE0539
              40911887E0CA88E076A6B7F43D8604A52B5835824A3C50F1096B36A0B600DE82
              CB632000B5490EE073000B16B1F53006A869710AD8C448043AC254F805D85250
              93031402D05A022BF096BE8B6C9620A92180B321006A29837C0772C0B7BFAC60
              DF83D2037A2894699D4276B022B0547E404A085C402E50D14BE803401C26FF8D
              410BE810604B0D6B1A3A4C422EC0E68040581AC005902B297C2176A8DD97C1AE
              7233068D5C4BB06069F13D001A0A8AB7FDB8428298C61F387E3B306950CD7298
              4008C01A8986D0D6663D7AB3151BC05665D1A51AAB20B1F58AAE9E65201C310A
              9001009952657E0B350CF00000000049454E44AE426082}
          end>
      end>
    Left = 320
    Top = 296
  end
  object VirtualImageList32: TVirtualImageList
    AutoFill = True
    DisabledGrayscale = False
    DisabledSuffix = '_Disabled'
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'AboutBox'
        Disabled = False
        Name = 'AboutBox'
      end
      item
        CollectionIndex = 1
        CollectionName = 'FireMonkey-Metropolis-UI'
        Disabled = False
        Name = 'FireMonkey-Metropolis-UI'
      end
      item
        CollectionIndex = 2
        CollectionName = 'Type'
        Disabled = False
        Name = 'Type'
      end
      item
        CollectionIndex = 3
        CollectionName = 'Unit32'
        Disabled = False
        Name = 'Unit32'
      end
      item
        CollectionIndex = 4
        CollectionName = 'VCL-Metropolis-UI'
        Disabled = False
        Name = 'VCL-Metropolis-UI'
      end
      item
        CollectionIndex = 5
        CollectionName = 'Web-Server'
        Disabled = False
        Name = 'Web-Server'
      end>
    ImageCollection = ImageCollection1
    Width = 32
    Height = 32
    Left = 656
    Top = 208
  end
end
