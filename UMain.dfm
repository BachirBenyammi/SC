object Form1: TForm1
  Left = 192
  Top = 114
  Width = 520
  Height = 268
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Split & Combine - BENBAC SOFT -'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 497
    Height = 105
    Caption = 'Split'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 52
      Height = 13
      Caption = 'File to split:'
    end
    object Label2: TLabel
      Left = 8
      Top = 80
      Width = 46
      Height = 13
      Caption = 'Size (KB):'
    end
    object Label5: TLabel
      Left = 8
      Top = 52
      Width = 74
      Height = 13
      Caption = 'Files distination:'
    end
    object SpeedButton1: TSpeedButton
      Left = 376
      Top = 16
      Width = 23
      Height = 22
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 376
      Top = 40
      Width = 23
      Height = 22
      OnClick = SpeedButton2Click
    end
    object Button1: TButton
      Left = 408
      Top = 16
      Width = 75
      Height = 49
      Caption = 'Split'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 64
      Top = 16
      Width = 305
      Height = 21
      TabOrder = 1
    end
    object SpinEdit1: TSpinEdit
      Left = 64
      Top = 72
      Width = 89
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 1024
    end
    object Edit4: TEdit
      Left = 96
      Top = 44
      Width = 273
      Height = 21
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 120
    Width = 497
    Height = 81
    Caption = 'GroupBox2'
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 28
      Width = 79
      Height = 13
      Caption = 'Files to combine:'
    end
    object Label4: TLabel
      Left = 8
      Top = 52
      Width = 74
      Height = 13
      Caption = 'Files distination:'
    end
    object SpeedButton3: TSpeedButton
      Left = 376
      Top = 40
      Width = 23
      Height = 22
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 376
      Top = 16
      Width = 23
      Height = 22
      OnClick = SpeedButton4Click
    end
    object Button2: TButton
      Left = 408
      Top = 16
      Width = 75
      Height = 49
      Caption = 'Combine'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Edit2: TEdit
      Left = 96
      Top = 20
      Width = 273
      Height = 21
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 96
      Top = 44
      Width = 273
      Height = 21
      TabOrder = 2
    end
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 208
    Width = 497
    Height = 17
    TabOrder = 2
  end
  object OD: TOpenDialog
    Left = 168
    Top = 80
  end
  object SD: TSaveDialog
    Left = 200
    Top = 80
  end
end
