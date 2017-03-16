name = "catch: Route 13 (near Berry Tower Reception Kanto)"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Route 13 and Berry Tower Reception Kanto.]]
health = 99
function onStart()
    caughtCount = 0
end

function onPathAction()
	if not isMounted() and hasItem("Bicycle") and not string.find(getMapName(), "Center") and not string.find(getMapName(), "Tunnel") and not string.find(getMapName(), "Stop") and not string.find(getMapName(), "Cave") and not string.find(getMapName(), "Mt") and not string.find(getMapName(), "Tower") and not string.find(getMapName(), "mansion") and not string.find(getMapName(), "Victory") and not string.find(getMapName(), "center") then
        return  useItem("Bicycle")
    end

    if isPokemonUsable(1) and getRemainingPowerPoints(1,"Sleep Powder") > 0 and getRemainingPowerPoints(1,"Leech Seed") > 0 then
		if getMapName() == "Berry Tower Reception Kanto" then
			moveToMap("Route 13")
		elseif getMapName() == "Route 13" then
			moveToGrass()
		end
	else
		if getMapName() == "Route 13" then
			moveToMap("Berry Tower Reception Kanto")
		elseif getMapName() == "Berry Tower Reception Kanto" then
			talkToNpcOnCell(4, 12)
		end
	end
end

function onBattleAction()
	if isWildBattle() and ( isOpponentShiny()  or getOpponentName() == "Happiny" or getOpponentName() == "Chansey" or getOpponentName() == "Slowpoke") then
        if health < getOpponentHealthPercent() and getRemainingPowerPoints(1,"Leech Seed") > 0 then
            return useMove("Leech Seed") or useItem("Pokeball") or weakAttack()
        end

        if (getOpponentStatus() ~= "SLEEP") and getRemainingPowerPoints(1,"Sleep Powder") > 0 then
            -- If you want to use Sleep Powder, then replace with Hypnosis
            return useMove("Sleep Powder") or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendUsablePokemon() or sendAnyPokemon()
        else
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendUsablePokemon() or sendAnyPokemon()
        end
    end

    return attack() or run() or sendAnyPokemon()
end

function onBattleMessage(message)
    if stringContains(message, "Success! You caught") then
        caughtCount = caughtCount + 1
    end
end

function onPause()
    log("Current, you caught:" .. caughtCount .. " Chanseys. ")
end

function onStop()
    log("You caught total: " .. caughtCount .. " Chanseys. ")
end
