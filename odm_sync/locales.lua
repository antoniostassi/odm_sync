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

Locales['fr'] = { -- Layenz
    ['player_joined'] = "Un joueur a rejoint - ID: ",
    ['player_left'] = "Un joueur vient de se déconnecter - ID: ",
    ['time_sync'] = "Le temps est maintenant synchronisé",
    ['weather_sync'] = "La météo est maintenant synchronisée",
}

Locales['pl'] = { -- Credits to SamWieszKto
    ['player_joined'] = "Gracz dołączył - ID: ",
    ['player_left'] = "Gracz rozłączył się - ID: ",
    ['time_sync'] = "Czas został zsynchronizowany",
    ['weather_sync'] = "Pogoda została zsynchronizowana",
}

Locales['de'] = { -- Credits to .voy
    ['player_joined'] = "Spieler beigetreten - ID: ",
    ['player_left'] = "Spieler verlassen - ID: ",
    ['time_sync'] = "Zeit ist nun synchronisiert",
    ['weather_sync'] = "Wetter ist nun synchronisiert",
}