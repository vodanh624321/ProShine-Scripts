name = "Leveling: Victory Road Kanto 3F"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere on Victory Road Kanto 3F.]]

dofile("../../Util.lua")

function onPathAction()
	if isPokemonUsable(1) ~= true and isPokemonUsable(2) then
        return swapPokemon(1,2)
    end
    if isPokemonUsable(1) ~= true and isPokemonUsable(3) then
        return swapPokemon(1,3)
    end
    if isPokemonUsable(1) ~= true and isPokemonUsable(4) then
        return swapPokemon(1,4)
    end
    if isPokemonUsable(5) and isPokemonUsable(1) ~= true then
        return swapPokemon(1,5)
    end
	if getUsablePokemonCount() > 1 then
		if getMapName() == "Indigo Plateau Center" then
			moveToMap("Indigo Plateau")
		elseif getMapName() == "Indigo Plateau" then
			moveToMap("Victory Road Kanto 3F")
		elseif getMapName() == "Victory Road Kanto 3F" then
			moveToRectangle(28, 18, 32, 21)
		end
	else
		if getMapName() == "Victory Road Kanto 3F" then
			moveToMap("Indigo Plateau")
		elseif getMapName() == "Indigo Plateau" then
			moveToMap("Indigo Plateau Center")
		elseif getMapName() == "Indigo Plateau Center" then
			talkToNpcOnCell(4, 22)
		end
	end
end

function onBattleAction()
	if isWildBattle() and isOpponentShiny() then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	end
	if getUsablePokemonCount() > 1 then
		return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
