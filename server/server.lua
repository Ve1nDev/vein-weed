local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("vein-weed:ottopla")
AddEventHandler("vein-weed:ottopla", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local rewardAmount = math.random(Ve1n.OtMin, Ve1n.OtMax)
    xPlayer.Functions.AddItem(Ve1n.OtItemAdi, rewardAmount)
end)

RegisterServerEvent("vein-weed:server:otpaketle")
AddEventHandler("vein-weed:server:otpaketle", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local weedItem = xPlayer.Functions.GetItemByName(Ve1n.OtItemAdi)
    if weedItem then
        local weedAmount = weedItem.amount
        local packages = math.floor(weedAmount / 5)
        local remainingWeed = weedAmount % 5

        if packages > 0 then
            xPlayer.Functions.RemoveItem(Ve1n.OtItemAdi, packages * 5)
            xPlayer.Functions.AddItem(Ve1n.PaketlenmisOtItem, packages)

            TriggerClientEvent('QBCore:Notify', source, 'Başarıyla ' .. packages .. ' paket oluşturuldu!', 'success')
        else
            TriggerClientEvent('QBCore:Notify', source, 'Paketleyecek yeterli ot yok!', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'Envanterinizde hiç ot yok!', 'error')
    end
end)

RegisterNetEvent("vein-weed:server:otsat")
AddEventHandler("vein-weed:server:otsat", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local weedCount = xPlayer.Functions.GetItemByName(Ve1n.PaketlenmisOtItem) and xPlayer.Functions.GetItemByName(Ve1n.PaketlenmisOtItem).amount or 0

    if weedCount > 0 then
        local totalPrice = math.floor(weedCount / 1) * Ve1n.PaketBasiUcret
        xPlayer.Functions.RemoveItem(Ve1n.PaketlenmisOtItem, weedCount)
        xPlayer.Functions.AddItem(Ve1n.SatisDaGelenItem, totalPrice)

        TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'İşlenmiş Ot Sattın! Kazancın: ' .. totalPrice .. ' Karapara', length = 2500})
    else
        TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince İşlenmiş Ot Yok!', length = 2500})
    end
end)

Config.LimitedTriggers = {
    ["vein-weed:ottopla"] = {limit = 1, seconds = 3},
    ["vein-weed:server:otpaketle"] = {limit = 1, seconds = 3},
    ["vein-weed:server:otsat"] = {limit = 1, seconds = 3},--- ayarlayın bunları limitini ve saniyesini ayarlıyonuz örnepğin 2 saniye de 1 kere olabilir 2.sinde kick atıyor istediğiniz gibi ayarlayın limitleri
}


local limitedTriggers = Config.LimitedTriggers
local triggerCounts = {}

for trigger, limitData in pairs(limitedTriggers) do
    RegisterServerEvent(trigger)
    AddEventHandler(trigger, function(...)
        local src = source
        if not triggerCounts[src] then
            triggerCounts[src] = {}
        end
        if not triggerCounts[src][trigger] then
            triggerCounts[src][trigger] = {count = 0, timestamp = os.time()}
        end

        local currentTime = os.time()
        local elapsedTime = currentTime - triggerCounts[src][trigger].timestamp

        if elapsedTime > limitData.seconds then
            triggerCounts[src][trigger].count = 0
            triggerCounts[src][trigger].timestamp = currentTime
        end

        triggerCounts[src][trigger].count = triggerCounts[src][trigger].count + 1

        if triggerCounts[src][trigger].count > limitData.limit then
            DropPlayer(src, "[VE1N] Yakaladım Seni Hileci Orospu Evladııı @everyone")
        end
    end)
end