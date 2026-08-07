return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("harpoon"):setup()
    end,
    keys = function()
        local keys = {
            {
                "<leader>a",
                function()
                    require("harpoon"):list():add()
                end,
                desc = "Harpoon add file",
            },
            {
                "<C-e>",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "Harpoon quick menu",
            },
        }
        for i = 1, 4 do
            table.insert(keys, {
                "<leader>" .. i,
                function()
                    require("harpoon"):list():select(i)
                end,
                desc = "Harpoon slot " .. i,
            })
        end
        return keys
    end,
}
