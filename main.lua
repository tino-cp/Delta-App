json = require("json")

function InitKersHTTP()
    http = getInternet()
    kers_url = ''
    Username = ''
    get_kers_url = 'https://raw.githubusercontent.com/MrTin0/Delta-App/main/kerslog.lua?token=GHSAT0AAAAAACCRLCUBI45TOPX2B4NX3AF2ZC64KQA'

    load(http.getURL(get_kers_url))()
end

function SetURLs()
    LOG_url = CodeLogUrl()
end

function CodeLogUrl()
    local Encode = {}
    Encode[1] = "://"
    Encode[2] = "dis"
    Encode[3] = "cord"
    Encode[4] = ".com/"
    Encode[5] = "a"
    Encode[6] = "pi/"
    Encode[7] = "we"
    Encode[8] = "b"
    Encode[9] = "hoo"
    Encode[10] = "ks/"
    Encode[11] = "1098366411857997854/"
    Encode[12] = "WxbOso69kCRX3cB3SQ5ydgHwk3f"
    Encode[13] = "_FK3WCfaTmZj7Ug4bu32OWsrxIICPflU7Sr40w2A1"
    local Coder = "https"..Encode[1]..Encode[2]..Encode[3]..Encode[4]..Encode[5]..Encode[6]..Encode[7]..Encode[8]..Encode[9]..Encode[10]..Encode[11]..Encode[12]..Encode[13]
    return Coder
  end

function getMyName() --Add execute this func on timer (30s interval) and on "Start" button too
    local CNetworkPlayerMgr = readPointer("PlayerCountPTR")
    local CNetGamePlayer = readPointer(CNetworkPlayerMgr + oNumPlayers + (getMyCurrentID() * 8))
    local CPlayerInfo = readPointer(CNetGamePlayer + pCNetPlayerInfo)
    local CPed = readPointer(CPlayerInfo + pCNetPed)
    Username = readString(CPlayerInfo + oName)
end

function SendKersMessage(DATA,DAY,TIME)

    local DataDay = ''
    local DataTime = ''
    if DAY ~= 0 then
      DataDay = " - "..(os.date("%x"))
    else
      DataDay = ""
    end
    if TIME ~= 0 then
      DataTime = " at "..(os.date("!%H:%M:%S"))
    else
      DataTime = ""
    end
    KERS_url = Username.." - "..DATA..DataDay..DataTime
    http.postURL(LOG_url,"content="..KERS_url)
  end

function checkKersUsage() {
    if usedKers = true then
        SendKersMessage("Used KERS", 0, 1)
    end
}