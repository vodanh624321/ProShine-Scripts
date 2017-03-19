
name = "SpAttack EV: Route 6, Land (near Vermilion)"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will only attack pokémon giving special attack + speed EV.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Vermilion City and Route 6.]]
dofile("../../Util.lua")
battlePoke = 1
maxLevel = 96
function onPathAction()
	if not isMounted() and hasItem("Bicycle") and not string.find(getMapName(), "Center") and not string.find(getMapName(), "Tunnel") and not string.find(getMapName(), "Stop") and not string.find(getMapName(), "Cave") and not string.find(getMapName(), "Mt") and not string.find(getMapName(), "Tower") and not string.find(getMapName(), "mansion") and not string.find(getMapName(), "Victory") and not string.find(getMapName(), "center") then
        return  useItem("Bicycle")
    end
    if not isPokemonUsable(1) and isPokemonUsable(2) then
        return swapPokemon(1,2)
    end

    -- if getPokemonLevel(1) > maxLevel then
    -- 	return
    -- end

	if getUsablePokemonCount() > 4
		-- and getRemainingPowerPoints(2, "Sleep Powder") >= 1 
		-- and getRemainingPowerPoints(battlePoke, "Dark Pulse") >= 1 
		then
		if getMapName() == "Pokecenter Vermilion" then
			moveToMap("Vermilion City")
		elseif getMapName() == "Vermilion City" then
			moveToMap("Route 6")
		elseif getMapName() == "Route 6" then
			moveToGrass()
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

function onBattleAction()
	battlePoke = getActivePokemonNumber()
	if isWildBattle() and isOpponentShiny() then
		if useItem("Great Ball") or useItem("Ultra Ball") or useItem("Pokeball") then
			return
		end
	end

	if isWildBattle() and getOpponentName() == "Abra" then
		return useItem("Pokeball")
	end

	-- if isWildBattle() and (getOpponentName() == "Slowpoke" or getOpponentName() == "Magnemite" or getOpponentName() == "Gastly" or getOpponentName() == "Haunter") then 
	-- 	if getOpponentHealthPercent() > 30 then
	-- 		return weakAttack() or useItem("Pokeball") or attack() or sendAnyPokemon()
	-- 	else 
	-- 		return useItem("Pokeball") or attack() or sendAnyPokemon()
	-- 	end
	-- end

	if getPokemonLevel(battlePoke) <= maxLevel and (isOpponentEffortValue("SpAttack") or isOpponentEffortValue("Speed")) then
		-- if hasMove(battlePoke, "Dark Pulse") and getRemainingPowerPoints(battlePoke, "Dark Pulse") >= 1 and (getPokemonName(battlePoke) == "Haunter" or getPokemonName(battlePoke) == "Gastly") then
		-- 	if getOpponentName() == "Rattata" or getOpponentName() == "Raticate" or getOpponentName() == "Meowth" or getOpponentName() == "Persian" or getOpponentName() == "Pidgey" or getOpponentName() == "Pidgeotto" then

		-- 		return useMove("Dark Pulse") or run()
		-- 	end
		-- else
			-- return sendUsablePokemon() or sendAnyPokemon()
		-- end

		return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
	else
		if run() then
			return
		end
		return attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
