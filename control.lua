
script.on_event({defines.events.on_tick},
function (e)
  if e.tick % 60 == 0 then
    local radius = 5
    local player = game.players[1]
    local pos = player.position
    local surface = player.surface

    for _, _ in pairs(surface.find_entities_filtered{
        position=pos,
        radius=radius,
        limit=1,
        name="uranium-ore"
      }) do
      player.play_sound{path = "geiger-counter", position=pos}
    end
  end
end
)

