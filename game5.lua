-----------------------------------------------------------------------------------------
--
-- game5.lua(덫풀기)
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local widget = require("widget")
	local gauge = {}

	local power = 0

	local wrong_back = display.newImageRect("image/trap/wrong_back.png", display.contentWidth, display.contentHeight)
	wrong_back.x, wrong_back.y = display.contentWidth/2, display.contentHeight/2

	local finish_back = display.newImageRect("image/trap/finish_back.png", display.contentWidth, display.contentHeight)
	finish_back.x, finish_back.y = display.contentWidth/2, display.contentHeight/2
	finish_back.alpha = 0

	local tail_finish = display.newImageRect("image/trap/tail_finish.png", 1203, 669)
	tail_finish.x, tail_finish.y = display.contentWidth/2, display.contentHeight/2
	tail_finish.alpha = 0

	gauge[1] = display.newImageRect("image/trap/gauge1.png", 1083, 609)
	gauge[2] = display.newImageRect("image/trap/gauge2.png", 1083, 609)
	gauge[3] = display.newImageRect("image/trap/gauge3.png", 1083, 609)
	gauge[4] = display.newImageRect("image/trap/gauge4.png", 1083, 609)
	gauge[5] = display.newImageRect("image/trap/gauge5.png", 1083, 609)
	gauge[6] = display.newImageRect("image/trap/gauge6.png", 1083, 609)
	for i = 1, #gauge, 1 do
		gauge[i].x, gauge[i].y = display.contentWidth/2, display.contentHeight/2+150
		gauge[i].alpha = 0
	end
--------------------------------------------------------------
	gauge[1].alpha = 1

	function nextPage(event)
		event.target.alpha = 0
		composer.gotoScene("view7")--다음장으로
	end

	function touchTrap (event)
		power = power + 1
		if power == 10 then
			gauge[1].alpha = 0
			gauge[2].alpha = 1
		elseif power == 20 then
			gauge[2].alpha = 0
			gauge[3].alpha = 1
		elseif power == 30 then
			gauge[3].alpha = 0
			gauge[4].alpha = 1
		elseif power == 40 then
			gauge[4].alpha = 0
			gauge[5].alpha = 1
		elseif power == 50 then
			gauge[5].alpha = 0
			gauge[6].alpha = 1
			event.target.alpha = 0
			tail_finish.alpha = 1
			finish_back.alpha = 1
			right = widget.newButton(
	    	{ 
	      		defaultFile = "image/right.png", overFile = "image/right.png",
	        	width = 100, height = 100, onPress = nextPage
	   		})
	    	right.x, right.y = display.contentWidth-150, display.contentHeight-120
		end
	end

	local button = widget.newButton(
		{defaultFile = "image/trap/tail_trapped.png", overFile = "image/trap/tail_trapped.png",
		width = 1203, height = 669, onPress = touchTrap}
	)
	button.x, button.y = display.contentWidth/2, display.contentHeight/2

	sceneGroup:insert(wrong_back)
	sceneGroup:insert(finish_back)
	sceneGroup:insert(tail_finish)
	for i = 1, #gauge, 1 do sceneGroup:insert(gauge[i]) end
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
		composer.removeScene("game5")
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene