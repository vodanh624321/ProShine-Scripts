name = "Leveling: Seafoam B4"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere on Seafoam B4.]]

dofile("../../Util.lua")
battalePoke = 1

function onPathAction()
	if getPokemonName(battalePoke) == "Magnemite" and getPokemonLevel(battalePoke) > 96 then
		return
	end
	if isPokemonUsable(1) ~= true and isPokemonUsable(2) then
        return swapPokemon(1,2)
    end
    if isPokemonUsable(1) ~= true and isPokemonUsable(3) then
        return swapPokemon(1,3)
    end
    if isPokemonUsable(1) ~= true and isPokemonUsable(4) then
        return swapPokemon(1,4)
    end
    -- if isPokemonUsable(5) and isPokemonUsable(1) ~= true then
    --     return swapPokemon(1,5)
    -- end
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
	if getPokemonName(battalePoke) == "Magnemite" and getPokemonLevel(battalePoke) > 96 then
		return run()
	end

	if isWildBattle() and (isOpponentShiny() or getOpponentName() == "Slowpoke" or getOpponentName() == "Slowbro") then
		if useItem("Pokeball") then
			return
		end
	end
	if battalePoke == 1 or battalePoke == 2 or battalePoke == 3 or battalePoke == 4 then
		return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
