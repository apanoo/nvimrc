local M = {}

M.requirePlugin = function(plugin_name, message)
    local status_ok, plugin = pcall(require, plugin_name)
    if not status_ok then
        if message ~= false then
            vim.notify(" Failed to load: " .. plugin_name .. " (From requirePlugin)", vim.log.levels.WARN)
        end
        return nil
    else
        if plugin ~= true then
            return plugin
        end
    end
    return nil
end

-- Function for make mapping easier.
M.keyMap = function (mode, lhs, rhs, opts)
	local options = {
		noremap = true,
		silent = true,
	}
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

return M