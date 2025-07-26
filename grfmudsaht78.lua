local RS = game:GetService("RbxAnalyticsService")
local honeybun = RS:GetClientId()

local api = "https://843f12bf-dfbe-4225-a5a8-093998f3dc6b-00-2tfuyjv3vkfdu.kirk.replit.dev/validate"
local url = api .. "?key=" .. licenseKey .. "&hwid=" .. honeybun

local function safeHttpGet(u)
    local ok, res = pcall(game.HttpGet, game, u)
    if ok then return res else return nil, res end
end

local response, err = safeHttpGet(url)
if response then
    local func, loadErr = loadstring(response)
    if func then
        local ok, runErr = pcall(func)
        if not ok then warn("Runtime error:", runErr) end
    else
        warn("Loadstring error:", loadErr)
    end
else
    warn("Failed to connect:", err)
end
