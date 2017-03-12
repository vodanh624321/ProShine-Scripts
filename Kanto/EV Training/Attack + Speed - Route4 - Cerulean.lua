name = "Attack EV: Route 4 (near Cerulean)"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will only attack pokémon giving speed EV.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Cerulean City and Route 4.]]

dofile("../../Util.lua")

function onPathAction()
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
	if isWildBattle() and (isOpponentShiny() or getOpponentName() == "Abra" or getOpponentName() == "Jigglypuff") then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	end
	if getActivePokemonNumber() == 1 or getActivePokemonNumber() == 2 and (isOpponentEffortValue("Attack") or isOpponentEffortValue("Speed")) then
		return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end