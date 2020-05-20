local koltukdegistirengel = true

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        local PlayerPed = GetPlayerPed(-1)
        local Arac = GetVehiclePedIsIn(PlayerPed, false)
		if IsPedInAnyVehicle(PlayerPed, false) and koltukdegistirengel then
    		if GetPedInVehicleSeat(Arac, 0) == PlayerPed then
				if GetIsTaskActive(PlayerPed, 165) then
					SetPedIntoVehicle(PlayerPed, Arac, 0)
				end
			end
		end
	end
end)



function round(value, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", value))
end



RegisterCommand("seat", function(source, args)
    local PlayerPed = GetPlayerPed(-1)
    local Arac = GetVehiclePedIsIn(PlayerPed, false)
    
    if args[1] == nil then
        Koltuk = -1
    else
        Koltuk = round(tonumber(args[1]-2))
    end
    if IsPedInAnyVehicle(PlayerPed, false) then
        if IsVehicleSeatFree(Arac, Koltuk) then 
            SetPedIntoVehicle(PlayerPed, Arac, Koltuk)
        else
            TriggerEvent('mythic_notify:client:SendAlert', {type = 'error', text = 'This seat is unavailable.'})
        end
    end
end)