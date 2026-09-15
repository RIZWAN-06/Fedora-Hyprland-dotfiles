---@module 'hl'

-- Monitor setup (Scale 1.25 for your HP laptop)
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = 1.25,
})

-- ---Default Programs---
local terminal = "kitty"
local fileManager = "nautilus"
local menu = "rofi -show drun"

-- Environment Variables (Intel + NVIDIA Hybrid)
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1")
hl.env("__EGL_VENDOR_LIBRARY_FILENAMES", "/usr/share/glvnd/egl_vendor.d/50_mesa.json")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "mesa")
hl.env("__NV_PRIME_RENDER_OFFLOAD", 0)
hl.env("QT_SCALE_FACTOR", 1)
hl.env("GDK_SCALE", 1)
hl.env("HYPRSHOT_DIR", os.getenv("HOME") .. "/Pictures/Screenshots")

-- Configuration Blocks
hl.config({
	general = {
		gaps_in = 10,
		gaps_out = 15,
		border_size = 2,
		layout = "master",
	},
	decoration = {
		rounding = 12,
		rounding_power = 2.0,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		blur = {
			enabled = true,
			size = 6,
			passes = 3,
			new_optimizations = true,
		},
	},
	master = {
		mfact = 0.55,
		new_status = "master",
		orientation = "left",
		smart_resizing = true,
	},
})

-- --- Core Keybindings ---
hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.exit())
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + V", hl.dsp.window.float())
hl.bind("SUPER + R", hl.dsp.exec_cmd("ambxst run launcher"))
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd("ambxst run powermenu"))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + RETURN", hl.dsp.layout("swapwithmaster"))
hl.bind("SUPER + F", hl.dsp.layout("focusmaster"))

-- --- Focus Movement (Vim & Arrows) ---
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))

-- --- Workspaces ---
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- --- Special Workspace (Scratchpad) ---
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- --- Mouse Bindings ---
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- ---Lock/suspand key--- --
hl.bind("SUPER + X", hl.dsp.exec_cmd("ambxst lock"))

-- Screenshots
hl.bind("SUPER + ALT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind("SUPER + ALT + A", hl.dsp.exec_cmd("hyprshot -m output --clipboard-only"))
hl.bind("SUPER + ALT + W", hl.dsp.exec_cmd("hyprshot -m window --clipboard-only"))

hl.bind("SUPER + ALT + S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("SUPER + ALT + A", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("SUPER + ALT + W", hl.dsp.exec_cmd("hyprshot -m window"))

-- --- Media & System Keys ---
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- --- Autostart ---
hl.on("hyprland.start", function()
	hl.exec_cmd("/usr/libexec/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("hyprctl dismissnotify")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("ambxst")
	hl.exec_cmd("~/.config/ambxst/palette/restore.sh")

	-- Force our decorations after axctl runs
	hl.exec_cmd("sleep 3 && hyprctl keyword general:gaps_in 10")
	hl.exec_cmd("sleep 3 && hyprctl keyword general:gaps_out 15")
	hl.exec_cmd("sleep 3 && hyprctl keyword decoration:rounding 12")
	hl.exec_cmd("sleep 3 && hyprctl keyword decoration:blur:size 6")
	hl.exec_cmd("sleep 3 && hyprctl keyword decoration:blur:passes 3")
end)

-- Ambxst
--loadfile(os.getenv("HOME") .. "/.local/share/ambxst/hyprland.lua")()

-- OVERRIDES
-- Down here you can write or source anything that you want to override from Ambxst's settings.
