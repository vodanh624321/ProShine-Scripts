name = "Leveling: Cinnabar 3f"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere on Cinnabar 3f.]]
function onPathAction()
    if isPokemonUsable(1) ~= true and isPokemonUsable(2) then
        return swapPokemon(1,2)
    end
    if isPokemonUsable(1) ~= true and isPokemonUsable(3) then
        return swapPokemon(1,3)
    end
    if isPokemonUsable(1) ~= true and isPokemonUsable(4) then
        return swapPokemon(1,4)
    end
    if getUsablePokemonCount() > 2 then
        if getMapName() == "Pokecenter Cinnabar" then
            moveToMap("Cinnabar Island")
        elseif getMapName() == "Cinnabar Island" then
                if not isMounted() then
                return useItem("Bicycle")
            else moveToMap("Cinnabar mansion 1")
                end
        elseif getMapName() == "Cinnabar mansion 1" then
            moveToMap("Cinnabar mansion 2")
        elseif getMapName() == "Cinnabar mansion 2" then
            moveToMap("Cinnabar mansion 3")
        elseif getMapName() == "Cinnabar mansion 3" then
            moveToRectangle(1,11,14,18)
        end
    else
        if getMapName() == "Cinnabar mansion 3" then
            moveToMap("Cinnabar mansion 2")
        elseif getMapName() == "Cinnabar mansion 2" then
            moveToMap("Cinnabar mansion 1")
        elseif getMapName() == "Cinnabar mansion 1" then
            moveToMap("Cinnabar Island")
        elseif getMapName() == "Cinnabar Island" then
                if not isMounted() then
                return useItem("Bicycle")
            else moveToMap("Pokecenter Cinnabar")
                end
        elseif getMapName() == "Pokecenter Cinnabar" then
            usePokecenter()
        end
    end
end


function onBattleAction()

-- [[This script will try to capture shinies/[PokemonName] with Sync on 1st slot,
-- sends 2nd Pokemon(False Swipe) and at 1hp 3rd Pokemon(Sleep Powder) or (4th Pokemon if 3rd is already faint) and then by throwing balls based on priority.
-- Your 1st Pokemon needs to be Sync.
-- Your 2nd Pokemon needs to be False Swipe.
-- Your 3rd Pokemon needs to be Sleep Powder / Hypnosis / Spore.
-- ]]
    -- if isWildBattle() and ( isOpponentShiny() or (getOpponentName() == "[[PokemonName]]" ) ) then
    --     if getActivePokemonNumber() == 1 then
    --         return sendPokemon(2) or run()
    --     elseif ( getActivePokemonNumber() == 2 ) and ( getOpponentHealth() > 1 ) then
    --         return weakAttack() or run()
    --     elseif ( getActivePokemonNumber() == 2 ) and ( getOpponentHealth() == 1 ) then
    --         return sendPokemon(3) or sendPokemon(4)
    --     elseif ( getActivePokemonNumber() == 3 ) and ( getOpponentHealth() == 1 ) and ( getOpponentStatus() ~= "SLEEP" ) then
    --         return useMove("Sleep Powder") or useMove("Hypnosis") or sendPokemon(4) 
    --     elseif ( getOpponentStatus() == "SLEEP" ) or ( getOpponentHealth() == 1 ) then
    --         return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")
    --     end
    --     return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")
    -- end
    if isWildBattle() and (hasItem("Pokeball")) then

        if (isOpponentShiny() or getOpponentName() == "Magnemite" or getOpponentName() == "Magneton" or getOpponentName() == "Gastly" or getOpponentName() == "Haunter" or getOpponentName() == "Magikarp" or getOpponentName() == "Gyarados") then
            if getActivePokemonNumber() == 1 then
                return sendPokemon(2) or sendPokemon(3) or useItem("Pokeball")
            elseif ( getOpponentStatus() ~= "SLEEP" ) then
                return useMove("Sleep Powder") or useMove("Hypnosis") or sendPokemon(3) or sendPokemon(4) or useItem("Pokeball")
            elseif ( getOpponentStatus() == "SLEEP" ) then
                return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")
            end
        
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")
        end
    
        if getActivePokemonNumber() > 2 then
            return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
        end

    end

    return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
end