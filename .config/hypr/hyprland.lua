local var_mainMod = "SUPER"
local var_terminal = "kitty"
local var_browser = "uwsm-app -- xdg-open https://"
local var_fileManager = "uwsm-app -- nautilus"
local var_configDir = "$HOME/.config/hypr"

-- Standalone Hyprland configuration

-- Generated from the active desktop setup on 2026-09-20.

-- This file intentionally has no external configuration dependencies.
hl.config({
	input = {
		kb_layout = "us",
		kb_options = "caps:ctrl_modifier,caps:shift_lock,grp:alts_toggle",
		repeat_rate = 40,
		repeat_delay = 250,
		numlock_by_default = true,
		sensitivity = 0.35,
		accel_profile = "flat",
		follow_mouse = 1,
		touchpad = {
			natural_scroll = true,
			clickfinger_behavior = true,
			scroll_factor = 0.4,
			disable_while_typing = false,
			drag_3fg = 1,
		},
	},
	general = {
		gaps_in = 4,
		gaps_out = 8,
		border_size = 1,
		layout = "dwindle",
		resize_on_border = false,
		allow_tearing = false,
		col = {
			active_border = {
				colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
				angle = 45,
			},
			inactive_border = "rgba(595959aa)",
		},
	},
	decoration = {
		rounding = 0,
		shadow = {
			enabled = false,
		},
		blur = {
			enabled = false,
		},
	},
	animations = {
		enabled = false,
	},
	dwindle = {
		preserve_split = true,
		force_split = 2,
	},
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		disable_scale_notification = true,
		focus_on_activate = true,
		vrr = 0,
	},
	cursor = {
		hide_on_key_press = true,
		warp_on_change_workspace = 1,
	},
})

require("monitors")

hl.env("GDK_SCALE", "1")
hl.env("XCURSOR_SIZE", "24")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")
	-- polkit agent runs via hyprpolkitagent.service (systemd user unit).
	-- Do NOT call the binary here: it lives at /usr/lib/hyprpolkitagent/hyprpolkitagent
	-- and is not in PATH, so a bare call fails silently.
	hl.exec_cmd("sh -c 'if ! command -v noctalia >/dev/null 2>&1; then mako; fi'")
	hl.exec_cmd("sh -c 'command -v hyprpaper >/dev/null && hyprpaper'")
	hl.exec_cmd(
		"sh -c 'if command -v noctalia >/dev/null 2>&1; then noctalia --daemon; elif command -v ashell >/dev/null 2>&1; then ashell; fi'"
	)
end)

-- Applications and system actions
hl.bind(var_mainMod .. " + RETURN", hl.dsp.exec_cmd(var_terminal))
hl.bind(var_mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(var_browser))
hl.bind(var_mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(var_fileManager))
hl.bind(var_mainMod .. " + SHIFT + ALT + F", hl.dsp.exec_cmd(var_fileManager .. ' --working-directory "$PWD"'))
hl.bind(var_mainMod .. " + SPACE", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind(var_mainMod .. " + COMMA", hl.dsp.exec_cmd("noctalia msg settings-open"))
hl.bind(var_mainMod .. " + ALT + SPACE", hl.dsp.exec_cmd('bash "' .. var_configDir .. '/bin/system-menu.sh"'))
hl.bind(var_mainMod .. " + ESCAPE", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))
hl.bind(var_mainMod .. " + CTRL + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(var_mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd('loginctl terminate-session "$XDG_SESSION_ID"'))
hl.bind(var_mainMod .. " + CTRL + SHIFT + SPACE", hl.dsp.exec_cmd('bash "' .. var_configDir .. '/bin/theme-menu.sh"'))
hl.bind(var_mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(var_browser))
hl.bind(var_mainMod .. " + SHIFT + ALT + B", hl.dsp.exec_cmd(var_browser .. " --private-window"))
hl.bind(var_mainMod .. " + SHIFT + N", hl.dsp.exec_cmd(var_terminal .. ' -e "${EDITOR:-vi}"'))
hl.bind(var_mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(var_terminal .. " -e copilot --yolo"))

-- Window management
hl.bind(var_mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(var_mainMod .. " + ALT + F", hl.dsp.window.fullscreen_state({ internal = 2, client = 0 }))
hl.bind(var_mainMod .. " + W", hl.dsp.window.close())
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd('bash "' .. var_configDir .. '/bin/close-all.sh"'))
hl.bind(var_mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(var_mainMod .. " + O", hl.dsp.window.pin())
hl.bind(var_mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(var_mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(var_mainMod .. " + ALT + G", hl.dsp.window.move({ out_of_group = true }))
hl.bind(var_mainMod .. " + S", hl.dsp.workspace.toggle_special(""))
hl.bind(var_mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:scratchpad", silent = true }))
hl.bind(var_mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(var_mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(var_mainMod .. " + SHIFT + BACKSPACE", function()
	hl.config({
		general = {
			gaps_in = "0; hyprctl keyword general:gaps_out 0",
		},
	})
end)
hl.bind(var_mainMod .. " + BACKSPACE", hl.dsp.window.set_prop({ prop = "opaque", value = "false", window = "active" }))

-- Vim-style focus and movement
hl.bind(var_mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(var_mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(var_mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(var_mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(var_mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(var_mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(var_mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(var_mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(var_mainMod .. " + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind(var_mainMod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind(var_mainMod .. " + UP", hl.dsp.focus({ direction = "up" }))
hl.bind(var_mainMod .. " + DOWN", hl.dsp.focus({ direction = "down" }))
hl.bind(var_mainMod .. " + SHIFT + LEFT", hl.dsp.window.move({ direction = "left" }))
hl.bind(var_mainMod .. " + SHIFT + RIGHT", hl.dsp.window.move({ direction = "right" }))
hl.bind(var_mainMod .. " + SHIFT + UP", hl.dsp.window.move({ direction = "up" }))
hl.bind(var_mainMod .. " + SHIFT + DOWN", hl.dsp.window.move({ direction = "down" }))
hl.bind(var_mainMod .. " + mouse:273", hl.dsp.window.resize(), {
	mouse = true,
})
hl.bind(var_mainMod .. " + mouse:272", hl.dsp.window.drag(), {
	mouse = true,
})

-- Workspace 0 is represented by Hyprland workspace ID 10. Super+D is

-- intentionally the only workspace-0 key.
hl.bind(var_mainMod .. " + D", hl.dsp.focus({ workspace = 10 }))
hl.bind(var_mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = 10 }))
hl.bind(var_mainMod .. " + SHIFT + ALT + D", hl.dsp.window.move({ workspace = 10, silent = true }))
hl.bind(var_mainMod .. " + CTRL + TAB", hl.dsp.focus({ workspace = "previous" }))
hl.bind(var_mainMod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(var_mainMod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(var_mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(var_mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(var_mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(var_mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(var_mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(var_mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(var_mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(var_mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(var_mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(var_mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(var_mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(var_mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(var_mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(var_mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(var_mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(var_mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(var_mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(var_mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(var_mainMod .. " + SHIFT + ALT + 1", hl.dsp.window.move({ workspace = 1, silent = true }))
hl.bind(var_mainMod .. " + SHIFT + ALT + 2", hl.dsp.window.move({ workspace = 2, silent = true }))
hl.bind(var_mainMod .. " + SHIFT + ALT + 3", hl.dsp.window.move({ workspace = 3, silent = true }))
hl.bind(var_mainMod .. " + SHIFT + ALT + 4", hl.dsp.window.move({ workspace = 4, silent = true }))
hl.bind(var_mainMod .. " + SHIFT + ALT + 5", hl.dsp.window.move({ workspace = 5, silent = true }))
hl.bind(var_mainMod .. " + SHIFT + ALT + 6", hl.dsp.window.move({ workspace = 6, silent = true }))
hl.bind(var_mainMod .. " + SHIFT + ALT + 7", hl.dsp.window.move({ workspace = 7, silent = true }))
hl.bind(var_mainMod .. " + SHIFT + ALT + 8", hl.dsp.window.move({ workspace = 8, silent = true }))
hl.bind(var_mainMod .. " + SHIFT + ALT + 9", hl.dsp.window.move({ workspace = 9, silent = true }))

-- Keep the Hyprland screen-share chooser as a floating window.
hl.window_rule({
	name = "float-hyprland-share-picker",
	match = { class = "^hyprland-share-picker$" },
	float = true,
})

-- Keep Zathura PDFs floating and centered over the current workspace.
hl.window_rule({
	name = "float-center-zathura",
	match = { class = "^org\\.pwmt\\.zathura$" },
	float = true,
	center = true,
})

-- Keep MPV videos floating and centered over the current workspace.
hl.window_rule({
	name = "float-center-mpv",
	match = { class = "^mpv$" },
	float = true,
	center = true,
})

-- Screenshots, clipboard, emojis, and night light
hl.bind("PRINT", hl.dsp.exec_cmd('bash "' .. var_configDir .. '/bin/screenshot.sh"'))
hl.bind("ALT + PRINT", hl.dsp.exec_cmd('bash "' .. var_configDir .. '/bin/screenrecord.sh"'))
-- Noctalia's native screenshot actions mirror macOS: 3 captures the focused
-- display, 4 selects a region, and 5 opens the annotate/copy/save workflow.
hl.bind("CTRL + ALT + SHIFT + 3", hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen"))
hl.bind("CTRL + ALT + SHIFT + 4", hl.dsp.exec_cmd("noctalia msg screenshot-region"))
hl.bind("CTRL + ALT + SHIFT + 5", hl.dsp.exec_cmd("gsr-ui launch-show"))
hl.bind(var_mainMod .. " + C", hl.dsp.exec_cmd("wl-copy --trim-newline < <(wl-paste)"))
hl.bind(var_mainMod .. " + V", hl.dsp.exec_cmd("wl-paste --no-newline"))
hl.bind(var_mainMod .. " + CTRL + V", hl.dsp.exec_cmd('bash "' .. var_configDir .. '/bin/clipboard.sh"'))
hl.bind(var_mainMod .. " + CTRL + E", hl.dsp.exec_cmd('bash "' .. var_configDir .. '/bin/emoji.sh"'))
hl.bind(var_mainMod .. " + CTRL + N", hl.dsp.exec_cmd('bash "' .. var_configDir .. '/bin/nightlight.sh"'))

-- Audio, brightness, and media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), {
	repeating = true,
	locked = true,
})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {
	repeating = true,
	locked = true,
})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {
	locked = true,
})
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), {
	repeating = true,
	locked = true,
})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), {
	repeating = true,
	locked = true,
})
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd('bash "' .. var_configDir .. '/bin/media.sh" play-pause'), {
	locked = true,
})
hl.bind("XF86AudioNext", hl.dsp.exec_cmd('bash "' .. var_configDir .. '/bin/media.sh" next'), {
	locked = true,
})
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd('bash "' .. var_configDir .. '/bin/media.sh" previous'), {
	locked = true,
})
hl.bind("XF86AudioStop", hl.dsp.exec_cmd('bash "' .. var_configDir .. '/bin/media.sh" stop'), {
	locked = true,
})

-- Custom monitor scaling bindings. The helper chooses the next safe scale.
hl.bind(var_mainMod .. " + SLASH", hl.dsp.exec_cmd('bash "' .. var_configDir .. '/bin/monitor-scale.sh" up'))
hl.bind(var_mainMod .. " + ALT + SLASH", hl.dsp.exec_cmd('bash "' .. var_configDir .. '/bin/monitor-scale.sh" down'))
require("workspaces")

hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
-- Adwaita-qt: true Adwaita widget rendering. Swap to "gtk3" in
-- QT_QPA_PLATFORMTHEME above if Noctalia colors matter more than widget shape.
hl.env("QT_STYLE_OVERRIDE", "Adwaita-Dark")
-- QML/QtQuick apps (ignore QT_STYLE_OVERRIDE): Fusion makes them follow the
-- platform palette (Noctalia colors) instead of their own default look.
hl.env("QT_QUICK_CONTROLS_STYLE", "Fusion")

-- HyprMod managed settings
require("hyprland-gui")

-- TODO: the following entries need manual conversion to Lua:
--   bind = $mainMod, mouse:272, movewindow
