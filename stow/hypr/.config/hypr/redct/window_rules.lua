--------------
-- MY RULES --
--------------

-- Minecraft
hl.window_rule({
	name = "workspace-minecraft",
	match = {
		initial_title = "^(Minecraft.*)$",
	},
	fullscreen = true,
	workspace = "3 silent",
	--monitor = "HDMI-A-1 silent"
})

-- QBitTorrent
-- windowrule {
--  name = windowed-qbittorrent
--  match:class = org.qbittorrent.qBittorrent
--  match:title = ^\[.+\]$
--  float = on
--  center = on
--}

-- PrismLauncherPopup
hl.window_rule({
	name = "wisndowed-prismlauncher-popup",
	match = {
		initial_class = "org.prismlauncher.PrismLauncher",
		title = "^(Please wait.*)$",
	},
	float = true,
	center = true,
	size = { 200, 100 },
	workspace = "3 silent",
	--monitor = "HDMI-A-1 silent"
})

-------------------
-- DEFAULT RULES --
-------------------
local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
