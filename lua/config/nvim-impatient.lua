local M = {}

function M.config()
    local Impatient = require("utils").requirePlugin("impatient")
    if not Impatient then
        return
    end

    Impatient.enable_profile()

end

return M
