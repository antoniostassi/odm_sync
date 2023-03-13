
local Admin = false

function UpdateLoggedPlayers(player)
    table.insert(Staff.LoggedPlayers, player)
end

function CheckStaff(player)
    for i,_ in pairs(Staff.Admins) do
        if _ == player.discord_id then 
            Admin = true 
            table.insert(Staff.LoggedAdmins, player.discord_id) 
            print(json.encode(Staff.LoggedAdmins)) 
            player.SendSystemMessage(player, _U("welcome_message"))
        end
    end
end

-- Command to change season or weather
registerForEvent("player_chat", function(player, message)

    local words = {}
    local weFoundIt = false
    words[1], words[2] = message:match("(%w+)(.+)")
    
    -- Weather
    if string.find(message,"?weather") then
            if Admin then
                for k,v in pairs (Config.Seasons[Config.WeatherType]) do
                    if string.find(words[2], v) then 
                    server.world.weather = v
                    server.world:RpcSet()
                    player.SendSystemMessage(player, _U("weather_command").." "..words[2])
                    weFoundIt = true
                    end
                end
                if not weFoundIt then
                    player.SendSystemMessage(player, _U("weather_syntax"))
                    player.SendSystemMessage(player, json.encode(Config.Seasons[Config.WeatherType]))
                end
            else
                player.SendSystemMessage(player, "<Gryffindor>You're not an admin.")
            end
        return true
    end

    -- Season
    if string.find(message,"?season") then
        if Admin then
            _k = tonumber(words[2])
            if _k ~= nil then
            server.world.season = _k
            server.world:RpcSet()
            player.SendSystemMessage(player, _U("weather_command").." "..words[2])
            for k,v in pairs(Config.WorldSeason) do
                if _k == k then Config.WeatherType = v print(v) end
            end
            else
            player.SendSystemMessage(player, _U("season_syntax"))
            player.SendSystemMessage(player, "1 = Estate, 2 = Inverno, 3 = Autunno, 4 = Primavera")
            end
            
        else
            player.SendSystemMessage(player, "<Gryffindor>You're not an admin.")
        end
    return true
end
    
    -- Time
    if string.find(message,"?time") then
        if Admin then
            hour = tonumber(words[2])
            if hour == nil then player.SendSystemMessage(player, _U("time_syntax")) 
            else
            server.world.hour = hour
            server.world:RpcSet()
            player.SendSystemMessage(player, _U("time_command").." "..server.world.hour..":"..server.world.minute)
            end
        else
            player.SendSystemMessage(player, "<Gryffindor>You're not an admin.")
        end
    return true
    end
    
    -- Coords
    if string.find(message, "?coords") then
        if Admin then
            local position = player.time_point.movement.position
            player.SendSystemMessage(player, "X = "..position.x.." Y = "..position.y.." Z = "..position.z)
            print(player.name.."'s Position: X = "..position.x.." Y = "..position.y.." Z = "..position.z)
        else
            player.SendSystemMessage(player, "<Gryffindor>You're not an admin.")
        end
        return true
    end
end)
