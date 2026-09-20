-- Hyprland loads this file when it is started without a config, and it prefers
-- it over hyprland.conf. HyDE loads it too, last, as the override layer below.
-- The block keeps the two apart: hyde.lua sets `hyde` on its first line, so it
-- runs only when this file is the entry point and HyDE has not been loaded.
-- Removing it leaves a session with a cursor and nothing else.
if not hyde then
	local share = os.getenv("XDG_DATA_HOME") or (os.getenv("HOME") .. "/.local/share")
	local entry = share .. "/hypr/hyde.lua"
	local handle = io.open(entry, "r")
	if not handle then
		error("HyDE is not installed at " .. entry .. ". Run install.sh -r, or point Hyprland at your own config.")
	end
	handle:close()
	dofile(entry)
end

-- Your Hyprland configuration. HyDE never overwrites this file.
--
-- It loads after HyDE's own binds, so settings here take precedence. Replacing
-- a bind needs more than that: see below. HyDE's defaults live in
-- ~/.local/share/hypr/lua/ and are overwritten on every update, so edits there
-- do not survive.
--
-- Adding a keybind:
--
--     hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(hyde.sh.gamelauncher()), {
--         description = "[Utilities] game launcher",
--     })
--
-- Replacing one of HyDE's: bind the same combination again and yours takes
-- over, but copy its flags across as well. A bind counts as the same one only
-- when its flags match, and `description` is not a flag — miss one and both
-- binds stay live on that combination. Copy the whole options table from
-- ~/.local/share/hypr/lua/key_binds.lua and change only what you need:
--
--     hl.bind("F9", hl.dsp.exec_cmd(hyde.sh.volumecontrol("-o", "m")), {
--         locked = true,
--         description = "[Hardware Controls|Audio] un/mute output",
--     })
--
-- Press SUPER + / to see what is actually loaded, your own binds included.
-- The full reference is KEYBINDINGS.md in the HyDE repository.
--

local ca = "CTRL + ALT"
local mainMod = "SUPER"
local scrPath = os.getenv("HOME") .. "/.config/hypr/scripts"
local BROWSER = "firefox-developer-edition"
local term= "kitty"
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down", mods = "ALT", action = "close" })
hl.gesture({ fingers = 3, direction = "up", mods = "SUPER", scale = 1.5, action = "fullscreen" })

-- ~/.config/hypr/hyprland.lua

-- ============================================================
-- Window rules
-- ============================================================

hl.window_rule({
    name = "windowrule-1",
    match = {
        class = "^([Ss]potify)$",
    },
    workspace = "9",
})

hl.window_rule({
    name = "windowrule-2",
    match = {
        class = "^([Vv]esktop)$",
    },
    workspace = "8",
})


-- ============================================================
-- Keybinds
-- ============================================================

hl.bind(
    ca .. " + F",
    hl.dsp.exec_cmd(BROWSER)
)
hl.bind(ca .. " + G", hl.dsp.exec_cmd("steam"))
hl.bind(ca .. " + T", hl.dsp.exec_cmd(term))
hl.bind(ca .. " + C", hl.dsp.exec_cmd("code"))

hl.bind(
    "SUPER + SUPER_L",
    hl.dsp.exec_cmd(hyde.sh.menu.apps()),
    { release = true }
)

hl.bind(ca .. " + S", hl.dsp.exec_cmd("spotify-launcher"))

-- Discord disabled
-- hl.bind(ca .. " + D", hl.dsp.exec_cmd("discord"))

hl.bind(ca .. " + D", hl.dsp.exec_cmd("vesktop"))

hl.bind(
    mainMod .. " + SHIFT + G",
    hl.dsp.exec_cmd(
        "pkill -x rofi || " .. scrPath .. "/gamelauncher.sh 4"
    )
)

hl.bind(
    ca .. " + DELETE",
    hl.dsp.exec_cmd("swaylock; systemctl suspend")
)

hl.bind(
    ca .. " + Y",
    hl.dsp.exec_cmd(BROWSER .. " https://youtube.com")
)

hl.bind(
    "XF86Calculator",
    hl.dsp.exec_cmd(term)
)

hl.bind(
    "XF86Launch2",
    hl.dsp.exec_cmd(BROWSER)
)

hl.bind(
    "XF86Launch2",
    hl.dsp.exec_cmd("spotify-launcher")
)

hl.bind(
    "XF86Launch2",
    hl.dsp.exec_cmd("vesktop")
)


-- ============================================================
-- Input
-- ============================================================

hl.config({
    input = {
        kb_layout = "us,gr",
        numlock_by_default = false,

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.4,
        },
    },
})
