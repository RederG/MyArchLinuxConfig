local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + RETURN", 			hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", 					hl.dsp.window.close())
hl.bind("ALT + F4", 						hl.dsp.exec_cmd(system_state_changer))
hl.bind(mainMod .. " + M", 					hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", 					hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", 					hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", 				hl.dsp.exec_cmd(app_launcher))
hl.bind(mainMod .. " + SPACE + RETURN", 	hl.dsp.exec_cmd(commands_launcher))
hl.bind(mainMod .. " + SPACE + C", 			hl.dsp.exec_cmd(clipboard_manager))
hl.bind(mainMod .. " + SPACE + I", 			hl.dsp.exec_cmd(arch_pacman_installer))
hl.bind(mainMod .. " + SPACE + R", 			hl.dsp.exec_cmd(arch_pacman_remover))
hl.bind(mainMod .. " + SPACE + U", 			hl.dsp.exec_cmd(arch_yay_system_updater))
hl.bind(mainMod .. " + SPACE + P", 			hl.dsp.exec_cmd(color_picker))
hl.bind(mainMod .. " + P", 					hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", 					hl.dsp.layout("togglesplit"))    -- dwindle only

-- For swicthing between workspaces

local up_num_keys = {
	"ampersand",
	"eacute",
	"quotedbl",
	"apostrophe",
	"parenleft",
	"minus",
	"egrave",
	"underscore",
	"ccedilla"
}

for i, key in ipairs(up_num_keys) do
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i}))
end

local numpad = {
	"KP_End",
	"KP_Down",
	"KP_Next",
	"KP_Left",
	"KP_Begin",
	"KP_Right",
	"KP_Home",
	"KP_Up",
	"KP_Prior"
}

for i, key in ipairs(numpad) do
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i}))
end

hl.bind(mainMod .. " + CTRL + left", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.focus({ workspace = "e+1" }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- local workspace = hl.get_active_workspace()
-- hl.bind(mainMod .. " + CTRL + left", function()
-- 	local id = workspace.id
-- 	id = id - 1
-- 	if id < 0 then
-- 		id = 0
-- 	end
-- 	hl.dsp.focus({ workspace = id })
-- end)
-- 
-- hl.bind(mainMod .. " + CTRL + right", function()
--     local id = workspace.id
--     id = id + 1
--     if id > 9 then
--             id = 9
--     end
--     hl.dsp.focus({ workspace = id })
-- end)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
-- for i = 1, 10 do
--     local key = i % 10 -- 10 maps to key 0
--     hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
--     hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
-- end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
