-- ENV VARIABLES --
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice-Right")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- INPUT --
hl.config({
	input = {
		kb_layout = "es",
		kb_variant = "nodeadkeys",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
		accel_profile = "flat",
		touchpad = {
			natural_scroll = false,
		},
	},
})

-- MISC --
hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
})
