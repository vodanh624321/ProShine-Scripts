name = "level: Digletts Cave Entrance 2 (near Vermilion)"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Vermilion City and Digletts Cave Entrance 2.]]

function onPathAction()
	if isPokemonUsable(1) and isPokemonUsable(2) and getRemainingPowerPoints(2, "Sleep Powder") then
		if getMapName() == "Pokecenter Vermilion" then
            moveToMap("Vermilion City")
        elseif getMapName() == "Vermilion City" then
            moveToMap("Route 11")
        elseif getMapName() == "Route 11" then
            moveToMap("Digletts Cave Entrance 2")
        elseif getMapName() == "Digletts Cave Entrance 2" then
            moveToRectangle(15,19,25,27)
        end
	else
		if getMapName() == "Digletts Cave Entrance 2" then
            moveToMap("Route 11")
        elseif getMapName() == "Route 11" then
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
        if getActivePokemonNumber() == 2 and getOpponentStatus() ~= "SLEEP" then
            return useMove("Sleep Powder") or run() or sendUsablePokemon() or sendAnyPokemon()
        end

        if getActivePokemonNumber() == 1 then
            return sendPokemon(2) or run()
        end

        return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")
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