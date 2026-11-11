local MAX_ZOOM = 5
local MIN_ZOOM = 1
local ZOOM_TOGGLE_FACTOR = 1.5

---@param offset number
---@return nil
function zoom(offset)
	local current = hl.get_config("cursor.zoom_factor")
	if offset ~= nil then
		current = current + offset
	elseif current ~= MIN_ZOOM then
		current = MIN_ZOOM
	else
		current = ZOOM_TOGGLE_FACTOR
	end
	current = math.max(MIN_ZOOM, math.min(MAX_ZOOM, current))
	hl.config({ cursor = { zoom_factor = current } })
end

local DEVICES = { "@DEFAULT_AUDIO_SINK@", "@DEFAULT_AUDIO_SOURCE@" }

local function is_muted(dev)
	local p = io.popen("wpctl get-volume " .. dev)
	if not p then
		return false
	end
	local out = p:read("*a") or ""
	p:close()
	return out:find("%[MUTED%]") ~= nil
end

local function set_mute(dev, on)
	os.execute("wpctl set-mute " .. dev .. " " .. (on and "1" or "0"))
end

function toggle_blank_workspaces()
	-- second press: restore the saved workspaces
	if blank_state then
		for _, s in ipairs(blank_state.monitors) do
			if hl.get_monitor(s.name) then
				hl.dispatch(hl.dsp.focus({ monitor = s.name }))
				hl.dispatch(hl.dsp.focus({ workspace = s.workspace }))
			end
		end
		if hl.get_monitor(blank_state.focused) then
			hl.dispatch(hl.dsp.focus({ monitor = blank_state.focused }))
		end
		-- only unmute devices that weren't already muted before blanking
		for _, dev in ipairs(DEVICES) do
			if not blank_state.was_muted[dev] then
				set_mute(dev, false)
			end
		end
		blank_state = nil
		return
	end

	-- first press: save the layout, then give each monitor a fresh workspace
	local taken = {}
	for _, ws in ipairs(hl.get_workspaces()) do
		taken[ws.id] = true
	end

	local state = {
		focused = hl.get_active_monitor().name,
		monitors = {},
		was_muted = {},
	}
	for _, dev in ipairs(DEVICES) do
		state.was_muted[dev] = is_muted(dev)
	end

	local next_id = 1
	for _, mon in ipairs(hl.get_monitors()) do
		while taken[next_id] do
			next_id = next_id + 1
		end
		taken[next_id] = true
		table.insert(state.monitors, {
			name = mon.name,
			workspace = mon.active_workspace.id,
			blank = next_id,
		})
	end

	for _, s in ipairs(state.monitors) do
		hl.dispatch(hl.dsp.focus({ monitor = s.name }))
		hl.dispatch(hl.dsp.focus({ workspace = s.blank }))
	end
	hl.dispatch(hl.dsp.focus({ monitor = state.focused }))

	-- mute speaker and mic
	for _, dev in ipairs(DEVICES) do
		set_mute(dev, true)
	end
	blank_state = state
end
