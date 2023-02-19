require("config")
require("locales")

local players = {}
local timeBool = false
local weatherBool = false

registerForEvent("init", function()
    if Config.TimeSync then syncTime() timeBool = true end
    if Config.WeatherSync then syncWeather() weatherBool = true end
end)

local timeSync = 0
local weatherSync = 0

registerForEvent("update", function(delta) -- Syncing Time/Weather

    timeSync = timeSync + delta
    weatherSync = weatherSync + delta

    if timeSync > Config.TimerToSyncTime and timeBool then
        timeSync = 0
        syncTime()
    end
    
    if weatherSync > Config.TimerToSyncWeather and weatherBool then
        weatherSync = 0
        syncWeather() -- Do not comment this if you want to sync the weather in your server.
    end
end)

local hour = Config.Hour
local minute = Config.Minute

function syncTime()
    print(_U("time_sync"))
    minute = minute + 2

    if minute > 59 then
        minute = 0
        hour = hour + 1
    end

    world.hour = hour
    world.minute = minute
    world:RpcSet()
end

function syncWeather()
    print(_U("weather_sync"))
    world.weather = Config.WeatherType -- Choose your favourite weather
    world:RpcSet()
end

-- Notifying player login/quit
registerForEvent("player_joined", function(Player) -- Notify when players join
    print(_U("player_joined")..Player.id)
end)

registerForEvent("player_left", function(Player) -- Notify when players left
    print(_U("player_left")..Player.id)
end)
