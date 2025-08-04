object Form1: TForm1
  Left = 543
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'RC4 File & String Crypter'
  ClientHeight = 310
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Label1: TLabel
    Left = 440
    Top = 105
    Width = 36
    Height = 13
    Caption = 'Result :'
  end
  object Label2: TLabel
    Left = 227
    Top = 198
    Width = 25
    Height = 13
    Caption = '0 bits'
  end
  object Label3: TLabel
    Left = 487
    Top = 28
    Width = 66
    Height = 13
    Caption = 'String Crypter:'
  end
  object Label4: TLabel
    Left = 19
    Top = 112
    Width = 52
    Height = 13
    Caption = 'Password :'
  end
  object Label5: TLabel
    Left = 122
    Top = 161
    Width = 48
    Height = 13
    Caption = 'Numbers :'
  end
  object Label6: TLabel
    Left = 248
    Top = 160
    Width = 38
    Height = 13
    Caption = 'Letters :'
  end
  object Bevel1: TBevel
    Left = 370
    Top = 8
    Width = 2
    Height = 276
  end
  object Button1: TButton
    Left = 17
    Top = 259
    Width = 82
    Height = 20
    Caption = 'Crypt'
    TabOrder = 0
    TabStop = False
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 17
    Top = 217
    Width = 328
    Height = 28
    Smooth = True
    Step = 1
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 487
    Top = 47
    Width = 234
    Height = 21
    TabStop = False
    TabOrder = 2
    Text = 'Hello this is a RC4 Crypter'
  end
  object Edit2: TEdit
    Left = 487
    Top = 73
    Width = 234
    Height = 21
    TabStop = False
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 487
    Top = 99
    Width = 234
    Height = 21
    TabStop = False
    TabOrder = 4
  end
  object Button2: TButton
    Left = 393
    Top = 48
    Width = 85
    Height = 20
    Caption = 'Crypt'
    TabOrder = 5
    TabStop = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 393
    Top = 74
    Width = 85
    Height = 20
    Caption = 'Decrypt'
    TabOrder = 6
    TabStop = False
    OnClick = Button3Click
  end
  object Edit4: TEdit
    Left = 19
    Top = 56
    Width = 329
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 291
    Width = 732
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Load File..'
    ExplicitTop = 244
    ExplicitWidth = 350
  end
  object Button4: TButton
    Left = 19
    Top = 26
    Width = 80
    Height = 20
    Caption = 'Open EXE'
    TabOrder = 9
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 266
    Top = 259
    Width = 75
    Height = 20
    Caption = 'Decrypt'
    TabOrder = 10
    TabStop = False
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 261
    Top = 26
    Width = 80
    Height = 20
    Caption = 'Open RC4'
    TabOrder = 11
    OnClick = Button6Click
  end
  object Edit5: TEdit
    Left = 20
    Top = 131
    Width = 329
    Height = 21
    TabOrder = 12
    Text = 'abc123'
  end
  object Button7: TButton
    Left = 19
    Top = 158
    Width = 75
    Height = 20
    Caption = 'Generate'
    TabOrder = 13
    TabStop = False
    OnClick = Button7Click
  end
  object SpinEdit1: TSpinEdit
    Left = 176
    Top = 158
    Width = 57
    Height = 22
    TabStop = False
    MaxValue = 0
    MinValue = 0
    TabOrder = 14
    Value = 5
  end
  object SpinEdit2: TSpinEdit
    Left = 292
    Top = 158
    Width = 57
    Height = 22
    TabStop = False
    MaxValue = 0
    MinValue = 0
    TabOrder = 15
    Value = 5
  end
  object OpenDialog1: TOpenDialog
    Left = 418
    Top = 155
  end
end
