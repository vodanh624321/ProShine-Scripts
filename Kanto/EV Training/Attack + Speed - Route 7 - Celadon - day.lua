name = "attack + speed: Route 7 (near Celadon)"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Celadon City and Route 7.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Celadon" then
			moveToMap("Celadon City")
		elseif getMapName() == "Celadon City" then
			moveToMap("Route 7")
		elseif getMapName() == "Route 7" then
			moveToGrass()
		end
	else
		if getMapName() == "Route 7" then
			moveToMap("Celadon City")
		elseif getMapName() == "Celadon City" then
			moveToMap("Pokecenter Celadon")
		elseif getMapName() == "Pokecenter Celadon" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and isOpponentShiny() or getOpponentName() == "Abra" then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	end
	if isOpponentEffortValue("Attack") or isOpponentEffortValue("Speed") then
		return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
	else
		if run() then
			return
		end
		return attack() or sendUsablePokemon() or sendAnyPokemon()
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

	if hasMove(1, "Teleport") then
	    return forgetMove("Teleport")
	end

	if hasMove(1, "Seismic Toss") then
	    return forgetMove("Seismic Toss")
	end

	if hasMove(1, "Disable") then
	    return forgetMove("Disable")
	end

	if hasMove(1, "Miracle Eye") then
	    return forgetMove("Miracle Eye")
	end

	if hasMove(1, "Chip Away") then
	    return forgetMove("Chip Away")
	end

	if hasMove(1, "Confusion") then
	    return forgetMove("Confusion")
	end
end