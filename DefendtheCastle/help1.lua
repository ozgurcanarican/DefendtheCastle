local composer = require("composer")
local scene = composer.newScene()

local function nextPage()
  composer.gotoScene("help2")
end

function scene:create(event)
  
  local sceneGroup = self.view
  
  local background = display.newImageRect(sceneGroup, "help1bg.png", 360, 570)
  background.x = display.contentCenterX
  background.y = display.contentCenterY
  
  local nextButton = display.newImageRect(sceneGroup, "nextButton.png", 65, 26)
  nextButton.x = 260
  nextButton.y = 490
  
  nextButton:addEventListener("tap", nextPage)
  
end

scene:addEventListener("create", scene)

return scene