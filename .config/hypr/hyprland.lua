-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@75",
	position = "auto",
	scale = "1",
})

hl.monitor({
	output = "DP-3",
	mode = "1920x1080@75",
	position = "auto",
	scale = "1",
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "alacritty"
local fileManager = "krusader"
local menu = "rofi"
local browser = "zen"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar & hyprpaper & dunst & hyprsunset")
	hl.exec_cmd("wl-clip-persist --clipboard both")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("zen")
	hl.exec_cmd("vesktop --ozone-platform-hint=auto --enable-blink-features=MiddleClickAutoscroll %U")
	hl.exec_cmd("sleep 3 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("sleep 3 && systemctl --user restart xdg-desktop-portal xdg-desktop-portal-hyprland")
	hl.exec_cmd("sleep 3 && systemctl --user start hyprpolkitagent")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- Cursors
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "breeze_cursors")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "breeze_cursors")

hl.env("ADW_DISABLE_PORTAL", "1")
hl.env("WLR_DRM_DEVICES", "/dev/dri/by-path/pci-0000:03:00.0-card")

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,

		-- border_size = 2,
		border_size = 0,

		col = {
			active_border = { colors = { "rgba(5c99e1ee)", "rgba(76b4feee)" }, angle = 45 },
			inactive_border = { colors = { "rgba(969696aa)", "rgba(b0b0b0aa)" }, angle = 45 },
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 0.97,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- stylua: ignore start
hl.curve("easeOutQuint",       { type = "bezier", points = { { 0.23, 1 },    { 0.32, 1 } } })
hl.curve("easeInOutCubic",     { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear",             { type = "bezier", points = { { 0,    0 },    { 1,    1 } } })
hl.curve("almostLinear",       { type = "bezier", points = { { 0.5,  0.5 },  { 0.75, 1 } } })
hl.curve("quick",              { type = "bezier", points = { { 0.15, 0 },    { 0.1,  1 } } })
hl.curve("workspaceAnimation", { type = "bezier", points = { { 0.23, 1.12 }, { 0.32, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 3,    bezier = "workspaceAnimation", style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 3,    bezier = "workspaceAnimation", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 3,    bezier = "workspaceAnimation", style = "slide" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })
-- stylua: ignore end

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(

		font_family = "CaskaydiaCove Nerd Font",
		splash_font_family = "CaskaydiaCove Nerd Font",
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	cursor = {
		no_warps = true,
	},
})

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		repeat_rate = 25,
		repeat_delay = 400,

		follow_mouse = 1,

		sensitivity = -0.2, -- -1.0 - 1.0, 0 means no modification.
		accel_profile = "flat",

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

-- Screenshotting with grim slurp and swappy

hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

hl.bind(
	mainMod .. " + ALT + P",
	hl.dsp.exec_cmd("grim -o $(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name') - | swappy -f -")
)
hl.bind(
	mainMod .. " + ALT + O",
	hl.dsp.exec_cmd("grim -o $(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name') - | wl-copy")
)

-- Show clipboard with rofi and cliphist
local clipboardMenuLocation = "~/.config/hypr/scripts/clipboard-menu.sh"
local clipboardBaseCommand = "cliphist list | rofi -dmenu -display-columns 2 -p ' ' | cliphist "

hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(clipboardBaseCommand .. "decode | wl-copy"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(clipboardBaseCommand .. "delete"))
hl.bind(mainMod .. " + ALT + SHIFT + C", hl.dsp.exec_cmd(clipboardMenuLocation))

-- Change bringhtness with ddcutil
local brightnessChangeKeys = {
	["code:34"] = "- 10",
	["code:35"] = "+ 10",
	["code:51"] = "50",
}

for key, change in pairs(brightnessChangeKeys) do
	hl.bind(mainMod .. " + " .. key, hl.dsp.exec_cmd("ddcutil --bus 8 setvcp 10 " .. change .. " --noverify"))
end

-- Normal keybinds
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(
	mainMod .. " + SHIFT + code:51",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + A", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + L", hl.dsp.window.center())
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu .. " -show drun"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("bemoji -p"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("bemoji -p -f ~/.config/hypr/misc/nerdfont.txt"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("hyprpicker --autocopy --notify"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + B", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + V", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + T", hl.dsp.window.fullscreen())

-- Debug
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("eww close-all"))

local uiApplications = {
	["slash"] = "waybar",
	["period"] = "hyprpaper",
	["comma"] = "dunst",
}

for key, app in pairs(uiApplications) do
	-- Bind for starting the utility
	hl.bind(mainMod .. " + " .. key, hl.dsp.exec_cmd(app))

	-- Bind for killing the utility
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.exec_cmd("pkill " .. app))
end

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
-- for i = 1, 10 do
-- 	local key = i % 10 -- 10 maps to key 0
-- 	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
-- 	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
-- end

for i = 1, 5 do
	local wsMain = i
	local wsSec = i + 5

	hl.bind(mainMod .. " + " .. i, function()
		local activeWs = hl.get_active_workspace()

		if activeWs and activeWs.id > 5 then
			hl.dispatch(hl.dsp.focus({ workspace = wsMain }))
			hl.dispatch(hl.dsp.focus({ workspace = wsSec }))
		else
			hl.dispatch(hl.dsp.focus({ workspace = wsSec }))
			hl.dispatch(hl.dsp.focus({ workspace = wsMain }))
		end
	end)

	hl.bind(mainMod .. " + SHIFT + " .. i, function()
		local activeWs = hl.get_active_workspace()
		if activeWs and activeWs.id > 5 then
			hl.dispatch(hl.dsp.window.move({ workspace = wsSec }))
			hl.dispatch(hl.dsp.focus({ workspace = wsMain }))
			hl.dispatch(hl.dsp.focus({ workspace = wsSec }))
		else
			hl.dispatch(hl.dsp.window.move({ workspace = wsMain }))
			hl.dispatch(hl.dsp.focus({ workspace = wsSec }))
			hl.dispatch(hl.dsp.focus({ workspace = wsMain }))
		end
	end)

	hl.bind(mainMod .. " + ALT + SHIFT + " .. i, function()
		local activeWs = hl.get_active_workspace()
		if activeWs and activeWs.id > 5 then
			hl.dispatch(hl.dsp.window.move({ workspace = wsMain }))
			hl.dispatch(hl.dsp.focus({ workspace = wsSec }))
			hl.dispatch(hl.dsp.focus({ workspace = wsMain }))
		else
			hl.dispatch(hl.dsp.window.move({ workspace = wsSec }))
			hl.dispatch(hl.dsp.focus({ workspace = wsMain }))
			hl.dispatch(hl.dsp.focus({ workspace = wsSec }))
		end
	end)
end

-- Special workspaces
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Remove middle click paste and make it not eat the input
hl.bind("mouse:274", hl.dsp.exec_cmd("wl-copy -pc"), { non_consuming = true })

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

-- Global keybinds
hl.bind("CTRL + SHIFT + D", hl.dsp.pass({ window = "class:vesktop" }))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

suppressMaximizeRule:set_enabled(true)

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

-- Make Youtube not blurred
hl.window_rule({
	name = "youtube-opaque",
	match = { title = ".*[Yy]outube.*" },

	opaque = true,
})

-- Alacritty opacity
hl.window_rule({
	name = "alacritty-opacity",
	match = { class = "^(Alacritty)$" },

	opacity = "0.9 0.85",
})

-- Vesktop opacity
hl.window_rule({
	name = "vesktop-opacity",
	match = { class = "^(vesktop)$" },

	opacity = "0.9 0.85",
})

-- Vesktop opacity
hl.window_rule({
	name = "vesktop-opacity",
	match = { class = "^(vesktop)$" },

	opacity = "0.9 0.85",
})

-- If class is float-term then make it float
hl.window_rule({
	name = "floating-tui",
	match = { class = "^(float-term)$" },

	float = true,
	size = "800 500",
	center = true,
})

for i = 1, 5 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "HDMI-A-1",
	})
end

-- Bind workspaces 6 through 10 to DP-3
for i = 6, 10 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "DP-3",
	})
end

-- -- Screenshotting with hyprshot
-- local screenshotTypeKeys = {
-- 	["CONTROL"] = "window",
-- 	["ALT"] = "output",
-- 	["SHIFT"] = "region",
-- }
-- local screenshotOutputFolder = "~/Pictures/hyprshot/"
--
-- for key, type in pairs(screenshotTypeKeys) do
-- 	local baseCommand = "hyprshot -m " .. type .. " --output-folder " .. screenshotOutputFolder
-- 	hl.bind(mainMod .. " + " .. key .. " + P", hl.dsp.exec_cmd(baseCommand))
-- 	hl.bind(mainMod .. " + " .. key .. " + O", hl.dsp.exec_cmd(baseCommand .. " --clipboard-only"))
-- end

-- open app on workspace x
local workspaceApps = {
	["vesktop"] = "2",
	["steam"] = "5",
}

for app, workspace in pairs(workspaceApps) do
	hl.window_rule({
		name = app .. "-on-ws" .. workspace,
		match = { class = app },

		workspace = workspace .. " silent",
	})
end

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
