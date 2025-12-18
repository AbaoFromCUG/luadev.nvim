# Introduction


## Features

- [Addon management capability](https://luals.github.io/wiki/addons/#addon-manager) for [lua language server](https://github.com/luals/lua-language-server)
- Support neovim/plugins complete
- Support multiple language servers of lua ([lua_ls](https://github.com/LuaLS/lua-language-server), [emmylua_ls](https://github.com/EmmyLuaLs/emmylua-analyzer-rust))


<table>
    <tr>
        <th>busted</th>
        <th>luassert(busted assert)</th>
    </tr>
    <tr>
        <th style="text-align:center">
            <img alt="luassert" src="./doc/busted.png">
        </th>
        <th>
            <img alt="nvim stdlib" src="./doc/luassert_and_busted.png">
        </th>
    </tr>
    <tr>
        <th>nvim stdlib</th>
        <th>nvim plugin</th>
    </tr>
    <tr>
        <th style="text-align:center">
            <img alt="luassert" src="./doc/stdlib.png">
        </th>
        <th style="text-align:center">
            <img alt="luassert" src="./doc/plugin.png">
        </th>
    </tr>
</table>




# Installation

- With 💤lazy.nvim:

```lua
{
    "AbaoFromCUG/luadev.nvim",
    event = "VeryLazy",
    opts= {
        enabled_lsp = nil,  -- or "lua_ls", or "emmylua_ls", will call `vim.lsp.enable`
        -- install default
        addons = {
            -- addon published on https://github.com/LuaLS/LLS-Addons
            "luassert",
            -- neovim/plugins in rtp
            "nvim",
            "nvim-lspconfig",
        }
    }
}
```

Supported addons

- [x] Neovim plugins
- [x] Install from [LLS-Addons](https://github.com/LuaLS/LLS-Addons) automatically
- [x] Local addon
- [x] Remote addon

# Integration


## [Neoconf.nvim](https://github.com/folke/neoconf.nvim)

`luadev.nvim` support neoconf, like it's a native settings supported by lua language server

`.neoconf.json`

```json
{
  "luadev": {
    "addons": [
      "nvim-full",
      "nvim",
      "nvim-lspconfig",
      "luassert",
      "busted"
    ]
  }
}
```
