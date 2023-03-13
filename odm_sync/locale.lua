require('config')
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
    ['time_hour'] = "Hour: ",
    ['time_minute'] = "Minute: ",
    ['current_season'] = "The season is now in sync with the real world. Season ID:",
    ['weather_command'] = "The weather has been changed:",
    ['weather_syntax'] = "Use this syntax: ?weather WEATHER_TYPE"
}

Locales['it'] = {
    ['player_joined'] = "Giocatore connesso con ID: ",
    ['player_left'] = "Giocatore disconnesso con ID: ",
    ['time_sync'] = "Orario sincronizzato",
    ['weather_sync'] = "Meteo sincronizzato",
    ['time_hour'] = "Ora: ",
    ['time_minute'] = "Minuti: ",
    ['current_season'] = "La stagione e' ora sincronizzata con il mondo reale. ID Stagione:",
    ['weather_command'] = "</><slytherin>La condizione atmosferica è stata cambiata:",
    ['weather_syntax'] = "</><gryffindor>Utilizza la seguente sintassi: ?weather WEATHER_TYPE",
    ['season_syntax'] = "</><gryffindor>Utilizza la seguente sintassi: ?season NUMERO_STAGIONE",
    ['time_syntax'] = "</><gryffindor>Utilizza la seguente sintassi: ?time ORA MINUTI",
    ['time_command'] = "</><slytherin>L'orario e` stato cambiato. Ora sono le:",
    ['welcome_message'] = "</><hufflepuff> Benvenuto, sei loggato come Admin."
}

Locales['fr'] = { -- Credits to Layenz
    ['player_joined'] = "Un joueur a rejoint - ID: ",
    ['player_left'] = "Un joueur vient de se déconnecter - ID: ",
    ['time_sync'] = "Le temps est maintenant synchronisé",
    ['weather_sync'] = "La météo est maintenant synchronisée",
    ['time_hour'] = "Heure: ",
    ['time_minute'] = "Minute: ",
    ['current_season'] = "La saison est maintenant en phase avec le monde réel. ID de saison:",
    ['weather_command'] = "COME TO LOCALE LUA FILE AND TRANSLATE THIS"
}

Locales['pl'] = { -- Credits to SamWieszKto
    ['player_joined'] = "Gracz dołączył - ID: ",
    ['player_left'] = "Gracz rozłączył się - ID: ",
    ['time_sync'] = "Czas został zsynchronizowany",
    ['weather_sync'] = "Pogoda została zsynchronizowana",
    ['time_hour'] = "Godzina: ",
    ['time_minute'] = "Minuta: ",
    ['current_season'] = "Sezon jest teraz zsynchronizowany z prawdziwym światem. Identyfikator sezonu:",
    ['weather_command'] = "COME TO LOCALE LUA FILE AND TRANSLATE THIS"
}

Locales['de'] = { -- Credits to .voy
    ['player_joined'] = "Spieler beigetreten - ID: ",
    ['player_left'] = "Spieler verlassen - ID: ",
    ['time_sync'] = "Zeit ist nun synchronisiert",
    ['weather_sync'] = "Wetter ist nun synchronisiert",
    ['time_hour'] = "Stunde: ",
    ['time_minute'] = "Minute: ",
    ['current_season'] = "Die Saison ist jetzt synchron mit der realen Welt. Saison-ID:",
    ['weather_command'] = "COME TO LOCALE LUA FILE AND TRANSLATE THIS"
}