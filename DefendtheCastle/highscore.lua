local composer = require("composer")
local json = require("json")
local scene = composer.newScene()

local highestscore
local lastscore
local filePath = system.pathForFile("scores.json", system.DocumentsDirectory)

local function adListener(event)
  if (event.phase == "init") then
    print(event.provider)
  end
end

local function loadscore()
  local file = io.open(filePath, "r")

	if file then
		local contents = file:read("*a")
		io.close(file)
		highestscore = json.decode(contents)
	end
  
  if (lastscore == nil) then
    lastscore = 0
  end
end

local function savescore()
	local file = io.open(filePath, "w")

	if file then
		file:write(json.encode(highestscore))
		io.close(file)
	end
end

local function returnMenu()
  composer.gotoScene("menu")
end

function scene:create(event)
  
  local sceneGroup = self.view
  
  if (highestscore == nil) then
    highestscore = 0
  end
  
  lastscore = composer.getVariable("lastscore")
  loadscore()
  
  if (highestscore < lastscore) then
    highestscore = lastscore
  else
    highestscore = highestscore
  end

  
  local background = display.newImageRect(sceneGroup, "highscoreBackground.png", 360, 570)
  background.x = display.contentCenterX
  background.y = display.contentCenterY
  
  local menuButton = display.newImageRect(sceneGroup, "menuButton.png", 65, 26)
  menuButton.x = 260
  menuButton.y = 490
  
  local lastScoreText = display.newText(sceneGroup, "Last Score:", display.contentCenterX, 100, native.systemFont, 30)
  local lastScore = display.newText(sceneGroup, lastscore, display.contentCenterX, 150, native.systemFont, 30)
  local highestScoreText = display.newText(sceneGroup, "Highest Score:", display.contentCenterX, 300, native.systemFont, 30)
  local highestScore = display.newText(sceneGroup, highestscore, display.contentCenterX, 350, native.systemFont, 30)

  
  lastscore = composer.setVariable("lastscore", 0)
  savescore()
  
  menuButton:addEventListener("tap", returnMenu)
  
end

function scene:hide(event)
  composer.removeScene("highscore")
end

scene:addEventListener("create", scene)
scene:addEventListener("hide", scene)

return scene