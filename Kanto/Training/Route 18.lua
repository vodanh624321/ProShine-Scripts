name = "level: Route 18 (near Fuchsia)"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Fuchsia City and Route 18.]]
-- function onPathAction()
--     if isPokemonUsable(3) and isPokemonUsable(2) ~= true then
--         swapPokemon(2,3)
--     end
-- end
function onPathAction()
    if isPokemonUsable(3) and isPokemonUsable(2) ~= true then
        return swapPokemon(2,3)
    end
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
    if isWildBattle() and isOpponentShiny() then
        if getOpponentStatus() ~= "SLEEP" and getPokemonName() == "Gloom" then
            return useMove("Sleep Powder") or sendUsablePokemon() or sendAnyPokemon()
        end

        return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")
    end

	if getActivePokemonNumber() <= 5 then
		if getPokemonName(1) == "Haunter" then
			if getOpponentName() == "Rattata" or getOpponentName() == "Raticate" or getOpponentName() == "Meowth" or getOpponentName() == "Persian" or getOpponentName() == "Pidgey" or getOpponentName() == "Pidgeotto" then

				return useMove("Dark Pulse") or run()
			end
		end

		return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
	else
		if run() then
			return
		end
		return attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end

function onLearningMove(moveName, pokemonIndex)
    if pokemonIndex == 1 then
        return forgetAnyMoveExcept({"Sleep Powder", "Cut"})
    end
    dofile("../../forgetMove.lua")
end