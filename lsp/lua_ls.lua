--[[
-- lua-language-server(lua_ls): https://github.com/LuaLS/lua-language-server
--]]

return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        ".git",
    },
    settings = require("luadev.lsp").get_settings(),
}
