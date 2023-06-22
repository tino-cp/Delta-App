function createUI()
  UI = createForm()
    UI.Left = -1047
    UI.Height = 214
    UI.Top = 705
    UI.Width = 500
    UI.ActiveControl = Steer
    UI.BorderStyle = bsSingle
    UI.Caption = "DeltaApp by Vi'o'Lence 13" 
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


  KersValueBar = createProgressBar()
    KersValueBar.Left = 393
    KersValueBar.Height = 16
    KersValueBar.Top = 179
    KersValueBar.Width = 100
    KersValueBar.BorderWidth = 1
    KersValueBar.Position = 100
    KersValueBar.TabOrder = 10


  SettingButton = createButton(UI)
    SettingButton.Left = 387
    SettingButton.Height = 36
    SettingButton.Top = 13
    SettingButton.Width = 90
    SettingButton.Caption = 'SETTINGS'
    SettingButton.Font.Height = -16
    SettingButton.Font.Name = 'Segoe UI'
    SettingButton.Font.fsBold = true
    SettingButton.Font.fsItalic = true
    SettingButton.OnClick = ShowHideSettings
    SettingButton.ParentFont = false
    SettingButton.TabOrder = 7


  StartDetect = createButton(UI)
    StartDetect.Left = 295
    StartDetect.Height = 36
    StartDetect.Top = 13
    StartDetect.Width = 70
    StartDetect.Caption = 'START'
    StartDetect.Enabled = false
    StartDetect.Font.Height = -16
    StartDetect.Font.Name = 'Segoe UI'
    StartDetect.Font.fsBold = true
    StartDetect.Font.fsItalic = true
    StartDetect.OnClick = UpdateInfo
    StartDetect.ParentFont = false
    StartDetect.TabOrder = 0


  CurrentLapLabel = createLabel(UI)
    CurrentLapLabel.Left = 10
    CurrentLapLabel.Height = 30
    CurrentLapLabel.Top = 58
    CurrentLapLabel.Width = 121
    CurrentLapLabel.Caption = 'Current Lap:'
    CurrentLapLabel.Font.Color = clWindow
    CurrentLapLabel.Font.Height = -21
    CurrentLapLabel.Font.Name = 'Segoe UI'
    CurrentLapLabel.Font.fsBold = true
    CurrentLapLabel.Font.fsItalic = true
    CurrentLapLabel.ParentColor = false
    CurrentLapLabel.ParentFont = false


  FastestLapLabel = createLabel(UI)
    FastestLapLabel.Left = 10
    FastestLapLabel.Height = 30
    FastestLapLabel.Top = 94
    FastestLapLabel.Width = 115
    FastestLapLabel.Caption = 'Fastest Lap:'
    FastestLapLabel.Font.Color = clFuchsia
    FastestLapLabel.Font.Height = -21
    FastestLapLabel.Font.Name = 'Segoe UI'
    FastestLapLabel.Font.fsBold = true
    FastestLapLabel.Font.fsItalic = true
    FastestLapLabel.ParentColor = false
    FastestLapLabel.ParentFont = false


  CL2 = createLabel(UI)
    CL2.Left = 380
    CL2.Height = 25
    CL2.Top = 86
    CL2.Width = 26
    CL2.Caption = 'S1:'
    CL2.Font.Color = clWindow
    CL2.Font.Height = -19
    CL2.Font.Name = 'Segoe UI'
    CL2.Font.fsBold = true
    CL2.Font.fsItalic = true
    CL2.ParentColor = false
    CL2.ParentFont = false


  CL3 = createLabel(UI)
    CL3.Left = 380
    CL3.Height = 25
    CL3.Top = 118
    CL3.Width = 26
    CL3.Caption = 'S2:'
    CL3.Font.Color = clWindow
    CL3.Font.Height = -19
    CL3.Font.Name = 'Segoe UI'
    CL3.Font.fsBold = true
    CL3.Font.fsItalic = true
    CL3.ParentColor = false
    CL3.ParentFont = false


  CL4 = createLabel(UI)
    CL4.Left = 380
    CL4.Height = 25
    CL4.Top = 150
    CL4.Width = 26
    CL4.Caption = 'S3:'
    CL4.Font.Color = clWindow
    CL4.Font.Height = -19
    CL4.Font.Name = 'Segoe UI'
    CL4.Font.fsBold = true
    CL4.Font.fsItalic = true
    CL4.ParentColor = false
    CL4.ParentFont = false


  LapProgress = createProgressBar()
    LapProgress.Left = 0
    LapProgress.Height = 10
    LapProgress.Top = 202
    LapProgress.Width = 500
    LapProgress.Position = 50
    LapProgress.TabOrder = 1


  CurrentLapValue = createLabel(UI)
    CurrentLapValue.Left = 144
    CurrentLapValue.Height = 30
    CurrentLapValue.Top = 58
    CurrentLapValue.Width = 84
    CurrentLapValue.Caption = '0:0.000'
    CurrentLapValue.Font.Color = clWindow
    CurrentLapValue.Font.Height = -21
    CurrentLapValue.Font.Name = 'Segoe UI'
    CurrentLapValue.Font.fsBold = true
    CurrentLapValue.Font.fsItalic = true
    CurrentLapValue.ParentColor = false
    CurrentLapValue.ParentFont = false


  FastestLapValue = createLabel(UI)
    FastestLapValue.Left = 144
    FastestLapValue.Height = 30
    FastestLapValue.Top = 94
    FastestLapValue.Width = 108
    FastestLapValue.Caption = '166:40.000'
    FastestLapValue.Font.Color = clFuchsia
    FastestLapValue.Font.Height = -21
    FastestLapValue.Font.Name = 'Segoe UI'
    FastestLapValue.Font.fsBold = true
    FastestLapValue.Font.fsItalic = true
    FastestLapValue.ParentColor = false
    FastestLapValue.ParentFont = false


  S1Label = createLabel(UI)
    S1Label.Left = 420
    S1Label.Height = 25
    S1Label.Top = 86
    S1Label.Width = 38
    S1Label.Caption = '0.00'
    S1Label.Font.Color = clWindow
    S1Label.Font.Height = -19
    S1Label.Font.Name = 'Segoe UI'
    S1Label.Font.fsBold = true
    S1Label.Font.fsItalic = true
    S1Label.ParentColor = false
    S1Label.ParentFont = false


  S2Label = createLabel(UI)
    S2Label.Left = 420
    S2Label.Height = 25
    S2Label.Top = 118
    S2Label.Width = 38
    S2Label.Caption = '0.00'
    S2Label.Font.Color = clWindow
    S2Label.Font.Height = -19
    S2Label.Font.Name = 'Segoe UI'
    S2Label.Font.fsBold = true
    S2Label.Font.fsItalic = true
    S2Label.ParentColor = false
    S2Label.ParentFont = false


  S3Label = createLabel(UI)
    S3Label.Left = 420
    S3Label.Height = 25
    S3Label.Top = 150
    S3Label.Width = 38
    S3Label.Caption = '0.00'
    S3Label.Font.Color = clWindow
    S3Label.Font.Height = -19
    S3Label.Font.Name = 'Segoe UI'
    S3Label.Font.fsBold = true
    S3Label.Font.fsItalic = true
    S3Label.ParentColor = false
    S3Label.ParentFont = false


  DeltaLabel = createLabel(UI)
    DeltaLabel.Left = 186
    DeltaLabel.Height = 45
    DeltaLabel.Top = 134
    DeltaLabel.Width = 113
    DeltaLabel.Caption = '+ 9.999'
    DeltaLabel.Font.Color = clWindow
    DeltaLabel.Font.Height = -32
    DeltaLabel.Font.Name = 'Segoe UI'
    DeltaLabel.Font.fsBold = true
    DeltaLabel.Font.fsItalic = true
    DeltaLabel.ParentColor = false
    DeltaLabel.ParentFont = false


  S1ProggressBar = createLabel(UI)
    S1ProggressBar.Left = 145
    S1ProggressBar.Height = 17
    S1ProggressBar.Top = 183
    S1ProggressBar.Width = 37
    S1ProggressBar.Caption = 'S1 | S2'
    S1ProggressBar.Font.Color = clMenuBar
    S1ProggressBar.Font.Height = -13
    S1ProggressBar.Font.Name = 'Segoe UI'
    S1ProggressBar.Font.fsItalic = true
    S1ProggressBar.ParentColor = false
    S1ProggressBar.ParentFont = false


  S1ProggressBar1 = createLabel(UI)
    S1ProggressBar1.Left = 310
    S1ProggressBar1.Height = 17
    S1ProggressBar1.Top = 183
    S1ProggressBar1.Width = 37
    S1ProggressBar1.Caption = 'S2 | S3'
    S1ProggressBar1.Font.Color = clMenuBar
    S1ProggressBar1.Font.Height = -13
    S1ProggressBar1.Font.Name = 'Segoe UI'
    S1ProggressBar1.Font.fsItalic = true
    S1ProggressBar1.ParentColor = false
    S1ProggressBar1.ParentFont = false


  SectorsCurrent = createLabel(UI)
    SectorsCurrent.Left = 386
    SectorsCurrent.Height = 21
    SectorsCurrent.Top = 61
    SectorsCurrent.Width = 88
    SectorsCurrent.Caption = 'Current lap:'
    SectorsCurrent.Font.Color = clMenuBar
    SectorsCurrent.Font.Height = -16
    SectorsCurrent.Font.Name = 'Segoe UI'
    SectorsCurrent.Font.fsBold = true
    SectorsCurrent.Font.fsItalic = true
    SectorsCurrent.ParentColor = false
    SectorsCurrent.ParentFont = false


  BestSectors = createLabel(UI)
    BestSectors.Left = 401
    BestSectors.Height = 17
    BestSectors.Top = 13
    BestSectors.Width = 57
    BestSectors.Caption = 'Best Lap:'
    BestSectors.Font.Color = clMenuBar
    BestSectors.Font.Height = -13
    BestSectors.Font.Name = 'Segoe UI'
    BestSectors.Font.fsBold = true
    BestSectors.Font.fsItalic = true
    BestSectors.ParentColor = false
    BestSectors.ParentFont = false
    BestSectors.Visible = false

  LogBuildingButton = createButton(UI)
    LogBuildingButton.Left = 10
    LogBuildingButton.Height = 36
    LogBuildingButton.Top = 13
    LogBuildingButton.Width = 90
    LogBuildingButton.Caption = 'LOGS OFF'
    LogBuildingButton.Enabled = false
    LogBuildingButton.Font.Height = -16
    LogBuildingButton.Font.Name = 'Segoe UI'
    LogBuildingButton.Font.fsBold = true
    LogBuildingButton.Font.fsItalic = true
    LogBuildingButton.OnClick = LogsSwitcher
    LogBuildingButton.ParentFont = false
    LogBuildingButton.TabOrder = 4


  LoadFLButton = createButton(UI)
    LoadFLButton.Left = 105
    LoadFLButton.Height = 36
    LoadFLButton.Top = 13
    LoadFLButton.Width = 90
    LoadFLButton.Caption = 'LOAD LAP'
    LoadFLButton.Enabled = false
    LoadFLButton.Font.Height = -16
    LoadFLButton.Font.Name = 'Segoe UI'
    LoadFLButton.Font.fsBold = true
    LoadFLButton.Font.fsItalic = true
    LoadFLButton.OnClick = LoadFastLap
    LoadFLButton.ParentFont = false
    LoadFLButton.TabOrder = 5


  SaveFLButton = createButton(UI)
    SaveFLButton.Left = 200
    SaveFLButton.Height = 36
    SaveFLButton.Top = 13
    SaveFLButton.Width = 90
    SaveFLButton.Caption = 'SAVE LAP'
    SaveFLButton.Enabled = false
    SaveFLButton.Font.Height = -16
    SaveFLButton.Font.Name = 'Segoe UI'
    SaveFLButton.Font.fsBold = true
    SaveFLButton.Font.fsItalic = true
    SaveFLButton.OnClick = SaveFastLap
    SaveFLButton.OnMouseEnter = ShowTime
    SaveFLButton.OnMouseLeave = RevertCaption
    SaveFLButton.ParentFont = false
    SaveFLButton.TabOrder = 6


  SettingPanel = createPanel()
    SettingPanel.Left = 375
    SettingPanel.Height = 130
    SettingPanel.Top = 50
    SettingPanel.Width = 110
    SettingPanel.BevelColor = clBackground
    SettingPanel.BevelWidth = 2
    SettingPanel.ClientHeight = 130
    SettingPanel.ClientWidth = 110
    SettingPanel.TabOrder = 8
    SettingPanel.Visible = false


  SpeedTurnOn = createButton(UI)
    SpeedTurnOn.Left = 5
    SpeedTurnOn.Height = 30
    SpeedTurnOn.Top = 5
    SpeedTurnOn.Width = 100
    SpeedTurnOn.Caption = 'SPEED: ON'
    SpeedTurnOn.Font.Name = 'Segoe UI'
    SpeedTurnOn.Font.fsBold = true
    SpeedTurnOn.Font.fsItalic = true
    SpeedTurnOn.OnClick = ChangeSpeed
    SpeedTurnOn.ParentFont = false
    SpeedTurnOn.TabOrder = 0

  MetricsTurnOn = createButton(UI)
    MetricsTurnOn.Left = 5
    MetricsTurnOn.Height = 30
    MetricsTurnOn.Top = 35
    MetricsTurnOn.Width = 100
    MetricsTurnOn.Caption = 'SPEED: KPH'
    MetricsTurnOn.Font.Name = 'Segoe UI'
    MetricsTurnOn.Font.fsBold = true
    MetricsTurnOn.Font.fsItalic = true
    MetricsTurnOn.OnClick = ChangeMetrics
    MetricsTurnOn.ParentFont = false
    MetricsTurnOn.TabOrder = 1


  GearsTurnOn = createButton(UI)
    GearsTurnOn.Left = 5
    GearsTurnOn.Height = 30
    GearsTurnOn.Top = 65
    GearsTurnOn.Width = 100
    GearsTurnOn.Caption = 'GEARS: ON'
    GearsTurnOn.Font.Name = 'Segoe UI'
    GearsTurnOn.Font.fsBold = true
    GearsTurnOn.Font.fsItalic = true
    GearsTurnOn.OnClick = ChangeGears
    GearsTurnOn.ParentFont = false
    GearsTurnOn.TabOrder = 2


  InputsTurnOn = createButton(UI)
    InputsTurnOn.Left = 5
    InputsTurnOn.Height = 30
    InputsTurnOn.Top = 95
    InputsTurnOn.Width = 100
    InputsTurnOn.Caption = 'INPUT: ON'
    InputsTurnOn.Font.Name = 'Segoe UI'
    InputsTurnOn.Font.fsBold = true
    InputsTurnOn.Font.fsItalic = true
    InputsTurnOn.OnClick = ChangeInputs
    InputsTurnOn.ParentFont = false
    InputsTurnOn.TabOrder = 3

  KersValueTurnOn = createButton(UI)
    KersValueTurnOn.Left = 5
    KersValueTurnOn.Height = 30
    KersValueTurnOn.Top = 125
    KersValueTurnOn.Width = 100
    KersValueTurnOn.Caption = 'KERS: ON'
    KersValueTurnOn.Font.CharSet = ANSI_CHARSET
    KersValueTurnOn.Font.Color = clWhite
    KersValueTurnOn.Font.Pitch = fpVariable
    KersValueTurnOn.Font.Quality = fqDraft
    KersValueTurnOn.Font.fsBold = true
    KersValueTurnOn.Font.fsItalic = true
    KersValueTurnOn.OnClick = ChangeKers
    KersValueTurnOn.ParentFont = False
    KersValueTurnOn.TabOrder = 4

  SpeedLabel = createLabel(UI)
    SpeedLabel.Left = 24
    SpeedLabel.Height = 30
    SpeedLabel.Top = 166
    SpeedLabel.Width = 81
    SpeedLabel.Caption = 'Kph: 0.0'
    SpeedLabel.Font.Color = clWindow
    SpeedLabel.Font.Height = -21
    SpeedLabel.Font.Name = 'Segoe UI'
    SpeedLabel.Font.fsBold = true
    SpeedLabel.Font.fsItalic = true
    SpeedLabel.ParentColor = false
    SpeedLabel.ParentFont = false


  GearLabel = createLabel(UI)
    GearLabel.Left = 40
    GearLabel.Height = 42
    GearLabel.Top = 126
    GearLabel.Width = 80
    GearLabel.Alignment = taCenter
    GearLabel.AutoSize = false
    GearLabel.Caption = 'N'
    GearLabel.Font.Color = clWindow
    GearLabel.Font.Height = -32
    GearLabel.Font.Name = 'Segoe UI'
    GearLabel.Font.fsBold = true
    GearLabel.Font.fsItalic = true
    GearLabel.Font.fsUnderline = true
    GearLabel.ParentColor = false
    GearLabel.ParentFont = false


  RPM1 = createLabel(UI)
    RPM1.Left = 47
    RPM1.Height = 65
    RPM1.Top = 113
    RPM1.Width = 67
    RPM1.Caption = '∙   ∙'
    RPM1.Font.Color = clLime
    RPM1.Font.Height = -48
    RPM1.Font.Name = 'Segoe UI'
    RPM1.Font.fsBold = true
    RPM1.Font.fsItalic = true
    RPM1.ParentColor = false
    RPM1.ParentFont = false
    RPM1.Visible = false


  RPM2 = createLabel(UI)
    RPM2.Left = 34
    RPM2.Height = 65
    RPM2.Top = 113
    RPM2.Width = 93
    RPM2.Caption = '∙     ∙'
    RPM2.Font.Color = clYellow
    RPM2.Font.Height = -48
    RPM2.Font.Name = 'Segoe UI'
    RPM2.Font.fsBold = true
    RPM2.Font.fsItalic = true
    RPM2.ParentColor = false
    RPM2.ParentFont = false
    RPM2.Visible = false


  RPM3 = createLabel(UI)
    RPM3.Left = 20
    RPM3.Height = 65
    RPM3.Top = 113
    RPM3.Width = 119
    RPM3.Caption = '∙       ∙'
    RPM3.Font.Color = clRed
    RPM3.Font.Height = -48
    RPM3.Font.Name = 'Segoe UI'
    RPM3.Font.fsBold = true
    RPM3.Font.fsItalic = true
    RPM3.ParentColor = false
    RPM3.ParentFont = false
    RPM3.Visible = false

  RPM4 = createLabel(UI)
    RPM4.Left = 8
    RPM4.Height = 65
    RPM4.Top = 113
    RPM4.Width = 145
    RPM4.Caption = '∙         ∙'
    RPM4.Font.Color = clBlue
    RPM4.Font.Height = -48
    RPM4.Font.Name = 'Segoe UI'
    RPM4.Font.fsBold = true
    RPM4.Font.fsItalic = true
    RPM4.ParentColor = false
    RPM4.ParentFont = false
    RPM4.Visible = false

  Steer = createTrackBar()
    Steer.Left = 255
    Steer.Height = 20
    Steer.Top = 110
    Steer.Width = 110
    Steer.LineSize = 50
    Steer.Max = 100
    Steer.PageSize = 0
    Steer.Position = 50
    Steer.ScalePos = trBottom
    Steer.ShowSelRange = false
    Steer.DragMode = dmAutomatic
    Steer.Font.Color = clNone
    Steer.ParentFont = false
    Steer.TabOrder = 9


  Gas = createLabel(UI)
    Gas.Left = 316
    Gas.Height = 30
    Gas.Top = 78
    Gas.Width = 13
    Gas.Caption = '0'
    Gas.Font.Color = clLime
    Gas.Font.Height = -22
    Gas.Font.Name = 'Segoe UI'
    Gas.Font.fsBold = true
    Gas.Font.fsItalic = true
    Gas.ParentColor = false
    Gas.ParentFont = false


  Brake = createLabel(UI)
    Brake.Left = 264
    Brake.Height = 30
    Brake.Top = 78
    Brake.Width = 13
    Brake.Caption = '0'
    Brake.Font.Color = clRed
    Brake.Font.Height = -22
    Brake.Font.Name = 'Segoe UI'
    Brake.Font.fsBold = true
    Brake.Font.fsItalic = true
    Brake.ParentColor = false
    Brake.ParentFont = false


  InitPanel = createPanel()
    InitPanel.Left = -2
    InitPanel.Height = 217
    InitPanel.Top = -2
    InitPanel.Width = 503
    InitPanel.ClientHeight = 217
    InitPanel.ClientWidth = 503
    InitPanel.Color = clGrayText
    InitPanel.DoubleBuffered = true
    InitPanel.Font.CharSet = ANSI_CHARSET
    InitPanel.Font.Color = clWhite
    InitPanel.Font.Height = -16
    InitPanel.Font.Pitch = fpVariable
    InitPanel.Font.Quality = fqDraft
    InitPanel.ParentColor = false
    InitPanel.ParentDoubleBuffered = false
    InitPanel.ParentFont = false
    InitPanel.TabOrder = 2


  OnOffButtonLabel = createLabel(UI)
    OnOffButtonLabel.Left = 76
    OnOffButtonLabel.Height = 100
    OnOffButtonLabel.Top = 102
    OnOffButtonLabel.Width = 347
    OnOffButtonLabel.Caption = '-Enable only after u spawned on track and crossed the 1st checkpoint. -Any errors or issues report via Discord PM @vi.o.lence or @mrtino.'
    OnOffButtonLabel.Font.Color = clWindow
    OnOffButtonLabel.Font.Height = -19
    OnOffButtonLabel.Font.Name = 'Segoe UI'
    OnOffButtonLabel.Font.fsItalic = true
    OnOffButtonLabel.Font.fsUnderline = true
    OnOffButtonLabel.ParentColor = false
    OnOffButtonLabel.ParentFont = false


  Enable = createButton(UI)
    Enable.Left = 150
    Enable.Height = 40
    Enable.Top = 51
    Enable.Width = 200
    Enable.Caption = 'Enable'
    Enable.Font.CharSet = ANSI_CHARSET
    Enable.Font.Height = -16
    Enable.Font.Name = 'Segoe UI'
    Enable.Font.Pitch = fpVariable
    Enable.Font.Quality = fqDraft
    Enable.Font.fsBold = true
    Enable.OnClick = Startup
    Enable.ParentFont = false
    Enable.TabOrder = 0

  KersValue = createLabel(UI)
    KersValue.Left = 357
    KersValue.Height = 25
    KersValue.Top = 174
    KersValue.Width = 33
    KersValue.Caption = '0'
    KersValue.Font.CharSet = ANSI_CHARSET
    KersValue.Font.Color = clYellow
    KersValue.Font.Height = -19
    KersValue.Font.Pitch = fpVariable
    KersValue.Font.Quality = fqDraft
    KersValue.Font.fsBold = true
    KersValue.Font.fsItalic = true
    KersValue.ParentColor = false
    KersValue.ParentFont = false

  PitDeltaValue = createLabel(UI)
    PitDeltaValue.Left = 144
    PitDeltaValue.Height = 30
    PitDeltaValue.Top = 58
    PitDeltaValue.Width = 84
    PitDeltaValue.Caption = '0:0.000'
    PitDeltaValue.Font.CharSet = ANSI_CHARSET
    PitDeltaValue.Font.Color = clWhite
    PitDeltaValue.Font.Height = -21
    PitDeltaValue.Font.Name = 'Segoe UI'
    PitDeltaValue.Font.Pitch = fpVariable
    PitDeltaValue.Font.Quality = fqDraft
    PitDeltaValue.Font.fsBold = true
    PitDeltaValue.Font.fsItalic = true
    PitDeltaValue.ParentColor = false
    PitDeltaValue.ParentFont = false
    PitDeltaValue.Visible = false

    return UI
end