local utils = require("luadev.utils")

local M = {}

function M.setup()
    local neoconf = require("neoconf")
    local manager = require("luadev.addon_manager")
    local function load_settings()
        local new_settings = neoconf.get("luadev")
        new_settings = utils.flatten(new_settings or {})
        require("luadev").config = vim.tbl_deep_extend("force", require("luadev").config, new_settings)
    end
    require("neoconf.plugins").register({
        name = "luadev",
        on_schema = function(schema)
            local addon_names = vim.iter(manager.addons)
                :map(function(_, v)
                    return v.id
                end)
                :totable()
            schema:set("luadev", {
                description = "Configuration of luadev.nvim",
                type = "object",
                properties = {
                    addons = {
                        type = "array",
                        description = "addon list which will be added to `Lua.workspace.library`",
                        items = {
                            anyOf = {
                                { enum = addon_names },
                                { type = "string" },
                            },
                        },
                    },
                },
            })
        end,
        on_update = function()
            -- print("update")
            -- load_settings()
        end,
    })
    load_settings()
end

return M
