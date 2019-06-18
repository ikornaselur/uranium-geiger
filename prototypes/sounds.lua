data:extend({
  {
    type = "sound",
    name = "geiger-counter",
    filename = "__uranium_geiger__/sounds/geiger.ogg",
    volume = 0.5,
    aggregation = {
      max_count = 2,
      remove = false,
      count_already_playing = true,
      progress_threshold = 3
    }
  },
})
