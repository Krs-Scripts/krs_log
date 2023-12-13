
local Webhooks = {

    ['drop'] = '',
    ['stash'] = '',
    ['banking'] = '',
    ['vehicleshop'] = '',
    ['shops'] = '',
    ['death'] = '',
    ['ooc'] = '',
    ['report'] = '',
    ['me'] = '',
    ['112'] = '',
    ['bans'] = '',
    ['anticheat'] = '',
    ['weather'] = '',
    ['bennys'] = '',
    ['bossmenu'] = '',
    ['robbery'] = '',
    ['casino'] = '',
    ['police'] = '',
    ['house'] = '',
}

local colors = { -- https://www.spycolor.com/

    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ['lightgreen'] = 65309,
}


RegisterNetEvent('esx:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false

    if not Webhooks[name] then
        print('Tried to call a log that isn\'t configured with the name of ' .. name)
        return
    end

    local webhook = Webhooks[name] ~= '' and Webhooks[name] or Webhooks['default']

    local embedData = {
        {
            ['title'] = title,
            ['color'] = colors[color] or colors['default'], 
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'Krs Log Discord',
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/1165234834227085372/1167866540796940308/Krs-logo.png', -- Logo --
            },
        }
    }

    local postData = {
        embeds = embedData,
    }

    PerformHttpRequest(webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
end)
