Config = {}

-- Language Setting
Config.Locale = "en" -- Set here your language.

-- Time Settings
Config.TimeSync = true -- Set it to false if you don't want your time to be synced
Config.Hour = 8 -- ( This number represents the game time in hours )
Config.Minute = 0 -- ( Same but with minutes )
Config.TimerToSyncTime = 30 -- This number represents the timer for every time the script has to sync the time.
Config.RealTime = true -- Set it to true if you want the Real-Life time in game

-- Weather Settings
-- IF REALTIME IS TRUE, LET "WEATHERSYNC" TRUE AND DON'T EDIT ANYTHING!
Config.WeatherSync = true -- Set it to false if you don't want your weather to be synced. ( I do not recommend this )
Config.WeatherType = "Summer" -- (OR Summer - Autumn - Spring). You have to write here one of the Seasons you can find below. You can customize your own season as you wish.
Config.TimerToSyncWeather = 600 -- If you wanna test your personal list of Weather put this number around 30 so you can test it and see changes in game.

Config.WorldSeason = {"Summer", "Winter", "Autumn", "Spring"} -- DO NOT EDIT THIS! It will automatically set your season for the weather you desire!

-- !!DO NOT EDIT SEASON'S NAME!!
Config.Seasons = {
    ['Summer'] = { "Summer_Overcast_Heavy_01","Clear","Announce","Astronomy","Default_PHY","FIG_07_Storm","ForbiddenForest_01","HighAltitudeOnly","Intro_01","LightClouds_01",
    "LightRain_01","Misty_01","MistyOvercast_01","MKT_Nov11","Overcast_01","Overcast_Heavy_01","Overcast_Windy_01","Rainy","Sanctuary_Bog","Sanctuary_Coastal","Sanctuary_Forest",
    "Sanctuary_Grasslands","Stormy_01","StormyLarge_01","TestStormShort","TestWind"}, 

    ['Winter'] = {"Clear", "Overcast_Heavy_Winter_01", "Winter_Misty_01", "Winter_Overcast_01", "Winter_Overcast_Windy_01", "Snow_01", "Snow_Const", "SnowLight_01", "SnowShort"},
    
    ['Autumn'] = {"Clear","Announce","Astronomy","Default_PHY","FIG_07_Storm","ForbiddenForest_01","HighAltitudeOnly","Intro_01","LightClouds_01","LightRain_01","Misty_01",
    "MistyOvercast_01","MKT_Nov11","Overcast_01","Overcast_Heavy_01","Overcast_Windy_01","Rainy","Sanctuary_Bog","Sanctuary_Coastal","Sanctuary_Forest","Sanctuary_Grasslands",
    "Stormy_01","StormyLarge_01","TestStormShort","TestWind",},
    
    ['Spring'] = {"Clear","Announce","Astronomy","Default_PHY","FIG_07_Storm","ForbiddenForest_01","HighAltitudeOnly","Intro_01","LightClouds_01","LightRain_01","Misty_01",
    "MistyOvercast_01","MKT_Nov11","Overcast_01","Overcast_Heavy_01","Overcast_Windy_01","Rainy","Sanctuary_Bog","Sanctuary_Coastal","Sanctuary_Forest","Sanctuary_Grasslands",
    "Stormy_01","StormyLarge_01","TestStormShort","TestWind"}
}

Config.RLWeather = {2, 2, 4, 4, 4, 1, 1, 1, 3, 3, 3, 2} -- !! DO NOT EDIT !!
