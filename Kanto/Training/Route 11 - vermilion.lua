
name = "level: Route 11, Land (near Vermilion)"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Vermilion City and Route 11.]]

function onPathAction()
	if isPokemonUsable(2) and getRemainingPowerPoints(2, "Sleep Powder") then
		if getMapName() == "Pokecenter Vermilion" then
			moveToMap("Vermilion City")
		elseif getMapName() == "Vermilion City" then
			moveToMap("Route 11")
		elseif getMapName() == "Route 11" then
			moveToGrass()
		end
	else
		if getMapName() == "Route 11" then
			moveToMap("Vermilion City")
		elseif getMapName() == "Vermilion City" then
			moveToMap("Pokecenter Vermilion")
		elseif getMapName() == "Pokecenter Vermilion" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and isOpponentShiny() then
		if useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") then
			return
		end
	end

	if isWildBattle() and getOpponentName() == "Abra" then
		return useItem("Pokeball")
	end

	if isWildBattle() and getOpponentName() == "Magnemite" or getOpponentName() == "Gastly" or getOpponentName() == "Haunter" then
		if getActivePokemonNumber() == 2 and getOpponentStatus() ~= "SLEEP" then
			return useMove("Sleep Powder") or run() or sendUsablePokemon() or sendAnyPokemon()
		end

		if getActivePokemonNumber() == 1 then
            return sendPokemon(2) or run()
        end

        return useItem("Pokeball")
	end

	if getActivePokemonNumber() == 1 then
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

function onLearningMove()
	dofile("../../forgetMove.lua")
end