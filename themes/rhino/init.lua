local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local math, string, os = math, string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local wallpaper_path = "~/.config/awesome/themes/rhino/rhino-wallpaper.png"
local rhino_icon = "/home/gustavo/.config/awesome/themes/rhino/icons/rhino_64x64.png"

local theme = {}

local colors = {}

colors.background = "#282a36"
colors.gray = "#44475a"
colors.foreground = "#f8f8f2"
colors.comment = "#6272a4"
colors.cyan = "#8be9fd"
colors.green = "#50fa7b" 
colors.orange = "#ffb86c"
colors.pink = "#ff79c6"
colors.purple = "#bd93f9"
colors.red = "#ff5555"
colors.yellow = "#f1fa8c"
colors.purpleish = "#b4befe"

theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/rhino"
theme.wallpaper                                 = wallpaper_path
theme.font                                      = "DejaVu Sans Mono Bold 10"
theme.taglist_font                              = "JetBrainsMono Nerd Font"--Font Awesome 6 Brands Regular 16"

theme.fg_normal                                 = colors.foreground
theme.fg_blue                                   = colors.cyan
theme.fg_magenta                                = colors.purple
theme.purple                                    = colors.purple
theme.fg_focus                                  = colors.purple
theme.fg_urgent                                 = colors.orange
theme.bg_normal                                 = "#111111"
theme.bg_focus                                  = "#111111"
theme.bg_urgent                                 = colors.foreground
theme.taglist_fg_focus                          = colors.purple
theme.tasklist_bg_focus                         = "#000000"
theme.tasklist_fg_focus                         = colors.orange
theme.border_width                              = 2
theme.border_normal                             = "#310053"
theme.border_focus                              = colors.purple
theme.border_marked                             = colors.purple
theme.titlebar_bg_focus                         = "#3F3F3F"
theme.titlebar_bg_normal                        = "#3F3F3F"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = 20
theme.menu_width                                = 140
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
theme.rhino_icon                                = rhino_icon --"~/.config/awesome/themes/rhino/icons/rhino_64x64.png"
--
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note.png"
theme.widget_music_pause                        = theme.dir .. "/icons/pause.png"
theme.widget_music_stop                         = theme.dir .. "/icons/stop.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.widget_task                               = theme.dir .. "/icons/task.png"
theme.widget_scissors                           = theme.dir .. "/icons/scissors.png"
theme.widget_weather                            = theme.dir .. "/icons/dish.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 6
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.bg_systray                                = "#111111"
theme.clock_fontfg                              = "#FFFFFF"
theme.clock_font                                = "DejaVu Sans Mono Bold 9"

local markup = lain.util.markup
local separators = lain.util.separators

-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
    "date +'%a %d %b %R'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.fontfg(theme.clock_font, colors.orange, stdout))
    end
)

-- Battery
local baticon = wibox.widget.textbox('')
function theme.update_baticon(icon)
	baticon:set_markup(
		string.format('<span color="%s" font="'..theme.taglist_font..'">%s</span>', colors.purpleish, icon)
	)
end

-- Separators
local spr = wibox.widget.textbox('     ')
local half_spr = wibox.widget.textbox('  ')
local small_spr = wibox.widget.textbox(' ')

local bat = wibox.widget.textbox('')
function theme.update_battery()
	awful.spawn.easy_async_with_shell(
	[[bash -c "echo $(acpi|awk '{split($0,a,", "); print a[2]}')"]],
	function(stdout)
		if stdout == '' then
			bat:set_markup('<span color="'..colors.purpleish..'" font="'..theme.font..'"> N/A</span>')
			return
		end
		stdout = stdout:gsub("%%", ""):match("^%s*(.-)%s*$")
		percent = tonumber(stdout)
		if percent <= 5 then
			theme.update_baticon('󰂎')
		elseif percent <= 25 then
			theme.update_baticon('󱊡')
		elseif percent >= 25 and percent <= 75 then
			theme.update_baticon('󰁿')
		elseif percent < 100 then
			theme.update_baticon('󰂁')
		else
			theme.update_baticon('󱊣')
		end

		bat:set_markup('<span color="'..colors.purpleish..'" font="'..theme.font..'"> ' ..stdout.."%</span> ")
	end)
end
theme.update_battery()

local vert_sep = wibox.widget {
    widget = wibox.widget.separator,
    orientation = "vertical",
    forced_width = 10,
    color = colors.purple,
}

local battery = {
		layout = wibox.layout.fixed.horizontal,
		half_spr,
		baticon,
		bat,
}

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = "Roboto Mono Medium 10",
        fg   = colors.purpleish,
        bg   = theme.bg_normal
    }
})

-- ALSA volume
theme.volume = lain.widget.alsabar({
    --togglechannel = "IEC958,3",
    notification_preset = { font = theme.font, fg = theme.fg_blue },
})

-- MPD
local musicplr = "urxvt -title Music -g 130x34-320+16 -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(my_table.join(
    awful.button({ modkey }, 1, function () awful.spawn.with_shell(musicplr) end),
    awful.button({ }, 2, function ()
        awful.spawn.with_shell("mpc toggle")
        theme.mpd.update()
    end),
    awful.button({ modkey }, 3, function () awful.spawn.with_shell("pkill ncmpcpp") end),
    awful.button({ }, 3, function ()
        awful.spawn.with_shell("mpc stop")
        theme.mpd.update()
    end)))
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            mpdicon:set_image(theme.widget_music_on)
            widget:set_markup(markup.font(theme.font, markup("#FFFFFF", artist) .. " " .. title))
        elseif mpd_now.state == "pause" then
            widget:set_markup(markup.font(theme.font, " mpd paused "))
            mpdicon:set_image(theme.widget_music_pause)
        else
            widget:set_text("")
            mpdicon:set_image(theme.widget_music)
        end
    end
})

local rhinobutton = awful.widget.button {
    image = theme.rhino_icon,
    buttons = {
        awful.button({}, 1, nil, function()
            awful.spawn.with_shell("~/.config/rofi/powermenu/type-2/powermenu.sh")
        end)
    }
}
local rhino_text = wibox.widget{
    markup = '  <b>Rhino Linux</b>',
    align  = 'left',
    valign = 'left',
    widget = wibox.widget.textbox
}


-- Separators
local arrow = separators.arrow_left


function theme.powerline_rl(cr, width, height)
    local arrow_depth, offset = height/2, 0

    -- Avoid going out of the (potential) clip area
    if arrow_depth < 0 then
        width  =  width + 2*arrow_depth
        offset = -arrow_depth
    end

    cr:move_to(offset + arrow_depth         , 0        )
    cr:line_to(offset + width               , 0        )
    cr:line_to(offset + width - arrow_depth , height/2 )
    cr:line_to(offset + width               , height   )
    cr:line_to(offset + arrow_depth         , height   )
    cr:line_to(offset                       , height/2 )

    cr:close_path()
end

local function pl(widget, bgcolor, padding)
    return wibox.container.background(wibox.container.margin(widget, 16, 16), bgcolor, theme.powerline_rl)
end

function theme.at_screen_connect(s)
    -- Quake application
   -- s.quake = lain.util.quake({ app = awful.util.terminal })
   s.quake = lain.util.quake({ app = "termite", height = 0.50, argname = "--name %s" })

    -- If wallpaper is a function, call it with the scre
    -- n
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- All tags open with layout 1
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    --s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)
    s.mytaglist = require("themes.rhino.taglist")(s)
    -- Create the wibox
    function custom_shape(cr, width, height)

        gears.shape.rounded_rect(cr, width, height, 25)

    end

    s.mywibox = awful.wibar({ position = "top", screen = s, bg = theme.bg_normal, fg= theme.fg_normal}) --height = 35, width = 1850, border_width = 5, bg = theme.bg_normal, fg = theme.fg_magenta })

    tbox_separator = wibox.widget.textbox(" | ")

    local vert_sep = wibox.widget {
        widget = wibox.widget.separator,
        orientation = "vertical",
        forced_width = 10,
        color = colors.purple,
    }
    


    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,

            small_spr,
            rhinobutton,
            rhino_text,

            s.mypromptbox,
            spr,
        },
        {
            layout = wibox.layout.align.horizontal,
            wibox.container.background(wibox.container.margin(s.mytaglist, 650, 0, 2, 2)),
        },
        -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,

            volume_widget{
                widget_type = 'icon_and_text',
             },

            wibox.container.background(wibox.container.margin(wibox.widget { theme.volume.widget, layout = wibox.layout.align.horizontal }, 2, 3)),

            battery,

            wibox.container.background(wibox.container.margin(clock, 6, 10, 2, 2)),
            s.mypromptbox,

            vert_sep,
            wibox.container.background(wibox.container.margin(wibox.widget.systray { layout = wibox.layout.align.horizontal }, 8, 4)),
        },
    }
end

return theme
