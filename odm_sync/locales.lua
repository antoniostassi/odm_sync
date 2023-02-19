require("config")
Locales = {}

function _(str, ...) -- Translate string
    if Locales[Config.Locale] ~= nil then
        if Locales[Config.Locale][str] ~= nil then
            return string.format(Locales[Config.Locale][str], ...)
        else
            return 'Translation [' .. Config.Locale .. '][' .. str .. '] does not exist'
        end
    else
        return 'Locale [' .. Config.Locale .. '] does not exist'
    end
end

function _U(str, ...) -- Translate string first char uppercase
    return tostring(_(str, ...):gsub("^%l", string.upper))
end

Locales['en'] = {
    ['player_joined'] = "Player joined - ID: ",
    ['player_left'] = "Player just left - ID: ",
    ['time_sync'] = "Time is now synced",
    ['weather_sync'] = "Weather is now synced",
}

Locales['it'] = {
    ['player_joined'] = "Giocatore connesso con ID: ",
    ['player_left'] = "Giocatore disconnesso con ID: ",
    ['time_sync'] = "Orario sincronizzato",
    ['weather_sync'] = "Meteo sincronizzato",
}
