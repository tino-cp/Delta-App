--DELTA APP ERROR
Build_Version = 'v1.0.1'
openProcess'GTA5.exe'
autoAssemble([[
unregistersymbol(adr)
unregistersymbol(TimesPTR)]])
markMyRid = -1
LoadedTime = false
ADR = 0
Metrics = 1
SpeedStatus = 1
Gears = 1
Inputs = 1
KersValues = 1
darkMode = 0
simpleMode = 0
fullscreenMode = 0
setPosition = 1
setFont = 0
function InitOffsets()
  pCNetPlayerInfo = 0xA0
  pCNetPed = 0x240
  oNumPlayers = 0x188
  oRid = 0xE8
  pCPed = 0x8
  pCPlayerInfo = 0x10A8
  oName = 0xFC
  oCurCheck = 0x11578
  oCurLap = 0x11570
end

InitOffsets()

--Check player ID

function GetPTRs()
  autoAssemble([[
  aobscanmodule(WorldPTR,GTA5.exe,48 8B 05 ? ? ? ? 45 ? ? ? ? 48 8B 48 08 48 85 C9 74 07)
  registersymbol(WorldPTR)
  aobscanmodule(PlayerCountPTR,GTA5.exe,48 8B 0D ? ? ? ? E8 ? ? ? ? 48 8B C8 E8 ? ? ? ? 48 8B CF)
  registersymbol(PlayerCountPTR)
  aobscanmodule(UnkPTR,GTA5.exe,48 39 3D ? ? ? ? 75 2D)
  registerSymbol(UnkPTR)
  ]])
  addr=getAddress("WorldPTR")
  addr=addr+readInteger(addr+3)+7
  unregisterSymbol("WorldPTR")
  registerSymbol("WorldPTR", addr, true)
  WorldPTR = readQword("WorldPTR")

  addr=getAddress("PlayerCountPTR")
  addr=addr+readInteger(addr+3)+7
  unregisterSymbol("PlayerCountPTR")
  registerSymbol("PlayerCountPTR", addr, true)
  WorldPTR = readQword("PlayerCountPTR")

  UnkPTR=getAddress('UnkPTR') UnkPTR = UnkPTR + readInteger(UnkPTR + 3) + 7
  unregisterSymbol('UnkPTR') registerSymbol('UnkPTR',UnkPTR,true)
  UNK = readQword("UnkPTR")
  end

  function mark_MYRid()
  local contest = getAddressSafe('WorldPTR')

  local ridaddr = "[[[WorldPTR]+pCPed]+pCPlayerInfo]+oRid"

  local testy = readPointer(ridaddr)

  if not testy then
  else
    markMyRid = testy
  end
end

function FoundMyCurrentID()
  local CNetworkPlayerMgr=readPointer("PlayerCountPTR")
  if markMyRid == -1 then mark_MYRid() end
  --Never use goto kids. This isn't my function.
  for i=0,32,1 do
    local CNetGamePlayer = readPointer(CNetworkPlayerMgr + oNumPlayers + (i*8))
    if not CNetGamePlayer then
      goto continue
    end
    local CPlayerInfo = readPointer(CNetGamePlayer + pCNetPlayerInfo)
    if not CPlayerInfo then
      goto continue
    end
    local CPed = readPointer(CPlayerInfo + pCNetPed)
    if not CPed or CPed == 0 then
      goto continue
    end
    local ORGRid = readPointer(CPlayerInfo + oRid)
    if ORGRid == markMyRid then
      MyIDNumber = i
      goto found
    end
    ::continue::
  end
  ::found::
end

function Fetch()
  GetPTRs()
  FoundMyCurrentID()
end

function ActivateApp()
  Enable.Caption = "Activating app"
  InitPanel.Enabled=false
  InitPanel.Visible=false
  StartDetect.Enabled=true
  NewCheckpoint=true
  NewSector=true
  DeltaMils=1
  FirstLap=true
  Enable=false
  LogsEnabled=false
  UI.FormStyle = 'fsSystemStayOnTop'

  previousKersValue = nil
  kersGainedOnLap = 0
  kersUsedOnLap = 0

  Value = createTimer(nil, false)
  timer_onTimer(Value, ReadValue)
  timer_setInterval(Value, 50)
  timer_setEnabled(Value, true)
  
end


function InitTrackInfo()
  --Build Sectors
  S1_raw=0
  S2_raw=0
  S3_raw=0
  MaxCheckpoints = readInteger('adr + D3618') --old CBF40 new D 16C0 del prev 97C60 928
  local Track_Name = readString('adr + E5AF0')
  Caption = Track_Name.." Delta App Online 1.2.0"
  CurLapLastCheckpointTime = 0
  LastCheckpoint = 100
  CurrentLapSectors = {}
  FastLapSectors = {}
  if LoadedTime == false then
    for i=0,MaxCheckpoints-1 do
      CurrentLapSectors[i]=0
      FastLapSectors[i]=10000000
    end
    LatestFastLapSectors=10000000
  else
    for i=0,MaxCheckpoints-1 do
      CurrentLapSectors[i]=0
    end
    LatestFastLapSectors=FastLapSectors[0]
    FirstLap=false
  end
  S1 = MaxCheckpoints//3
  S2 = S1 + MaxCheckpoints//3
  S3 = 0
  Fetch()
end

function CloseToTheEnd()
  if CurCheckpoint==MaxCheckpoints-1 and CurLapMils>1000 then
    if NewCheckpoint==true then
      CurrentLapSectors[MaxCheckpoints-1]=CurLapMils
      NewCheckpoint=false
      CanWrite=true
    end
    CurLapLastCheckpointTime=CurLapMils
  end
end

--CloseToTheEnd
function NewC()
  if NewCheckpoint==true and CurCheckpoint>0 then
    if CurCheckpoint ~= MaxCheckpoints-1 then
      CurrentLapSectors[CurCheckpoint]=CurLapMils
      NewCheckpoint=false
    else
      CloseToTheEnd()
    end
    LastCheckpoint=CurCheckpoint
  end
end

--NewC
function Drive()
  if LastCheckpoint ~= CurCheckpoint then
    NewCheckpoint = true
    NewSector=true
    NewC()
  end
end

function NewLapProcedure()
  if CurCheckpoint == 0 and LastCheckpoint ~= 0 and CurLapLastCheckpointTime ~= 0 then
    CurrentLapSectors[0] = CurLapLastCheckpointTime
    --LOGS

    if Enable == true then
      RequireIncomingTransaction()
    end

    if LogsEnabled == true and CanWrite==true then
      --Record laptime
      LogsLaptime = CurLapLastCheckpointTime
      --Record Sectors
      LogsSector1 = S1_raw
      LogsSector2 = S2_raw
      LogsSector3 = CurLapLastCheckpointTime-S1_raw-S2_raw
      --RecordLap
      CurrentLap = readInteger(ChecksPTR + oCurLap + (MyIDNumber*0x670))
      LogsLap = CurrentLap - 1
      local SpeedTrap = GetSpeed()
      -- same for sectors here
      --LogArray=LogArray.."Lap №"..LogsLap..": Lap time - "..LogsLaptime.."\n".." With sectors: S1-"..LogsSector1.." S2-"..LogsSector2.." S3-"..LogsSector3.."\n"
      LogArray = LogArray..LogsLap..", "..LogsLaptime..", "..SpeedTrap..", "..((SpeedTrap/1.6)*10//1/10)..", "..TopSpeed..", "..((TopSpeed/1.6)*10//1/10)..", "..AvgSpeed..", "..((AvgSpeed/1.6)*10//1/10)..", "..LogsSector1..", "..LogsSector2..", "..LogsSector3..", "..kersGainedOnLap..", "..kersUsedOnLap.."\n"
      TopSpeed = 0
      AvgSpeed = nil
      previousKersValue = nil
      kersGainedOnLap = 0
      kersUsedOnLap = 0
      CanWrite = false
    end
      --LOGS
    FirstLap = false
    if CurrentLapSectors[0] < FastLapSectors[0] then
      LatestFastLapSectors = FastLapSectors[0]
      for i=0,MaxCheckpoints-1 do
        FastLapSectors[i] = CurrentLapSectors[i]
      end
    end
  end
end

function UpdateInfo()

  if Enable == true then
    Enable = false
    StartDetect.Caption='START'

    if LogsEnabled ==true then
      PackLogs()
      LogsSwitcher()
    end
    LoadedTime = false
    LoadFLButton.Enabled = false
    LogBuildingButton.Enabled = false

    UI.Caption = "Delta App Online 1.2.0"
  elseif Enable == false then
    UpdateCar()
    InitTrackInfo()
    Enable = true
    StartDetect.Caption='STOP'

    ChecksPTR = getAddress('TimesPTR')
    ForLogs_TrackName=readString('adr + E5AF0') --new E3998 del 3A388 prev A9610
    if LogsEnabled == true then
      CanWrite=false
    end
    LogArray=''
    TopSpeed=0
    AvgSpeed=nil
    previousKersValue = nil
    kersGainedOnLap = 0
    kersUsedOnLap = 0
    LogBuildingButton.Enabled = true
    SaveFLButton.Enabled = true
    LoadFLButton.Enabled = true
  end

  local timer_ps = createTimer()
  timer_ps.Interval = 1
  timer_ps.OnTimer =
  function (ps)

    if Enable == true then
      --Take values
      CurLapMils = readInteger('TimesPTR - 250') --3D0 basic
      --FastLapMils = readInteger('TimesPTR + 11228') --EA10 E960
      CurCheckpoint = readInteger(ChecksPTR + oCurCheck + (MyIDNumber*0x670)) --7598 74E8
      --print(CurCheckpoint)
      LapProgress.Position=(((CurCheckpoint)*100)/MaxCheckpoints)

      --Checks
      --checkPitDeltaValue()
      Drive()
      CloseToTheEnd()
      NewLapProcedure()

      --Display
      if FirstLap==false then

        if CurCheckpoint==0 then
          DeltaMils=CurrentLapSectors[0]-LatestFastLapSectors
        else
          DeltaMils=CurrentLapSectors[CurCheckpoint]-FastLapSectors[CurCheckpoint]
        end

        if DeltaMils>9999 then

          DeltaLabel.Caption="+ 9.999"
          DeltaLabel.Font.Color=clRed

        elseif DeltaMils>0 then

          if (DeltaMils-1000*(DeltaMils//1000))<10 then
            DeltaLabel.Caption='+'..(DeltaMils//1000)..'.00'..(DeltaMils-1000*(DeltaMils//1000))
          elseif (DeltaMils-1000*(DeltaMils//1000))<100 then
            DeltaLabel.Caption='+'..(DeltaMils//1000)..'.0'..(DeltaMils-1000*(DeltaMils//1000))
          else
            DeltaLabel.Caption='+'..(DeltaMils//1000)..'.'..(DeltaMils-1000*(DeltaMils//1000))
          end
          DeltaLabel.Font.Color=clRed

        elseif DeltaMils<-9999 then

          DeltaLabel.Caption="- 9.999"
          DeltaLabel.Font.Color=clLime

        elseif DeltaMils<0 then

          DeltaMils=DeltaMils*(-1)
          if (DeltaMils-1000*(DeltaMils//1000))<10 then
            DeltaLabel.Caption='-'..(DeltaMils//1000)..'.00'..(DeltaMils-1000*(DeltaMils//1000))
          elseif (DeltaMils-1000*(DeltaMils//1000))<100 then
            DeltaLabel.Caption='-'..(DeltaMils//1000)..'.0'..(DeltaMils-1000*(DeltaMils//1000))
          else
            DeltaLabel.Caption='-'..(DeltaMils//1000)..'.'..(DeltaMils-1000*(DeltaMils//1000))
          end
          DeltaLabel.Font.Color=clLime

        elseif DeltaMils==0 then
          DeltaLabel.Caption="0.000"
          DeltaLabel.Font.Color=clWhite

        end
      end

      --If you read this and trying to understand it, know... you are awesome

      --FREEZE Last Lap
      if CurCheckpoint~=0 then

        local TimeStamp=FastLapSectors[0]

        --Display laptime info
        CalcMins = CurLapMils//60000
        CalcSec = (CurLapMils - (60000*CalcMins))//1000
        CalcMils = (CurLapMils - (CalcMins*60000) - (CalcSec*1000))
        if CalcMils<10 then
          CurrentLapValue.Caption=CalcMins..':'..CalcSec..'.00'..CalcMils
        elseif CalcMils<100 then
          CurrentLapValue.Caption=CalcMins..':'..CalcSec..'.0'..CalcMils
        else
          CurrentLapValue.Caption=CalcMins..':'..CalcSec..'.'..CalcMils
        end

        FCalcMins = TimeStamp//60000
        FCalcSec = (TimeStamp - (60000*FCalcMins))//1000
        FCalcMils = (TimeStamp - 60000*FCalcMins - 1000*FCalcSec)
        if FCalcMils<10 then
          FastestLapValue.Caption=FCalcMins..':'..FCalcSec..'.00'..FCalcMils
        elseif FCalcMils<100 then
          FastestLapValue.Caption=FCalcMins..':'..FCalcSec..'.0'..FCalcMils
        else
          FastestLapValue.Caption=FCalcMins..':'..FCalcSec..'.'..FCalcMils
        end

      elseif CurCheckpoint==0 then

        --NewLapProcedure()
        local TimeStamp=FastLapSectors[0]
        CalculateMins = CurLapLastCheckpointTime//60000
        CalculateSec = (CurLapLastCheckpointTime - (60000*CalculateMins))//1000
        CalculateMils = (CurLapLastCheckpointTime - 60000*CalculateMins - 1000*CalculateSec)
        if CalculateMils<10 then
          CurrentLapValue.Caption=CalculateMins..':'..CalculateSec..'.00'..CalculateMils
        elseif CalculateMils<100 then
          CurrentLapValue.Caption=CalculateMins..':'..CalculateSec..'.0'..CalculateMils
        else
          CurrentLapValue.Caption=CalculateMins..':'..CalculateSec..'.'..CalculateMils
        end

        FCalculateMins = TimeStamp//60000
        FCalculateSec = (TimeStamp - (60000*FCalculateMins))//1000
        FCalculateMils = (TimeStamp - 60000*FCalculateMins - 1000*FCalculateSec)
        if FCalculateMils<10 then
          FastestLapValue.Caption=FCalculateMins..':'..FCalculateSec..'.00'..FCalculateMils
        elseif FCalculateMils<100 then
          FastestLapValue.Caption=FCalculateMins..':'..FCalculateSec..'.0'..FCalculateMils
        else
          FastestLapValue.Caption=FCalculateMins..':'..FCalculateSec..'.'..FCalculateMils
        end
        
      end

      --Detect Sector's marks
      local TimeSectors=CurLapMils
      if CurCheckpoint == S1 and NewSector==true then
        S1_raw = TimeSectors
        if S3_raw ~= 0 then
          S2_raw=0
          S3_raw=0
        end
        NewSector=false
      elseif CurCheckpoint == S2 and NewSector==true then
        S2_raw = TimeSectors - S1_raw
        NewSector=false
      elseif CurCheckpoint == 0 and S2_raw ~= 0 and S1_raw ~= 0 and NewSector==true then
        S3_raw = CurLapLastCheckpointTime - S1_raw - S2_raw
        NewSector=false
      end

      --Convert milis in time for Sectors
      S1_sec = S1_raw//1000
      S1_mil = S1_raw - 1000*S1_sec

      S2_sec = S2_raw//1000
      S2_mil = S2_raw - 1000*S2_sec

      S3_sec = S3_raw//1000
      S3_mil = S3_raw - 1000*S3_sec

      --Display Sector info

      if S1_mil<10 then
        S1Label.Caption=S1_sec..'.00'..S1_mil
        if S1_mil<100 then
          S1Label.Caption=S1_sec..'.0'..S1_mil
        end
      else
        S1Label.Caption=S1_sec..'.'..S1_mil
      end

      if S2_mil<10 then
        S2Label.Caption=S2_sec..'.00'..S2_mil
        if S2_mil<100 then
          S2Label.Caption=S2_sec..'.0'..S2_mil
        end
      else
        S2Label.Caption=S2_sec..'.'..S2_mil
      end

      if S3_mil<10 then
        S3Label.Caption=S3_sec..'.00'..S3_mil
        if S3_mil<100 then
          S3Label.Caption=S3_sec..'.0'..S3_mil
        end
      else
        S3Label.Caption=S3_sec..'.'..S3_mil
      end

    end
  end
end

--STARTUP FUNCS

function FindAdr()
  Enable.Caption = "Scanning memory 1/3"
  local results = AOBScan('02 00 00 00 ?? 0? 00 00 FF FF FF FF 00 00 00 00 00 00 00 00 ?? 0? 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ?? 0? 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00', '*X*C*W', 2, '000')
  assert(results, 'aobscan failed')
  local addr = results[0]
  results.destroy()
  registerSymbol('adr',addr)
end

function FindTimes()
  Enable.Caption = "Scanning memory 2/3"
  local results = AOBScan('FF FF FF FF 00 00 00 00 00 00 00 00 ?? 0? 00 00 08 00 00 00 00 00 00 00 05 00 00 00 00 00 00 00 ?? ?? ?? ?? 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 EC FF FF FF ?? 0?', '-X-C+W', 2, '8')
  assert(results, 'aobscan failed')
  local addr = results[0]
  results.destroy()
  registerSymbol('TimesPTR',addr)
end

function FindCar()
  Enable.Caption = "Scanning memory 3/3"
  autoAssemble([[
  aobscanmodule(WorldPTR,GTA5.exe,48 8B 05 ? ? ? ? 45 ? ? ? ? 48 8B 48 08 48 85 C9 74 07)
  registersymbol(WorldPTR)
  ]])
  addr=getAddress("WorldPTR")
  addr=addr+readInteger(addr+3)+7
  unregisterSymbol("WorldPTR")
  registerSymbol("WorldPTR", addr, true)
  PTR = readQword("WorldPTR")
  --CarNameADR = getAddress("[[[PTR+8]+D10]+20]+298")
  --CarNameCurrent = readString(CarNameADR)
  --284EA541160
end

function UpdateCar()
  if CarNameCurrent ~= readString(CarNameADR) then CarNameCurrent = readString(CarNameADR) end
end

function LogsSwitcher()
  if LogsEnabled == false then
    LogsEnabled=true
    LogBuildingButton.Caption = 'LOGS ON'
    LastElement = 100
  else
    LogsEnabled=false
    LogBuildingButton.Caption = 'LOGS OFF'
  end
end

function PackLogs()
  local ForLogs_TrackName = readString('adr + E5AF0')
  local save_dialog = createSaveDialog(self)
  save_dialog.InitalDir = os.getenv('%USERPROFILE%')
  if save_dialog.execute() then
    local s=(save_dialog.FileName..'.csv')
    file = io.open(s, "a+")
    CurrentDate=os.date("%x")
    file:write(ForLogs_TrackName.."\n")
    file:write(CurrentDate.."\n")
    file:write("Lap, Laptime, Speed_S/F(KPH), Speed_S/F(MPH), TopSpeed(KPH), TopSpeed(MPH), AverageSpeed(KPH), AverageSpeed(MPH), S1, S2, S3, KersGained, KersUsed".."\n")
    file:write(LogArray)
    file:close()
  end
end

function ShowTime()
       local TimeStamp=FastLapSectors[0]
        local FMins = TimeStamp//60000
        FSec = (TimeStamp - (60000*FMins))//1000
        FMils = (TimeStamp - 60000*FMins - 1000*FSec)
        if FMils<10 then
          SaveFLButton.Caption=FMins..':'..FSec..'.00'..FMils
        elseif FMils<100 then
          SaveFLButton.Caption=FMins..':'..FSec..'.0'..FMils
        else
          SaveFLButton.Caption=FMins..':'..FSec..'.'..FMils
        end
end

function RevertCaption()
  SaveFLButton.Caption="SAVE LAP"
end

function SaveFastLap()
  local FLdata = ""
  for i=0,MaxCheckpoints-1 do
      FLdata = FLdata..FastLapSectors[i].."\n"
  end
  local TrackName = readString('adr + E5AF0')
  local save_dialog = createSaveDialog(self)
  save_dialog.InitalDir = os.getenv('%USERPROFILE%')
  if save_dialog.execute() then
    local s=(save_dialog.FileName..'.HOTLAP')
    file = io.open(s, "a+")
    CurrentDate=os.date("%x")
    file:write(TrackName..'\n')
    file:write(FLdata..'\n')
    file:close()
  end
end

function TestFL()
  local FLdata = ""
  for i=0,MaxCheckpoints-1 do
      FLdata = FLdata .. tostring(FastLapSectors[i]).."\n"
  end
  print(FLdata)
end

function LoadFastLap()
     load_dialog = createOpenDialog(self)
     load_dialog.InitalDir = os.getenv('%USERPROFILE%')
     if load_dialog.execute() then
     file = io.open(load_dialog.FileName, "r")
     local Track = tostring(file:read())
     if Track == readString('adr + E5AF0') then
        for i=0,MaxCheckpoints-1 do
            FastLapSectors[i] = tonumber(file:read())
        end
     LoadedTime = true
     end
     end
end

function Startup()
  Enable.Enabled = false
  FindAdr()
  FindTimes()
  FindCar()
  ActivateApp()
  -- if SteamVersion.Checked == true then ADR = 0 end
  -- if NonSteamVersion.Checked == true then ADR = 1 end
end

function RescanUNK()
    if UNK ~= readQword("UnkPTR") then
      autoAssemble([[
        aobscanmodule(UnkPTR,GTA5.exe,48 39 3D ? ? ? ? 75 2D)
        registerSymbol(UnkPTR)
      ]])
      UnkPTR=getAddress('UnkPTR') UnkPTR=UnkPTR+readInteger(UnkPTR+3)+7
      unregisterSymbol('UnkPTR') registerSymbol('UnkPTR',UnkPTR,true)
      UNK = readQword("UnkPTR")
    end
end

function ShowHideSettings()
  if SettingPanel.Visible == true then
     SettingPanel.Visible = false
     SettingPanel.Enable = false
  else
     SettingPanel.Visible = true
     SettingPanel.Enable = true
  end
end

function ShowHideSimple()
  if SimplePanel.Visible == true then
    SimplePanel.Visible = false
    SimplePanel.Enable = false
  else
    SimplePanel.Visible = true
    SimplePanel.Enable = true
  end
end

function ChangeMetrics()
  if Metrics == 1 then
     Metrics = 0
     MetricsTurnOn.Caption = "SPEED: MPH"

  elseif Metrics == 0 then
     Metrics = 1
     MetricsTurnOn.Caption = "SPEED: KPH"

  end
end

function ChangeSpeed()
  if SpeedStatus == 1 then
     SpeedStatus = 0
     SpeedTurnOn.Caption = "SPEED: OFF"
     SpeedLabel.Visible = false
  elseif SpeedStatus == 0 then
     SpeedStatus = 1
     SpeedTurnOn.Caption = "SPEED: ON"
     SpeedLabel.Visible = true
  end
end

function ChangeGears()
  if Gears == 1 then
     Gears = 0
     GearsTurnOn.Caption = "GEARS: OFF"
     GearLabel.Visible = false
  elseif Gears == 0 then
     Gears = 1
     GearsTurnOn.Caption = "GEARS: ON"
     GearLabel.Visible = true
  end
end

function ChangeInputs()
  if Inputs == 1 then
     Inputs = 0
     InputsTurnOn.Caption = "INPUT: OFF"
     Gas.Visible = false
     Brake.Visible = false
     Steer.Visible = false
  elseif Inputs == 0 then
     Inputs = 1
     InputsTurnOn.Caption = "INPUT: ON"
     Gas.Visible = true
     Brake.Visible = true
     Steer.Visible = true
  end
end

function ChangeKers()
  if KersValues == 1 then
     KersValues = 0
     KersValueTurnOn.Caption = "KERS: ON"
     KersValue.Visible = true
     KersValueBar.Visible = true
  elseif KersValues == 0 then
    KersValues = 1
     KersValueTurnOn.Caption = "KERS: OFF"
     KersValue.Visible = false
     KersValueBar.Visible = false
  end
end

function darkModeTurnOn()
  if darkMode == 1 then
    darkMode = 0
    DarkModeTurnOn.Caption = 'DARK: ON'

    UI.Color = clBlack
  elseif darkMode == 0 then
    darkMode = 1
    DarkModeTurnOn.Caption = 'DARK: OFF'

    UI.Color = clGray
  end
end

function simpleModeTurnOn()
  if simpleMode == 1 then
    simpleMode = 0
    SimpleModeTurnOn.Caption = 'SIMPLE: OFF'

    KersValue.Visible = false
    KersValueBar.Visible = false
    Gas.Visible = true
    Brake.Visible = true
    Steer.Visible = true
    SectorsCurrent.Visible = true
    S3Label.Visible = true
    S2Label.Visible = true
    S1Label.Visible = true
    CL4.Visible = true
    CL3.Visible = true
    CL2.Visible = true
    LapProgress.Visible = true
    S1_2ProggressBar.Visible = true
    S2_3ProggressBar.Visible = true
    SettingPanel.Visible = true

    -- LogBuildingButton.Visible = true
    -- LoadFLButton.Visible = true
    -- SaveFLButton.Visible = true
    -- StartDetect.Visible = true
    -- SettingButton.Visible = true
    -- SimpleModeTurnOn.Visible = true

    SimpleButton.Visible = false
    SimplePanel.Visible = false

    LogBuildingButton.Parent = UI
    LogBuildingButton.Left = 10
    LogBuildingButton.Height = 35
    LogBuildingButton.Top = 10
    LogBuildingButton.Width = 90

    LoadFLButton.Parent = UI
    LoadFLButton.Left = 105
    LoadFLButton.Height = 35
    LoadFLButton.Top = 10
    LoadFLButton.Width = 90

    SaveFLButton.Parent = UI
    SaveFLButton.Left = 200
    SaveFLButton.Height = 35
    SaveFLButton.Top = 10
    SaveFLButton.Width = 90

    StartDetect.Parent = UI
    StartDetect.Left = 295
    StartDetect.Height = 35
    StartDetect.Top = 10
    StartDetect.Width = 70

    SettingButton.Parent = UI
    SettingButton.Left = 380
    SettingButton.Height = 35
    SettingButton.Top = 10
    SettingButton.Width = 90

    DarkModeTurnOn.Parent = SettingPanel
    DarkModeTurnOn.Left = 205
    DarkModeTurnOn.Height = 30
    DarkModeTurnOn.Top = 5
    DarkModeTurnOn.Width = 100

    SimpleModeTurnOn.Parent = SettingPanel
    SimpleModeTurnOn.Left = 205
    SimpleModeTurnOn.Height = 30
    SimpleModeTurnOn.Top = 35
    SimpleModeTurnOn.Width = 100

    FullscreenModeTurnOn.Parent = SettingPanel
    FullscreenModeTurnOn.Left = 205
    FullscreenModeTurnOn.Height = 30
    FullscreenModeTurnOn.Top = 65
    FullscreenModeTurnOn.Width = 100

    MetricsTurnOn.Parent = SettingPanel
    MetricsTurnOn.Left = 5
    MetricsTurnOn.Height = 30
    MetricsTurnOn.Top = 35
    MetricsTurnOn.Width = 100

    UI.Height = 200
    UI.Width = 480
    UI.ClientHeight = 200
    UI.ClientWidth = 480
  elseif simpleMode == 0 then
    simpleMode = 1
    SimpleModeTurnOn.Caption = 'SIMPLE: ON'

    KersValue.Visible = false
    KersValueBar.Visible = false
    Gas.Visible = false
    Brake.Visible = false
    Steer.Visible = false
    SectorsCurrent.Visible = false
    S3Label.Visible = false
    S2Label.Visible = false
    S1Label.Visible = false
    CL4.Visible = false
    CL3.Visible = false
    CL2.Visible = false
    LapProgress.Visible = false
    S1_2ProggressBar.Visible = false
    S2_3ProggressBar.Visible = false
    SettingPanel.Visible = false
    
    SimpleButton.Visible = true

    LogBuildingButton.Parent = SimplePanel
    LogBuildingButton.Left = 5
    LogBuildingButton.Height = 30
    LogBuildingButton.Top = 5
    LogBuildingButton.Width = 100

    LoadFLButton.Parent = SimplePanel
    LoadFLButton.Left = 5
    LoadFLButton.Height = 30
    LoadFLButton.Top = 35
    LoadFLButton.Width = 100

    SaveFLButton.Parent = SimplePanel
    SaveFLButton.Left = 110
    SaveFLButton.Height = 30
    SaveFLButton.Top = 5
    SaveFLButton.Width = 100
    
    StartDetect.Parent = SimplePanel
    StartDetect.Left = 110
    StartDetect.Height = 30
    StartDetect.Top = 35
    StartDetect.Width = 100

    DarkModeTurnOn.Parent = SimplePanel
    DarkModeTurnOn.Left = 5
    DarkModeTurnOn.Height = 30
    DarkModeTurnOn.Top = 70
    DarkModeTurnOn.Width = 100
    
    SimpleModeTurnOn.Parent = SimplePanel
    SimpleModeTurnOn.Left = 110
    SimpleModeTurnOn.Height = 30
    SimpleModeTurnOn.Top = 70
    SimpleModeTurnOn.Width = 100

    FullscreenModeTurnOn.Parent = SimplePanel
    FullscreenModeTurnOn.Left = 110
    FullscreenModeTurnOn.Height = 30
    FullscreenModeTurnOn.Top = 100
    FullscreenModeTurnOn.Width = 100

    MetricsTurnOn.Parent = SimplePanel
    MetricsTurnOn.Left = 5
    MetricsTurnOn.Height = 30
    MetricsTurnOn.Top = 100
    MetricsTurnOn.Width = 100

    UI.Height = 200
    UI.Width = 270
    UI.ClientHeight = 200
    UI.ClientWidth = 270
  end
end

function fullscreenModeTurnOn()
  if fullscreenMode == 1 then
    fullscreenMode = 0
    FullscreenModeTurnOn.Caption = 'FULL: OFF'

    UI.BorderStyle = 'bsSingle'
    UI.AlphaBlend = false
    UI.AlphaBlendValue = 255

  elseif fullscreenMode == 0 then
    fullscreenMode = 1
    FullscreenModeTurnOn.Caption = 'FULL: ON'

    UI.BorderStyle = 'bsNone'
    UI.AlphaBlend = true
    UI.AlphaBlendValue = 180
  end
end

function setUIPosition()
  local screenWidth = getScreenWidth()
  local screenHeight = getScreenHeight()
  local deltaWidth = UI.Width
  local deltaHeight = UI.Height

  if setPosition == 1 then
    setPosition =  setPosition + 1
    UI.Left = 0
    UI.Top = 0
    SetDeltaPosition.Caption = 'POS: TL'
  elseif setPosition == 2 then
    setPosition =  setPosition + 1
    UI.Left = (screenWidth - deltaWidth) / 2
    UI.Top = 0
    SetDeltaPosition.Caption = 'POS: TM'
  elseif setPosition == 3 then
    setPosition =  setPosition + 1
    UI.Left = screenWidth - deltaWidth
    UI.Top = 0
    SetDeltaPosition.Caption = 'POS: TR'
  elseif setPosition == 4 then
    setPosition = 1
    UI.Left = (screenWidth - deltaWidth) / 2
    UI.Top = screenHeight - deltaHeight
    SetDeltaPosition.Caption = 'POS: BM'
  end
end

function setFontStyle()
  if setFont == 0 then
    setFont = 1
    SetFontStyle.Caption = 'FONT: ON'

    CurrentLapLabel.Font.Style = 'fsBold, fsItalic'
    FastestLapLabel.Font.Style = 'fsBold, fsItalic'
    CurrentLapValue.Font.Style = 'fsBold, fsItalic'
    FastestLapValue.Font.Style = 'fsBold, fsItalic'
    DeltaLabel.Font.Style = 'fsBold, fsItalic'
    SectorsCurrent.Font.Style = 'fsBold, fsItalic'
    CL2.Font.Style = 'fsBold, fsItalic'
    CL3.Font.Style = 'fsBold, fsItalic'
    CL4.Font.Style = 'fsBold, fsItalic'
    S1Label.Font.Style = 'fsBold, fsItalic'
    S2Label.Font.Style = 'fsBold, fsItalic'
    S3Label.Font.Style = 'fsBold, fsItalic'
    LapProgress.Font.Style = 'fsBold, fsItalic'
    S1_2ProggressBar.Font.Style = 'fsBold, fsItalic'
    S2_3ProggressBar.Font.Style = 'fsBold, fsItalic'
    BestSectors.Font.Style = 'fsBold, fsItalic'
    SpeedLabel.Font.Style = 'fsBold, fsItalic'
    GearLabel.Font.Style = 'fsBold, fsItalic'
    RPM1.Font.Style = 'fsBold, fsItalic'
    RPM2.Font.Style = 'fsBold, fsItalic'
    RPM3.Font.Style = 'fsBold, fsItalic'
    RPM4.Font.Style = 'fsBold, fsItalic'
    Steer.Font.Style = 'fsBold, fsItalic'
    Gas.Font.Style = 'fsBold, fsItalic'
    Brake.Font.Style = 'fsBold, fsItalic'
    KersValue.Font.Style = 'fsBold, fsItalic'
    LogBuildingButton.Font.Style = 'fsBold, fsItalic'
    LoadFLButton.Font.Style = 'fsBold, fsItalic'
    SaveFLButton.Font.Style = 'fsBold, fsItalic'
    StartDetect.Font.Style = 'fsBold, fsItalic'
    SettingButton.Font.Style = 'fsBold, fsItalic'
    SpeedTurnOn.Font.Style = 'fsBold, fsItalic'
    MetricsTurnOn.Font.Style = 'fsBold, fsItalic'
    GearsTurnOn.Font.Style = 'fsBold, fsItalic'
    InputsTurnOn.Font.Style = 'fsBold, fsItalic'
    KersValueTurnOn.Font.Style = 'fsBold, fsItalic'
    SetDeltaPosition.Font.Style = 'fsBold, fsItalic'
    DarkModeTurnOn.Font.Style = 'fsBold, fsItalic'
    SimpleModeTurnOn.Font.Style = 'fsBold, fsItalic'
    FullscreenModeTurnOn.Font.Style = 'fsBold, fsItalic'
    SetFontStyle.Font.Style = 'fsBold, fsItalic'
    SimpleButton.Font.Style = 'fsBold, fsItalic'
  elseif setFont == 1 then
    setFont = 0
    SetFontStyle.Caption = 'FONT: OFF'
    CurrentLapLabel.Font.Style = false
    FastestLapLabel.Font.Style = false
    CurrentLapValue.Font.Style = false
    FastestLapValue.Font.Style = false
    DeltaLabel.Font.Style = false
    SectorsCurrent.Font.Style = false
    CL2.Font.Style = false
    CL3.Font.Style = false
    CL4.Font.Style = false
    S1Label.Font.Style = false
    S2Label.Font.Style = false
    S3Label.Font.Style = false
    LapProgress.Font.Style = false
    S1_2ProggressBar.Font.Style = false
    S2_3ProggressBar.Font.Style = false
    BestSectors.Font.Style = false
    SpeedLabel.Font.Style = false
    GearLabel.Font.Style = false
    RPM1.Font.Style = false
    RPM2.Font.Style = false
    RPM3.Font.Style = false
    RPM4.Font.Style = false
    Steer.Font.Style = false
    Gas.Font.Style = false
    Brake.Font.Style = false
    KersValue.Font.Style = false
    LogBuildingButton.Font.Style = false
    LoadFLButton.Font.Style = false
    SaveFLButton.Font.Style = false
    StartDetect.Font.Style = false
    SettingButton.Font.Style = false
    SpeedTurnOn.Font.Style = false
    MetricsTurnOn.Font.Style = false
    GearsTurnOn.Font.Style = false
    InputsTurnOn.Font.Style = false
    KersValueTurnOn.Font.Style = false
    SetDeltaPosition.Font.Style = false
    DarkModeTurnOn.Font.Style = false
    SimpleModeTurnOn.Font.Style = false
    FullscreenModeTurnOn.Font.Style = false
    SimpleButton.Font.Style = false
  end 
end

function GetKers()
  if ADR == 0 then
    Kers = readFloat("GTA5.exe+1D59B60")
    if Speed ~= nil then
      Kers = Kers * 10 //1 /10
      return Kers
    end
  elseif ADR == 1 then
    Kers = readFloat("GTA5.exe+1D59B60")
    if Speed ~= nil then
      Kers = Kers * 10 //1 /10
      return Kers
    end
  end
end

function storeGainedKers(value)
  kersGainedOnLap = kersGainedOnLap + value  -- On new lap set value to 0
end

function storeUsedKers(value)
  kersUsedOnLap = kersUsedOnLap + value  -- On new lap set value to 0
end

function defineKersDirection(valuePrv, valueCur)
  if valuePrv > valueCur then storeUsedKers(valuePrv - valueCur)
  elseif valuePrv < valueCur then storeGainedKers(valueCur - valuePrv)
  end
end

function ReadKers()
  local Kers = 0
  if KersValues == 1 then
    if ADR == 0 then
      Kers = readFloat("GTA5.exe+1D59B60")
      if Kers ~= nil then
        Kers = Kers * 10 //1 /10
        KersValueBar.Position = Kers
        KersValue.Caption = math.floor(Kers)
        if LogsEnabled == true and Enable == true then
          if previousKersValue ~= nil and previousKersValue ~= Kers then
            defineKersDirection(previousKersValue, Kers)
          end
        end
        previousKersValue = Kers
      end
    elseif ADR == 1 then
      Kers = readFloat("GTA5.exe+1D59B60")
      if Kers ~= nil then
        Kers = Kers * 10 //1 /10
        KersValueBar.Position = Kers
        KersValue.Caption = math.floor(Kers)
        if LogsEnabled == true and Enable == true then
          if previousKersValue ~= nil and previousKersValue ~= Kers then
            defineKersDirection(previousKersValue, Kers)
          end
        end
        previousKersValue = Kers
      end
    end
  end
end

function GetSpeed()
   if ADR == 0 then
       Speed = readFloat("GTA5.exe+2698D6C")
       if Speed ~= nil then
         if Metrics == 1 then
            Speed = Speed * 10 //1 /10
            return Speed
         else
             Speed = Speed/1.6
             Speed = Speed * 10 //1 /10
             return Speed
         end
       end
    elseif ADR == 1 then
       Speed = readFloat("GTA5.exe+2698D6C")
       if Speed ~= nil then
         if Metrics == 1 then
            Speed = Speed * 10 //1 /10
            return Speed
         else
             Speed = Speed/1.6
             Speed = Speed * 10 //1 /10
             return Speed
         end
       end
    end
end

function ReadSpeed()
  local Speed = 0
  if SpeedStatus == 1 then
    if ADR == 0 then
       Speed = readFloat("GTA5.exe+2698D6C")
       if Speed ~= nil then
         if Metrics == 1 then
            Speed = Speed * 10 //1 /10
            SpeedLabel.Caption = "Kph: "..Speed
         else
             Speed = Speed/1.6
             Speed = Speed * 10 //1 /10
             SpeedLabel.Caption = "Mph: "..Speed
         end
         if LogsEnabled == true and Enable == true then
           if Speed > TopSpeed  then TopSpeed = Speed end
           if AvgSpeed == nil then AvgSpeed = Speed
           else AvgSpeed = ((AvgSpeed + Speed)/2)*10//1/10
           end
         end
       end
    elseif ADR == 1 then
       Speed = readFloat("GTA5.exe+2698D6C")
       if Speed ~= nil then
         if Metrics == 1 then
            Speed = Speed * 10 //1 /10
            SpeedLabel.Caption = "Kph: "..Speed
         else
             Speed = Speed/1.6
             Speed = Speed * 10 //1 /10
             SpeedLabel.Caption = "Mph: "..Speed
         end
         if LogsEnabled == true and Enable == true then
           if Speed > TopSpeed  then TopSpeed = Speed end
           if AvgSpeed == nil then AvgSpeed = Speed
           else AvgSpeed = ((AvgSpeed + Speed)/2)*10//1/10
           end
         end
       end
    end
  end

  if Gears == 1 then
     RescanUNK()
     local RPM = readFloat("UNK+E50")
     local Gear = readInteger("UNK+FD4")
     if Gear and RPM then
        if Gear == 0 then GearLabel.Caption = "N" end
        if Gear == 0 and Speed < 0 then GearLabel.Caption = "R" end
        if Gear > 0 then GearLabel.Caption = Gear end
        if RPM > 0.5 then RPM1.Visible = true
           if RPM > 0.7 then RPM2.Visible = true
              if RPM > 0.8 then RPM3.Visible = true
                 if RPM > 0.9 then RPM4.Visible = true
                   if RPM > 0.96 then GearLabel.Font.Color = clRed
                   elseif darkMode == 1 then GearLabel.Font.Color = clBlack
                   else GearLabel.Font.Color = clWhite
                   end
                 else RPM4.Visible = false
                 end
              else
                  RPM3.Visible = false
                  RPM4.Visible = false
              end
           else
             RPM2.Visible = false
             RPM3.Visible = false
             RPM4.Visible = false
           end
        else
          RPM1.Visible = false
          RPM2.Visible = false
          RPM3.Visible = false
          RPM4.Visible = false
        end
     end
  else
    RPM1.Visible = false
    RPM2.Visible = false
    RPM3.Visible = false
  end

  if Inputs == 1 then
     local SteerPos = readFloat("UNK+CA8")
     local BrakePos = readFloat("GTA5.exe+25E79BC")
     local ThrottlePos = readFloat("GTA5.exe+25E7974")
     if SteerPos ~= nil then
       if SteerPos < 0 then
          Steer.Position = (((SteerPos * (-1) *50) + 50) // 1)
       elseif SteerPos > 0 then
              Steer.Position = ((50 - (SteerPos *50)) // 1)
       else
           Steer.Position = 50
       end
     end
     Brake.Caption = math.floor(BrakePos * 100)
     Gas.Caption = math.floor(ThrottlePos * 100)
  end
end

-- local startTime = 0
-- local pitEntry = 0
-- local pitExit = 0
-- local pitExitTime = 0
-- local isPitEntrySet = false

-- function getPitEntry()
--   if isPitEntrySet == false then
--     pitEntry = CurLapMils
--     isPitEntrySet = true
--   end
-- end

-- function getPitExit()
--   if isPitEntrySet == true then
--     pitExit = CurLapMils
--     pitExitTime = startTime
--     isPitEntrySet = false
--   end
-- end

-- function startPitDelta()
--   startTime = CurLapMils - pitEntry
--   CalcSec = startTime//1000
--   CalcMils = (startTime - (CalcSec*1000))
--   if CalcMils<10 then
--     PitDeltaValue.Caption=CalcSec..'.00'..CalcMils
--   elseif CalcMils<100 then
--     PitDeltaValue.Caption=CalcSec..'.0'..CalcMils
--   else
--     PitDeltaValue.Caption=CalcSec..'.'..CalcMils
--   end
-- end

-- function stopPitDelta()
--     CalcSec = pitExitTime//1000
--     CalcMils = (pitExitTime - (CalcSec*1000))
--     if CalcMils<10 then
--       PitDeltaValue.Caption=CalcSec..'.00'..CalcMils
--     elseif CalcMils<100 then
--       PitDeltaValue.Caption=CalcSec..'.0'..CalcMils
--     else
--       PitDeltaValue.Caption=CalcSec..'.'..CalcMils
--     end
-- end

-- function checkPitDeltaValue()
--   local inPit = readInteger("GTA5.exe+2A320D0")
  
--   if Enable == true then
--     if inPit == 1 then
--       CurrentLapValue.Visible = false
--       CurrentLapLabel.Caption = 'Pit Delta:'
--       PitDeltaValue.Visible = true
--       getPitEntry()
--       startPitDelta()
--     elseif inPit == 0 then
--       getPitExit()
--       local freezeTime = 2000
--       if (CurLapMils - pitExit) < freezeTime then
--         stopPitDelta()
--       else
--         startTime = 0
--         PitDeltaValue.Visible = false
--         CurrentLapLabel.Caption = 'Current Lap:'
--         CurrentLapValue.Visible = true
--       end
--     end
--   end
-- end

function ReadValue()
  ReadKers()
  ReadSpeed()
end

-- Delta Lap Times Google Sheet
json = require("json")


function RequireIncomingTransaction()
  local https = GetInternet()
  local TransactionURL = 'https://script.google.com/macros/s/AKfycbzcW8Qb0ByoajCEguRIV-fgxHRghl9cgHftV3s81-pWLgfEQVtW1lhyjR34q8NMs-iI/exec?gid=2012962818&Track=1&S1=1&S2=2&S3=3'
  local TrackName = readString('adr + E5AF0')
  local nameaddr = "[[[WorldPTR]+pCPed]+pCPlayerInfo]+oName"
  local Username = readString(nameaddr)
  local S3_raw = CurLapLastCheckpointTime-S1_raw-S2_raw
  https.postURL(TransactionURL,"Track="..TrackName.."&Player="..Username.."&S1="..S1_raw.."&S2="..S2_raw.."&S3="..S3_raw)
  https.destroy()
end

function ex()
  CloseCE()
end
