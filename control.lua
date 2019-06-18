local function withinRadius(player, radius)
  local surface = player.surface
  local position = player.position
  local entities = surface.find_entities_filtered{
    position=position,
    radius=radius,
    limit=1,
    name="uranium-ore"
  }

  for _, _ in pairs(entities) do
    return true
  end

  return false
end

script.on_event({defines.events.on_tick},
function (e)
  if e.tick % 60 == 0 then
    local player = game.players[1]

    if withinRadius(player, 1) then
      player.play_sound{path = "geiger-close"}
    elseif withinRadius(player, 10) then
      player.play_sound{path = "geiger-middle"}
    elseif withinRadius(player, 25) then
      player.play_sound{path = "geiger-distant"}
    end
  end
end
)

