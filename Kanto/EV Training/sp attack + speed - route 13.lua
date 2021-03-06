name = "Sp attack + speed: Route 13 (near Berry Tower Reception Kanto)"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Route 13 and Berry Tower Reception Kanto.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Berry Tower Reception Kanto" then
			moveToMap("Route 13")
		elseif getMapName() == "Route 13" then
			moveToGrass()
		end
	else
		if getMapName() == "Route 13" then
			moveToMap("Berry Tower Reception Kanto")
		elseif getMapName() == "Berry Tower Reception Kanto" then
			talkToNpcOnCell(4, 12)
		end
	end
end

function onBattleAction()
	if isWildBattle() and isOpponentShiny() or getOpponentName() == "Abra" then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	end
	if isOpponentEffortValue("SpAttack") or isOpponentEffortValue("Speed") then
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

	if hasMove(1, "Chip Away") then
	    return forgetMove("Chip Away")
	end

	if hasMove(1, "Confusion") then
	    return forgetMove("Confusion")
	end
end