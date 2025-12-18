---@type luadev
local luadev

describe("default config", function()
    before_each(function()
        luadev = require("luadev")
    end)
    after_each(function()
        for name, _ in pairs(package.loaded) do
            if string.match(name, "^lua_ls.*") or string.match(name, "^lspconfig.*") then
                -- print("reset:", name)
                package.loaded["luadev"] = nil
            end
        end
    end)
    it("default config", function()
        luadev.setup()
        assert.are_nil(false)
    end)
    it("default config2", function()
        luadev.setup({})
    end)
end)
