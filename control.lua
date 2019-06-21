local function withinRadius(player, radius)
    local surface = player.surface
    local position = player.position
    local entities =
        surface.find_entities_filtered {
        position = position,
        radius = radius,
        limit = 1,
        name = "uranium-ore"
    }

    return next(entities) ~= nil
end

local radiation = 0

script.on_event(
    {defines.events.on_tick},
    function(e)
        if e.tick % 60 == 0 then
            local player = game.players[1]

            local values = settings.global

            local close = values["close-range"].value
            local middle = values["middle-range"].value
            local distant = values["distant-range"].value

            if radiation > 0 and values["enable-damage"].value then
                player.character.damage(radiation / 10, "enemy")
            end

            if withinRadius(player, close) then
                radiation = radiation + values["close-radiation"].value
                local volume = player.mod_settings["close-volume"].value
                player.play_sound {path = "geiger-close", volume_modifier = volume}
            elseif withinRadius(player, middle) then
                radiation = radiation + values["middle-radiation"].value
                local volume = player.mod_settings["middle-volume"].value
                player.play_sound {path = "geiger-middle", volume_modifier = volume}
            elseif withinRadius(player, distant) then
                radiation = radiation + values["distant-radiation"].value
                local volume = player.mod_settings["close-volume"].value
                player.play_sound {path = "geiger-distant", volume_modifier = volume}
            elseif radiation > 0 then
                radiation = radiation - 1
            end
        end
    end
)
