
name = "Level: Route 24 (near Cerulean)"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will only attack pokémon giving attack + speed EV.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Cerulean City and Route 24.]]

dofile("../../Util.lua")

function onPathAction()
	if isPokemonUsable(1) ~= true and isPokemonUsable(2) then
        return swapPokemon(1,2)
    end

	if getUsablePokemonCount() > 3  then
		if getMapName() == "Pokecenter Cerulean" then
			moveToMap("Cerulean City")
		elseif getMapName() == "Cerulean City" then
			moveToMap("Route 24")
		elseif getMapName() == "Route 24" and 14 <= getPlayerX() and 1 <= getPlayerY() and getPlayerX() <= 15 and getPlayerY() <= 30 then
			moveToMap("Route 25")
		elseif getMapName() == "Route 25" then
			moveToCell(9, 30)
		elseif getMapName() == "Route 24" and 6 <= getPlayerX() and 1 <= getPlayerY() and getPlayerX() <= 10 and getPlayerY() <= 17 then
			moveToRectangle(6, 2, 8, 5)
		end
	else
		if getMapName() == "Route 24" and 6 <= getPlayerX() and 1 <= getPlayerY() and getPlayerX() <= 10 and getPlayerY() <= 17 then
			moveToMap("Route 25")
		elseif getMapName() == "Route 25" then
			moveToCell(14, 30)
		elseif getMapName() == "Route 24" and 14 <= getPlayerX() and 1 <= getPlayerY() and getPlayerX() <= 15 and getPlayerY() <= 30 then
			moveToMap("Cerulean City")
		elseif getMapName() == "Cerulean City" then
			moveToMap("Pokecenter Cerulean")
		elseif getMapName() == "Pokecenter Cerulean" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and (isOpponentShiny() or getOpponentName() == "Abra") then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	end
	if getUsablePokemonCount() > 3 then
		return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end

