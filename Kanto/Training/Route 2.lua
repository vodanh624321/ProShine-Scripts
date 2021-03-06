name = "Attack + Speed EV: Route 2 (near Viridian)"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will only attack pokémon giving attack + speed EV.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Viridian City and Route 2.]]

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

	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Viridian" then
			moveToMap("Viridian City")
		elseif getMapName() == "Viridian City" then
			moveToMap("Route 2")
		elseif getMapName() == "Route 2" then
			moveToGrass()
		end
	else
		if getMapName() == "Route 2" then
			moveToMap("Viridian City")
		elseif getMapName() == "Viridian City" then
			moveToMap("Pokecenter Viridian")
		elseif getMapName() == "Pokecenter Viridian" then
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
	
	if getActivePokemonNumber() == 1 then
		return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end