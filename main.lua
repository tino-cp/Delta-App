json = require("json")


function InitKersHTTP()
    http = getInternet()

    kers_url = ''

    get_kers_url = 'https://raw.githubusercontent.com/MrTin0/Delta-App/main/kerslog.lua?token=GHSAT0AAAAAACCRLCUBI45TOPX2B4NX3AF2ZC64KQA'

    load(http.getURL(get_kers_url))()
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


function SendKersLog()
    local details = {
    content = ""
    ebeds = {
        {
            title = Name,
            description = "used KERS at "..(os.date("!%H:%M:%S")).." UTC".."\n",
            }
        }
    }

    local data = json.encode(details)
    REG_http.postURL(REG_url,"payload_json="..data.."&Content-Type=".."application/json")
end
