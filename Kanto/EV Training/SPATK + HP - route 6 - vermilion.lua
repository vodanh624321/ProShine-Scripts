
name = "SpAttack EV: Route 6, Water (near Vermilion)"
author = "Dung Le"
description = [[Water - This script will train the first pokémon of your team.
It will only attack pokémon giving special attack + HP EV.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Vermilion City and Route 6.]]

dofile("../../Util.lua")

function onPathAction()
	-- if not isMounted() and hasItem("Bicycle") and not string.find(getMapName(), "Center") and not string.find(getMapName(), "Tunnel") and not string.find(getMapName(), "Stop") and not string.find(getMapName(), "Cave") and not string.find(getMapName(), "Mt") and not string.find(getMapName(), "Tower") and not string.find(getMapName(), "mansion") and not string.find(getMapName(), "Victory") and not string.find(getMapName(), "center") then
 --        return  useItem("Bicycle")
 --    end
    -- if not isPokemonUsable(1) and isPokemonUsable(2) then
    --     return swapPokemon(1,2)
    -- end

	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Vermilion" then
			moveToMap("Vermilion City")
		elseif getMapName() == "Vermilion City" then
			moveToMap("Route 6")
		elseif getMapName() == "Route 6" and 13 <= getPlayerX() and 44 <= getPlayerY() and getPlayerX() <= 38 and getPlayerY() <= 61 then
			moveToCell(23,42)
		elseif getMapName() == "Route 6" then
			moveToWater()
		end
	else
		if getMapName() == "Route 6" then
			moveToMap("Vermilion City")
		elseif getMapName() == "Vermilion City" then
			moveToMap("Pokecenter Vermilion")
		elseif getMapName() == "Pokecenter Vermilion" then
			usePokecenter()
		end
	end
end
isRun = 1
function onBattleAction()
	if isWildBattle() and isOpponentShiny() then
		isRun = 1
		if useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") then
			return
		end
	end

	if isWildBattle() and getOpponentName() == "Abra" then
		isRun = 1
		return useItem("Pokeball")
	end

	if isWildBattle() and (getOpponentName() == "Magnemite" or getOpponentName() == "Gastly" or getOpponentName() == "Haunter") then 
		isRun = 1
		if getOpponentHealthPercent() > 30 then
			return weakAttack() or useItem("Pokeball") or attack() or sendAnyPokemon()
		else 
			return useItem("Pokeball") or attack() or sendAnyPokemon()
		end
	end

	if isOpponentEffortValue("SpAttack") or isOpponentEffortValue("HP") then
		isRun = 1
		return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
	else
		isRun = isRun + 1
		if isRun < 5 then
			return run()
		else
			isRun = 1
			return attack() or sendUsablePokemon() or sendAnyPokemon()
		end
	end
end
