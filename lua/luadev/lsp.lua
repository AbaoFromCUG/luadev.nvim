local utils = require("luadev.utils")

local M = {}

function M.get_settings()
    local addon_manager = require("luadev.addon_manager")
    local addons = vim.tbl_filter(function(addon)
        return addon.enabled
    end, vim.tbl_values(addon_manager.addons))
    local i = 1
    while i <= #addons do
        ---@type luadev.Addon
        local addon = addons[i]
        if addon.dependencies then
            vim.iter(addon.dependencies):each(function(name)
                if addon_manager.addons[name] then
                    table.insert(addons, addon_manager.addons[name])
                end
            end)
        end
        i = i + 1
    end
    local all_settings = vim.iter(addons)
        :map(function(addon)
            ---@cast addon luadev.Addon
            return { addon.library_settings, addon.config_settings }
        end)
        :flatten()
        :totable()

    return utils.merge(unpack(all_settings))
end

---enable addon
function M.update_settings()
    local client = vim.lsp.get_clients({ name = "luadev" })[1]

    if not client then
        return
    end
end

return M
