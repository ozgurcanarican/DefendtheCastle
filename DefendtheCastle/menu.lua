local composer = require("composer")
local scene = composer.newScene()

local function startGame()
  composer.gotoScene("gameSheet")
end

local function showHighScore()
  composer.gotoScene("highscore")
end

local function showHelp()
  composer.gotoScene("help1")
end

local function showCredits()
  composer.gotoScene("credits")
end

function scene:create(event)
  
  local sceneGroup = self.view
  
  local background = display.newImageRect(sceneGroup, "background1.png", 360, 570)
  background.x = display.contentCenterX
  background.y = display.contentCenterY

  local playButton = display.newImageRect(sceneGroup, "playButton.png", 65, 26)
  playButton.x = 100
  playButton.y = 200
  
  local scoreButton = display.newImageRect(sceneGroup, "scoreButton.png", 65, 26)
  scoreButton.x = 210
  scoreButton.y = 200
  
  local helpButton = display.newImageRect(sceneGroup, "helpButton.png", 65, 26)
  helpButton.x = 100
  helpButton.y = 250
  
  local creditsButton = display.newImageRect(sceneGroup, "creditsButton.png", 65, 26)
  creditsButton.x = 210
  creditsButton.y = 250

  playButton:addEventListener("tap", startGame)
  scoreButton:addEventListener("tap", showHighScore)
  helpButton:addEventListener("tap", showHelp)
  creditsButton:addEventListener("tap", showCredits)
end

scene:addEventListener("create", scene)

return scene