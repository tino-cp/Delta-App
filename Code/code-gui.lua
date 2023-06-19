FL = createForm()
  FL.Left = -1047
  FL.Height = 214
  FL.Top = 705
  FL.Width = 500
  FL.ActiveControl = Steer
  FL.BorderIcons = [biSystemMenu, biMinimize]
  FL.BorderStyle = bsSingle
  FL.Caption = 'DeltaApp by Vi''o''Lence'
  FL.ClientHeight = 214
  FL.ClientWidth = 500
  FL.Color = clGrayText
  FL.Font.Color = clWhite
  FL.FormStyle = fsSystemStayOnTop
  FL.Icon.Data = {
    x
  }
  OnClose = ex
  OnDestroy = ex
  OnKeyDown = Speed
  ShowInTaskBar = stAlways
  LCLVersion = '2.2.2.0'
  Visible = True
  object KersValueTest2: TCEProgressBar
    Left = 393
    Height = 16
    Top = 179
    Width = 100
    BorderWidth = 1
    Position = 100
    TabOrder = 10
  end
  object SettingButton: TCEButton
    Left = 387
    Height = 36
    Top = 13
    Width = 90
    Caption = 'SETTINGS'
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    OnClick = ShowHideSettings
    ParentFont = False
    TabOrder = 7
  end
  object StartDetect: TCEButton
    Left = 295
    Height = 36
    Top = 13
    Width = 70
    Caption = 'START'
    Enabled = False
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    OnClick = UpdateInfo
    ParentFont = False
    TabOrder = 0
  end
  object CurrentLapLabel: TCELabel
    Left = 10
    Height = 30
    Top = 58
    Width = 121
    Caption = 'Current Lap:'
    Font.Color = clWindow
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object FastestLapLabel: TCELabel
    Left = 10
    Height = 30
    Top = 94
    Width = 115
    Caption = 'Fastest Lap:'
    Font.Color = clFuchsia
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object CL2: TCELabel
    Left = 380
    Height = 25
    Top = 86
    Width = 26
    Caption = 'S1:'
    Font.Color = clWindow
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object CL3: TCELabel
    Left = 380
    Height = 25
    Top = 118
    Width = 26
    Caption = 'S2:'
    Font.Color = clWindow
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object CL4: TCELabel
    Left = 380
    Height = 25
    Top = 150
    Width = 26
    Caption = 'S3:'
    Font.Color = clWindow
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object LapProgress: TCEProgressBar
    Left = 0
    Height = 10
    Top = 202
    Width = 500
    Position = 50
    TabOrder = 1
  end
  object CurrentLapValue: TCELabel
    Left = 144
    Height = 30
    Top = 58
    Width = 84
    Caption = '6:46.419'
    Font.Color = clWindow
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object FastestLapValue: TCELabel
    Left = 144
    Height = 30
    Top = 94
    Width = 108
    Caption = '166:40.000'
    Font.Color = clFuchsia
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object S1Label: TCELabel
    Left = 420
    Height = 25
    Top = 86
    Width = 38
    Caption = '0.00'
    Font.Color = clWindow
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object S2Label: TCELabel
    Left = 420
    Height = 25
    Top = 118
    Width = 38
    Caption = '0.00'
    Font.Color = clWindow
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object S3Label: TCELabel
    Left = 420
    Height = 25
    Top = 150
    Width = 38
    Caption = '0.00'
    Font.Color = clWindow
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object DeltaLabel: TCELabel
    Left = 186
    Height = 45
    Top = 134
    Width = 113
    Caption = '+ 9.999'
    Font.Color = clWindow
    Font.Height = -32
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object S1ProggressBar: TCELabel
    Left = 145
    Height = 17
    Top = 183
    Width = 37
    Caption = 'S1 | S2'
    Font.Color = clMenuBar
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object S1ProggressBar1: TCELabel
    Left = 310
    Height = 17
    Top = 183
    Width = 37
    Caption = 'S2 | S3'
    Font.Color = clMenuBar
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object SectorsCurrent: TCELabel
    Left = 386
    Height = 21
    Top = 61
    Width = 88
    Caption = 'Current lap:'
    Font.Color = clMenuBar
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object BestSectors: TCELabel
    Left = 401
    Height = 17
    Top = 13
    Width = 57
    Caption = 'Best Lap:'
    Font.Color = clMenuBar
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object CEButton1: TCEButton
    Left = 413
    Height = 36
    Top = 83
    Width = 48
    Caption = 'CEButton1'
    Enabled = False
    OnClick = Debuug
    TabOrder = 3
    Visible = False
  end
  object LogBuildingButton: TCEButton
    Left = 10
    Height = 36
    Top = 13
    Width = 90
    Caption = 'LOGS OFF'
    Enabled = False
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    OnClick = LogsSwitcher
    ParentFont = False
    TabOrder = 4
  end
  object LoadFLButton: TCEButton
    Left = 105
    Height = 36
    Top = 13
    Width = 90
    Caption = 'LOAD LAP'
    Enabled = False
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    OnClick = LoadFastLap
    ParentFont = False
    TabOrder = 5
  end
  object SaveFLButton: TCEButton
    Left = 200
    Height = 36
    Top = 13
    Width = 90
    Caption = 'SAVE LAP'
    Enabled = False
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    OnClick = SaveFastLap
    OnMouseEnter = ShowTime
    OnMouseLeave = RevertCaption
    ParentFont = False
    TabOrder = 6
  end
  object SettingPanel: TCEPanel
    Left = 375
    Height = 130
    Top = 50
    Width = 110
    BevelColor = clBackground
    BevelWidth = 2
    ClientHeight = 130
    ClientWidth = 110
    TabOrder = 8
    Visible = False
    object SpeedTurnOn: TCEButton
      Left = 5
      Height = 30
      Top = 5
      Width = 100
      Caption = 'SPEED: ON'
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      OnClick = ChangeSpeed
      ParentFont = False
      TabOrder = 0
    end
    object MetricsTurnOn: TCEButton
      Left = 5
      Height = 30
      Top = 35
      Width = 100
      Caption = 'SPEED: KPH'
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      OnClick = ChangeMetrics
      ParentFont = False
      TabOrder = 1
    end
    object GearsTurnOn: TCEButton
      Left = 5
      Height = 30
      Top = 65
      Width = 100
      Caption = 'GEARS: ON'
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      OnClick = ChangeGears
      ParentFont = False
      TabOrder = 2
    end
    object InputsTurnOn: TCEButton
      Left = 5
      Height = 30
      Top = 95
      Width = 100
      Caption = 'INPUT: ON'
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      OnClick = ChangeInputs
      ParentFont = False
      TabOrder = 3
    end
  end
  object SpeedLabel: TCELabel
    Left = 24
    Height = 30
    Top = 166
    Width = 81
    Caption = 'Kph: 0.0'
    Font.Color = clWindow
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object GearLabel: TCELabel
    Left = 40
    Height = 42
    Top = 126
    Width = 80
    Alignment = taCenter
    AutoSize = False
    Caption = '1'
    Font.Color = clWindow
    Font.Height = -32
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic, fsUnderline]
    ParentColor = False
    ParentFont = False
  end
  object RPM1: TCELabel
    Left = 47
    Height = 65
    Top = 113
    Width = 67
    Caption = '∙   ∙'
    Font.Color = clLime
    Font.Height = -48
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object RPM2: TCELabel
    Left = 34
    Height = 65
    Top = 113
    Width = 93
    Caption = '∙     ∙'
    Font.Color = clYellow
    Font.Height = -48
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object RPM3: TCELabel
    Left = 20
    Height = 65
    Top = 113
    Width = 119
    Caption = '∙       ∙'
    Font.Color = clRed
    Font.Height = -48
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Steer: TCETrackBar
    Left = 255
    Height = 20
    Top = 110
    Width = 110
    LineSize = 50
    Max = 100
    PageSize = 0
    Position = 50
    ScalePos = trBottom
    ShowSelRange = False
    DragMode = dmAutomatic
    Font.Color = clNone
    ParentFont = False
    TabOrder = 9
  end
  object RPM4: TCELabel
    Left = 8
    Height = 65
    Top = 113
    Width = 145
    Caption = '∙         ∙'
    Font.Color = clBlue
    Font.Height = -48
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Gas: TCELabel
    Left = 316
    Height = 30
    Top = 78
    Width = 13
    Caption = '0'
    Font.Color = clLime
    Font.Height = -22
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object Brake: TCELabel
    Left = 264
    Height = 30
    Top = 78
    Width = 13
    Caption = '0'
    Font.Color = clRed
    Font.Height = -22
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object InitPanel: TCEPanel
    Left = -2
    Height = 217
    Top = -2
    Width = 503
    ClientHeight = 217
    ClientWidth = 503
    Color = clGrayText
    DoubleBuffered = True
    Font.CharSet = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 2
    object OnOffButtonLabel: TCELabel
      Left = 76
      Height = 100
      Top = 102
      Width = 347
      Caption = '-Turn on only after spawn on track '#13#10'and cross 1''st checkpoint'#13#10'-Any errors or issues report via discord PM'#13#10'@Vi’o’Lence#4225'
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic, fsUnderline]
      ParentColor = False
      ParentFont = False
    end
    object Enable: TCEButton
      Left = 150
      Height = 40
      Top = 51
      Width = 200
      Caption = 'Enable'
      Font.CharSet = ANSI_CHARSET
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Pitch = fpVariable
      Font.Quality = fqDraft
      Font.Style = [fsBold]
      OnClick = Startup
      ParentFont = False
      TabOrder = 0
    end
    object SCversionlabel: TCELabel
      Left = 280
      Height = 21
      Top = 20
      Width = 19
      Caption = 'SC'
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object NonSteamVersion: TRadioButton
      Left = 261
      Height = 19
      Top = 22
      Width = 20
      AutoSize = False
      Color = clWindow
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      TabStop = True
      Visible = False
    end
    object SteamLabel: TCELabel
      Left = 204
      Height = 21
      Top = 20
      Width = 48
      Caption = 'Steam'
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object SteamVersion: TRadioButton
      Left = 185
      Height = 19
      Top = 22
      Width = 20
      AutoSize = False
      Checked = True
      Color = clWindow
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      TabStop = True
      Visible = False
    end
  end
  object KersValueTest: TCELabel
    Left = 357
    Height = 25
    Top = 174
    Width = 33
    Caption = '100'
    Font.CharSet = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -19
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object PitDeltaValue: TCELabel
    Left = 144
    Height = 30
    Top = 58
    Width = 84
    Caption = '0:00.000'
    Font.CharSet = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
end
