local hop = require('hop')
hop.setup {}
local directions = require('hop.hint').HintDirection
vim.keymap.set('', '<Leader><Leader>w', function()
    hop.hint_words({
        direction = directions.AFTER_CURSOR,
    })
end, {remap=true})
vim.keymap.set('', '<Leader><Leader>b', function()
    hop.hint_words({
        direction = directions.BEFORE_CURSOR,
    })
end, {remap=true})
