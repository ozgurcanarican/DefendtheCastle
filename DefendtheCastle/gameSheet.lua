local composer = require("composer")
local scene = composer.newScene()

local physics = require("physics")
physics.start()
physics.setGravity(0, 0)

local score = 0
local numTap1 = 0
local numTap2 = 0
local numTap3 = 0
local numTap4 = 0
local counter1 = 0
local counter2 = 0
local counter3 = 0
local counter4 = 0
local hCounter1 = 0
local hCounter2 = 0
local hCounter3 = 0
local hCounter4 = 0
local scoreText
local castle1, castle2, castle3, castle4, archer1, archer2, archer3, archer4, lightinfantryWalk1, lightinfantryWalk2, lightinfantryWalk3, lightinfantryWalk4, lightinfantryAttack1, lightinfantryAttack2, lightinfantryAttack3, lightinfantryAttack4, midinfantryWalk1, midinfantryWalk2, midinfantryWalk3, midinfantryWalk4,midinfantryAttack1, midinfantryAttack2, midinfantryAttack3, midinfantryAttack4, heavyinfantryWalk1, heavyinfantryWalk2, heavyinfantryWalk3, heavyinfantryWalk4,heavyinfantryAttack1, heavyinfantryAttack2, heavyinfantryAttack3,heavyinfantryAttack4, arrow1, arrow2, arrow3, arrow4, arrowTime1, arrowTime2, arrowTime3, arrowTime4
local backGroup, mainGroup, uiGroup


local archerData = {width = 50, height = 50, numFrames = 12, sheetContentWidth = 600, sheetContentHeight = 50}
local lightInfantryWalkData = {width = 35, height = 50, numFrames = 9, sheetContentWidth = 315, sheetContentHeight = 50}
local lightInfantryAttackData = {width = 50, height = 50, numFrames = 7, sheetContentWidth = 350, sheetContentHeight = 50}
local midInfantryWalkData = {width = 50, height = 50, numFrames = 9, sheetContentWidth = 450, sheetContentHeight = 50}
local midInfantryAttackData = {width = 50, height = 50, numFrames = 8, sheetContentWidth = 400, sheetContentHeight = 50}
local heavyInfantryWalkData = {width = 50, height = 50, numFrames = 9, sheetContentWidth = 450, sheetContentHeight = 50}
local heavyInfantryAttackData = {width = 50, height = 50, numFrames = 6, sheetContentWidth = 300, sheetContentHeight = 50}


local archer1Sheet = graphics.newImageSheet("archer1.png", archerData)
local archer2Sheet = graphics.newImageSheet("archer2.png", archerData)
local archer3Sheet = graphics.newImageSheet("archer3.png", archerData)
local archer4Sheet = graphics.newImageSheet("archer4.png", archerData)
local lightInfantryWalk1Sheet = graphics.newImageSheet("lightinfantryWalk1.png", lightInfantryWalkData)
local lightInfantryWalk2Sheet = graphics.newImageSheet("lightinfantryWalk2.png", lightInfantryWalkData)
local lightInfantryWalk3Sheet = graphics.newImageSheet("lightinfantryWalk3.png", lightInfantryWalkData)
local lightInfantryWalk4Sheet = graphics.newImageSheet("lightinfantryWalk4.png", lightInfantryWalkData)
local lightInfantryAttack1Sheet = graphics.newImageSheet("lightinfantryAttack1.png", lightInfantryAttackData)
local lightInfantryAttack2Sheet = graphics.newImageSheet("lightinfantryAttack2.png", lightInfantryAttackData)
local lightInfantryAttack3Sheet = graphics.newImageSheet("lightinfantryAttack3.png", lightInfantryAttackData)
local lightInfantryAttack4Sheet = graphics.newImageSheet("lightinfantryAttack4.png", lightInfantryAttackData)
local midInfantryWalk1Sheet = graphics.newImageSheet("midinfantryWalk1.png", midInfantryWalkData)
local midInfantryWalk2Sheet = graphics.newImageSheet("midinfantryWalk2.png", midInfantryWalkData)
local midInfantryWalk3Sheet = graphics.newImageSheet("midinfantryWalk3.png", midInfantryWalkData)
local midInfantryWalk4Sheet = graphics.newImageSheet("midinfantryWalk4.png", midInfantryWalkData)
local midInfantryAttack1Sheet = graphics.newImageSheet("midinfantryAttack1.png", midInfantryAttackData)
local midInfantryAttack2Sheet = graphics.newImageSheet("midinfantryAttack2.png", midInfantryAttackData)
local midInfantryAttack3Sheet = graphics.newImageSheet("midinfantryAttack3.png", midInfantryAttackData)
local midInfantryAttack4Sheet = graphics.newImageSheet("midinfantryAttack4.png", midInfantryAttackData)
local heavyInfantryWalk1Sheet = graphics.newImageSheet("heavyinfantryWalk1.png", heavyInfantryWalkData)
local heavyInfantryWalk2Sheet = graphics.newImageSheet("heavyinfantryWalk2.png", heavyInfantryWalkData)
local heavyInfantryWalk3Sheet = graphics.newImageSheet("heavyinfantryWalk3.png", heavyInfantryWalkData)
local heavyInfantryWalk4Sheet = graphics.newImageSheet("heavyinfantryWalk4.png", heavyInfantryWalkData)
local heavyInfantryAttack1Sheet = graphics.newImageSheet("heavyinfantryAttack1.png", heavyInfantryAttackData)
local heavyInfantryAttack2Sheet = graphics.newImageSheet("heavyinfantryAttack2.png", heavyInfantryAttackData)
local heavyInfantryAttack3Sheet = graphics.newImageSheet("heavyinfantryAttack3.png", heavyInfantryAttackData)
local heavyInfantryAttack4Sheet = graphics.newImageSheet("heavyinfantryAttack4.png", heavyInfantryAttackData)


local function excitingArcher1()
  
  numTap1 = numTap1 + 1
  if (numTap1 == 1) then
    archer1play = archer1:play()
    archer1play = true
    local function fireArrow1()
      local arrow1 = display.newImageRect(mainGroup, "arrow1.png", 25, 10)
      arrow1.x = archer1.x
      arrow1.y = archer1.y
      physics.addBody(arrow1, "dynamic", {isSensor = true})
      arrow1.isBullet = true
      arrow1.myName = "arrow1"
      arrow1:toBack()
      transition.to(arrow1, {x = 10, time = 1500, onComplete = function() display.remove(arrow1) end})
    end
    arrow1Time = timer.performWithDelay(500, fireArrow1)
    numTap1 = numTap1 + 1
    timer.pause(arrow1Time)
    timer.performWithDelay(600, timer.resume(arrow1Time))
  elseif (numTap1 > 1) then
    timer.performWithDelay(600, 
      function() 
        numTap1 = 0
      end)
  end
  
end

local function excitingArcher2()
  
  numTap2 = numTap2 + 1
  if (numTap2 == 1) then
    archer2play = archer2:play()
    archer2play = true
    local function fireArrow2()
      local arrow2 =  display.newImageRect(mainGroup, "arrow2.png", 25, 10)
      arrow2.x = archer2.x
      arrow2.y = archer2.y
      physics.addBody(arrow2, "dynamic", {isSensor = true})
      arrow2.isBullet = true
      arrow2.myName = "arrow2"
      arrow2:toBack()
      transition.to(arrow2, {x = 310, time = 2000, onComplete = function() display.remove(arrow2) end})
    end
    arrow2Time = timer.performWithDelay(500, fireArrow2)
    numTap2 = numTap2 + 1
    timer.pause(arrow2Time)
    timer.performWithDelay(600, timer.resume(arrow2Time))
  elseif (numTap2 > 1) then
    timer.performWithDelay(600, 
      function() 
        numTap2 = 0
      end)
  end
  
end

local function excitingArcher3()
  
  numTap3 = numTap3 + 1
  if (numTap3 == 1) then
    archer3play = archer3:play()
    archer3play = true
    local function fireArrow3()
      local arrow3 = display.newImageRect(mainGroup, "arrow3.png", 10, 25)
      arrow3.x = archer3.x
      arrow3.y = archer3.y
      physics.addBody(arrow3, "dynamic", {isSensor = true})
      arrow3.isBullet = true
      arrow3.myName = "arrow3"
      arrow3:toBack()
      transition.to(arrow3, {y = 500, time = 2000, onComplete = function() display.remove(arrow3) end})
    end
    arrow3Time = timer.performWithDelay(500, fireArrow3)
    numTap3 = numTap3 + 1
    timer.pause(arrow3Time)
    timer.performWithDelay(600, timer.resume(arrow3Time))
  elseif (numTap3 > 1) then
    timer.performWithDelay(600,
      function()
        numTap3 = 0
      end)
  end
  
end

local function excitingArcher4()
  
  numTap4 = numTap4 + 1
  if (numTap4 == 1) then
    archer4play = archer4:play()
    archer4play = true
    local function fireArrow4()
      local arrow4 = display.newImageRect(mainGroup, "arrow4.png", 10, 25)
      arrow4.x = archer4.x
      arrow4.y = archer4.y
      physics.addBody(arrow4, "dynamic", {isSensor = true})
      arrow4.isBullet = true
      arrow4.myName = "arrow4"
      arrow4:toBack()
      transition.to(arrow4, {y = 10, time = 2000, onComplete = function() display.remove(arrow4) end})
    end
    arrow4Time = timer.performWithDelay(500, fireArrow4)
    numTap4 = numTap4 + 1
    timer.pause(arrow4Time)
    timer.performWithDelay(600, timer.resume(arrow4Time))
  elseif (numTap4 > 1) then
    timer.performWithDelay(600,
      function()
        numTap4 = 0
      end)
  end
  
end

local function walkingLightInfantry1()
  lightinfantryWalk1 = display.newSprite(mainGroup, lightInfantryWalk1Sheet, {frames = {1, 2, 3, 4, 5, 6, 7, 8, 9}, time = 900})
  lightinfantryWalk1.x = display.contentWidth/2 - 200
  lightinfantryWalk1.y = display.contentHeight/2
  lightinfantryWalk1:play()
  physics.addBody(lightinfantryWalk1, "dynamic", {})
  lightinfantryWalk1:setLinearVelocity(5, 0)
  lightinfantryWalk1.myName = "lightinfantryWalk1"
end
  
local function walkingLightInfantry2()
  lightinfantryWalk2 = display.newSprite(mainGroup, lightInfantryWalk2Sheet, {frames = {1, 2, 3, 4, 5, 6, 7, 8, 9}, time = 900})
  lightinfantryWalk2.x = display.contentWidth/2 + 200
  lightinfantryWalk2.y = display.contentHeight/2
  lightinfantryWalk2:play()
  physics.addBody(lightinfantryWalk2, "dynamic", {})
  lightinfantryWalk2:setLinearVelocity(-5, 0)
  lightinfantryWalk2.myName = "lightinfantryWalk2"
end

local function walkingLightInfantry3() 
  lightinfantryWalk3 = display.newSprite(mainGroup, lightInfantryWalk3Sheet, {frames = {1, 2, 3, 4, 5, 6, 7, 8, 9}, time = 900})
  lightinfantryWalk3.x = display.contentWidth/2
  lightinfantryWalk3.y = display.contentHeight/2 + 330
  lightinfantryWalk3:play()
  physics.addBody(lightinfantryWalk3, "dynamic", {})
  lightinfantryWalk3:setLinearVelocity(0, -7.5)
  lightinfantryWalk3.myName = "lightinfantryWalk3"
end

local function walkingLightInfantry4()  
  lightinfantryWalk4 = display.newSprite(mainGroup, lightInfantryWalk4Sheet, {frames = {1, 2, 3, 4, 5, 6, 7, 8, 9}, time = 900})
  lightinfantryWalk4.x = display.contentWidth/2
  lightinfantryWalk4.y = display.contentHeight/2 - 330
  lightinfantryWalk4:play()
  physics.addBody(lightinfantryWalk4, "dynamic")
  lightinfantryWalk4:setLinearVelocity(0, 7.5)
  lightinfantryWalk4.myName = "lightinfantryWalk4"
end

local function walkingMidInfantry1()
  midinfantryWalk1 = display.newSprite(mainGroup, midInfantryWalk1Sheet, {frames = {1, 2, 3, 4, 5, 6, 7, 8, 9}, time = 900})
  midinfantryWalk1.x = display.contentWidth/2 - 200
  midinfantryWalk1.y = display.contentHeight/2
  midinfantryWalk1:play()
  physics.addBody(midinfantryWalk1, "dynamic", {})
  midinfantryWalk1:setLinearVelocity(5, 0)
  midinfantryWalk1.myName = "midinfantryWalk1"
end
  
local function walkingMidInfantry2() 
  midinfantryWalk2 = display.newSprite(mainGroup, midInfantryWalk2Sheet, {frames = {1, 2, 3, 4, 5, 6, 7, 8, 9}, time = 900})
  midinfantryWalk2.x = display.contentWidth/2 + 200
  midinfantryWalk2.y = display.contentHeight/2
  midinfantryWalk2:play()
  physics.addBody(midinfantryWalk2, "dynamic", {})
  midinfantryWalk2:setLinearVelocity(-5, 0)
  midinfantryWalk2.myName = "midinfantryWalk2"
end
  
local function walkingMidInfantry3() 
  midinfantryWalk3 = display.newSprite(mainGroup, midInfantryWalk3Sheet, {frames = {1, 2, 3, 4, 5, 6, 7, 8, 9}, time = 900})
  midinfantryWalk3.x = display.contentWidth/2
  midinfantryWalk3.y = display.contentHeight/2 + 330
  midinfantryWalk3:play()
  physics.addBody(midinfantryWalk3, "dynamic", {})
  midinfantryWalk3:setLinearVelocity(0, -7.5)
  midinfantryWalk3.myName = "midinfantryWalk3"
end 
  
local function walkingMidInfantry4()
  midinfantryWalk4 = display.newSprite(mainGroup, midInfantryWalk4Sheet, {frames = {1, 2, 3, 4, 5, 6, 7, 8, 9}, time = 900})
  midinfantryWalk4.x = display.contentWidth/2
  midinfantryWalk4.y = display.contentHeight/2 - 330
  midinfantryWalk4:play()
  physics.addBody(midinfantryWalk4, "dynamic", {})
  midinfantryWalk4:setLinearVelocity(0, 7.5)
  midinfantryWalk4.myName = "midinfantryWalk4"
end

local function walkingHeavyInfantry1()
  heavyinfantryWalk1 = display.newSprite(mainGroup, heavyInfantryWalk1Sheet, {frames = {1, 2, 3, 4, 5, 6, 7, 8, 9}, time = 900})
  heavyinfantryWalk1.x = display.contentWidth/ - 200
  heavyinfantryWalk1.y = display.contentHeight/2
  heavyinfantryWalk1:play()
  physics.addBody(heavyinfantryWalk1, "dynamic", {})
  heavyinfantryWalk1:setLinearVelocity(5, 0)
  heavyinfantryWalk1.myName = "heavyinfantryWalk1"
end

local function walkingHeavyInfantry2()
  heavyinfantryWalk2 = display.newSprite(mainGroup, heavyInfantryWalk2Sheet, {frames = {1, 2, 3, 4, 5, 6, 7, 8, 9}, time = 900})
  heavyinfantryWalk2.x = display.contentWidth/2 + 200
  heavyinfantryWalk2.y = display.contentHeight/2
  heavyinfantryWalk2:play()
  physics.addBody(heavyinfantryWalk2, "dynamic", {})
  heavyinfantryWalk2:setLinearVelocity(-5, 0)
  heavyinfantryWalk2.myName = "heavyinfantryWalk2"
end

local function walkingHeavyInfantry3()
  heavyinfantryWalk3 = display.newSprite(mainGroup, heavyInfantryWalk3Sheet, {frames = {1, 2, 3, 4, 5, 6, 7, 8, 9}, time = 900})
  heavyinfantryWalk3.x = display.contentWidth/2
  heavyinfantryWalk3.y = display.contentHeight/2 + 330
  heavyinfantryWalk3:play()
  physics.addBody(heavyinfantryWalk3, "dynamic", {})
  heavyinfantryWalk3:setLinearVelocity(0, -7.5)
  heavyinfantryWalk3.myName = "heavyinfantryWalk3"
end

local function walkingHeavyInfantry4()
  heavyinfantryWalk4 = display.newSprite(mainGroup, heavyInfantryWalk4Sheet, {frames = {1, 2, 3, 4, 5, 6, 7, 8, 9}, time = 900})
  heavyinfantryWalk4.x = display.contentWidth/2
  heavyinfantryWalk4.y = display.contentHeight/2 - 330
  heavyinfantryWalk4:play()
  physics.addBody(heavyinfantryWalk4, "dynamic", {})
  heavyinfantryWalk4:setLinearVelocity(0, 7.5)
  heavyinfantryWalk4.myName = "heavyinfantryWalk4"
end

local function attackingLightInfantry1()
  lightinfantryAttack1 = display.newSprite(mainGroup, lightInfantryAttack1Sheet, {name = "LIattack", frames = {1, 2, 3, 4, 5, 6, 7}, time = 700})
  lightinfantryAttack1:play()
  lightinfantryAttack1.myName = "lightinfantryAttack1"
end

local function attackingLightInfantry2()
  lightinfantryAttack2 = display.newSprite(mainGroup, lightInfantryAttack2Sheet, {name = "LIattack", frames = {1, 2, 3, 4, 5, 6, 7}, time = 700})
  lightinfantryAttack2:play()
  lightinfantryAttack2.myName = "lightinfantryAttack2"
end

local function attackingLightInfantry3()
  lightinfantryAttack3 = display.newSprite(mainGroup, lightInfantryAttack3Sheet, {name = "LIattack", frames = {1, 2, 3, 4, 5, 6, 7}, time = 700})
  lightinfantryAttack3:play()
  lightinfantryAttack3.myName = "lightinfantryAttack3"
end

local function attackingLightInfantry4()
  lightinfantryAttack4 = display.newSprite(mainGroup, lightInfantryAttack4Sheet, {name = "LIattack", frames = {1, 2, 3, 4, 5, 6, 7,}, time = 700})
  lightinfantryAttack4:play()
  lightinfantryAttack4.myName = "lightinfantryAttack4"
end

local function attackingMidInfantry1()
  midinfantryAttack1 = display.newSprite(mainGroup, midInfantryAttack1Sheet, {name = "MIattack", frames = {1, 2, 3, 4, 5, 6, 7, 8}, time = 800})
  midinfantryAttack1:play()
  midinfantryAttack1.myName = "midinfantryAttack1"
end

local function attackingMidInfantry2()
  midinfantryAttack2 = display.newSprite(mainGroup, midInfantryAttack2Sheet, {name = "MIattack", frames = {1, 2, 3, 4, 5, 6, 7, 8}, time = 800})
  midinfantryAttack2:play()
  midinfantryAttack2.myName = "midinfantryAttack2"
end

local function attackingMidInfantry3()
  midinfantryAttack3 = display.newSprite(mainGroup, midInfantryAttack3Sheet, {name = "MIattack", frames = {1, 2, 3, 4, 5, 6, 7, 8}, time = 800})
  midinfantryAttack3:play()
  midinfantryAttack3.myName = "midinfantryAttack1"
end

local function attackingMidInfantry4()
  midinfantryAttack4 = display.newSprite(mainGroup, midInfantryAttack4Sheet, {name = "MIattack", frames = {1, 2, 3, 4, 5, 6, 7, 8}, time = 800})
  midinfantryAttack4:play()
  midinfantryAttack4.myName = "midinfantryAttack4"
end

local function attackingHeavyInfantry1()
  heavyinfantryAttack1 = display.newSprite(mainGroup, heavyInfantryAttack1Sheet, {name = "HIattack", frames = {1, 2, 3, 4, 5, 6}, time = 600})
  heavyinfantryAttack1:play()
  heavyinfantryAttack1.myName = "heavyinfantryAttack1"
end

local function attackingHeavyInfantry2()
  heavyinfantryAttack2 = display.newSprite(mainGroup, heavyInfantryAttack2Sheet, {name = "HIattack", frames = {1, 2, 3, 4, 5, 6}, time = 600})
  heavyinfantryAttack2:play()
  heavyinfantryAttack2.myName = "heavyinfantryAttack2"
end

local function attackingHeavyInfantry3()
  heavyinfantryAttack3 = display.newSprite(mainGroup, heavyInfantryAttack3Sheet, {name = "HIattack", frames = {1, 2, 3, 4, 5, 6}, time = 600})
  heavyinfantryAttack3:play()
  heavyinfantryAttack3.myName = "heavyinfantryAttack3"
end

local function attackingHeavyInfantry4()
  heavyinfantryAttack4 = display.newSprite(mainGroup, heavyInfantryAttack4Sheet, {name = "HIattack", frames = {1, 2, 3, 4, 5, 6}, time = 600})
  heavyinfantryAttack4:play()
  heavyinfantryAttack4.myName = "heavyinfantryAttack4"
end

local function lightinfantryLoop()
  walkingLightInfantry1()
  walkingLightInfantry2()
  walkingLightInfantry3()
  walkingLightInfantry4()
end

local function midinfantryLoop()
  walkingMidInfantry1()
  walkingMidInfantry2()
  walkingMidInfantry3()
  walkingMidInfantry4()
end
  
local function heavyinfantryLoop()
  walkingHeavyInfantry1()
  walkingHeavyInfantry2()
  walkingHeavyInfantry3()
  walkingHeavyInfantry4()
end

local function calltheCastle2()
  castle2 = display.newImageRect(mainGroup, "castle2.png", 100, 100)
  castle2.x = display.contentCenterX
  castle2.y = display.contentCenterY
  physics.addBody(castle2, "static", {})
  castle2.myName = "castle2"
  display.remove(castle1)
end
local function killArchers(event)
  
  if (event.phase == "began") then

    obj1 = event.object1
    obj2 = event.object2
    
    if ((obj1.myName == "archer1" and obj2.myName == "lightinfantryWalk1") or (obj1.myName == "lightinfantryWalk1" and obj2.myName == "archer1")) then
      
      attackingLightInfantry1()
      lightinfantryAttack1.x = display.contentWidth/2 - 95
      lightinfantryAttack1.y = display.contentHeight/2
      
      display.remove(obj1)
			display.remove(obj2)
      
      local function callBackLightInfantryWalk1()
        walkingLightInfantry1()
        lightinfantryWalk1.x = display.contentWidth/2 - 95
        lightinfantryWalk1.y = display.contentHeight/2
        
        display.remove(lightinfantryAttack1) ; lightinfantryAttack1 = nil
      end
      
      timer.performWithDelay(700, callBackLightInfantryWalk1)
      
    elseif ((obj1.myName == "archer2" and obj2.myName == "lightinfantryWalk2") or (obj1.myName == "lightinfantryWalk2" and obj2.myName == "archer2")) then
      
      attackingLightInfantry2()
      lightinfantryAttack2.x = display.contentWidth/2 + 95
      lightinfantryAttack2.y = display.contentHeight/2
      
      display.remove(obj1)
			display.remove(obj2)
      
      local function callBackLightInfantryWalk2()
        walkingLightInfantry2()
        lightinfantryWalk2.x = display.contentWidth/2 + 95
        lightinfantryWalk2.y = display.contentHeight/2
        
        display.remove(lightinfantryAttack2); lightinfantryAttack2 = nil
      end
      
      timer.performWithDelay(700, callBackLightInfantryWalk2)
      
    elseif ((obj1.myName == "archer3" and obj2.myName == "lightinfantryWalk3") or (obj1.myName == "lightinfantryWalk3" and obj2.myName == "archer3")) then
      
      attackingLightInfantry3()
      lightinfantryAttack3.x = display.contentWidth/2
      lightinfantryAttack3.y = display.contentHeight/2 + 95
      
      display.remove(obj1)
			display.remove(obj2)
      
      local function callBackLightInfantryWalk3()
        walkingLightInfantry3()
        lightinfantryWalk3.x = display.contentWidth/2
        lightinfantryWalk3.y = display.contentHeight/2 + 95
        
        display.remove(lightinfantryAttack3); lightinfantryAttack3 = nil
      end
      
      timer.performWithDelay(700, callBackLightInfantryWalk3)
      
    elseif ((obj1.myName == "archer4" and obj2.myName == "lightinfantryWalk4") or (obj1.myName == "lightinfantryWalk4" and obj2.myName == "archer4")) then
      
      attackingLightInfantry4()
      lightinfantryAttack4.x = display.contentWidth/2
      lightinfantryAttack4.y = display.contentHeight/2 - 95
      
      display.remove(obj1)
			display.remove(obj2)
      
      local function callBackLightInfantryWalk4()
        walkingLightInfantry4()
        lightinfantryWalk4.x = display.contentWidth/2
        lightinfantryWalk4.y = display.contentHeight/2 - 95
        
        display.remove(lightinfantryAttack4); lightinfantryAttack4 = nil
      end
      
      timer.performWithDelay(700, callBackLightInfantryWalk4)
      
    elseif ((obj1.myName == "archer1" and obj2.myName == "midinfantryWalk1") or (obj1.myName == "midinfantryWalk1" and obj2.myName == "archer1")) then
      
      attackingMidInfantry1()
      midinfantryAttack1.x = display.contentWidth/2 - 95
      midinfantryAttack1.y = display.contentHeight/2
      
      display.remove(obj1)
			display.remove(obj2)
      
      local function callBackMidInfantryWalk1()
        walkingMidInfantry1()
        midinfantryWalk1.x = display.contentWidth/2 - 95
        midinfantryWalk1.y = display.contentHeight/2
        
        display.remove(midinfantryAttack1); midinfantryAttack1 = nil
      end
      
      timer.performWithDelay(800, callBackMidInfantryWalk1)
      
    elseif ((obj1.myName == "archer2" and obj2.myName == "midinfantryWalk2") or (obj1.myName == "midinfantryWalk2" and obj2.myName == "archer2")) then
      
      attackingMidInfantry2()
      midinfantryAttack2.x = display.contentWidth/2 + 95
      midinfantryAttack2.y = display.contentHeight/2
      
      display.remove(obj1)
			display.remove(obj2)
      
      local function callBackMidInfantryWalk2()
        walkingMidInfantry2()
        midinfantryWalk2.x = display.contentWidth/2 + 95
        midinfantryWalk2.y = display.contentHeight/2
        
        display.remove(midinfantryAttack2); midinfantryAttack2 = nil
      end
      
      timer.performWithDelay(800, callBackMidInfantryWalk2)
      
    elseif ((obj1.myName == "archer3" and obj2.myName == "midinfantryWalk3") or (obj1.myName == "midinfantryWalk3" and obj2.myName == "archer3")) then
      
      attackingMidInfantry3()
      midinfantryAttack3.x = display.contentWidth/2
      midinfantryAttack3.y = display.contentHeight/2 + 95
      
      display.remove(obj1)
			display.remove(obj2)
      
      local function callBackMidInfantryWalk3()
        walkingMidInfantry3()
        midinfantryWalk3.x = display.contentWidth/2
        midinfantryWalk3.y = display.contentHeight/2 + 95
        
        display.remove(midinfantryAttack3); midinfantryAttack3 = nil
      end
      
      timer.performWithDelay(800, callBackMidInfantryWalk3)
      
    elseif ((obj1.myName == "archer4" and obj2.myName == "midinfantryWalk4") or (obj1.myName == "midinfantryWalk4" and obj2.myName == "archer4")) then
      
      attackingMidInfantry4()
      midinfantryAttack4.x = display.contentWidth/2
      midinfantryAttack4.y = display.contentHeight/2 - 95
      
      display.remove(obj1)
			display.remove(obj2)
      
      local function callBackMidInfantryWalk4()
        walkingMidInfantry4()
        midinfantryWalk4.x = display.contentWidth/2
        midinfantryWalk4.y = display.contentHeight/2 - 95
        
        display.remove(midinfantryAttack4); midinfantryAttack4 = nil
      end
      
      timer.performWithDelay(800, callBackMidInfantryWalk4)
      
    elseif ((obj1.myName == "archer1" and obj2.myName == "heavyinfantryWalk1") or (obj1.myName == "heavyinfantryWalk1" and obj2.myName == "archer1")) then
      
      attackingHeavyInfantry1()
      heavyinfantryAttack1.x = display.contentWidth/2 - 95
      heavyinfantryAttack1.y = display.contentHeight/2
      
      display.remove(obj1)
			display.remove(obj2)
      
      local function callBackHeavyInfantryWalk1()
        walkingHeavyInfantry1()
        heavyinfantryWalk1.x = display.contentWidth/2 - 95
        heavyinfantryWalk1.y = display.contentHeight/2
        
        display.remove(heavyinfantryAttack1); heavyinfantryAttack1 = nil
      end
      
      timer.performWithDelay(600, callBackHeavyInfantryWalk1)
      
    elseif ((obj1.myName == "archer2" and obj2.myName == "heavyinfantryWalk2") or (obj1.myName == "heavyinfantryWalk2" and obj2.myName == "archer2")) then
      
      attackingHeavyInfantry2()
      heavyinfantryAttack2.x = display.contentWidth/2 + 95
      heavyinfantryAttack2.y = display.contentHeight/2
      
      display.remove(obj1)
			display.remove(obj2)
      
      local function callBackHeavyInfantryWalk2()
        walkingHeavyInfantry2()
        heavyinfantryWalk2.x = display.contentWidth/2 + 95
        heavyinfantryWalk2.y = display.contentHeight/2
        
        display.remove(heavyinfantryAttack2); heavyinfantryAttack2 = nil
      end
      
      timer.performWithDelay(600, callBackHeavyInfantryWalk2)
      
    elseif ((obj1.myName == "archer3" and obj2.myName == "heavyinfantryWalk3") or (obj1.myName == "heavyinfantryWalk3" and obj2.myName == "archer3")) then
      
      attackingHeavyInfantry3()
      heavyinfantryAttack3.x = display.contentWidth/2
      heavyinfantryAttack3.y = display.contentHeight/2 + 95
      
      display.remove(obj1)
			display.remove(obj2)
      
      local function callBackHeavyInfantryWalk3()
        walkingHeavyInfantry3()
        heavyinfantryWalk3.x = display.contentWidth/2
        heavyinfantryWalk3.y = display.contentHeight/2 + 95
        
        display.remove(heavyinfantryAttack3); heavyinfantryAttack3 = nil
      end
      
      timer.performWithDelay(600, callBackHeavyInfantryWalk3)
      
    elseif ((obj1.myName == "archer4" and obj2.myName == "heavyinfantryWalk4") or (obj1.myName == "heavyinfantryWalk4" and obj2.myName == "archer4")) then
      
      attackingHeavyInfantry4()
      heavyinfantryAttack4.x = display.contentWidth/2
      heavyinfantryAttack4.y = display.contentHeight/2 - 95
      
      display.remove(obj1)
			display.remove(obj2)
      
      local function callBackHeavyInfantryWalk4()
        walkingHeavyInfantry4()
        heavyinfantryWalk4.x = display.contentWidth/2
        heavyinfantryWalk4.y = display.contentHeight/2 - 95
        
        display.remove(heavyinfantryAttack4); heavyinfantryAttack4 = nil
      end
      
      timer.performWithDelay(600, callBackHeavyInfantryWalk4)  
      
    end
  end
end

local function killInfantries(event)
  
  if (event.phase == "began") then
    obj1 = event.object1
    obj2 = event.object2
    
    if ((obj1.myName == "arrow1" and obj2.myName == "lightinfantryWalk1") or (obj1.myName == "lightinfantryWalk1" and obj2.myName == "arrow1")) then
      
      display.remove(obj1)
      display.remove(obj2)
      
      score = score + 100
			scoreText.text = "Score: " .. score
      
    elseif ((obj1.myName == "arrow2" and obj2.myName == "lightinfantryWalk2") or (obj1.myName == "lightinfantryWalk2" and obj2.myName == "arrow2")) then
      
      display.remove(obj1)
      display.remove(obj2)
      
      score = score + 100
			scoreText.text = "Score: " .. score
      
    elseif ((obj1.myName == "arrow3" and obj2.myName == "lightinfantryWalk3") or (obj1.myName == "lightinfantryWalk3" and obj2.myName == "arrow3")) then
      
      display.remove(obj1)
      display.remove(obj2)
      
      score = score + 100
			scoreText.text = "Score: " .. score
      
    elseif ((obj1.myName == "arrow4" and obj2.myName == "lightinfantryWalk4") or (obj1.myName == "lightinfantryWalk4" and obj2.myName == "arrow4")) then
      
      display.remove(obj1)
      display.remove(obj2)
      
      score = score + 100
			scoreText.text = "Score: " .. score
      
    elseif ((obj1.myName == "arrow1" and obj2.myName == "midinfantryWalk1") or (obj1.myName == "midinfantryWalk1" and obj2.myName == "arrow1")) then
      
      counter1 = counter1 + 1
      
      if (counter1 == 1) then
      
        display.remove("arrow1")
      
      elseif (counter1 == 2) then
        
        display.remove(obj1)
        display.remove(obj2)
      
        score = score + 200
        scoreText.text = "Score: " .. score
        
        counter1 = 0
      end
      
    elseif ((obj1.myName == "arrow2" and obj2.myName == "midinfantryWalk2") or (obj1.myName == "midinfantryWalk2" and obj2.myName == "arrow2")) then
      
      counter2 = counter2 + 1
      
      if (counter2 == 1) then
      
        display.remove("arrow2")
      
      elseif (counter2 == 2) then
        
        display.remove(obj1)
        display.remove(obj2)
      
        score = score + 200
        scoreText.text = "Score: " .. score
        
        counter2 = 0
      end
      
    elseif ((obj1.myName == "arrow3" and obj2.myName == "midinfantryWalk3") or (obj1.myName == "midinfantryWalk3" and obj2.myName == "arrow3")) then
      
      counter3 = counter3 + 1
      
      if (counter3 == 1) then
      
        display.remove("arrow3")
      
      elseif (counter3 == 2) then
        
        display.remove(obj1)
        display.remove(obj2)
      
        score = score + 200
        scoreText.text = "Score: " .. score
        
        counter3 = 0
      end
      
    elseif ((obj1.myName == "arrow4" and obj2.myName == "midinfantryWalk4") or (obj1.myName == "midinfantryWalk4" and obj2.myName == "arrow4")) then
      
      counter4 = counter4 + 1
      
      if (counter4 == 1) then
      
        display.remove("arrow4")
      
      elseif (counter4 == 2) then
        
        display.remove(obj1)
        display.remove(obj2)
      
        score = score + 200
        scoreText.text = "Score: " .. score
        
        counter4 = 0
      end
      
    elseif ((obj1.myName == "arrow1" and obj2.myName == "heavyinfantryWalk1") or (obj1.myName == "heavyinfantryWalk1" and obj2.myName == "arrow1")) then
      
      hCounter1 = hCounter1 + 1
      
      if (hCounter1 == 1) then
      
        display.remove("arrow1")
        
      elseif (hCounter1 == 2) then
      
        display.remove("arrow1")
      
      elseif (hCounter1 == 3) then
        
        display.remove(obj1)
        display.remove(obj2)
      
        score = score + 300
        scoreText.text = "Score: " .. score
        
        hCounter1 = 0
        
      end
      
    elseif ((obj1.myName == "arrow2" and obj2.myName == "heavyinfantryWalk2") or (obj1.myName == "heavyinfantryWalk2" and obj2.myName == "arrow2")) then
      
      hCounter2 = hCounter2 + 1
      
      if (hCounter2 == 1) then
      
        display.remove("arrow2")
        
      elseif (hCounter2 == 2) then
      
        display.remove("arrow2")
      
      elseif (hCounter2 == 3) then
        
        display.remove(obj1)
        display.remove(obj2)
      
        score = score + 300
        scoreText.text = "Score: " .. score
        
        hCounter2 = 0
        
      end
      
    elseif ((obj1.myName == "arrow3" and obj2.myName == "heavyinfantryWalk3") or (obj1.myName == "heavyinfantryWalk3" and obj2.myName == "arrow3")) then
      
      hCounter3 = hCounter3 + 1
      
      if (hCounter3 == 1) then
      
        display.remove("arrow3")
        
      elseif (hCounter3 == 2) then
      
        display.remove("arrow3")
      
      elseif (hCounter3 == 3) then
        
        display.remove(obj1)
        display.remove(obj2)
      
        score = score + 300
        scoreText.text = "Score: " .. score
        
        hCounter3 = 0
        
      end
      
    elseif ((obj1.myName == "arrow4" and obj2.myName == "heavyinfantryWalk4") or (obj1.myName == "heavyinfantryWalk4" and obj2.myName == "arrow4")) then
      
      hCounter4 = hCounter4 + 1
      
      if (hCounter4 == 1) then
      
        display.remove("arrow4")
        
      elseif (hCounter4 == 2) then
      
        display.remove("arrow4")
      
      elseif (hCounter4 == 3) then
        
        display.remove(obj1)
        display.remove(obj2)
      
        score = score + 300
        scoreText.text = "Score: " .. score
        
        hCounter4 = 0
        
      end
    end
  end
end

local function destroyCastle(event)
  
  if (event.phase == "began") then
    obj1 = event.object1
    obj2 = event.object2
    
    if ((obj1.myName == "castle1" and obj2.myName == "lightinfantryWalk1") or (obj1.myName == "lightinfantryWalk1" and obj2.myName == "castle1")) then
      
      attackingLightInfantry1()
      lightinfantryAttack1.x = display.contentWidth/2 - 60
      lightinfantryAttack1.y = display.contentHeight/2
      display.remove(lightinfantryWalk1); lightinfantryWalk1 = nil
      timer.performWithDelay(800, calltheCastle2)
      timer.performWithDelay(2000, gameOver)
      
    elseif ((obj1.myName == "castle1" and obj2.myName == "lightinfantryWalk2") or (obj1.myName == "lightinfantryWalk2" and obj2.myName == "castle1")) then
      
      attackingLightInfantry2()
      lightinfantryAttack2.x = display.contentWidth/2 + 60
      lightinfantryAttack2.y = display.contentHeight/2
      display.remove(lightinfantryWalk2); lightinfantryWalk2 = nil
      timer.performWithDelay(800, calltheCastle2)
      timer.performWithDelay(2000, gameOver)
      
    elseif ((obj1.myName == "castle1" and obj2.myName == "lightinfantryWalk3") or (obj1.myName == "lightinfantryWalk3" and obj2.myName == "castle1")) then
      
      attackingLightInfantry3()
      lightinfantryAttack3.x = display.contentWidth/2
      lightinfantryAttack3.y = display.contentHeight/2 + 60
      display.remove(lightinfantryWalk3); lightinfantryWalk3 = nil
      timer.performWithDelay(800, calltheCastle2)
      timer.performWithDelay(2000, gameOver)
      
    elseif ((obj1.myName == "castle1" and obj2.myName == "lightinfantryWalk4") or (obj1.myName == "lightinfantryWalk4" and obj2.myName == "castle1")) then
      
      attackingLightInfantry4()
      lightinfantryAttack4.x = display.contentWidth/2
      lightinfantryAttack4.y = display.contentHeight/2 - 60
      display.remove(lightinfantryWalk4); lightinfantryWalk4 = nil
      timer.performWithDelay(800, calltheCastle2)
      timer.performWithDelay(2000, gameOver)
    
    elseif ((obj1.myName == "castle1" and obj2.myName == "midinfantryWalk1") or (obj1.myName == "midinfantryWalk1" and obj2.myName == "castle1")) then
      
      attackingMidInfantry1()
      midinfantryAttack1.x = display.contentWidth/2 - 60
      midinfantryAttack1.y = display.contentHeight/2
      display.remove(midinfantryWalk1); midinfantryWalk1 = nil
      timer.performWithDelay(800, calltheCastle2)
      timer.performWithDelay(2000, gameOver)
      
    elseif ((obj1.myName == "castle1" and obj2.myName == "midinfantryWalk2") or (obj1.myName == "midinfantryWalk2" and obj2.myName == "castle1")) then
      
      attackingMidInfantry2()
      midinfantryAttack2.x = display.contentWidth/2 + 60
      midinfantryAttack2.y = display.contentHeight/2
      display.remove(midinfantryWalk2); midinfantryWalk2 = nil
      timer.performWithDelay(800, calltheCastle2)
      timer.performWithDelay(2000, gameOver)
      
    elseif ((obj1.myName == "castle1" and obj2.myName == "midinfantryWalk3") or (obj1.myName == "midinfantryWalk3" and obj2.myName == "castle1")) then
      
      attackingMidInfantry3()
      midinfantryAttack3.x = display.contentWidth/2
      midinfantryAttack3.y = display.contentHeight/2 + 60
      display.remove(midinfantryWalk3); midinfantryWalk3 = nil
      timer.performWithDelay(800, calltheCastle2)
      timer.performWithDelay(2000, gameOver)
      
    elseif ((obj1.myName == "castle1" and obj2.myName == "midinfantryWalk4") or (obj1.myName == "midinfantryWalk4" and obj2.myName == "castle1")) then
      
      attackingMidInfantry4()
      midinfantryAttack4.x = display.contentWidth/2
      midinfantryAttack4.y = display.contentHeight/2 - 60
      display.remove(lightinfantryWalk4); midinfantryWalk4 = nil
      timer.performWithDelay(800, calltheCastle2)
      timer.performWithDelay(2000, gameOver)
      
    elseif ((obj1.myName == "castle1" and obj2.myName == "heavyinfantryWalk1") or (obj1.myName == "heavyinfantryWalk1" and obj2.myName == "castle1")) then
      
      attackingHeavyInfantry1()
      heavyinfantryAttack1.x = display.contentWidth/2 - 60
      heavyinfantryAttack1.y = display.contentHeight/2
      display.remove(heavyinfantryWalk1); heavyinfantryWalk1 = nil
      timer.performWithDelay(800, calltheCastle2)
      timer.performWithDelay(2000, gameOver)
      
    elseif ((obj1.myName == "castle1" and obj2.myName == "heavyinfantryWalk2") or (obj1.myName == "heavyinfantryWalk2" and obj2.myName == "castle1")) then
      
      attackingHeavyInfantry2()
      heavyinfantryAttack2.x = display.contentWidth/2 + 60
      heavyinfantryAttack2.y = display.contentHeight/2
      display.remove(heavyinfantryWalk2); heavyinfantryWalk2 = nil
      timer.performWithDelay(800, calltheCastle2)
      timer.performWithDelay(2000, gameOver)
      
    elseif ((obj1.myName == "castle1" and obj2.myName == "heavyinfantryWalk3") or (obj1.myName == "heavyinfantryWalk3" and obj2.myName == "castle1")) then
      
      attackingHeavyInfantry3()
      heavyinfantryAttack3.x = display.contentWidth/2
      heavyinfantryAttack3.y = display.contentHeight/2 + 60
      display.remove(heavyinfantryWalk3); heavyinfantryWalk3 = nil
      timer.performWithDelay(800, calltheCastle2)
      timer.performWithDelay(2000, gameOver)
      
    elseif ((obj1.myName == "castle1" and obj2.myName == "heavyinfantryWalk4") or (obj1.myName == "heavyinfantryWalk4" and obj2.myName == "castle1")) then
      
      attackingHeavyInfantry4()
      heavyinfantryAttack4.x = display.contentWidth/2
      heavyinfantryAttack4.y = display.contentHeight/2 - 60
      display.remove(heavyinfantryWalk4); heavyinfantryWalk4 = nil
      timer.performWithDelay(800, calltheCastle2)
      timer.performWithDelay(2000, gameOver)
      
    end
  end
end

local function updateScoreText()
  scoreText.text = score "Score: " .. score
end

function gameOver()
  composer.setVariable("lastscore", score)
  composer.gotoScene("highscore")
end

function scene:create(event)
  local sceneGroup = self.view
  
  physics.pause()
  
  backGroup = display.newGroup()
	sceneGroup:insert(backGroup)

	mainGroup = display.newGroup()
	sceneGroup:insert(mainGroup)

	uiGroup = display.newGroup()
	sceneGroup:insert(uiGroup)
  
  local background = display.newImageRect(backGroup, "background2.png", 360, 570)
  background.x = display.contentCenterX
  background.y = display.contentCenterY
  
  castle1 = display.newImageRect(mainGroup, "castle1.png", 100, 100)
  castle1.x = display.contentCenterX
	castle1.y = display.contentCenterY
  physics.addBody(castle1, "static", {})
	castle1.myName = "castle1"
  
  archer1 = display.newSprite(mainGroup, archer1Sheet, {name = "firing", frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, time = 600, loopCount = 1})
  archer1.x = display.contentWidth/2 - 55
  archer1.y = display.contentHeight/2
  archer1:pause()
  physics.addBody(archer1, "static", {})
  archer1.myName = "archer1"
  
  archer2 = display.newSprite(mainGroup, archer2Sheet, {name = "firing", frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, time = 600, loopCount = 1})
  archer2.x = display.contentWidth/2 + 55
  archer2.y = display.contentHeight/2
  archer2:pause()
  physics.addBody(archer2, "static", {})
  archer2.myName = "archer2"
  
  archer3 = display.newSprite(mainGroup, archer3Sheet, {name = "firing", frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, time = 600, loopCount = 1})
  archer3.x = display.contentWidth/2
  archer3.y = display.contentHeight/2 + 60
  archer3:pause()
  physics.addBody(archer3, "static", {})
  archer3.myName = "archer3"
  
  archer4 = display.newSprite(mainGroup, archer4Sheet, {name = "firing", frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, time = 600, loopCount = 1})
  archer4.x = display.contentWidth/2
  archer4.y = display.contentHeight/2 - 60
  archer4:pause()
  physics.addBody(archer4, "static", {})
  archer4.myName = "archer4"
  
  archer1:addEventListener("tap", excitingArcher1)
  archer2:addEventListener("tap", excitingArcher2)
  archer3:addEventListener("tap", excitingArcher3)
  archer4:addEventListener("tap", excitingArcher4)
  
	scoreText = display.newText(uiGroup, "Score: " .. score, 160, -15, native.systemFont, 20)
  
end


function scene:show(event)
  
  local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
    
	elseif (phase == "did") then
    physics.start()
    Runtime:addEventListener("collision", killArchers)
    Runtime:addEventListener("collision", killInfantries)
    Runtime:addEventListener("collision", destroyCastle)
    LS = timer.performWithDelay(3000, lightinfantryLoop)
    LI = timer.performWithDelay(11000 ,lightinfantryLoop, 0)
    MI = timer.performWithDelay(17000, midinfantryLoop, 0)
    HI = timer.performWithDelay(27000, heavyinfantryLoop, 0)
	end
  
end

function scene:hide(event)
  local sceneGroup = self.view
  local phase = event.phase

	if (phase == "will") then
    
	elseif ( phase == "did" ) then
    Runtime:removeEventListener("collision", killArchers)
    Runtime:removeEventListener("collision", killInfantries)
    Runtime:removeEventListener("collision", destroyCastle)
		physics.pause()
		composer.removeScene("gameSheet")
    timer.cancel(LI)
    timer.cancel(MI)
    timer.cancel(HI)
    timer.cancel(LS)
  end
end


scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene