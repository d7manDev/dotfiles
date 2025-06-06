local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local mini = require("mini.files")

-- Set header
dashboard.section.header.val = {
    "    _ .-') _                ) (`-.   ",
    "( (  OO) )                ( OO ).    ",
    "      .'_   .-'),-----. (_/.  _)-. ",
    " ,`'--..._) ( OO'  .-.  '   `.'  /  ",
    " |  |    ' /   |  | |  |       /  ",
    " |  |   ' | _) |  ||  |       |  ",
    " |  |   / :    |  | |  |  .'    _) ",
    " |  '--'  /    `'  '-'  ' /  .'.    ",
    " `-------'       `-----' '--'   '--'",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
    dashboard.button("SPC ee", "  > Toggle file explorer", mini.open),
    dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
    dashboard.button("SPC fw", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
    dashboard.button("SPC sr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
    dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
