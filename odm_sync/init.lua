
local players = {}
local timeBool = false
local weatherBool = false
local weatherType -- do not touch



registerForEvent("init", function()
    if Config.TimeSync then syncTime() timeBool = true end
    if Config.WeatherSync then pickWeather() weatherBool = true end
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
        pickWeather()
    end
end)

function getRandomWeather(myWeatherType)
    local randomWeather = math.random(1, #Config.Seasons[myWeatherType])
    for _, _weatherType in pairs(Config.Seasons[myWeatherType]) do 
        if randomWeather == _ then 
            if weatherType ~= _weatherType then 
                weatherType = _weatherType 
                syncWeather(weatherType)
            else pickWeather() --print("dbg") 
            end
        end
    end
end

function pickWeather()
    if not Config.RealTime then
        getRandomWeather(Config.WeatherType)            
        for k,v in pairs(Config.WorldSeason) do
            if v == Config.WeatherType then server.world.season = k end
        end
    else
        for month, season in pairs(Config.RLWeather) do
            if server.world.month == month then server.world.season = season print(_U("current_season").." "..season) end
        end
        local myImportantString
            if server.world.season == 1 then myImportantString = "Summer"
            elseif server.world.season == 2 then myImportantString = "Winter"
            elseif server.world.season == 3 then myImportantString = "Autumn"
            elseif server.world.season == 4 then myImportantString = "Spring" end
        getRandomWeather(myImportantString)
    end
end

local hour = Config.Hour
local minute = Config.Minute

function syncTime()
    print(_U("time_sync"))
    if Config.RealTime then 
            time = os.date('*t')
            hour = time.hour
            minute = time.min
            server.world.day = time.day
            server.world.month = time.month
    else
        minute = minute + 2
        if minute > 59 then
            minute = 0
            hour = hour + 1
        end

    end
    print(_U("time_hour")..hour.." - ".._U("time_minute")..minute)

    server.world.hour = hour
    server.world.minute = minute
    server.world:RpcSet()
end

function syncWeather(weatherType)
    print(_U("weather_sync").." "..weatherType)
    server.world.weather = weatherType 

    server.world:RpcSet()
end

-- Notifying player login/quit
registerForEvent("player_joined", function(Player) -- Notify when players join
    print(_U("player_joined")..Player.id)

end)

registerForEvent("player_left", function(Player) -- Notify when players left
    print(_U("player_left")..Player.id)
end)
