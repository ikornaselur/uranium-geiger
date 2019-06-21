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
    local close = 1
    local middle = 15
    local distant = 40

    if withinRadius(player, close) then
      player.play_sound{path = "geiger-close"}
    elseif withinRadius(player, middle) then
      player.play_sound{path = "geiger-middle"}
    elseif withinRadius(player, distant) then
      player.play_sound{path = "geiger-distant"}
    end
  end
end
)

