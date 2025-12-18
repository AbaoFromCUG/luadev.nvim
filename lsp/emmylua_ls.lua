--[[
-- emmylua-analyzer-rust(emmylua_ls): https://github.com/EmmyLuaLs/emmylua-analyzer-rust
--]]

---@type vim.lsp.Config
return {
    cmd = { "emmylua_ls" },
    filetypes = { "lua" },
    root_markers = {
        ".emmyrc.json",
        ".luarc.json",
        ".luacheckrc",
        ".git",
    },
    workspace_required = false,
    settings = require("luadev.lsp").get_settings(),
}
