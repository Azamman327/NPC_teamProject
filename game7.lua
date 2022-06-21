-----------------------------------------------------------------------------------------
--
-- game7.lua(보물상자)
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local widget = require("widget")

	local back_move = display.newImageRect("image/box/back_move.png", display.contentWidth, display.contentHeight)
	back_move.x, back_move.y = display.contentWidth/2, display.contentHeight/2

	local back_click = display.newImageRect("image/box/back_click.png", display.contentWidth, display.contentHeight)
	back_click.x, back_click.y = display.contentWidth/2, display.contentHeight/2
	back_click.alpha = 0

	local finish = display.newImageRect("image/box/finish.png", display.contentWidth, display.contentHeight)
	finish.x, finish.y = display.contentWidth/2, display.contentHeight/2
	finish.alpha = 0

	local key = display.newImageRect("image/box/key.png", 100, 115)
	key.x, key.y = display.contentWidth-100, display.contentHeight-150

	local box = display.newImageRect("image/box/box.png", 875, 609)
	box.x, box.y = display.contentWidth/2, display.contentHeight/2

	local pointing = display.newImageRect("image/hamster_bread.png", 100, 100)
	pointing.x, pointing.y = display.contentWidth/2-150, display.contentHeight/2
	pointing.alpha = 0

	----------------------------------------------------------------

	function nextPage(event)
		event.target:removeEventListener("tap", nextPage)
		event.target.alpha = 0
		composer.gotoScene("view9")--다음장으로
	end

	function flipBox (event)
		event.target.alpha = 0
		back_click.alpha = 0
		finish.alpha = 1

		local right = display.newImageRect("image/right.png", 100, 100)
		right.x, right.y = display.contentWidth-150, display.contentHeight-120
		right:addEventListener("tap", nextPage)
	end

	function moveKey (event)
		if event.keyName == "right" then
			key.x = key.x + 50	
		elseif event.keyName == "left" then
			key.x = key.x - 50
		elseif event.keyName == "up" then
			key.y = key.y - 50
		elseif event.keyName == "down" then
			key.y = key.y + 50
		end

		if (key.x < pointing.x+50 and key.x > pointing.x-50 and key.y < pointing.y+50 and key.y > pointing.y-50) then
			box.alpha = 0
			back_move.alpha = 0
			back_click.alpha = 1
			key.alpha = 0

			local box_open = display.newImageRect("image/box/box_open.png", 1029, 569)
			box_open.x, box_open.y = display.contentWidth/2, display.contentHeight/2
			box_open:addEventListener("touch", flipBox)
		end
	end

	Runtime:addEventListener("key", moveKey)

	sceneGroup:insert(back_move)
	sceneGroup:insert(back_click)
	sceneGroup:insert(finish)
	sceneGroup:insert(pointing)
	sceneGroup:insert(box)
	sceneGroup:insert(key)
	--sceneGroup:insert(right)
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
		composer.removeScene("game7")
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