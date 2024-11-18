require 'helpers'

addPath(vim.fn.getcwd() .. '/?.lua')

local config = merge(
    require 'config.base',
    include 'config.local',
    include 'nvim'
)

-- Conditional config tweaks:

if config.useLightScheme then
else
    if config.darkScheme == 'duskfox' then
        config.colors.dark = '#1f1d2e'
    elseif config.darkScheme == 'nordfox' then
        config.colors.dark = '#232831'
    elseif config.darkScheme == 'everforest' then
        config.colors.dark = '#1f2329'
    end
end

-- Helper config functions:

function comments (...)
    local shapes = {}
    for i, shape in ipairs({...}) do
        if config.comments[shape] then
            table.insert(shapes, config.comments[shape])
        end
    end
    return table.concat(shapes, ',')
end

function formatting (format)
    return config.formatting[format] or ''
end

return config
