name = "level: Route 18 (near Fuchsia)"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Fuchsia City and Route 18.]]

function onPathAction()
    -- if isPokemonUsable(3) and isPokemonUsable(2) ~= true then
    --     return swapPokemon(2,3)
    -- end
    if getUsablePokemonCount() <= 3 then
        if getMapName() == "Route 18" then
            moveToMap("Fuchsia City")
        elseif getMapName() == "Fuchsia City" then
            moveToMap("Pokecenter Fuchsia")
        elseif getMapName() == "Pokecenter Fuchsia" then
            usePokecenter()
        end
    else
        if getMapName() == "Pokecenter Fuchsia" then
            moveToMap("Fuchsia City")
        elseif getMapName() == "Fuchsia City" then
            moveToMap("Route 18")
        elseif getMapName() == "Route 18" then
            moveToGrass()
        end
    end
end

function onBattleAction()
    if isWildBattle() and (hasItem("Pokeball")) then
        if (getOpponentName() == "Abra") then
            if (hasMove(1, "Sleep Powder") or hasMove(1, "Hypnosis")) and getOpponentStatus() ~= "SLEEP" then
                return useMove("Sleep Powder") or useMove("Hypnosis") or useItem("Pokeball")
            end

            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")
        end

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
    
        if getActivePokemonNumber() >= 1 then
            -- return attack() or sendUsablePokemon() or run()
            if getPokemonName(1) == "Haunter" then
                if getOpponentName() == "Rattata" or getOpponentName() == "Raticate" or getOpponentName() == "Meowth" or getOpponentName() == "Persian" or getOpponentName() == "Pidgey" or getOpponentName() == "Pidgeotto" then
                    return useMove("Dark Pulse") or sendUsablePokemon() or sendAnyPokemon() or run()
                end
            end
        end

    end

    return attack() or sendUsablePokemon() or run()

 --    if isWildBattle() and isOpponentShiny() then
 --        if getOpponentStatus() ~= "SLEEP" and (getPokemonName(1) == "Gloom" or getPokemonName(2) == "Gloom") then
 --            return useMove("Sleep Powder") or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")
 --        end

 --        return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")
 --    end

	-- if getActivePokemonNumber() <= 5 then
	-- 	if getPokemonName(1) == "Haunter" then
	-- 		if getOpponentName() == "Rattata" or getOpponentName() == "Raticate" or getOpponentName() == "Meowth" or getOpponentName() == "Persian" or getOpponentName() == "Pidgey" or getOpponentName() == "Pidgeotto" then

	-- 			return useMove("Dark Pulse") or sendUsablePokemon() or sendAnyPokemon() or run()
	-- 		end
	-- 	end

	-- 	return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
	-- else
	-- 	if run() then
	-- 		return
	-- 	end
	-- 	return attack() or sendUsablePokemon() or sendAnyPokemon()
	-- end
end

dofile("../../KeepMoves.lua")
function onLearningMove(moveName, pokemonIndex)
    PokemonsName = getPokemonName(pokemonIndex)
    log(PokemonsName .. " is learning a new move " .. moveName)
    if forgetAnyMoveExcept(PokemonsName) then
        return
    else 
        dofile("../../forgetMove.lua")
    end
end