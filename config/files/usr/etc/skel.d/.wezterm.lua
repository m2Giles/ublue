local wezterm = require 'wezterm'
local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback {
    'CaskaydiaCove Nerd Font',
    'Noto Color Emoji'
}

config.font_size = 14

config.hide_tab_bar_if_only_one_tab = true

local function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

config.exec_domains = {
    wezterm.exec_domain('Default Toolbox', function (cmd)
        local wrapped = {
            'toolbox-enter'
        }
        cmd.args = wrapped
        return cmd
    end)
}

local function split(s, sep)
    local fields = {}
    local sep = sep or " "
    local pattern = string.format("([^%s]+)", sep)
    string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)
    return fields
end

local function all_trim(s)
    return s:match( "^%s*(.-)%s*$")
end

local function distrobox_list()
    local result = {}
    local success, stdout = wezterm.run_child_process { 'distrobox-list' }
    stdout = split(stdout, "\n")
    for i=2,#stdout,1 do
        table.insert(result, all_trim(split(stdout[i], "|")[2]))
    end
    return result
end

local function toolbox_list()
   local result = {}
    local success, stdout = wezterm.run_child_process { 'toolbox', 'list', '-c' }
    stdout = split(stdout, "\n")
    for i=2,#stdout,1 do
        table.insert(result, all_trim(split(stdout[i], " ")[2]))
    end
    return result
end

local function make_distrobox_fixup_func(name)
    return function (cmd)
        wezterm.log_info(cmd)
        local wrapped = {
            'distrobox',
            'enter',
            name,
        }
        cmd.args = wrapped
        return cmd
    end
end

local function make_toolbox_fixup_func(name)
    return function (cmd)
        wezterm.log_info(cmd)
        local wrapped = {
            'toolbox',
            'enter',
            name,
        }
        cmd.args = wrapped
        return cmd
    end
end

for _, name in ipairs(distrobox_list()) do
    table.insert(
    config.exec_domains,
    wezterm.exec_domain(
        'distrobox: ' .. name,
        make_distrobox_fixup_func(name)
        )
    )
end

for _, name in ipairs(toolbox_list()) do
    table.insert(
    config.exec_domains,
    wezterm.exec_domain(
        'toolbox: ' .. name,
        make_toolbox_fixup_func(name)
        )
    )
end

config.default_domain = "Default Toolbox"

config.keys = {
    {
        key = 'T',
        mods = 'ALT|SHIFT',
        action = "ShowLauncher"
    },
    {
        key = 'R',
        mods = 'ALT|SHIFT',
        action = wezterm.action.ReloadConfiguration
    }
}

return config