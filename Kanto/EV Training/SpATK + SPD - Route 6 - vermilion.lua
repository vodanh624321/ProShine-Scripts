
name = "SpAttack EV: Route 6, Land (near Vermilion)"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will only attack pokémon giving special attack + speed EV.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Vermilion City and Route 6.]]

function onPathAction()
	if isPokemonUsable(2) and getRemainingPowerPoints(2, "Sleep Powder") >= 1 and getRemainingPowerPoints(1, "Dark Pulse") >= 1 then
		if getMapName() == "Pokecenter Vermilion" then
			moveToMap("Vermilion City")
		elseif getMapName() == "Vermilion City" then
			moveToMap("Route 6")
		elseif getMapName() == "Route 6" then
			moveToRectangle(25, 48, 27, 52)
		end
	else
		if getMapName() == "Route 6" then
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

	if isOpponentEffortValue("SpAttack") or isOpponentEffortValue("Speed") then
		if getPokemonName(1) == "Haunter" then
			if getOpponentName() == "Rattata" or getOpponentName() == "Raticate" or getOpponentName() == "Meowth" or getOpponentName() == "Persian" or getOpponentName() == "Pidgey" or getOpponentName() == "Pidgeotto" then
				if useMove("Dark Pulse") then
					return
				end

				return run()
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