local luadev = require("luadev")

local addon_manager = require("luadev.addon_manager")

local cmds = {
    install = {
        complete = function()
            return vim.tbl_map(function(addon)
                return addon.id
            end, vim.tbl_values(addon_manager.addons))
        end,
        execute = function(name)
            addon_manager.load_addon(name)
        end,
    },
    -- enable = {
    --     complete = function()
    --         return vim.tbl_map(function(addon)
    --             return addon.id
    --         end, vim.tbl_values(addon_manager.addons))
    --     end,
    --     execute = function(name)
    --         -- addon_manager.enable({ name })
    --     end,
    -- },
    status = {
        execute = function()
            vim.cmd("checkhealth luadev")
        end,
    },
}

vim.api.nvim_create_user_command("LuaDev", function(opts)
    local cmd = cmds[opts.fargs[1]]
    if cmd == nil then
        luadev.open()
    else
        table.remove(opts.fargs, 1)
        cmd.execute(unpack(opts.fargs))
    end
end, {
    desc = "Addon manager of lua language server",
    nargs = "*",
    complete = function(_, line, _)
        local l = vim.split(line, "%s+")
        local n = #l - 2
        if n == 0 then
            return vim.tbl_filter(function(val)
                return vim.startswith(val, l[2])
            end, vim.tbl_keys(cmds))
        elseif n == 1 and cmds[l[2]] ~= nil then
            local cmd = cmds[l[2]]
            local condition = {}
            if type(cmd["complete"]) == "function" then
                condition = cmd.complete()
            elseif type(cmd["complete"]) == "table" then
                condition = cmd.complete --[[@as table]]
            end
            return vim.tbl_filter(function(val)
                return vim.startswith(val, l[3])
            end, condition)
        end
    end,
})
