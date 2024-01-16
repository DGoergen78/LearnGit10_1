function Game.SpawnVehicleAtCoords(car, x, y, z, h, inVeh)
    if type(x) == 'vector3' then 
        h = y
        inVeh = z
        x, y, z = table.unpack(x)
    end
    if type(x) == 'vector4' then 
        inVeh = y
        x, y, z, h = table.unpack(x)
    end
    print(x, y, z, h, inVeh)
    local ped = GetPlayerPed(-1)
    local car = GetHashKey(car)
    RequestModel(car)
    while not HasModelLoaded(car) do 
        RequestModel(car)
        Citizen.Wait(50)
    end
    local spawned_car = CreateVehicle(car, x, y, z, h, true, false)
    if inVeh ~= false then 
        SetPedIntoVehicle(ped, spawned_car, -1)
    end
    SetVehicleOnGroundProperly(spawned_car)
    SetModelAsNoLongerNeeded(car)
    SetVehicleHasBeenOwnedByPlayer(spawned_car, true)
    local id = NetworkGetNetworkIdFromEntity(spawned_car)
    SetNetworkIdCanMigrate(id, true)
    return spawned_car
end
