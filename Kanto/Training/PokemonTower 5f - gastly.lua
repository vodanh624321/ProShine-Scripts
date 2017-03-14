name = "Pokemon Tower Gastly Catcher"
author = "Dung Le"
description = "Catches Gastly & shinies in the Pokemon Tower. Uses in first slot Leech Seed and Sleep Powder"

health = 99
function onStart()
    caughtCount = 0
end

function onPathAction()
    if getMapName() == "Pokecenter Lavender" then
        moveToMap("Lavender Town")
    elseif getMapName() == "Lavender Town" then
        moveToMap("Pokemon Tower 1F")
    elseif getMapName() == "Pokemon Tower 1F" then
        moveToMap("Pokemon Tower 2F")
    elseif getMapName() == "Pokemon Tower 2F" then
        moveToMap("Pokemon Tower 3F")
    elseif getMapName() == "Pokemon Tower 3F" then
        moveToMap("Pokemon Tower 4F")
    elseif getMapName() == "Pokemon Tower 4F" then
        moveToMap("Pokemon Tower 5F")
    end
    
    if isPokemonUsable(1) and getRemainingPowerPoints(1,"Sleep Powder") > 0 and getRemainingPowerPoints(1,"Leech Seed") > 0 then
        if getMapName() == "Pokemon Tower 5F" then
            moveToMap("Pokemon Tower 6F")
        elseif getMapName() == "Pokemon Tower 6F" then
            moveToMap("Pokemon Tower 7F")
        elseif getMapName() == "Pokemon Tower 7F" then
            moveToRectangle(7, 9, 11, 13)
        end
    else
        if getMapName() == "Pokemon Tower 7F" then
            moveToMap("Pokemon Tower 6F")
        elseif getMapName() == "Pokemon Tower 6F" then
            moveToMap("Pokemon Tower 5F")
        elseif getMapName() == "Pokemon Tower 5F" then
            talkToNpcOnCell(9,10)
        end
    end
end

function onBattleAction()
    if isWildBattle() and ( isOpponentShiny()  or getOpponentName() == "Gastly" or getOpponentName() == "Haunter") then
        if health < getOpponentHealthPercent() then
            return useMove("Leech Seed") or sendAnyPokemon()
        end

        if (getOpponentStatus() ~= "SLEEP") then
            -- If you want to use Sleep Powder, then replace Hypnosis with Sleep Powder 
            return useMove("Sleep Powder") or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendUsablePokemon() or sendAnyPokemon()
        else
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendUsablePokemon() or sendAnyPokemon()
        end
    end

    return run() or sendAnyPokemon()
end

function onBattleMessage(message)
    if stringContains(message, "Success! You caught") then
        caughtCount = caughtCount + 1
    end
end

function onPause()
    log("Current, you caught:" .. caughtCount .. " Gastlys. ")
end

function onStop()
    log("You caught total: " .. caughtCount .. " Gastlys. ")
end