require("redct/variables")

hl.on("hyprland.start", function()
	hl.exec_cmd("discord")
	hl.exec_cmd("spotify")

	hl.exec_cmd(terminal .. " --quit-after-last-window-closed=false --initial-window=false")
	hl.exec_cmd("waybar & hyprpaper &")
	hl.exec_cmd("hyprlauncher -d &")
	hl.exec_cmd("easyeffects")
end)
