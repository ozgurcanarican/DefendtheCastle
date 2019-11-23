local composer = require("composer")
local scene = composer.newScene()

local function returnMenu()
  composer.gotoScene("menu")
end

function scene:create(event)
  
  local sceneGroup = self.view
  
  local background = display.newImageRect(sceneGroup, "credits.png", 360, 570)
  background.x = display.contentCenterX
  background.y = display.contentCenterY
  
  local menuButton = display.newImageRect(sceneGroup, "menuButton.png", 65, 26)
  menuButton.x = 260
  menuButton.y = 490
  
  menuButton:addEventListener("tap", returnMenu)
  
end

scene:addEventListener("create", scene)

return scene