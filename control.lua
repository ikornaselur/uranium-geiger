local function withinRadius(player, radius)
  local surface = player.surface
  local position = player.position
  local entities = surface.find_entities_filtered{
    position=position,
    radius=radius,
    limit=1,
    name="uranium-ore"
  }

  return next(entities) ~= nil;
end

script.on_event({defines.events.on_tick},
function (e)
  if e.tick % 60 == 0 then
    local player = game.players[1]

    local close = settings.global["close-range"].value
    local middle = settings.global["middle-range"].value
    local distant = settings.global["distant-range"].value

    if withinRadius(player, close) then
      local volume = player.mod_settings["close-volume"].value
      player.play_sound{path = "geiger-close", volume_modifier = volume}
    elseif withinRadius(player, middle) then
      local volume = player.mod_settings["middle-volume"].value
      player.play_sound{path = "geiger-middle", volume_modifier = volume}
    elseif withinRadius(player, distant) then
      local volume = player.mod_settings["close-volume"].value
      player.play_sound{path = "geiger-distant", volume_modifier = volume}
    end
  end
end
)

