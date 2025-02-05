local QBCore = exports['qb-core']:GetCoreObject()

local OtYerleri = Ve1n.OtYerleri

CreateThread(function()
    for _, coords in ipairs(OtYerleri) do -- "prop_weed_02
        local prop = CreateObject(Ve1n.OtPropu, coords.x, coords.y, coords.z, false, false, false)
        if DoesEntityExist(prop) then
            SetEntityAsMissionEntity(prop, true, true)
            FreezeEntityPosition(prop, true)
            PlaceObjectOnGroundProperly(prop)

            exports['qb-target']:AddTargetEntity(prop, {
                options = {
                    {
                        label = "Otu Topla",
                        action = function()
                            OtToplamaYaBasla()
                        end,
                        icon = "fas fa-leaf",
                    }
                },
                distance = 2.0
            })
        end
    end
end)

function OtToplamaYaBasla()
    QBCore.Functions.Progressbar("ot_toplama", "Otu topluyorsun...", 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "creatures@rottweiler@tricks@",
        anim = "petting_franklin",
        flags = 49
    }, {}, {}, function()
        TriggerServerEvent('vein-weed:ottopla')
        ClearPedTasks(PlayerPedId())
    end, function()
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify("Toplama işlemi iptal edildi!", "error")
    end)
end
---------------------------------------------------------------
Citizen.CreateThread(function()
    local npcModel = Ve1n.PaketlemeNpcModel
    local npcCoords = Ve1n.PaketlemeNpcYeri
    local paketleme_npcheading = Ve1n.PaketlemeNpcYeriHeading

    RequestModel(npcModel)
    while not HasModelLoaded(npcModel) do
        Wait(500)
    end

    local npc = CreatePed(4, GetHashKey(npcModel), npcCoords.x, npcCoords.y, npcCoords.z, paketleme_npcheading, false, true)
    SetEntityAsMissionEntity(npc, true, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityVisible(npc, true, false)

    exports['qb-target']:AddTargetEntity(npc, {
        options = {
            {
                type = "client",
                event = "vein-weed:client:otpaketle",
                icon = "fas fa-leaf",
                label = "Bütün Otları Paketle",
            },
        },
        distance = 1.5
    })
end)

RegisterNetEvent('vein-weed:client:otpaketle')
AddEventHandler('vein-weed:client:otpaketle', function()
    QBCore.Functions.Progressbar("ot_paketleme", "Otları Paketliyorsun", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("vein-weed:server:otpaketle")
    end, function()
        TriggerClientEvent('QBCore:Notify', source, 'İşlem iptal edildi!', 'error')
    end)
end)
-----------------------------------------------------------------
Citizen.CreateThread(function()
local satis_npcModel = Ve1n.SatisNpcModel
local satis_npcCoords = Ve1n.SatisNpcKordinatlar  --vector3(-274.2, 2193.5, 129.81) 
local satis_npcheading = Ve1n.SatisNpcHeading -- 163.23

RequestModel(satis_npcModel)
while not HasModelLoaded(satis_npcModel) do
    Wait(500)
end

local satis_npc = CreatePed(4, GetHashKey(satis_npcModel), satis_npcCoords.x, satis_npcCoords.y, satis_npcCoords.z, satis_npcheading, false, true)
SetEntityAsMissionEntity(satis_npc, true, true)
FreezeEntityPosition(satis_npc, true)
SetEntityInvincible(satis_npc, true)
SetBlockingOfNonTemporaryEvents(satis_npc, true)
SetEntityVisible(satis_npc, true, false)

exports['qb-target']:AddTargetEntity(satis_npc, {
    options = {
        {
            type = "client",
            event = "vein-weed:client:otsat",
            icon = "fas fa-leaf",
            label = "Paketlenmiş otları sat",
        },
    },
    distance = 1.5
})
end)

RegisterNetEvent('vein-weed:client:otsat')
AddEventHandler('vein-weed:client:otsat', function()
QBCore.Functions.Progressbar("ot_satis", "Paketlenmiş Otları Satıyorsun...", 4000, false, true, {
    disableMovement = true,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true,
}, {}, {}, {}, function()
    TriggerServerEvent("vein-weed:server:otsat")
end, function()
    TriggerClientEvent('QBCore:Notify', source, 'İşlem iptal edildi!', 'error')
end)
end)

CreateThread(function()
    for _, blip in pairs(Ve1n.Blips) do
        local blipHandle = AddBlipForCoord(blip.coords)

        SetBlipSprite(blipHandle, blip.sprite)
        SetBlipScale(blipHandle, blip.scale)
        SetBlipColour(blipHandle, blip.colour)
        SetBlipAsShortRange(blipHandle, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(blip.label)
        EndTextCommandSetBlipName(blipHandle)
    end
end)