data:extend(
    {
        {
            type = "int-setting",
            name = "distant-range",
            setting_type = "runtime-global",
            minimum_value = 30,
            maximum_value = 100,
            default_value = 40
        },
        {
            type = "int-setting",
            name = "middle-range",
            setting_type = "runtime-global",
            minimum_value = 10,
            maximum_value = 30,
            default_value = 15
        },
        {
            type = "int-setting",
            name = "close-range",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 10,
            default_value = 1
        },
        {
            type = "double-setting",
            name = "distant-volume",
            setting_type = "runtime-per-user",
            minimum_value = 0.0,
            maximum_value = 1.0,
            default_value = 0.7
        },
        {
            type = "double-setting",
            name = "middle-volume",
            setting_type = "runtime-per-user",
            minimum_value = 0.0,
            maximum_value = 1.0,
            default_value = 0.8
        },
        {
            type = "double-setting",
            name = "close-volume",
            setting_type = "runtime-per-user",
            minimum_value = 0.0,
            maximum_value = 1.0,
            default_value = 1.0
        }
    }
)
