local data_path = vim.fn.stdpath("data")
---@cast data_path string

---@class (exact) luadev.Config
---@field enabled_lsp? "lua_ls"|"emmylua_ls"
---@field installDir? string
---@field addons? (string|luadev.OfficialAddonName|luadev.NeovimAddonName)[]
---@field ui?  luadev.UIConfig

---@type luadev.Config
local default_config = {
    addons = {
        "nvim",
    },
    install_dir = vim.fs.joinpath(data_path, "luadev", "addons"),
    ui = {
        size = { width = 0.8, height = 0.8 },
    },
}

---@class luadev
---@field config luadev.Config
local M = {}

---setup
---@param config? luadev.Config
function M.setup(config)
    local AddonManager = require("luadev.addon_manager")
    M.config = vim.tbl_deep_extend("force", default_config, config or {})

    if pcall(require, "neoconf") then
        require("luadev.neoconf").setup()
    end

    AddonManager.setup()
    if M.config.enabled_lsp then
        vim.defer_fn(function()
            vim.lsp.enable(M.config.enabled_lsp)
        end, 0)
    end
end

return M
