require("config")
local players = {}
local timeBool = false
local weatherBool = false

function storePlayerInfo(Player)
    local self = {}
    self.id = Player.id
    self.gear = Player.gear
    self.gender = Player.gender
    self.house = Player.house

    return self
end


registerForEvent("init", function()
    if Config.TimeSync then syncTime() timeBool = true end
    if Config.WeatherSync then syncWeather() weatherBool = true end
end)

local lasttick = 0
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


registerForEvent("player_joined", function(Player) -- Notify when players join
    players[Player.id] = storePlayerInfo(Player)
    print("Giocatore ID: "..Player.id.." connesso con la Casata: "..Player.house.." ed il Sesso: ".. Player.gender)
end)

registerForEvent("player_left", function(Player) -- Notify when players left
    print("Giocatore ID: "..Player.id.." disconnesso")
    players[Player.id] = nil
end)

local hour = Config.Hour
local minute = Config.Minute

function syncTime()
    --print("Time is now synced")
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
    --print("Weather is now synced")
    world.weather = Config.WeatherType -- Choose your favourite weather
    world:RpcSet()
end

