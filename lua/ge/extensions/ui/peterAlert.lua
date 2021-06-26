--extensions.ui_peterAlert.show()
local M = {}
M.dependencies = {"ui_imgui"}
local im = ui_imgui
local imguiUtils = require('ui/imguiUtils')

local peter = imguiUtils.texObj('/lua/ge/extensions/ui/peter/Peter_Griffin.png')
local petersize = im.ImVec2(100, 71)

local showUI = nil

local function onUpdate()
  if not showUI[0] then return end

  im.Begin('Peter Alert', showUI, im.WindowFlags_AlwaysAutoResize)
  im.Text("")
  im.Text("             ")
  im.SameLine()
  im.Image(peter.texId, petersize, im.ImVec2(0, 0), im.ImVec2(1, 1), col)
  im.Text("                      ")
  im.SameLine()
    if im.Button("OK") then
      log('I', '', 'Exiting Peter Alert' )
      showUI[0] = false
    end
  im.SameLine()
  im.Text("                      ")


  im.End()
end

local function openUI()
  showUI[0] = true
end

local function onExtensionLoaded()
  if showUI == nil then
    showUI = im.BoolPtr(false)
  end
end

M.show = openUI
M.onExtensionLoaded = onExtensionLoaded
M.onUpdate = onUpdate

return M