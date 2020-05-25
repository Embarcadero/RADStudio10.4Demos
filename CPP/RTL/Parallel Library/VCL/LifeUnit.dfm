object LifeForm: TLifeForm
  Left = 0
  Top = 0
  Caption = 'Conway'#39's Life'
  ClientHeight = 444
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  DesignSize = (
    671
    444)
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 8
    Top = 8
    Width = 637
    Height = 357
    Anchors = [akLeft, akTop, akRight, akBottom]
    OnMouseDown = PaintBox1MouseDown
    OnMouseMove = PaintBox1MouseMove
    OnPaint = PaintBox1Paint
    ExplicitWidth = 433
    ExplicitHeight = 321
  end
  object Label1: TLabel
    Left = 478
    Top = 389
    Width = 3
    Height = 13
    Anchors = [akRight, akBottom]
    ExplicitLeft = 274
    ExplicitTop = 353
  end
  object Label2: TLabel
    Left = 478
    Top = 408
    Width = 3
    Height = 13
    Anchors = [akRight, akBottom]
    ExplicitLeft = 274
    ExplicitTop = 372
  end
  object Label3: TLabel
    Left = 478
    Top = 423
    Width = 3
    Height = 13
    Anchors = [akRight, akBottom]
    ExplicitLeft = 401
    ExplicitTop = 395
  end
  object Button1: TButton
    Left = 8
    Top = 411
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 388
    Width = 97
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Parallel'
    TabOrder = 1
    OnClick = CheckBox1Click
  end
  object Button2: TButton
    Left = 89
    Top = 411
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Clear'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 251
    Top = 411
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Load'
    TabOrder = 3
    OnClick = Button3Click
  end
  object HorzScrollBar: TScrollBar
    Left = 8
    Top = 367
    Width = 637
    Height = 15
    Anchors = [akLeft, akRight, akBottom]
    PageSize = 0
    TabOrder = 4
    TabStop = False
    OnChange = HorzScrollBarChange
  end
  object VertScrollBar: TScrollBar
    Left = 648
    Top = 8
    Width = 15
    Height = 357
    Anchors = [akTop, akRight, akBottom]
    Kind = sbVertical
    PageSize = 0
    TabOrder = 5
    TabStop = False
    OnChange = VertScrollBarChange
  end
  object Button4: TButton
    Left = 170
    Top = 411
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Re-center'
    TabOrder = 6
    OnClick = Button4Click
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'lif'
    Filter = 'Life Pattern Files (*.lif; *.life)|*.lif;*.life'
    Title = 'Open Life Patterns'
    Left = 528
    Top = 360
  end
end
