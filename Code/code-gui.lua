FLtest = createForm()
    FLtest.Left = -1047
    FLtest.Height = 214
    FLtest.Top = 705
    FLtest.Width = 500
    FLtest.ActiveControl = Steer
    FLtest.BorderIcons = [biSystemMenu, biMinimize]
    FLtest.BorderStyle = bsSingle
    FLtest.Caption = 'DeltaApp by Vi''o''Lence'
    FLtest.ClientHeight = 214
    FLtest.ClientWidth = 500
    FLtest.Color = clGrayText
    FLtest.Font.Color = clWhite
    FLtest.FormStyle = fsSystemStayOnTop
    FLtest.Icon.Data = { x }
    FLtest.OnClose = ex
    FLtest.OnDestroy = ex
    FLtest.OnKeyDown = Speed
    FLtest.ShowInTaskBar = stAlways
    FLtest.LCLVersion = '2.2.2.0'
    FLtest.Visible = True
end

local KersValueBar =  createProgressBar()
  FLtest.KersValueBar.Left = 393
  FLtest.KersValueBar.Height = 16
  FLtest.KersValueBar.Top = 179
  FLtest.KersValueBar.Width = 100
  FLtest.KersValueBar.BorderWidth = 1
  FLtest.KersValueBar.Position = 100
  FLtest.KersValueBar.TabOrder = 10
end

local SettingButton = createButton()
  FLtest.SettingButton.Left = 387
  FLtest.SettingButton.Height = 36
  FLtest.SettingButton.Top = 13
  FLtest.SettingButton.Width = 90
  FLtest.SettingButton.Caption = 'SETTINGS'
  FLtest.SettingButton.Font.Height = -16
  FLtest.SettingButton.Font.Name = 'Segoe UI'
  FLtest.SettingButton.Font.Style = [fsBold, fsItalic]
  FLtest.SettingButton.OnClick = ShowHideSettings
  FLtest.SettingButton.ParentFont = False
  FLtest.SettingButton.TabOrder = 7
end

local StartDetect = createButton()
  FLtest.StartDetect.Left = 295
  FLtest.StartDetect.Height = 36
  FLtest.StartDetect.Top = 13
  FLtest.StartDetect.Width = 70
  FLtest.StartDetect.Caption = 'START'
  FLtest.StartDetect.Enabled = False
  FLtest.StartDetect.Font.Height = -16
  FLtest.StartDetect.Font.Name = 'Segoe UI'
  FLtest.StartDetect.Font.Style = [fsBold, fsItalic]
  FLtest.StartDetect.OnClick = UpdateInfo
  FLtest.StartDetect.ParentFont = False
  FLtest.StartDetect.TabOrder = 0
end

local CurrentLapLabel = createLabel()
  FLtest.CurrentLapLabel.Left = 10
  FLtest.CurrentLapLabel.Height = 30
  FLtest.CurrentLapLabel.Top = 58
  FLtest.CurrentLapLabel.Width = 121
  FLtest.CurrentLapLabel.Caption = 'Current Lap:'
  FLtest.CurrentLapLabel.Font.Color = clWindow
  FLtest.CurrentLapLabel.Font.Height = -21
  FLtest.CurrentLapLabel.Font.Name = 'Segoe UI'
  FLtest.CurrentLapLabel.Font.Style = [fsBold, fsItalic]
  FLtest.CurrentLapLabel.ParentColor = False
  FLtest.CurrentLapLabel.ParentFont = False
end

local FastestLapLabel = createLabel()
  FLtest.FastestLapLabel.Left = 10
  FLtest.FastestLapLabel.Height = 30
  FLtest.FastestLapLabel.Top = 94
  FLtest.FastestLapLabel.Width = 115
  FLtest.FastestLapLabel.Caption = 'Fastest Lap:'
  FLtest.FastestLapLabel.Font.Color = clFuchsia
  FLtest.FastestLapLabel.Font.Height = -21
  FLtest.FastestLapLabel.Font.Name = 'Segoe UI'
  FLtest.FastestLapLabel.Font.Style = [fsBold, fsItalic]
  FLtest.FastestLapLabel.ParentColor = False
  FLtest.FastestLapLabel.ParentFont = False
end

local CL2 = createLabel()
  FLtest.CL2.Left = 380
  FLtest.CL2.Height = 25
  FLtest.CL2.Top = 86
  FLtest.CL2.Width = 26
  FLtest.CL2.Caption = 'S1:'
  FLtest.CL2.Font.Color = clWindow
  FLtest.CL2.Font.Height = -19
  FLtest.CL2.Font.Name = 'Segoe UI'
  FLtest.CL2.Font.Style = [fsBold, fsItalic]
  FLtest.CL2.ParentColor = False
  FLtest.CL2.ParentFont = False
end

local CL3 = createLabel()
  FLtest.CL3.Left = 380
  FLtest.CL3.Height = 25
  FLtest.CL3.Top = 118
  FLtest.CL3.Width = 26
  FLtest.CL3.Caption = 'S2:'
  FLtest.CL3.Font.Color = clWindow
  FLtest.CL3.Font.Height = -19
  FLtest.CL3.Font.Name = 'Segoe UI'
  FLtest.CL3.Font.Style = [fsBold, fsItalic]
  FLtest.CL3.ParentColor = False
  FLtest.CL3.ParentFont = False
end

local CL4 = createLabel()
  FLtest.CL4.Left = 380
  FLtest.CL4.Height = 25
  FLtest.CL4.Top = 150
  FLtest.CL4.Width = 26
  FLtest.CL4.Caption = 'S3:'
  FLtest.CL4.Font.Color = clWindow
  FLtest.CL4.Font.Height = -19
  FLtest.CL4.Font.Name = 'Segoe UI'
  FLtest.CL4.Font.Style = [fsBold, fsItalic]
  FLtest.CL4.ParentColor = False
  FLtest.CL4.ParentFont = False
end

local LapProgress = createProgressBar()
  FLtest.LapProgress.Left = 0
  FLtest.LapProgress.Height = 10
  FLtest.LapProgress.Top = 202
  FLtest.LapProgress.Width = 500
  FLtest.LapProgress.Position = 50
  FLtest.LapProgress.TabOrder = 1
end

local CurrentLapValue = createLabel()
  FLtest.CurrentLapValue.Left = 144
  FLtest.CurrentLapValue.Height = 30
  FLtest.CurrentLapValue.Top = 58
  FLtest.CurrentLapValue.Width = 84
  FLtest.CurrentLapValue.Caption = '0:0.000'
  FLtest.CurrentLapValue.Font.Color = clWindow
  FLtest.CurrentLapValue.Font.Height = -21
  FLtest.CurrentLapValue.Font.Name = 'Segoe UI'
  FLtest.CurrentLapValue.Font.Style = [fsBold, fsItalic]
  FLtest.CurrentLapValue.ParentColor = False
  FLtest.CurrentLapValue.ParentFont = False
end

local FastestLapValue = createLabel()
  FLtest.FastestLapValue.Left = 144
  FLtest.FastestLapValue.Height = 30
  FLtest.FastestLapValue.Top = 94
  FLtest.FastestLapValue.Width = 108
  FLtest.FastestLapValue.Caption = '166:40.000'
  FLtest.FastestLapValue.Font.Color = clFuchsia
  FLtest.FastestLapValue.Font.Height = -21
  FLtest.FastestLapValue.Font.Name = 'Segoe UI'
  FLtest.FastestLapValue.Font.Style = [fsBold, fsItalic]
  FLtest.FastestLapValue.ParentColor = False
  FLtest.FastestLapValue.ParentFont = False
end

local S1Label = createLabel()
  FLtest.S1Label.Left = 420
  FLtest.S1Label.Height = 25
  FLtest.S1Label.Top = 86
  FLtest.S1Label.Width = 38
  FLtest.S1Label.Caption = '0.00'
  FLtest.S1Label.Font.Color = clWindow
  FLtest.S1Label.Font.Height = -19
  FLtest.S1Label.Font.Name = 'Segoe UI'
  FLtest.S1Label.Font.Style = [fsBold, fsItalic]
  FLtest.S1Label.ParentColor = False
  FLtest.S1Label.ParentFont = False
end

local S2Label = createLabel()
  FLtest.S2Label.Left = 420
  FLtest.S2Label.Height = 25
  FLtest.S2Label.Top = 118
  FLtest.S2Label.Width = 38
  FLtest.S2Label.Caption = '0.00'
  FLtest.S2Label.Font.Color = clWindow
  FLtest.S2Label.Font.Height = -19
  FLtest.S2Label.Font.Name = 'Segoe UI'
  FLtest.S2Label.Font.Style = [fsBold, fsItalic]
  FLtest.S2Label.ParentColor = False
  FLtest.S2Label.ParentFont = False
end

local S3Label = createLabel()
  FLtest.S3Label.Left = 420
  FLtest.S3Label.Height = 25
  FLtest.S3Label.Top = 150
  FLtest.S3Label.Width = 38
  FLtest.S3Label.Caption = '0.00'
  FLtest.S3Label.Font.Color = clWindow
  FLtest.S3Label.Font.Height = -19
  FLtest.S3Label.Font.Name = 'Segoe UI'
  FLtest.S3Label.Font.Style = [fsBold, fsItalic]
  FLtest.S3Label.ParentColor = False
  FLtest.S3Label.ParentFont = False
end

local DeltaLabel = createLabel()
  FLtest.DeltaLabel.Left = 186
  FLtest.DeltaLabel.Height = 45
  FLtest.DeltaLabel.Top = 134
  FLtest.DeltaLabel.Width = 113
  FLtest.DeltaLabel.Caption = '+ 9.999'
  FLtest.DeltaLabel.Font.Color = clWindow
  FLtest.DeltaLabel.Font.Height = -32
  FLtest.DeltaLabel.Font.Name = 'Segoe UI'
  FLtest.DeltaLabel.Font.Style = [fsBold, fsItalic]
  FLtest.DeltaLabel.ParentColor = False
  FLtest.DeltaLabel.ParentFont = False
end

local S1ProggressBar = createLabel()
  FLtest.S1ProggressBar.Left = 145
  FLtest.S1ProggressBar.Height = 17
  FLtest.S1ProggressBar.Top = 183
  FLtest.S1ProggressBar.Width = 37
  FLtest.S1ProggressBar.Caption = 'S1 | S2'
  FLtest.S1ProggressBar.Font.Color = clMenuBar
  FLtest.S1ProggressBar.Font.Height = -13
  FLtest.S1ProggressBar.Font.Name = 'Segoe UI'
  FLtest.S1ProggressBar.Font.Style = [fsItalic]
  FLtest.S1ProggressBar.ParentColor = False
  FLtest.S1ProggressBar.ParentFont = False
end

local S1ProggressBar1 = createLabel()
  FLtest.S1ProggressBar1.Left = 310
  FLtest.S1ProggressBar1.Height = 17
  FLtest.S1ProggressBar1.Top = 183
  FLtest.S1ProggressBar1.Width = 37
  FLtest.S1ProggressBar1.Caption = 'S2 | S3'
  FLtest.S1ProggressBar1.Font.Color = clMenuBar
  FLtest.S1ProggressBar1.Font.Height = -13
  FLtest.S1ProggressBar1.Font.Name = 'Segoe UI'
  FLtest.S1ProggressBar1.Font.Style = [fsItalic]
  FLtest.S1ProggressBar1.ParentColor = False
  FLtest.S1ProggressBar1.ParentFont = False
end

local SectorsCurrent = createLabel()
  FLtest.SectorsCurrent.Left = 386
  FLtest.SectorsCurrent.Height = 21
  FLtest.SectorsCurrent.Top = 61
  FLtest.SectorsCurrent.Width = 88
  FLtest.SectorsCurrent.Caption = 'Current lap:'
  FLtest.SectorsCurrent.Font.Color = clMenuBar
  FLtest.SectorsCurrent.Font.Height = -16
  FLtest.SectorsCurrent.Font.Name = 'Segoe UI'
  FLtest.SectorsCurrent.Font.Style = [fsBold, fsItalic]
  FLtest.SectorsCurrent.ParentColor = False
  FLtest.SectorsCurrent.ParentFont = False
end

local BestSectors = createLabel()
  FLtest.BestSectors.Left = 401
  FLtest.BestSectors.Height = 17
  FLtest.BestSectors.Top = 13
  FLtest.BestSectors.Width = 57
  FLtest.BestSectors.Caption = 'Best Lap:'
  FLtest.BestSectors.Font.Color = clMenuBar
  FLtest.BestSectors.Font.Height = -13
  FLtest.BestSectors.Font.Name = 'Segoe UI'
  FLtest.BestSectors.Font.Style = [fsBold, fsItalic]
  FLtest.BestSectors.ParentColor = False
  FLtest.BestSectors.ParentFont = False
  FLtest.BestSectors.Visible = False
end

local CEButton1 = createButton()
  FLtest.CEButton1.Left = 413
  FLtest.CEButton1.Height = 36
  FLtest.CEButton1.Top = 83
  FLtest.CEButton1.Width = 48
  FLtest.CEButton1.Caption = 'CEButton1'
  FLtest.CEButton1.Enabled = False
  FLtest.CEButton1.OnClick = Debuug
  FLtest.CEButton1.TabOrder = 3
  FLtest.CEButton1.Visible = False
end

local LogBuildingButton = createButton()
  FLtest.LogBuildingButton.Left = 10
  FLtest.LogBuildingButton.Height = 36
  FLtest.LogBuildingButton.Top = 13
  FLtest.LogBuildingButton.Width = 90
  FLtest.LogBuildingButton.Caption = 'LOGS OFF'
  FLtest.LogBuildingButton.Enabled = False
  FLtest.LogBuildingButton.Font.Height = -16
  FLtest.LogBuildingButton.Font.Name = 'Segoe UI'
  FLtest.LogBuildingButton.Font.Style = [fsBold, fsItalic]
  FLtest.LogBuildingButton.OnClick = LogsSwitcher
  FLtest.LogBuildingButton.ParentFont = False
  FLtest.LogBuildingButton.TabOrder = 4
end

local LoadFLButton = createButton()
  FLtest.LoadFLButton.Left = 105
  FLtest.LoadFLButton.Height = 36
  FLtest.LoadFLButton.Top = 13
  FLtest.LoadFLButton.Width = 90
  FLtest.LoadFLButton.Caption = 'LOAD LAP'
  FLtest.LoadFLButton.Enabled = False
  FLtest.LoadFLButton.Font.Height = -16
  FLtest.LoadFLButton.Font.Name = 'Segoe UI'
  FLtest.LoadFLButton.Font.Style = [fsBold, fsItalic]
  FLtest.LoadFLButton.OnClick = LoadFastLap
  FLtest.LoadFLButton.ParentFont = False
  FLtest.LoadFLButton.TabOrder = 5
end

local SaveFLButton = createButton()
  FLtest.SaveFLButton.Left = 200
  FLtest.SaveFLButton.Height = 36
  FLtest.SaveFLButton.Top = 13
  FLtest.SaveFLButton.Width = 90
  FLtest.SaveFLButton.Caption = 'SAVE LAP'
  FLtest.SaveFLButton.Enabled = False
  FLtest.SaveFLButton.Font.Height = -16
  FLtest.SaveFLButton.Font.Name = 'Segoe UI'
  FLtest.SaveFLButton.Font.Style = [fsBold, fsItalic]
  FLtest.SaveFLButton.OnClick = SaveFastLap
  FLtest.SaveFLButton.OnMouseEnter = ShowTime
  FLtest.SaveFLButton.OnMouseLeave = RevertCaption
  FLtest.SaveFLButton.ParentFont = False
  FLtest.SaveFLButton.TabOrder = 6
end

local SettingPanel = createPanel()
  FLtest.SettingPanel.Left = 375
  FLtest.SettingPanel.Height = 130
  FLtest.SettingPanel.Top = 50
  FLtest.SettingPanel.Width = 110
  FLtest.SettingPanel.BevelColor = clBackground
  FLtest.SettingPanel.BevelWidth = 2
  FLtest.SettingPanel.ClientHeight = 130
  FLtest.SettingPanel.ClientWidth = 110
  FLtest.SettingPanel.TabOrder = 8
  FLtest.SettingPanel.Visible = False
end

local SpeedTurnOn = createButton()
  FLtest.SpeedTurnOn.Left = 5
  FLtest.SpeedTurnOn.Height = 30
  FLtest.SpeedTurnOn.Top = 5
  FLtest.SpeedTurnOn.Width = 100
  FLtest.SpeedTurnOn.Caption = 'SPEED: ON'
  FLtest.SpeedTurnOn.Font.Name = 'Segoe UI'
  FLtest.SpeedTurnOn.Font.Style = [fsBold, fsItalic]
  FLtest.SpeedTurnOn.OnClick = ChangeSpeed
  FLtest.SpeedTurnOn.ParentFont = False
  FLtest.SpeedTurnOn.TabOrder = 0
end
local MetricsTurnOn = createButton()
  FLtest.MetricsTurnOn.Left = 5
  FLtest.MetricsTurnOn.Height = 30
  FLtest.MetricsTurnOn.Top = 35
  FLtest.MetricsTurnOn.Width = 100
  FLtest.MetricsTurnOn.Caption = 'SPEED: KPH'
  FLtest.MetricsTurnOn.Font.Name = 'Segoe UI'
  FLtest.MetricsTurnOn.Font.Style = [fsBold, fsItalic]
  FLtest.MetricsTurnOn.OnClick = ChangeMetrics
  FLtest.MetricsTurnOn.ParentFont = False
  FLtest.MetricsTurnOn.TabOrder = 1
end

local GearsTurnOn = createButton()
  FLtest.GearsTurnOn.Left = 5
  FLtest.GearsTurnOn.Height = 30
  FLtest.GearsTurnOn.Top = 65
  FLtest.GearsTurnOn.Width = 100
  FLtest.GearsTurnOn.Caption = 'GEARS: ON'
  FLtest.GearsTurnOn.Font.Name = 'Segoe UI'
  FLtest.GearsTurnOn.Font.Style = [fsBold, fsItalic]
  FLtest.GearsTurnOn.OnClick = ChangeGears
  FLtest.GearsTurnOn.ParentFont = False
  FLtest.GearsTurnOn.TabOrder = 2
end

local InputsTurnOn = createButton()
  FLtest.InputsTurnOn.Left = 5
  FLtest.InputsTurnOn.Height = 30
  FLtest.InputsTurnOn.Top = 95
  FLtest.InputsTurnOn.Width = 100
  FLtest.InputsTurnOn.Caption = 'INPUT: ON'
  FLtest.InputsTurnOn.Font.Name = 'Segoe UI'
  FLtest.InputsTurnOn.Font.Style = [fsBold, fsItalic]
  FLtest.InputsTurnOn.OnClick = ChangeInputs
  FLtest.InputsTurnOn.ParentFont = False
  FLtest.InputsTurnOn.TabOrder = 3
end

local SpeedLabel = createLabel()
  FLtest.SpeedLabel.Left = 24
  FLtest.SpeedLabel.Height = 30
  FLtest.SpeedLabel.Top = 166
  FLtest.SpeedLabel.Width = 81
  FLtest.SpeedLabel.Caption = 'Kph: 0.0'
  FLtest.SpeedLabel.Font.Color = clWindow
  FLtest.SpeedLabel.Font.Height = -21
  FLtest.SpeedLabel.Font.Name = 'Segoe UI'
  FLtest.SpeedLabel.Font.Style = [fsBold, fsItalic]
  FLtest.SpeedLabel.ParentColor = False
  FLtest.SpeedLabel.ParentFont = False
end

local GearLabel = createLabel()
  FLtest.GearLabel.Left = 40
  FLtest.GearLabel.Height = 42
  FLtest.GearLabel.Top = 126
  FLtest.GearLabel.Width = 80
  FLtest.GearLabel.Alignment = taCenter
  FLtest.GearLabel.AutoSize = False
  FLtest.GearLabel.Caption = 'N'
  FLtest.GearLabel.Font.Color = clWindow
  FLtest.GearLabel.Font.Height = -32
  FLtest.GearLabel.Font.Name = 'Segoe UI'
  FLtest.GearLabel.Font.Style = [fsBold, fsItalic, fsUnderline]
  FLtest.GearLabel.ParentColor = False
  FLtest.GearLabel.ParentFont = False
end

local RPM1 = createLabel()
  FLtest.RPM1.Left = 47
  FLtest.RPM1.Height = 65
  FLtest.RPM1.Top = 113
  FLtest.RPM1.Width = 67
  FLtest.RPM1.Caption = '∙   ∙'
  FLtest.RPM1.Font.Color = clLime
  FLtest.RPM1.Font.Height = -48
  FLtest.RPM1.Font.Name = 'Segoe UI'
  FLtest.RPM1.Font.Style = [fsBold, fsItalic]
  FLtest.RPM1.ParentColor = False
  FLtest.RPM1.ParentFont = False
  FLtest.RPM1.Visible = False
end

local RPM2 = createLabel()
  FLtest.RPM2.Left = 34
  FLtest.RPM2.Height = 65
  FLtest.RPM2.Top = 113
  FLtest.RPM2.Width = 93
  FLtest.RPM2.Caption = '∙     ∙'
  FLtest.RPM2.Font.Color = clYellow
  FLtest.RPM2.Font.Height = -48
  FLtest.RPM2.Font.Name = 'Segoe UI'
  FLtest.RPM2.Font.Style = [fsBold, fsItalic]
  FLtest.RPM2.ParentColor = False
  FLtest.RPM2.ParentFont = False
  FLtest.RPM2.Visible = False
end

local RPM3 = createLabel()
  FLtest.RPM3.Left = 20
  FLtest.RPM3.Height = 65
  FLtest.RPM3.Top = 113
  FLtest.RPM3.Width = 119
  FLtest.RPM3.Caption = '∙       ∙'
  FLtest.RPM3.Font.Color = clRed
  FLtest.RPM3.Font.Height = -48
  FLtest.RPM3.Font.Name = 'Segoe UI'
  FLtest.RPM3.Font.Style = [fsBold, fsItalic]
  FLtest.RPM3.ParentColor = False
  FLtest.RPM3.ParentFont = False
  FLtest.RPM3.Visible = False
end
local RPM4 = createLabel()
  FLtest.RPM4.Left = 8
  FLtest.RPM4.Height = 65
  FLtest.RPM4.Top = 113
  FLtest.RPM4.Width = 145
  FLtest.RPM4.Caption = '∙         ∙'
  FLtest.RPM4.Font.Color = clBlue
  FLtest.RPM4.Font.Height = -48
  FLtest.RPM4.Font.Name = 'Segoe UI'
  FLtest.RPM4.Font.Style = [fsBold, fsItalic]
  FLtest.RPM4.ParentColor = False
  FLtest.RPM4.ParentFont = False
  FLtest.RPM4.Visible = False
end
local Steer = createTrackBar()
  FLtest.Steer.Left = 255
  FLtest.Steer.Height = 20
  FLtest.Steer.Top = 110
  FLtest.Steer.Width = 110
  FLtest.Steer.LineSize = 50
  FLtest.Steer.Max = 100
  FLtest.Steer.PageSize = 0
  FLtest.Steer.Position = 50
  FLtest.Steer.ScalePos = trBottom
  FLtest.Steer.ShowSelRange = False
  FLtest.Steer.DragMode = dmAutomatic
  FLtest.Steer.Font.Color = clNone
  FLtest.Steer.ParentFont = False
  FLtest.Steer.TabOrder = 9
end

local Gas = createLabel()
  FLtest.Gas.Left = 316
  FLtest.Gas.Height = 30
  FLtest.Gas.Top = 78
  FLtest.Gas.Width = 13
  FLtest.Gas.Caption = '0'
  FLtest.Gas.Font.Color = clLime
  FLtest.Gas.Font.Height = -22
  FLtest.Gas.Font.Name = 'Segoe UI'
  FLtest.Gas.Font.Style = [fsBold, fsItalic]
  FLtest.Gas.ParentColor = False
  FLtest.Gas.ParentFont = False
end

local Brake = createLabel()
  FLtest.Brake.Left = 264
  FLtest.Brake.Height = 30
  FLtest.Brake.Top = 78
  FLtest.Brake.Width = 13
  FLtest.Brake.Caption = '0'
  FLtest.Brake.Font.Color = clRed
  FLtest.Brake.Font.Height = -22
  FLtest.Brake.Font.Name = 'Segoe UI'
  FLtest.Brake.Font.Style = [fsBold, fsItalic]
  FLtest.Brake.ParentColor = False
  FLtest.Brake.ParentFont = False
end

local InitPanel = createPanel()
  FLtest.InitPanel.Left = -2
  FLtest.InitPanel.Height = 217
  FLtest.InitPanel.Top = -2
  FLtest.InitPanel.Width = 503
  FLtest.InitPanel.ClientHeight = 217
  FLtest.InitPanel.ClientWidth = 503
  FLtest.InitPanel.Color = clGrayText
  FLtest.InitPanel.DoubleBuffered = True
  FLtest.InitPanel.Font.CharSet = ANSI_CHARSET
  FLtest.InitPanel.Font.Color = clWhite
  FLtest.InitPanel.Font.Height = -16
  FLtest.InitPanel.Font.Pitch = fpVariable
  FLtest.InitPanel.Font.Quality = fqDraft
  FLtest.InitPanel.ParentColor = False
  FLtest.InitPanel.ParentDoubleBuffered = False
  FLtest.InitPanel.ParentFont = False
  FLtest.InitPanel.TabOrder = 2
end

local OnOffButtonLabel = createLabel()
  FLtest.OnOffButtonLabel.Left = 76
  FLtest.OnOffButtonLabel.Height = 100
  FLtest.OnOffButtonLabel.Top = 102
  FLtest.OnOffButtonLabel.Width = 347
  FLtest.OnOffButtonLabel.Caption = '-Enable only after u spawned on track '#13#10'and crossed the 1st checkpoint'#13#10'-Any errors or issues report via Discord PM'#13#10'@vi.o.lence or @mrtino.'
  FLtest.OnOffButtonLabel.Font.Color = clWindow
  FLtest.OnOffButtonLabel.Font.Height = -19
  FLtest.OnOffButtonLabel.Font.Name = 'Segoe UI'
  FLtest.OnOffButtonLabel.Font.Style = [fsItalic, fsUnderline]
  FLtest.OnOffButtonLabel.ParentColor = False
  FLtest.OnOffButtonLabel.ParentFont = False
end

local Enable = createButton()
  FLtest.Enable.Left = 150
  FLtest.Enable.Height = 40
  FLtest.Enable.Top = 51
  FLtest.Enable.Width = 200
  FLtest.Enable.Caption = 'Enable'
  FLtest.Enable.Font.CharSet = ANSI_CHARSET
  FLtest.Enable.Font.Height = -16
  FLtest.Enable.Font.Name = 'Segoe UI'
  FLtest.Enable.Font.Pitch = fpVariable
  FLtest.Enable.Font.Quality = fqDraft
  FLtest.Enable.Font.Style = [fsBold]
  FLtest.Enable.OnClick = Startup
  FLtest.Enable.ParentFont = False
  FLtest.Enable.TabOrder = 0
end

-- local SCversionlabel = createLabel()
--   Left = 280
--   Height = 21
--   Top = 20
--   Width = 19
--   Caption = 'SC'
--   Font.Color = clWindow
--   Font.Height = -16
--   Font.Name = 'Segoe UI'
--   Font.Style = [fsBold]
--   ParentColor = False
--   ParentFont = False
--   Visible = False
-- end
-- local NonSteamVersion: TRadioButton
--   Left = 261
--   Height = 19
--   Top = 22
--   Width = 20
--   AutoSize = False
--   Color = clWindow
--   Font.Height = -19
--   Font.Name = 'Arial'
--   Font.Style = [fsBold, fsItalic]
--   ParentColor = False
--   ParentFont = False
--   TabOrder = 1
--   TabStop = True
--   Visible = False
-- end
-- local SteamLabel = createLabel()
--   Left = 204
--   Height = 21
--   Top = 20
--   Width = 48
--   Caption = 'Steam'
--   Font.Color = clWindow
--   Font.Height = -16
--   Font.Name = 'Segoe UI'
--   Font.Style = [fsBold]
--   ParentColor = False
--   ParentFont = False
--   Visible = False
-- end
-- local SteamVersion: TRadioButton
--   Left = 185
--   Height = 19
--   Top = 22
--   Width = 20
--   AutoSize = False
--   Checked = True
--   Color = clWindow
--   Font.Height = -19
--   Font.Name = 'Arial'
--   Font.Style = [fsBold, fsItalic]
--   ParentColor = False
--   ParentFont = False
--   TabOrder = 2
--   TabStop = True
--   Visible = False
-- end

local KersValue = createLabel()
  FLtest.KersValue.Left = 357
  FLtest.KersValue.Height = 25
  FLtest.KersValue.Top = 174
  FLtest.KersValue.Width = 33
  FLtest.KersValue.Caption = '100'
  FLtest.KersValue.Font.CharSet = ANSI_CHARSET
  FLtest.KersValue.Font.Color = clYellow
  FLtest.KersValue.Font.Height = -19
  FLtest.KersValue.Font.Pitch = fpVariable
  FLtest.KersValue.Font.Quality = fqDraft
  FLtest.KersValue.Font.Style = [fsBold, fsItalic]
  FLtest.KersValue.ParentColor = False
  FLtest.KersValue.ParentFont = False
end

local PitDeltaValue = createLabel()
  FLtest.PitDeltaValue.Left = 144
  FLtest.PitDeltaValue.Height = 30
  FLtest.PitDeltaValue.Top = 58
  FLtest.PitDeltaValue.Width = 84
  FLtest.PitDeltaValue.Caption = '0:0.000'
  FLtest.PitDeltaValue.Font.CharSet = ANSI_CHARSET
  FLtest.PitDeltaValue.Font.Color = clWhite
  FLtest.PitDeltaValue.Font.Height = -21
  FLtest.PitDeltaValue.Font.Name = 'Segoe UI'
  FLtest.PitDeltaValue.Font.Pitch = fpVariable
  FLtest.PitDeltaValue.Font.Quality = fqDraft
  FLtest.PitDeltaValue.Font.Style = [fsBold, fsItalic]
  FLtest.PitDeltaValue.ParentColor = False
  FLtest.PitDeltaValue.ParentFont = False
  FLtest.PitDeltaValue.Visible = False
end
