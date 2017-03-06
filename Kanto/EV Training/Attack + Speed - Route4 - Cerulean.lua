name = "Attack EV: Route 4 (near Cerulean)"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will only attack pokémon giving speed EV.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Cerulean City and Route 4.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Cerulean" then
			moveToMap("Cerulean City")
		elseif getMapName() == "Cerulean City" then
			moveToMap("Route 4")
		elseif getMapName() == "Route 4" then
			moveToRectangle(74, 25, 79, 28)
		end
	else
		if getMapName() == "Route 4" then
			moveToMap("Cerulean City")
		elseif getMapName() == "Cerulean City" then
			moveToMap("Pokecenter Cerulean")
		elseif getMapName() == "Pokecenter Cerulean" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and isOpponentShiny() then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	end
	if getActivePokemonNumber() == 1 and isOpponentEffortValue("Attack") then
		return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
	elseif getActivePokemonNumber() == 1 and isOpponentEffortValue("Speed") then
		return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end

function onLearningMove()
    if hasMove(1, "Poison Sting") then
	    return forgetMove("Poison Sting")
	end
	
	if hasMove(1, "Leer") then
	    return forgetMove("Leer")
	end

	if hasMove(1, "Harden") then
	    return forgetMove("Harden")
	end
	
	if hasMove(1, "Bubblebeam") then
	    return forgetMove("Bubblebeam")
	end

	if hasMove(1, "Double Kick") then
	    return forgetMove("Double Kick")
	end

	if hasMove(1, "Peck") then
	    return forgetMove("Peck")
	end

	if hasMove(1, "Chip Away") then
	    return forgetMove("Chip Away")
	end
end