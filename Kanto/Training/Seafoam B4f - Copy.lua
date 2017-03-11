name = "Leveling: Seafoam B4"
author = "Dung Le"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere on Seafoam B4.]]

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
    -- if isPokemonUsable(5) and isPokemonUsable(1) ~= true then
    --     return swapPokemon(1,5)
    -- end
	if getUsablePokemonCount() > 2 then
		if getMapName() == "Seafoam B4F" then
			moveToRectangle(50, 24, 55, 26)
		end
	else
		if getMapName() == "Seafoam B4F" then
			talkToNpcOnCell(59, 13)
		end
	end
end

function onBattleAction()
	if isWildBattle() and (isOpponentShiny() or getOpponentName() == "Slowpoke" or getOpponentName() == "Slowbro") then
		if useItem("Pokeball") then
			return
		end
	end
	if getActivePokemonNumber() == 1 or getActivePokemonNumber() == 2 or getActivePokemonNumber() == 3 or getActivePokemonNumber() == 4 then
		return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end

dofile("../../KeepMoves.lua")
function onLearningMove(moveName, pokemonIndex)
    PokemonsName = getPokemonName(pokemonIndex)
    log(PokemonsName .. " is learning a new move " .. moveName)
    if move[PokemonsName] and forgetAnyMoveExcept(move[PokemonsName]) then
        return
    else 
        dofile("../../forgetMove.lua")
    end
end
