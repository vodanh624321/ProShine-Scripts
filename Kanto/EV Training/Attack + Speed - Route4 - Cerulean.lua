name = "Attack + Speed EV: Route 4 (near Cerulean)"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will only attack pokémon giving Attack + speed EV.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Cerulean City and Route 4.]]

dofile("../../Util.lua")

function onPathAction()
	if isPokemonUsable(1) ~= true and isPokemonUsable(2) then
        return swapPokemon(1,2)
    end
    -- if isPokemonUsable(1) ~= true and isPokemonUsable(3) then
    --     return swapPokemon(1,3)
    -- end
    -- if isPokemonUsable(1) ~= true and isPokemonUsable(4) then
    --     return swapPokemon(1,4)
    -- end
    -- if isPokemonUsable(1) ~= true and isPokemonUsable(5) then
    --     return swapPokemon(1,5)
    -- end

	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Cerulean" then
			moveToMap("Cerulean City")
		elseif getMapName() == "Cerulean City" then
			moveToMap("Route 4")
		elseif getMapName() == "Route 4" then
			moveToGrass()
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
	--  or getOpponentName() == "Abra" or getOpponentName() == "Jigglypuff"
	if isWildBattle() and isOpponentShiny() then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	end
	local isEventPkm = getOpponentForm() ~= 0
	if isWildBattle() and isEventPkm then
		if getOpponentHealthPercent() >= 40 then
			return weakAttack() or attack() or sendUsablePokemon() or sendAnyPokemon() or run()
		else
			return useItem("Great Ball") or useItem("Pokeball")
		end
	end
	if getActivePokemonNumber() >= 1 and (isOpponentEffortValue("Attack") 
		or isOpponentEffortValue("Speed")
		) 
	then
		return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end