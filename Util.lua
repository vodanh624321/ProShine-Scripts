function onStart()
   pcVisits = 0
   shinyCounter = 0
   wildCounter = 0
   startLevel1 = getPokemonLevel(1)
   startLevel2 = getPokemonLevel(2)
   startLevel3 = getPokemonLevel(3)
   startLevel4 = getPokemonLevel(4)
   startLevel5 = getPokemonLevel(5)
   startLevel6 = getPokemonLevel(6)
   startMoney = getMoney()
   log("You have currently " .. getMoney() .. " Pokedollars.")
   log("Your " .. getPokemonName(1) .. " is Level " .. startLevel1 .. ".")
   log("Your " .. getPokemonName(2) .. " is Level " .. startLevel2 .. ".")
   log("Your " .. getPokemonName(3) .. " is Level " .. startLevel3 .. ".")
   log("Start botting.")
end

function onPause()
   log("***********************************PAUSED - SESSION STATS***********************************")
   log("Your First Pokemon, ".. getPokemonName(1) ..", has gained ".. (getPokemonLevel(1) - startLevel1) .." levels!")
   log("Your Second Pokemon, ".. getPokemonName(2) ..", has gained ".. (getPokemonLevel(2) - startLevel2) .." levels!")
   log("Your Third Pokemon, ".. getPokemonName(3) ..", has gained ".. (getPokemonLevel(3) - startLevel3) .." levels!")
   log("Your Four Pokemon, ".. getPokemonName(4) ..", has gained ".. (getPokemonLevel(4) - startLevel4) .." levels!")
   log("Your Five Pokemon, ".. getPokemonName(5) ..", has gained ".. (getPokemonLevel(5) - startLevel5) .." levels!")
   log("Your Six Pokemon, ".. getPokemonName(6) ..", has gained ".. (getPokemonLevel(6) - startLevel6) .." levels!")
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
   if stringContains(wild, "A Wild SHINY ") then
       shinyCounter = shinyCounter + 1
   elseif stringContains(wild, "A Wild ") then
       wildCounter = wildCounter + 1
   end
end