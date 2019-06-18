data:extend({
  {
    type = "sound",
    name = "geiger-close",
    filename = "__uranium_geiger__/sounds/geiger-close.ogg",
    volume = 0.7,
    aggregation = {
      max_count = 2,
      remove = true,
      count_already_playing = true,
      progress_threshold = 3
    }
  },
  {
    type = "sound",
    name = "geiger-middle",
    filename = "__uranium_geiger__/sounds/geiger-middle.ogg",
    volume = 0.6,
    aggregation = {
      max_count = 2,
      remove = true,
      count_already_playing = true,
      progress_threshold = 2
    }
  },
  {
    type = "sound",
    name = "geiger-distant",
    filename = "__uranium_geiger__/sounds/geiger-distant.ogg",
    volume = 0.5,
    aggregation = {
      max_count = 2,
      remove = true,
      count_already_playing = true,
      progress_threshold = 3
    }
  },
})
