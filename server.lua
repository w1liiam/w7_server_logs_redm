-- Collecting Values --

local webhook = "https://discord.com/api/webhooks/782621446144917504/IjRxwqWfQMQOcd4toNetYHzZOrI4kddwO8t_Fq5KK1e1NDMooDOELS_80y2Vlg6Bo0z1"
local name = "Western Log"
local logo = "https://cdn.discordapp.com/attachments/705017727957336165/765153188524851200/1609855.png" -- Must end with png, jpg e.t.c.




-- Player Connecting Event --

AddEventHandler('playerConnecting', function()
    local playerName = GetPlayerName(source)
    local playerIp = GetPlayerEndpoint(source)
    local playerHex = GetPlayerIdentifier(source)
    local playerPing = GetPlayerPing(source)
    local connecting = {
        {
            ["color"] = "000000",
            ["title"] = "Player Connecting",
            ["description"] = "Player Name: *"..playerName.."*\n\nPlayer IP: *"..playerIp.."*\n\nPlayer Steam Hex: *"..playerHex.."*\n Player Ping: *"..playerPing.."*",
	        ["footer"] = {
                ["text"] = name,
                ["icon_url"] = logo,
            },
        }
    }

    
-- Sending Embed To Discord Webhook --

PerformHttpRequest(webhook, function (err, text, headers) end, 'POST', json.encode({username = name, embeds = connecting}), { ['Content-Type'] = 'application/json' })
end)



-- Player Disconnecting Event --
AddEventHandler('playerDropped', function(reason)
    local playerName = GetPlayerName(source)
    local playerIp = GetPlayerEndpoint(source)
    local playerPing = GetPlayerPing(source)
    local playerHex = GetPlayerIdentifier(source)
    local playerId = source
    local disconnecting = {
        {
            ["color"] = "000000",
            ["title"] = "Player Disconnecting",
            ["description"] = "Player Name: *"..playerName.."*\n\nReason: *"..reason.."*\n\nPlayer IP: *"..playerIp.."*\n\nPlayer Steam Hex: *"..playerHex.."*\n Player Ping: *"..playerPing.."*",
            ["footer"] = {
                ["text"] = name,
                ["icon_url"] = logo,
            },
        }
    }




-- Sending Embed To Discord Webhook --

PerformHttpRequest(webhook, function (err, text, headers) end, 'POST', json.encode({username = name, embeds = disconnecting}), { ['Content-Type'] = 'application/json' })
end)