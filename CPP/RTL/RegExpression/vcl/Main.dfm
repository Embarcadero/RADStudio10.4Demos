object formRegExp: TformRegExp
  Left = 0
  Top = 0
  Caption = 'C++ Builder Regular Expression Demo'
  ClientHeight = 310
  ClientWidth = 713
  Color = clHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 247
    Top = 8
    Width = 142
    Height = 19
    Caption = 'Regular Expressions'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbType: TLabel
    Left = 8
    Top = 223
    Width = 39
    Height = 19
    Caption = 'Email'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbRegExp: TListBox
    Left = 8
    Top = 8
    Width = 233
    Height = 161
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    Items.Strings = (
      'Email'
      'IP Address'
      'Date Interval (mm-dd-yyyy)'
      'Date Interval (dd-mm-yyyy)')
    ParentFont = False
    TabOrder = 0
    OnClick = lbRegExpClick
  end
  object MemoRegEx: TMemo
    Left = 247
    Top = 33
    Width = 458
    Height = 136
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
    ParentFont = False
    TabOrder = 1
  end
  object btnEvaluate: TButton
    Left = 519
    Top = 245
    Width = 147
    Height = 33
    Caption = 'Evaluate'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnEvaluateClick
  end
  object EditText: TEdit
    Left = 8
    Top = 248
    Width = 505
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
end
