function createUI()
  UI = createForm()
      UI.Left = -1047
      UI.Height = 214
      UI.Top = 705
      UI.Width = 500
      UI.ActiveControl = Steer
      UI.BorderStyle = bsSingle
      UI.Caption = "DeltaApp by Vi'o'Lence 2" 
      UI.ClientHeight = 214
      UI.ClientWidth = 500
      UI.Color = clGrayText
      UI.Font.Color = clWhite
      UI.FormStyle = fsSystemStayOnTop
      UI.Icon.Data = {}
      UI.OnClose = ex
      UI.OnDestroy = ex
      UI.OnKeyDown = Speed
      UI.ShowInTaskBar = stAlways
      --UI.LCLVersion = '2.2.2.0'
      UI.Visible = true


  local KersValueBar =  createProgressBar()
    UI.KersValueBar.Left = 393
    UI.KersValueBar.Height = 16
    UI.KersValueBar.Top = 179
    UI.KersValueBar.Width = 100
    UI.KersValueBar.BorderWidth = 1
    UI.KersValueBar.Position = 100
    UI.KersValueBar.TabOrder = 10


  local SettingButton = createButton()
    UI.SettingButton.Left = 387
    UI.SettingButton.Height = 36
    UI.SettingButton.Top = 13
    UI.SettingButton.Width = 90
    UI.SettingButton.Caption = 'SETTINGS'
    UI.SettingButton.Font.Height = -16
    UI.SettingButton.Font.Name = 'Segoe UI'
    UI.SettingButton.Font.Style.fsBold = true
    UI.SettingButton.Font.Style.fsItalic = true
    UI.SettingButton.OnClick = ShowHideSettings
    UI.SettingButton.ParentFont = false
    UI.SettingButton.TabOrder = 7


  local StartDetect = createButton()
    UI.StartDetect.Left = 295
    UI.StartDetect.Height = 36
    UI.StartDetect.Top = 13
    UI.StartDetect.Width = 70
    UI.StartDetect.Caption = 'START'
    UI.StartDetect.Enabled = false
    UI.StartDetect.Font.Height = -16
    UI.StartDetect.Font.Name = 'Segoe UI'
    UI.StartDetect.Font.Style.fsBold = true
    UI.StartDetect.Font.Style.fsItalic = true
    UI.StartDetect.OnClick = UpdateInfo
    UI.StartDetect.ParentFont = false
    UI.StartDetect.TabOrder = 0


  local CurrentLapLabel = createLabel(UI)
    UI.CurrentLapLabel.Left = 10
    UI.CurrentLapLabel.Height = 30
    UI.CurrentLapLabel.Top = 58
    UI.CurrentLapLabel.Width = 121
    UI.CurrentLapLabel.Caption = 'Current Lap:'
    UI.CurrentLapLabel.Font.Color = clWindow
    UI.CurrentLapLabel.Font.Height = -21
    UI.CurrentLapLabel.Font.Name = 'Segoe UI'
    UI.CurrentLapLabel.Font.Style.fsBold = true
    UI.CurrentLapLabel.Font.Style.fsItalic = true
    UI.CurrentLapLabel.ParentColor = false
    UI.CurrentLapLabel.ParentFont = false


  local FastestLapLabel = createLabel(UI)
    UI.FastestLapLabel.Left = 10
    UI.FastestLapLabel.Height = 30
    UI.FastestLapLabel.Top = 94
    UI.FastestLapLabel.Width = 115
    UI.FastestLapLabel.Caption = 'Fastest Lap:'
    UI.FastestLapLabel.Font.Color = clFuchsia
    UI.FastestLapLabel.Font.Height = -21
    UI.FastestLapLabel.Font.Name = 'Segoe UI'
    UI.FastestLapLabel.Font.Style.fsBold = true
    UI.FastestLapLabel.Font.Style.fsItalic = true
    UI.FastestLapLabel.ParentColor = false
    UI.FastestLapLabel.ParentFont = false


  local CL2 = createLabel(UI)
    UI.CL2.Left = 380
    UI.CL2.Height = 25
    UI.CL2.Top = 86
    UI.CL2.Width = 26
    UI.CL2.Caption = 'S1:'
    UI.CL2.Font.Color = clWindow
    UI.CL2.Font.Height = -19
    UI.CL2.Font.Name = 'Segoe UI'
    UI.CL2.Font.Style.fsBold = true
    UI.CL2.Font.Style.fsItalic = true
    UI.CL2.ParentColor = false
    UI.CL2.ParentFont = false


  local CL3 = createLabel(UI)
    UI.CL3.Left = 380
    UI.CL3.Height = 25
    UI.CL3.Top = 118
    UI.CL3.Width = 26
    UI.CL3.Caption = 'S2:'
    UI.CL3.Font.Color = clWindow
    UI.CL3.Font.Height = -19
    UI.CL3.Font.Name = 'Segoe UI'
    UI.CL3.Font.Style.fsBold = true
    UI.CL3.Font.Style.fsItalic = true
    UI.CL3.ParentColor = false
    UI.CL3.ParentFont = false


  local CL4 = createLabel(UI)
    UI.CL4.Left = 380
    UI.CL4.Height = 25
    UI.CL4.Top = 150
    UI.CL4.Width = 26
    UI.CL4.Caption = 'S3:'
    UI.CL4.Font.Color = clWindow
    UI.CL4.Font.Height = -19
    UI.CL4.Font.Name = 'Segoe UI'
    UI.CL4.Font.Style.fsBold = true
    UI.CL4.Font.Style.fsItalic = true
    UI.CL4.ParentColor = false
    UI.CL4.ParentFont = false


  local LapProgress = createProgressBar()
    UI.LapProgress.Left = 0
    UI.LapProgress.Height = 10
    UI.LapProgress.Top = 202
    UI.LapProgress.Width = 500
    UI.LapProgress.Position = 50
    UI.LapProgress.TabOrder = 1


  local CurrentLapValue = createLabel(UI)
    UI.CurrentLapValue.Left = 144
    UI.CurrentLapValue.Height = 30
    UI.CurrentLapValue.Top = 58
    UI.CurrentLapValue.Width = 84
    UI.CurrentLapValue.Caption = '0:0.000'
    UI.CurrentLapValue.Font.Color = clWindow
    UI.CurrentLapValue.Font.Height = -21
    UI.CurrentLapValue.Font.Name = 'Segoe UI'
    UI.CurrentLapValue.Font.Style.fsBold = true
    UI.CurrentLapValue.Font.Style.fsItalic = true
    UI.CurrentLapValue.ParentColor = false
    UI.CurrentLapValue.ParentFont = false


  local FastestLapValue = createLabel(UI)
    UI.FastestLapValue.Left = 144
    UI.FastestLapValue.Height = 30
    UI.FastestLapValue.Top = 94
    UI.FastestLapValue.Width = 108
    UI.FastestLapValue.Caption = '166:40.000'
    UI.FastestLapValue.Font.Color = clFuchsia
    UI.FastestLapValue.Font.Height = -21
    UI.FastestLapValue.Font.Name = 'Segoe UI'
    UI.FastestLapValue.Font.Style.fsBold = true
    UI.FastestLapValue.Font.Style.fsItalic = true
    UI.FastestLapValue.ParentColor = false
    UI.FastestLapValue.ParentFont = false


  local S1Label = createLabel(UI)
    UI.S1Label.Left = 420
    UI.S1Label.Height = 25
    UI.S1Label.Top = 86
    UI.S1Label.Width = 38
    UI.S1Label.Caption = '0.00'
    UI.S1Label.Font.Color = clWindow
    UI.S1Label.Font.Height = -19
    UI.S1Label.Font.Name = 'Segoe UI'
    UI.S1Label.Font.Style.fsBold = true
    UI.S1Label.Font.Style.fsItalic = true
    UI.S1Label.ParentColor = false
    UI.S1Label.ParentFont = false


  local S2Label = createLabel(UI)
    UI.S2Label.Left = 420
    UI.S2Label.Height = 25
    UI.S2Label.Top = 118
    UI.S2Label.Width = 38
    UI.S2Label.Caption = '0.00'
    UI.S2Label.Font.Color = clWindow
    UI.S2Label.Font.Height = -19
    UI.S2Label.Font.Name = 'Segoe UI'
    UI.S2Label.Font.Style.fsBold = true
    UI.S2Label.Font.Style.fsItalic = true
    UI.S2Label.ParentColor = false
    UI.S2Label.ParentFont = false


  local S3Label = createLabel(UI)
    UI.S3Label.Left = 420
    UI.S3Label.Height = 25
    UI.S3Label.Top = 150
    UI.S3Label.Width = 38
    UI.S3Label.Caption = '0.00'
    UI.S3Label.Font.Color = clWindow
    UI.S3Label.Font.Height = -19
    UI.S3Label.Font.Name = 'Segoe UI'
    UI.S3Label.Font.Style.fsBold = true
    UI.S3Label.Font.Style.fsItalic = true
    UI.S3Label.ParentColor = false
    UI.S3Label.ParentFont = false


  local DeltaLabel = createLabel(UI)
    UI.DeltaLabel.Left = 186
    UI.DeltaLabel.Height = 45
    UI.DeltaLabel.Top = 134
    UI.DeltaLabel.Width = 113
    UI.DeltaLabel.Caption = '+ 9.999'
    UI.DeltaLabel.Font.Color = clWindow
    UI.DeltaLabel.Font.Height = -32
    UI.DeltaLabel.Font.Name = 'Segoe UI'
    UI.DeltaLabel.Font.Style.fsBold = true
    UI.DeltaLabel.Font.Style.fsItalic = true
    UI.DeltaLabel.ParentColor = false
    UI.DeltaLabel.ParentFont = false


  local S1ProggressBar = createLabel(UI)
    UI.S1ProggressBar.Left = 145
    UI.S1ProggressBar.Height = 17
    UI.S1ProggressBar.Top = 183
    UI.S1ProggressBar.Width = 37
    UI.S1ProggressBar.Caption = 'S1 | S2'
    UI.S1ProggressBar.Font.Color = clMenuBar
    UI.S1ProggressBar.Font.Height = -13
    UI.S1ProggressBar.Font.Name = 'Segoe UI'
    UI.S1ProggressBar.Font.Style.fsItalic = true
    UI.S1ProggressBar.ParentColor = false
    UI.S1ProggressBar.ParentFont = false


  local S1ProggressBar1 = createLabel(UI)
    UI.S1ProggressBar1.Left = 310
    UI.S1ProggressBar1.Height = 17
    UI.S1ProggressBar1.Top = 183
    UI.S1ProggressBar1.Width = 37
    UI.S1ProggressBar1.Caption = 'S2 | S3'
    UI.S1ProggressBar1.Font.Color = clMenuBar
    UI.S1ProggressBar1.Font.Height = -13
    UI.S1ProggressBar1.Font.Name = 'Segoe UI'
    UI.S1ProggressBar1.Font.Style.fsItalic = true
    UI.S1ProggressBar1.ParentColor = false
    UI.S1ProggressBar1.ParentFont = false


  local SectorsCurrent = createLabel(UI)
    UI.SectorsCurrent.Left = 386
    UI.SectorsCurrent.Height = 21
    UI.SectorsCurrent.Top = 61
    UI.SectorsCurrent.Width = 88
    UI.SectorsCurrent.Caption = 'Current lap:'
    UI.SectorsCurrent.Font.Color = clMenuBar
    UI.SectorsCurrent.Font.Height = -16
    UI.SectorsCurrent.Font.Name = 'Segoe UI'
    UI.SectorsCurrent.Font.Style.fsBold = true
    UI.SectorsCurrent.Font.Style.fsItalic = true
    UI.SectorsCurrent.ParentColor = false
    UI.SectorsCurrent.ParentFont = false


  local BestSectors = createLabel(UI)
    UI.BestSectors.Left = 401
    UI.BestSectors.Height = 17
    UI.BestSectors.Top = 13
    UI.BestSectors.Width = 57
    UI.BestSectors.Caption = 'Best Lap:'
    UI.BestSectors.Font.Color = clMenuBar
    UI.BestSectors.Font.Height = -13
    UI.BestSectors.Font.Name = 'Segoe UI'
    UI.BestSectors.Font.Style.fsBold = true
    UI.BestSectors.Font.Style.fsItalic = true
    UI.BestSectors.ParentColor = false
    UI.BestSectors.ParentFont = false
    UI.BestSectors.Visible = false

  local LogBuildingButton = createButton()
    UI.LogBuildingButton.Left = 10
    UI.LogBuildingButton.Height = 36
    UI.LogBuildingButton.Top = 13
    UI.LogBuildingButton.Width = 90
    UI.LogBuildingButton.Caption = 'LOGS OFF'
    UI.LogBuildingButton.Enabled = false
    UI.LogBuildingButton.Font.Height = -16
    UI.LogBuildingButton.Font.Name = 'Segoe UI'
    UI.LogBuildingButton.Font.Style.fsBold = true
    UI.LogBuildingButton.Font.Style.fsItalic = true
    UI.LogBuildingButton.OnClick = LogsSwitcher
    UI.LogBuildingButton.ParentFont = false
    UI.LogBuildingButton.TabOrder = 4


  local LoadFLButton = createButton()
    UI.LoadFLButton.Left = 105
    UI.LoadFLButton.Height = 36
    UI.LoadFLButton.Top = 13
    UI.LoadFLButton.Width = 90
    UI.LoadFLButton.Caption = 'LOAD LAP'
    UI.LoadFLButton.Enabled = false
    UI.LoadFLButton.Font.Height = -16
    UI.LoadFLButton.Font.Name = 'Segoe UI'
    UI.LoadFLButton.Font.Style.fsBold = true
    UI.LoadFLButton.Font.Style.fsItalic = true
    UI.LoadFLButton.OnClick = LoadFastLap
    UI.LoadFLButton.ParentFont = false
    UI.LoadFLButton.TabOrder = 5


  local SaveFLButton = createButton()
    UI.SaveFLButton.Left = 200
    UI.SaveFLButton.Height = 36
    UI.SaveFLButton.Top = 13
    UI.SaveFLButton.Width = 90
    UI.SaveFLButton.Caption = 'SAVE LAP'
    UI.SaveFLButton.Enabled = false
    UI.SaveFLButton.Font.Height = -16
    UI.SaveFLButton.Font.Name = 'Segoe UI'
    UI.SaveFLButton.Font.Style.fsBold = true
    UI.SaveFLButton.Font.Style.fsItalic = true
    UI.SaveFLButton.OnClick = SaveFastLap
    UI.SaveFLButton.OnMouseEnter = ShowTime
    UI.SaveFLButton.OnMouseLeave = RevertCaption
    UI.SaveFLButton.ParentFont = false
    UI.SaveFLButton.TabOrder = 6


  local SettingPanel = createPanel()
    UI.SettingPanel.Left = 375
    UI.SettingPanel.Height = 130
    UI.SettingPanel.Top = 50
    UI.SettingPanel.Width = 110
    UI.SettingPanel.BevelColor = clBackground
    UI.SettingPanel.BevelWidth = 2
    UI.SettingPanel.ClientHeight = 130
    UI.SettingPanel.ClientWidth = 110
    UI.SettingPanel.TabOrder = 8
    UI.SettingPanel.Visible = false


  local SpeedTurnOn = createButton()
    UI.SpeedTurnOn.Left = 5
    UI.SpeedTurnOn.Height = 30
    UI.SpeedTurnOn.Top = 5
    UI.SpeedTurnOn.Width = 100
    UI.SpeedTurnOn.Caption = 'SPEED: ON'
    UI.SpeedTurnOn.Font.Name = 'Segoe UI'
    UI.SpeedTurnOn.Font.Style.fsBold = true
    UI.SpeedTurnOn.Font.Style.fsItalic = true
    UI.SpeedTurnOn.OnClick = ChangeSpeed
    UI.SpeedTurnOn.ParentFont = false
    UI.SpeedTurnOn.TabOrder = 0

  local MetricsTurnOn = createButton()
    UI.MetricsTurnOn.Left = 5
    UI.MetricsTurnOn.Height = 30
    UI.MetricsTurnOn.Top = 35
    UI.MetricsTurnOn.Width = 100
    UI.MetricsTurnOn.Caption = 'SPEED: KPH'
    UI.MetricsTurnOn.Font.Name = 'Segoe UI'
    UI.MetricsTurnOn.Font.Style.fsBold = true
    UI.MetricsTurnOn.Font.Style.fsItalic = true
    UI.MetricsTurnOn.OnClick = ChangeMetrics
    UI.MetricsTurnOn.ParentFont = false
    UI.MetricsTurnOn.TabOrder = 1


  local GearsTurnOn = createButton()
    UI.GearsTurnOn.Left = 5
    UI.GearsTurnOn.Height = 30
    UI.GearsTurnOn.Top = 65
    UI.GearsTurnOn.Width = 100
    UI.GearsTurnOn.Caption = 'GEARS: ON'
    UI.GearsTurnOn.Font.Name = 'Segoe UI'
    UI.GearsTurnOn.Font.Style.fsBold = true
    UI.GearsTurnOn.Font.Style.fsItalic = true
    UI.GearsTurnOn.OnClick = ChangeGears
    UI.GearsTurnOn.ParentFont = false
    UI.GearsTurnOn.TabOrder = 2


  local InputsTurnOn = createButton()
    UI.InputsTurnOn.Left = 5
    UI.InputsTurnOn.Height = 30
    UI.InputsTurnOn.Top = 95
    UI.InputsTurnOn.Width = 100
    UI.InputsTurnOn.Caption = 'INPUT: ON'
    UI.InputsTurnOn.Font.Name = 'Segoe UI'
    UI.InputsTurnOn.Font.Style.fsBold = true
    UI.InputsTurnOn.Font.Style.fsItalic = true
    UI.InputsTurnOn.OnClick = ChangeInputs
    UI.InputsTurnOn.ParentFont = false
    UI.InputsTurnOn.TabOrder = 3

  local KersValueTurnOn = createButton()
    UI.KersValueTurnOn.Left = 5
    UI.KersValueTurnOn.Height = 30
    UI.KersValueTurnOn.Top = 125
    UI.KersValueTurnOn.Width = 100
    UI.KersValueTurnOn.Caption = 'KERS: ON'
    UI.KersValueTurnOn.Font.CharSet = ANSI_CHARSET
    UI.KersValueTurnOn.Font.Color = clWhite
    UI.KersValueTurnOn.Font.Pitch = fpVariable
    UI.KersValueTurnOn.Font.Quality = fqDraft
    UI.KersValueTurnOn.Font.Style.fsBold = true
    UI.KersValueTurnOn.Font.Style.fsItalic = true
    UI.KersValueTurnOn.OnClick = ChangeKers
    UI.KersValueTurnOn.ParentFont = False
    UI.KersValueTurnOn.TabOrder = 4

  local SpeedLabel = createLabel(UI)
    UI.SpeedLabel.Left = 24
    UI.SpeedLabel.Height = 30
    UI.SpeedLabel.Top = 166
    UI.SpeedLabel.Width = 81
    UI.SpeedLabel.Caption = 'Kph: 0.0'
    UI.SpeedLabel.Font.Color = clWindow
    UI.SpeedLabel.Font.Height = -21
    UI.SpeedLabel.Font.Name = 'Segoe UI'
    UI.SpeedLabel.Font.Style.fsBold = true
    UI.SpeedLabel.Font.Style.fsItalic = true
    UI.SpeedLabel.ParentColor = false
    UI.SpeedLabel.ParentFont = false


  local GearLabel = createLabel(UI)
    UI.GearLabel.Left = 40
    UI.GearLabel.Height = 42
    UI.GearLabel.Top = 126
    UI.GearLabel.Width = 80
    UI.GearLabel.Alignment = taCenter
    UI.GearLabel.AutoSize = false
    UI.GearLabel.Caption = 'N'
    UI.GearLabel.Font.Color = clWindow
    UI.GearLabel.Font.Height = -32
    UI.GearLabel.Font.Name = 'Segoe UI'
    UI.GearLabel.Font.Style.fsBold = true
    UI.GearLabel.Font.Style.fsItalic = true
    UI.GearLabel.Font.Style.fsUnderline = true
    UI.GearLabel.ParentColor = false
    UI.GearLabel.ParentFont = false


  local RPM1 = createLabel(UI)
    UI.RPM1.Left = 47
    UI.RPM1.Height = 65
    UI.RPM1.Top = 113
    UI.RPM1.Width = 67
    UI.RPM1.Caption = '∙   ∙'
    UI.RPM1.Font.Color = clLime
    UI.RPM1.Font.Height = -48
    UI.RPM1.Font.Name = 'Segoe UI'
    UI.RPM1.Font.Style.fsBold = true
    UI.RPM1.Font.Style.fsItalic = true
    UI.RPM1.ParentColor = false
    UI.RPM1.ParentFont = false
    UI.RPM1.Visible = false


  local RPM2 = createLabel(UI)
    UI.RPM2.Left = 34
    UI.RPM2.Height = 65
    UI.RPM2.Top = 113
    UI.RPM2.Width = 93
    UI.RPM2.Caption = '∙     ∙'
    UI.RPM2.Font.Color = clYellow
    UI.RPM2.Font.Height = -48
    UI.RPM2.Font.Name = 'Segoe UI'
    UI.RPM2.Font.Style.fsBold = true
    UI.RPM2.Font.Style.fsItalic = true
    UI.RPM2.ParentColor = false
    UI.RPM2.ParentFont = false
    UI.RPM2.Visible = false


  local RPM3 = createLabel(UI)
    UI.RPM3.Left = 20
    UI.RPM3.Height = 65
    UI.RPM3.Top = 113
    UI.RPM3.Width = 119
    UI.RPM3.Caption = '∙       ∙'
    UI.RPM3.Font.Color = clRed
    UI.RPM3.Font.Height = -48
    UI.RPM3.Font.Name = 'Segoe UI'
    UI.RPM3.Font.Style.fsBold = true
    UI.RPM3.Font.Style.fsItalic = true
    UI.RPM3.ParentColor = false
    UI.RPM3.ParentFont = false
    UI.RPM3.Visible = false

  local RPM4 = createLabel(UI)
    UI.RPM4.Left = 8
    UI.RPM4.Height = 65
    UI.RPM4.Top = 113
    UI.RPM4.Width = 145
    UI.RPM4.Caption = '∙         ∙'
    UI.RPM4.Font.Color = clBlue
    UI.RPM4.Font.Height = -48
    UI.RPM4.Font.Name = 'Segoe UI'
    UI.RPM4.Font.Style.fsBold = true
    UI.RPM4.Font.Style.fsItalic = true
    UI.RPM4.ParentColor = false
    UI.RPM4.ParentFont = false
    UI.RPM4.Visible = false

  local Steer = createTrackBar()
    UI.Steer.Left = 255
    UI.Steer.Height = 20
    UI.Steer.Top = 110
    UI.Steer.Width = 110
    UI.Steer.LineSize = 50
    UI.Steer.Max = 100
    UI.Steer.PageSize = 0
    UI.Steer.Position = 50
    UI.Steer.ScalePos = trBottom
    UI.Steer.ShowSelRange = false
    UI.Steer.DragMode = dmAutomatic
    UI.Steer.Font.Color = clNone
    UI.Steer.ParentFont = false
    UI.Steer.TabOrder = 9


  local Gas = createLabel(UI)
    UI.Gas.Left = 316
    UI.Gas.Height = 30
    UI.Gas.Top = 78
    UI.Gas.Width = 13
    UI.Gas.Caption = '0'
    UI.Gas.Font.Color = clLime
    UI.Gas.Font.Height = -22
    UI.Gas.Font.Name = 'Segoe UI'
    UI.Gas.Font.Style.fsBold = true
    UI.Gas.Font.Style.fsItalic = true
    UI.Gas.ParentColor = false
    UI.Gas.ParentFont = false


  local Brake = createLabel(UI)
    UI.Brake.Left = 264
    UI.Brake.Height = 30
    UI.Brake.Top = 78
    UI.Brake.Width = 13
    UI.Brake.Caption = '0'
    UI.Brake.Font.Color = clRed
    UI.Brake.Font.Height = -22
    UI.Brake.Font.Name = 'Segoe UI'
    UI.Brake.Font.Style.fsBold = true
    UI.Brake.Font.Style.fsItalic = true
    UI.Brake.ParentColor = false
    UI.Brake.ParentFont = false


  local InitPanel = createPanel()
    UI.InitPanel.Left = -2
    UI.InitPanel.Height = 217
    UI.InitPanel.Top = -2
    UI.InitPanel.Width = 503
    UI.InitPanel.ClientHeight = 217
    UI.InitPanel.ClientWidth = 503
    UI.InitPanel.Color = clGrayText
    UI.InitPanel.DoubleBuffered = true
    UI.InitPanel.Font.CharSet = ANSI_CHARSET
    UI.InitPanel.Font.Color = clWhite
    UI.InitPanel.Font.Height = -16
    UI.InitPanel.Font.Pitch = fpVariable
    UI.InitPanel.Font.Quality = fqDraft
    UI.InitPanel.ParentColor = false
    UI.InitPanel.ParentDoubleBuffered = false
    UI.InitPanel.ParentFont = false
    UI.InitPanel.TabOrder = 2


  local OnOffButtonLabel = createLabel(UI)
    UI.OnOffButtonLabel.Left = 76
    UI.OnOffButtonLabel.Height = 100
    UI.OnOffButtonLabel.Top = 102
    UI.OnOffButtonLabel.Width = 347
    UI.OnOffButtonLabel.Caption = '-Enable only after u spawned on track and crossed the 1st checkpoint. -Any errors or issues report via Discord PM @vi.o.lence or @mrtino.'
    UI.OnOffButtonLabel.Font.Color = clWindow
    UI.OnOffButtonLabel.Font.Height = -19
    UI.OnOffButtonLabel.Font.Name = 'Segoe UI'
    UI.OnOffButtonLabel.Font.Style.fsItalic = true
    UI.OnOffButtonLabel.Font.Style.fsUnderline = true
    UI.OnOffButtonLabel.ParentColor = false
    UI.OnOffButtonLabel.ParentFont = false


  local Enable = createButton()
    UI.Enable.Left = 150
    UI.Enable.Height = 40
    UI.Enable.Top = 51
    UI.Enable.Width = 200
    UI.Enable.Caption = 'Enable'
    UI.Enable.Font.CharSet = ANSI_CHARSET
    UI.Enable.Font.Height = -16
    UI.Enable.Font.Name = 'Segoe UI'
    UI.Enable.Font.Pitch = fpVariable
    UI.Enable.Font.Quality = fqDraft
    UI.Enable.Font.Style.fsBold = true
    UI.Enable.OnClick = Startup
    UI.Enable.ParentFont = false
    UI.Enable.TabOrder = 0

  local KersValue = createLabel(UI)
    UI.KersValue.Left = 357
    UI.KersValue.Height = 25
    UI.KersValue.Top = 174
    UI.KersValue.Width = 33
    UI.KersValue.Caption = '0'
    UI.KersValue.Font.CharSet = ANSI_CHARSET
    UI.KersValue.Font.Color = clYellow
    UI.KersValue.Font.Height = -19
    UI.KersValue.Font.Pitch = fpVariable
    UI.KersValue.Font.Quality = fqDraft
    UI.KersValue.Font.Style.fsBold = true
    UI.KersValue.Font.Style.fsItalic = true
    UI.KersValue.ParentColor = false
    UI.KersValue.ParentFont = false

  local PitDeltaValue = createLabel(UI)
    UI.PitDeltaValue.Left = 144
    UI.PitDeltaValue.Height = 30
    UI.PitDeltaValue.Top = 58
    UI.PitDeltaValue.Width = 84
    UI.PitDeltaValue.Caption = '0:0.000'
    UI.PitDeltaValue.Font.CharSet = ANSI_CHARSET
    UI.PitDeltaValue.Font.Color = clWhite
    UI.PitDeltaValue.Font.Height = -21
    UI.PitDeltaValue.Font.Name = 'Segoe UI'
    UI.PitDeltaValue.Font.Pitch = fpVariable
    UI.PitDeltaValue.Font.Quality = fqDraft
    UI.PitDeltaValue.Font.Style.fsBold = true
    UI.PitDeltaValue.Font.Style.fsItalic = true
    UI.PitDeltaValue.ParentColor = false
    UI.PitDeltaValue.ParentFont = false
    UI.PitDeltaValue.Visible = false
end