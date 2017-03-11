stops = 0
startMoney = 0

function onStart()
   pcVisits = 0
   shinyCounter = 0
   wildCounter = 0
   if stop1 ~= "" then
      stops = stops + 1
   end
   if stop2 ~= "" then
      stops = stops + 1
   end
   if stop3 ~= "" then
      stops = stops + 1
   end
   if stop4 ~= "" then
      stops = stops + 1
   end
   if stop5 ~= "" then
      stops = stops + 1
   end

   -- startLevel1 = getPokemonLevel(1)
   -- startLevel2 = getPokemonLevel(2)
   -- startLevel3 = getPokemonLevel(3)
   -- startLevel4 = getPokemonLevel(4)
   -- startLevel5 = getPokemonLevel(5)
   -- startLevel6 = getPokemonLevel(6)
   startMoney = getMoney()
   log("You have currently " .. startMoney .. " Pokedollars.")
   -- log("Your " .. getPokemonName(1) .. " is Level " .. startLevel1 .. ".")
   -- log("Your " .. getPokemonName(2) .. " is Level " .. startLevel2 .. ".")
   -- log("Your " .. getPokemonName(3) .. " is Level " .. startLevel3 .. ".")
   log("Start botting.")
end


function IsSorted()
    if getTeamSize() == 1 then
        return true
    elseif getTeamSize() == 2 then
        if getPokemonLevel(1) <= getPokemonLevel(2) then
            return true
        else
            return false
        end
    elseif getTeamSize() == 3 then
        if getPokemonLevel(1) <= getPokemonLevel(2) and getPokemonLevel(2) <= getPokemonLevel(3) then
            return true
        else
            return false
        end
    elseif getTeamSize() == 4 then
        if getPokemonLevel(1) <= getPokemonLevel(2) and getPokemonLevel(2) <= getPokemonLevel(3) and getPokemonLevel(3) <= getPokemonLevel(4) then
            return true
        else
            return false
        end
    elseif getTeamSize() == 5 then
        if getPokemonLevel(1) <= getPokemonLevel(2) and getPokemonLevel(2) <= getPokemonLevel(3) and getPokemonLevel(3) <= getPokemonLevel(4) and getPokemonLevel(4) <= getPokemonLevel(5) then
            return true
        else
            return false
        end
    -- elseif getTeamSize() == 6 then
        -- if getPokemonLevel(1) <= getPokemonLevel(2) and getPokemonLevel(2) <= getPokemonLevel(3) and getPokemonLevel(3) <= getPokemonLevel(4) and getPokemonLevel(4) <= getPokemonLevel(5) and getPokemonLevel(5) <= getPokemonLevel(6) then
            -- return true
        -- else
            -- return false
        -- end
    end
end

function ReturnHighestIndexUnderLevel()
    result = 0
    for i = 1, getTeamSize(), 1 do
        if getPokemonLevel(i) < levelPokesTo then
            result = i
        end
    end
    return result
end

function IsPokemonOnCaptureList()
    result = false
    if catchThesePokemon[1] ~= "" then
    for i = 1, TableLength(catchThesePokemon), 1 do
        if getOpponentName() == catchThesePokemon[i] then
            result = true
            break
        end
    end
    end
    return result
end

function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function onPause()
   log("***********************************PAUSED - SESSION STATS***********************************")
   -- log("Your First Pokemon, ".. getPokemonName(1) ..", has gained ".. (getPokemonLevel(1) - startLevel1) .." levels!")
   -- log("Your Second Pokemon, ".. getPokemonName(2) ..", has gained ".. (getPokemonLevel(2) - startLevel2) .." levels!")
   -- log("Your Third Pokemon, ".. getPokemonName(3) ..", has gained ".. (getPokemonLevel(3) - startLevel3) .." levels!")
   -- log("Your Four Pokemon, ".. getPokemonName(4) ..", has gained ".. (getPokemonLevel(4) - startLevel4) .." levels!")
   -- log("Your Five Pokemon, ".. getPokemonName(5) ..", has gained ".. (getPokemonLevel(5) - startLevel5) .." levels!")
   -- log("Your Six Pokemon, ".. getPokemonName(6) ..", has gained ".. (getPokemonLevel(6) - startLevel6) .." levels!")
   log("You have earned ".. tostring(getMoney() - startMoney) .." PokeDollars!")
   log("Shinies Caught: " .. shinyCounter)
   log("Pokemons encountered: " .. wildCounter)
   log("You have visited the PokeCenter ".. pcVisits .." times.")
   log("*********************************************************************************************")
end

function onResume()
   log("SESSION RESUMED")
end

function onDialogMessage(pokecenter)
   if stringContains(pokecenter, "Would you like me to heal your Pokemon?") then
       pcVisits = pcVisits + 1
   end
end

function onBattleMessage(wild)
   if stringContains(wild, "A Wild SHINY") then
       shinyCounter = shinyCounter + 1
   elseif stringContains(wild, "A Wild") then
       wildCounter = wildCounter + 1
   end
end

dofile("../../KeepMoves.lua")
function onLearningMove(moveName, pokemonIndex)
    PokemonsName = getPokemonName(pokemonIndex)
    log(PokemonsName .. " is learning a new move " .. moveName)
    if moves[PokemonsName] and forgetAnyMoveExcept(moves[PokemonsName]) then
        return
    else
        dofile("../../forgetMove.lua")
    end
end