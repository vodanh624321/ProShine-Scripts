name = "Leveling: Victory Road Kanto 3F"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere on Victory Road Kanto 3F.]]

--supports up to 5 stops, leave unused stops blank--
city = "Indigo Plateau"
pokecenter = "Indigo Plateau Center"
stop1 = ""
stop2 = ""
stop3 = ""
stop4 = ""
stop5 = ""
endLocation = "Victory Road Kanto 3F"

--if no city, and pokecenter is on route, change this to true, and leave city blank--
pokecenterOnRoute = false

--pokemon center at location(pokecenterX, pokecenterY)--
pokecenterIsNPC = true
pokecenterX = 4
pokecenterY = 22

--Leave this true unless you are not fighting/catching in grass--
lookForGrass = false

--If the above is false, what rectangle do you want to walk within at your endLocation?--
rectX1 = 28
rectY1 = 18
rectX2 = 32
rectY2 = 21

--the below will be the percentage of your opponent's health we'll start throwing balls at--
--DEFAULT: 30--
percentToStartThrowing = 30
--DEFAULT: 50--
percentToStartThrowingIfShiny = 100

--Do you want to catch shineys and uncaught pokemon?--
catchShineys = true

catchNotCaught = true

--Do you only want to catch pokemon, and not level?--
onlyCatch = false

--the below is case-sensitive, add more moves by adding commas. ex : onlyCatchThesePokemon = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}--
--Even if you set all other capture variables to false, we'll still try to catch these/this pokemon--
--Leave an empty "" here if you aren't using it--
catchThesePokemon = {"Charmander", "Abra", "Onix"}

--the below will be the percentage of your last alive poke's health that we'll stop fighting at--
--DEFAULT: 50--
healthToRunAt = 1

--Level to stop levelling mons, set to a value over 100 if you are just catching and have a lvl 100 team--
levelPokesTo = 99

dofile("../../Util.lua")

function onPathAction()
    changePokeUsable()
if getUsablePokemonCount() > 1 and getPokemonHealthPercent(getTeamSize()) >= healthToRunAt and isPokemonUsable(ReturnHighestIndexUnderLevel()) then
    
    -- if not onlyCatch and not IsSorted() then
    --     sortTeamByLevelAscending()
    -- else
    if not isMounted() and hasItem("Bicycle") and not string.find(getMapName(), "Center") and not string.find(getMapName(), "Tunnel") and not string.find(getMapName(), "Stop") and not string.find(getMapName(), "Cave") and not string.find(getMapName(), "Mt") and not string.find(getMapName(), "Tower") and not string.find(getMapName(), "mansion") and not string.find(getMapName(), "Victory") and not string.find(getMapName(), "center") then
        useItem("Bicycle")
        log("Getting on bike.")

    elseif stops == 0 and pokecenterOnRoute then
        if getMapName() == pokecenter then
            moveToMap(endLocation)
        elseif getMapName() == endLocation then
            if lookForGrass then
                moveToGrass()
            else
                moveToRectangle(rectX1, rectY1, rectX2, rectY2)
            end
        end
    
    elseif stops == 0 and not pokecenterOnRoute then
        if getMapName() == pokecenter then
            moveToMap(city)
        elseif getMapName() == city then
            moveToMap(endLocation)
        elseif getMapName() == endLocation then
            if lookForGrass then
                moveToGrass()
            else
                moveToRectangle(rectX1, rectY1, rectX2, rectY2)
            end
        end
    
    elseif stops == 1 then
        if getMapName() == pokecenter then
            moveToMap(city)
        elseif getMapName() == city then
            moveToMap(stop1)
        elseif getMapName() == stop1 then
            moveToMap(endLocation)
        elseif getMapName() == endLocation then
            if lookForGrass then
                moveToGrass()
            else
                moveToRectangle(rectX1, rectY1, rectX2, rectY2)
            end
        end
        
    elseif stops == 2 then
        if getMapName() == pokecenter then
            moveToMap(city)
        elseif getMapName() == city then
            moveToMap(stop1)
        elseif getMapName() == stop1 then
            moveToMap(stop2)
        elseif getMapName() == stop2 then
            moveToMap(endLocation)
        elseif getMapName() == endLocation then
            if lookForGrass then
                moveToGrass()
            else
                moveToRectangle(rectX1, rectY1, rectX2, rectY2)
            end
        end
    
    elseif stops == 3 then
        if getMapName() == pokecenter then
            moveToMap(city)
        elseif getMapName() == city then
            moveToMap(stop1)
        elseif getMapName() == stop1 then
            moveToMap(stop2)
        elseif getMapName() == stop2 then
            moveToMap(stop3)
        elseif getMapName() == stop3 then
            moveToMap(endLocation)
        elseif getMapName() == endLocation then
            if lookForGrass then
                moveToGrass()
            else
                moveToRectangle(rectX1, rectY1, rectX2, rectY2)
            end
        end
    
    elseif stops == 4 then
        if getMapName() == pokecenter then
            moveToMap(city)
        elseif getMapName() == city then
            moveToMap(stop1)
        elseif getMapName() == stop1 then
            moveToMap(stop2)
        elseif getMapName() == stop2 then
            moveToMap(stop3)
        elseif getMapName() == stop3 then
            moveToMap(stop4)
        elseif getMapName() == stop4 then
            moveToMap(endLocation)
        elseif getMapName() == endLocation then
            if lookForGrass then
                moveToGrass()
            else
                moveToRectangle(rectX1, rectY1, rectX2, rectY2)
            end
        end
        
    elseif stops == 5 then
        if getMapName() == pokecenter then
            moveToMap(city)
        elseif getMapName() == city then
            moveToMap(stop1)
        elseif getMapName() == stop1 then
            moveToMap(stop2)
        elseif getMapName() == stop2 then
            moveToMap(stop3)
        elseif getMapName() == stop3 then
            moveToMap(stop4)
        elseif getMapName() == stop4 then
            moveToMap(stop5)
        elseif getMapName() == stop5 then
            moveToMap(endLocation)
        elseif getMapName() == endLocation then
            if lookForGrass then
                moveToGrass()
            else
                moveToRectangle(rectX1, rectY1, rectX2, rectY2)
            end
        end
    end
        
        
else 
    if stops == 0 and pokecenterOnRoute then
        if getMapName() == endLocation then
            moveToMap(pokecenter)
        elseif getMapName() == pokecenter then
            if pokecenterIsNPC then
                talkToNpcOnCell(pokecenterX, pokecenterY)
            else
                usePokecenter()
            end
        end
        
    elseif not isMounted() and hasItem("Bicycle") and not string.find(getMapName(), "Center") and not string.find(getMapName(), "Tunnel") and not string.find(getMapName(), "Stop") and not string.find(getMapName(), "Cave") and not string.find(getMapName(), "Mt") and not string.find(getMapName(), "Tower") and not string.find(getMapName(), "mansion") and not string.find(getMapName(), "Victory") and not string.find(getMapName(), "center") then
        useItem("Bicycle")
        log("Getting on bike.")
    
    elseif stops == 0 and not pokecenterOnRoute then
        if getMapName() == endLocation then
            moveToMap(city)
        elseif getMapName() == city then
            moveToMap(pokecenter)
        elseif getMapName() == pokecenter then
            if pokecenterIsNPC then
                talkToNpcOnCell(pokecenterX, pokecenterY)
            else
                usePokecenter()
            end
        end
    
    elseif stops == 1 then
        if getMapName() == endLocation then
            moveToMap(stop1)
        elseif getMapName() == stop1 then
            moveToMap(city)
        elseif getMapName() == city then
            moveToMap(pokecenter)
        elseif getMapName() == pokecenter then
            if pokecenterIsNPC then
                talkToNpcOnCell(pokecenterX, pokecenterY)
            else
                usePokecenter()
            end
        end
        
    elseif stops == 2 then
        if getMapName() == endLocation then
            moveToMap(stop2)
        elseif getMapName() == stop2 then
            moveToMap(stop1)
        elseif getMapName() == stop1 then
            moveToMap(city)
        elseif getMapName() == city then
            moveToMap(pokecenter)
        elseif getMapName() == pokecenter then
            if pokecenterIsNPC then
                talkToNpcOnCell(pokecenterX, pokecenterY)
            else
                usePokecenter()
            end
        end
    
    elseif stops == 3 then
        if getMapName() == endLocation then
            moveToMap(stop3)
        elseif getMapName() == stop3 then
            moveToMap(stop2)
        elseif getMapName() == stop2 then
            moveToMap(stop1)
        elseif getMapName() == stop1 then
            moveToMap(city)
        elseif getMapName() == city then
            moveToMap(pokecenter)
        elseif getMapName() == pokecenter then
            if pokecenterIsNPC then 
                talkToNpcOnCell(pokecenterX, pokecenterY)
            else
                usePokecenter()
            end
        end
    
    elseif stops == 4 then
        if getMapName() == endLocation then
            moveToMap(stop4)
        elseif getMapName() == stop4 then
            moveToMap(stop3)
        elseif getMapName() == stop3 then
            moveToMap(stop2)
        elseif getMapName() == stop2 then
            moveToMap(stop1)
        elseif getMapName() == stop1 then
            moveToMap(city)
        elseif getMapName() == city then
            moveToMap(pokecenter)
        elseif getMapName() == pokecenter then
            if pokecenterIsNPC then 
                talkToNpcOnCell(pokecenterX, pokecenterY)
            else
                usePokecenter()
            end
        end
        
    elseif stops == 5 then
        if getMapName() == endLocation then
            moveToMap(stop5)
        elseif getMapName() == stop5 then
            moveToMap(stop4)
        elseif getMapName() == stop4 then
            moveToMap(stop3)
        elseif getMapName() == stop3 then
            moveToMap(stop2)
        elseif getMapName() == stop2 then
            moveToMap(stop1)
        elseif getMapName() == stop1 then
            moveToMap(city)
        elseif getMapName() == city then
            moveToMap(pokecenter)
        elseif getMapName() == pokecenter then
            if pokecenterIsNPC then
                talkToNpcOnCell(pokecenterX, pokecenterY)
            else
                usePokecenter()
            end
        end
    end
end --condition--
end --func--

function onBattleAction()
    if getActivePokemonNumber() <= getTeamSize() then
        if isWildBattle() and ((isOpponentShiny() and catchShineys) or (catchNotCaught and not isAlreadyCaught())) or IsPokemonOnCaptureList() then
            if getPokemonHealthPercent(getTeamSize()) > healthToRunAt then
                if isPokemonUsable(getActivePokemonNumber()) then
                    if getOpponentHealthPercent() >= percentToStartThrowing and not isOpponentShiny() then
                        return weakAttack()
                    else
                        if useItem("Pokeball") or useItem("Great Ball") then
                            return
                        else
                            return attack() or sendUsablePokemon() or run()
                        end
                    end
                    if getOpponentHealthPercent() >= percentToStartThrowingIfShiny and isOpponentShiny() then
                        return weakAttack()
                    else
                        if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
                            return
                        else
                            return attack() or sendUsablePokemon() or run()
                        end
                    end
                else
                    return sendUsablePokemon()
                end
            else
                return run()
            end
        else
            if getPokemonHealthPercent(getTeamSize()) < healthToRunAt or onlyCatch then
                return run()
            else
                return attack() or sendUsablePokemon() or run()
            end
        end
    end
end
