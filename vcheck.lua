local label = 
  [[
    //        
    ||  ________   ________    _____  ________  ________     
    || |\   ___  \|\   ____\  / __  \|\   __  \|\   __  \    
    || \ \  \\ \  \ \  \___|_|\/_|\  \ \  \|\  \ \  \|\  \   
    ||  \ \  \\ \  \ \_____  \|/ \ \  \ \  \\\  \ \  \\\  \  
    ||   \ \  \\ \  \|____|\  \   \ \  \ \  \\\  \ \  \\\  \ 
    ||    \ \__\\ \__\____\_\  \   \ \__\ \_______\ \_______\
    ||     \|__| \|__|\_________\   \|__|\|_______|\|_______|
    ||               \|_________|                                                                              
    ||
    ||
    ||
    ||                       Contact me: NS100#0001                      
    ||
  ]]

-- Returns the current version set in fxmanifest.lua
function GetCurrentVersion()
    return GetResourceMetadata( GetCurrentResourceName(), "version" )
end 

-- Grabs the latest version number from the web GitHub
PerformHttpRequest( "https://raw.githubusercontent.com/ehjay041/PurifyRP/main/Version.txt?token=AQ773NRAFP7BLJSJF2T6T4DA2OTMG", function( err, text, headers )
    
    Citizen.Wait( 2100 )
    print( label )

    local curVer = GetCurrentVersion()
    
    if ( text ~= nil ) then 
        print( "  ||    Current version: " .. curVer )
        print( "  ||    Latest recommended version: " .. text .."\n  ||" )
        if ( text ~= curVer ) then
            print( "  ||    ^1NS100 | Server Developer.\n^0  \\\\\n" )
        else
            print( "  ||    ^2TestRp V1 is up to date!\n^0  ||\n  \\\\\n" )
        end
    else 
        -- In case the version can not be requested, print out an error message
        print( "  ||    ^1There was an error getting the latest version information, if the issue persists double check if your version text is public on github.\n^0  ||\n  \\\\\n" )
    end 
end )
