inherited frmScript: TfrmScript
  Left = 372
  Top = 221
  Caption = 'Script executing'
  ClientHeight = 443
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 170
      Caption = 'Script Executing'
      ExplicitWidth = 170
    end
  end
  inherited pnlMain: TPanel
    Height = 334
    ExplicitHeight = 334
    object PageControl1: TPageControl
      Left = 6
      Top = 46
      Width = 617
      Height = 282
      ActivePage = tsFromStrings
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      object tsFromStrings: TTabSheet
        Caption = 'From strings'
        object Label1: TLabel
          Left = 3
          Top = 16
          Width = 56
          Height = 13
          Caption = 'CreateTabs'
        end
        object Label2: TLabel
          Left = 175
          Top = 16
          Width = 72
          Height = 13
          Caption = 'CreateIndexes'
        end
        object Label3: TLabel
          Left = 347
          Top = 16
          Width = 46
          Height = 13
          Caption = 'LoadData'
        end
        object Label4: TLabel
          Left = 175
          Top = 149
          Width = 22
          Height = 13
          Caption = 'Main'
        end
        object mmCreateTabs: TMemo
          Left = 3
          Top = 33
          Width = 166
          Height = 110
          Lines.Strings = (
            'drop table T2;'
            'drop table T1;'
            ''
            'create table T1 ('
            '  f1 integer primary key,'
            '  f2 varchar(20)'
            ');'
            ''
            'create table T2 ('
            '  f1 integer primary key,'
            '  f2_t1 integer,'
            '  f3 varchar(20),'
            '  foreign key (f2_t1) references T1 (f1)'
            ');')
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
        object mmLoadData: TMemo
          Left = 347
          Top = 33
          Width = 166
          Height = 111
          Lines.Strings = (
            'insert into T1 values (1, '#39'hello'#39');'
            'insert into T1 values (2, '#39'world'#39');'
            ''
            'insert into T2 values (1, 1, '#39'1_1'#39');'
            'insert into T2 values (2, 1, '#39'1_2'#39');'
            'insert into T2 values (3, 1, '#39'1_3'#39');'
            ''
            'insert into T2 values (4, 2, '#39'2_1'#39');'
            'insert into T2 values (5, 2, '#39'2_2'#39');'
            'insert into T2 values (6, 2, '#39'2_3'#39');'
            '')
          ScrollBars = ssBoth
          TabOrder = 1
          WordWrap = False
        end
        object mmCreateIndexes: TMemo
          Left = 175
          Top = 33
          Width = 166
          Height = 110
          Lines.Strings = (
            'rem ------------------------------------------'
            'rem Index for table T1'
            'create index i_t1_f2 on T1(f2);'
            ''
            'rem ------------------------------------------'
            'rem Index for table T2'
            'create index i_t2_f2_t1 on T2 (f2_t1);'
            '')
          ScrollBars = ssBoth
          TabOrder = 2
          WordWrap = False
        end
        object mmMain: TMemo
          Left = 175
          Top = 168
          Width = 166
          Height = 80
          Lines.Strings = (
            'set cmdsep ;'
            '@CreateTabs'
            '@CreateIndexes'
            '@LoadData')
          ScrollBars = ssBoth
          TabOrder = 3
          WordWrap = False
        end
        object btnRunFromStrings: TButton
          Left = 347
          Top = 168
          Width = 75
          Height = 25
          Caption = 'Run'
          Enabled = False
          TabOrder = 4
          OnClick = btnRunFromStringsClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'From files'
        ImageIndex = 1
        object btnRunFromFiles: TButton
          Left = 17
          Top = 19
          Width = 75
          Height = 25
          Caption = 'Run'
          Enabled = False
          TabOrder = 0
          OnClick = btnRunFromFilesClick
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Spool'
        ImageIndex = 2
        object Label5: TLabel
          Left = 3
          Top = 16
          Width = 22
          Height = 13
          Caption = 'Main'
        end
        object Label6: TLabel
          Left = 275
          Top = 16
          Width = 121
          Height = 13
          Caption = '$(temp)\spool$(rand).txt'
        end
        object Label7: TLabel
          Left = 431
          Top = 16
          Width = 58
          Height = 13
          Caption = 'InMemSpool'
        end
        object mmScriptSpool: TMemo
          Left = 3
          Top = 35
          Width = 185
          Height = 216
          Lines.Strings = (
            'set cmdsep ;'
            ''
            'spool $(temp)\spool$(rand).txt'
            'select * from {id Region};'
            'spool off'
            ''
            'spool InMemSpool'
            'select * from {id Region};'
            'spool off')
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
        object btnRunSpool: TButton
          Left = 194
          Top = 33
          Width = 75
          Height = 25
          Caption = 'Run'
          Enabled = False
          TabOrder = 1
          OnClick = btnRunSpoolClick
        end
        object mmSpoolInmem: TMemo
          Left = 431
          Top = 35
          Width = 154
          Height = 216
          ScrollBars = ssBoth
          TabOrder = 2
          WordWrap = False
        end
        object mmSpoolFile: TMemo
          Left = 275
          Top = 35
          Width = 150
          Height = 216
          ScrollBars = ssBoth
          TabOrder = 3
          WordWrap = False
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Run from spool (Oracle)'
        ImageIndex = 3
        object Label8: TLabel
          Left = 3
          Top = 16
          Width = 22
          Height = 13
          Caption = 'Main'
        end
        object Label9: TLabel
          Left = 336
          Top = 16
          Width = 58
          Height = 13
          Caption = 'InMemSpool'
        end
        object mmRunFromSpoolScript: TMemo
          Left = 3
          Top = 35
          Width = 249
          Height = 216
          Lines.Strings = (
            'set cmdsep ;'
            ''
            'set echo off'
            'set heading off '
            'set feedback off '
            'set pagesize 0 '
            'set trimout on'
            'spool InMemSpool'
            ''
            'select '#39'select * from "'#39' || table_name || '#39'";'#39' '
            'from user_tables '
            'where Upper(table_name) like '#39'ORDER%'#39';'
            ''
            'spool off'
            'set heading on'
            'set feedback on'
            'set pagesize 24'
            'set trimout off'
            'set echo on'
            ''
            'spool InMemSpool'
            '@InMemSpool'
            'spool off')
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
        object btnRunFromSpool: TButton
          Left = 255
          Top = 33
          Width = 75
          Height = 25
          Caption = 'Run'
          Enabled = False
          TabOrder = 1
          OnClick = btnRunFromSpoolClick
        end
        object mmRunFromSpoolOutput: TMemo
          Left = 336
          Top = 35
          Width = 270
          Height = 216
          ScrollBars = ssBoth
          TabOrder = 2
          WordWrap = False
        end
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 387
    ExplicitTop = 387
  end
  inherited StatusBar1: TStatusBar
    Top = 424
    ExplicitTop = 424
  end
  object FDScript1: TFDScript
    SQLScripts = <>
    Connection = dmlMainComp.dbMain
    ScriptDialog = FDGUIxScriptDialog1
    Params = <>
    Macros = <>
    Left = 408
    Top = 56
  end
  object FDGUIxScriptDialog1: TFDGUIxScriptDialog
    Left = 520
    Top = 56
  end
end
