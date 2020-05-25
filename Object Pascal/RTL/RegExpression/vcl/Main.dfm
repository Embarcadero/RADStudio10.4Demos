object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Regular Expression demo 2'
  ClientHeight = 283
  ClientWidth = 712
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object lbType: TLabel
    Left = 8
    Top = 207
    Width = 39
    Height = 19
    Caption = 'Email'
  end
  object Label1: TLabel
    Left = 232
    Top = 8
    Width = 135
    Height = 19
    Caption = 'Regular Expression'
  end
  object EditText: TEdit
    Left = 8
    Top = 232
    Width = 513
    Height = 27
    TabOrder = 2
  end
  object Button1: TButton
    Left = 534
    Top = 229
    Width = 147
    Height = 33
    Caption = 'Evaluate'
    TabOrder = 3
    OnClick = Button1Click
  end
  object lbRegExp: TListBox
    Left = 8
    Top = 12
    Width = 218
    Height = 177
    ItemHeight = 19
    Items.Strings = (
      'Email'
      'IP Address'
      'Date Interval (mm-dd-yyyy)'
      'Date Interval (dd-mm-yyyy)')
    TabOrder = 0
    OnClick = lbRegExpClick
  end
  object MemoRegEx: TMemo
    Left = 232
    Top = 33
    Width = 449
    Height = 156
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      
        '^((?>[a-zA-Z\d!#$%&'#39#39'*+\-/=?^_`{|}~]+\x20*|"((?=[\x01-\x7f])[^"\' +
        '\]|\'
      
        '\[\x01-\x7f])*"\x20*)*(?<angle><))?((?!\.)(?>\.?[a-zA-Z\d!#$%&'#39#39 +
        '*+'
      
        '\-/=?^_`{|}~]+)+|"((?=[\x01-\x7f])[^"\\]|\\[\x01-\x7f])*")@(((?!' +
        '-)[a-zA-'
      
        'Z\d\-]+(?<!-)\.)+[a-zA-Z]{2,}|\[(((?(?<!\[)\.)(25[0-5]|2[0-4]\d|' +
        '[01]?\d?'
      
        '\d)){4}|[a-zA-Z\d\-]*[a-zA-Z\d]:((?=[\x01-\x7f])[^\\\[\]]|\\[\x0' +
        '1-'
      '\x7f])+)\])(?(angle)>)$')
    OEMConvert = True
    ParentFont = False
    TabOrder = 1
    WantReturns = False
  end
end
