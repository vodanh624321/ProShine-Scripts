name = "Leveling: Seafoam B4"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere on Seafoam B4.]]

dofile("../../Util.lua")
battalePoke = 1
maxLevel = 96
function onPathAction()
	if getMapName() == "Pokecenter Fuchsia" then
            moveToMap("Fuchsia City")
        elseif getMapName() == "Fuchsia City" then
            moveToMap("Fuchsia City Stop House")
        elseif getMapName() == "Fuchsia City Stop House" then
            moveToMap("Route 19")
        elseif getMapName() == "Route 19" then
            moveToMap("Route 20")
        elseif getMapName() == "Route 20" then
            moveToCell(60, 32)
        elseif getMapName() == "Seafoam 1F" then
            moveToMap("Seafoam B1F")
        elseif getMapName() == "Seafoam B1F" then
            moveToMap("Seafoam B2F")
        elseif getMapName() == "Seafoam B2F" then
            moveToMap("Seafoam B3F")
        elseif getMapName() == "Seafoam B3F" then
            moveToCell(57, 26)
    end

	if isPokemonUsable(1) ~= true and isPokemonUsable(2) and getPokemonLevel(2) <= maxLevel then
        return swapPokemon(1,2)
    end
    if isPokemonUsable(1) ~= true and isPokemonUsable(3) and getPokemonLevel(3) <= maxLevel then
        return swapPokemon(1,3)
    end
    if isPokemonUsable(1) ~= true and isPokemonUsable(4) and getPokemonLevel(4) <= maxLevel then
        return swapPokemon(1,4)
    end
    if isPokemonUsable(5) and isPokemonUsable(1) ~= true and getPokemonLevel(5) <= maxLevel then
        return swapPokemon(1,5)
    end
	if getUsablePokemonCount() > 1 then
		if getMapName() == "Seafoam B4F" then
			moveToRectangle(50, 24, 55, 26)
		end
	else
		if getMapName() == "Seafoam B4F" then
			talkToNpcOnCell(59, 13)
		end
	end
end

function onBattleAction()
	battalePoke = getActivePokemonNumber()

	if isWildBattle() and (isOpponentShiny() or getOpponentName() == "Slowpoke" or getOpponentName() == "Slowbro") then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	end

	if getPokemonLevel(battalePoke) <= maxLevel
		-- if battalePoke == 1 or battalePoke == 2 or battalePoke == 3 
		-- or battalePoke == 4 
		then
		return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
