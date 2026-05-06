-- macspaces/focus_menu.lua
-- Inicializa el overlay y los módulos de enfoque.
-- Ya no tiene menú propio — todo está en menu.lua.

local M = {}

local cfg      = require("macspaces.config")
local pomodoro = require("macspaces.pomodoro")
local breaks   = require("macspaces.breaks")
local overlay  = require("macspaces.focus_overlay")

function M.build() end  -- no-op, compatibilidad

function M.init()
    pomodoro.set_menubar_updater(function()
        overlay.refresh()
    end)
    breaks.init()
    overlay.start()
end

function M.destroy()
    overlay.stop()
end

return M
