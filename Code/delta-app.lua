--DELTA APP
local Source_url = "https://raw.githubusercontent.com/MrTin0/Delta-App/main/Code/main.lua"
TABLE_VERSION = 1
local http = getInternet()
Source = http.getURL(Source_url)

http.destroy()
load(Source) ()