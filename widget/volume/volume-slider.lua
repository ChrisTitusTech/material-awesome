local wibox = require('wibox')
local mat_list_item = require('widget.material.list-item')
local mat_slider = require('widget.material.slider')
local mat_icon_button = require('widget.material.icon-button')
local icons = require('theme.icons')
local watch = require('awful.widget.watch')
local spawn = require('awful.spawn')

local slider =
  wibox.widget {
  read_only = false,
  widget = mat_slider
}

slider:connect_signal(
  'property::value',
  function()
    spawn('amixer -D pulse sset Master ' .. slider.value .. '%')
  end
)

local icon =
  wibox.widget {
  --image = icons.volume,
  widget = wibox.widget.imagebox
}

watch(
  [[bash -c "amixer -D pulse sget Master"]],
  1,
  function(_, stdout)
    local mute = string.match(stdout, '%[(o%D%D?)%]')
    if(mute == 'on') then
      icon.image = icons.volume
    else
      icon.image = icons.mutevolume
    end
    local volume = string.match(stdout, '(%d?%d?%d)%%')
    slider:set_value(tonumber(volume))
    collectgarbage('collect')
  end
)

local button = mat_icon_button(icon)

-- Mute or unmute sound when clicking button
button:connect_signal(
  'button::press',
  function()
    spawn('amixer -D pulse sset Master toggle')
  end
)

local volume_setting =
  wibox.widget {
  button,
  slider,
  widget = mat_list_item
}

return volume_setting
