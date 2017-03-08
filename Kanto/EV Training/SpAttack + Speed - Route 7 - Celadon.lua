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
	if isWildBattle() and isOpponentShiny() then
		if useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") then
			return
		end
	end

	if isWildBattle() and getOpponentName() == "Abra" then
		return useItem("Pokeball")
	end

	if isWildBattle() and getOpponentName() == "Magnemite" then
		if getActivePokemonNumber() == 1 then
            return sendPokemon(2)
		elseif ( getActivePokemonNumber() == 2 ) and ( getOpponentStatus() ~= "SLEEP" ) and hasMove("Sleep Powder") then
			return useMove("Sleep Powder") or run()
		elseif ( getActivePokemonNumber() == 2 ) or ( getOpponentStatus() == "SLEEP" ) then
			return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")
		end
		
		return useItem("Pokeball")
	end

	if isOpponentEffortValue("SpAttack") or isOpponentEffortValue("Speed") then
		if getPokemonName(1) == "Haunter" then
			if getOpponentName() == "Rattata" or getOpponentName() == "Meowth" then
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

	if hasMove(1, "Future Sight") then
	    return forgetMove("Future Sight")
	end

	if hasMove(1, "Mean Lock") then
	    return forgetMove("Mean Lock")
	end

	if hasMove(1, "Curse") then
	    return forgetMove("Curse")
	end

	if hasMove(1, "Sucker Punch") then
	    return forgetMove("Sucker Punch")
	end

	if hasMove(1, "Confuse Ray") then
	    return forgetMove("Confuse Ray")
	end

	if hasMove(1, "Shadow Punch") then
	    return forgetMove("Shadow Punch")
	end

	if hasMove(1, "Dream Eater") then
	    return forgetMove("Dream Eater")
	end

	if hasMove(1, "Chip Away") then
	    return forgetMove("Chip Away")
	end

	if hasMove(1, "Confusion") then
	    return forgetMove("Confusion")
	end
end