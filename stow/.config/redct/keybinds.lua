---@diagnostic disable: undefined-global
require("redct/variables")
require("redct/functions")
-----------------
-- MY KEYBINDS --
-----------------

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))

--hl.bind("num_lock", hl.dsp.pass({ window = "initial_class:discord", non_consuming = true }))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp -c 00000000 -b 00000070)" - | wl-copy'))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("bash ~/.config/scripts/prism.sh"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())

-- Full screen no maximize
hl.bind(mainMod .. " + F", function()
	local w = hl.get_active_window()
	if w ~= nil then
		if w.fullscreen ~= 0 then
			-- already fullscreen, unset it
			hl.dispatch(hl.dsp.window.fullscreen_state({ internal = 0, client = w.fullscreen_client }))
		else
			-- go fullscreen
			hl.dispatch(hl.dsp.window.fullscreen_state({ internal = 2, client = w.fullscreen_client }))
		end
	end
end)
-- Maximize no fullscreen
hl.bind(mainMod .. " + SHIFT + F", function()
	local w = hl.get_active_window()
	if w ~= nil then
		if w.fullscreen_client ~= 0 then
			-- already fullscreen, unset it
			hl.dispatch(hl.dsp.window.fullscreen_state({ internal = w.fullscreen, client = 0 }))
		else
			-- go fullscreen
			hl.dispatch(hl.dsp.window.fullscreen_state({ internal = w.fullscreen, client = 2 }))
		end
	end
end)

-- zoom
hl.bind(mainMod .. " + Z", zoom)
hl.bind(mainMod .. " + mouse_down", function()
	zoom(0.5)
end, { auto_consuming = true })
hl.bind(mainMod .. " + mouse_up", function()
	zoom(-0.5)
end, { auto_consuming = true })

-- Spotify
hl.bind("CTRL + ALT + SPACE", hl.dsp.exec_cmd(" playerctl play-pause --player=spotify"))
hl.bind("CTRL + ALT + right", hl.dsp.exec_cmd(" playerctl next --player=spotify"))
hl.bind("CTRL + ALT + left", hl.dsp.exec_cmd(" playerctl previous --player=spotify"))
-------------
-- DEFAULT --
-------------

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move workspace to the other monitor
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.workspace.move({ monitor = "HDMI-A-1" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.workspace.move({ monitor = "eDP-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
