-----------------------------------------------------------------------------------------
--
-- game3.lua(배만들기)
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local back_wrong = display.newImageRect("image/ship/back_wrong.png", display.contentWidth, display.contentHeight)
	back_wrong.x, back_wrong.y = display.contentWidth/2, display.contentHeight/2

	local frame = display.newImageRect("image/ship/ship_frame.png", 1470, 1200)
	frame.x, frame.y = display.contentWidth/2+10, display.contentHeight/2

	local finish = display.newImageRect("image/ship/finish.png", display.contentWidth, display.contentHeight)
	finish.x, finish.y = display.contentWidth/2, display.contentHeight/2
	finish.alpha = 0

	local piece = {}

	local count = 0
----------------------------------------------------
	function nextPage (event)
		event.target:removeEventListener("tap", nextPage)
		event.target.alpha = 0
		composer.gotoScene("view5")--다음장으로
	end

	function movepiece (event)
		if event.target.name == "1" then
			if (event.phase == "began") then
				display.getCurrentStage():setFocus( event.target )
		        event.target.isFocus = true
		    elseif(event.target.isFocus) then
		    	if (event.phase == "moved") then
		    		event.target.x = event.x
					event.target.y = event.y
				elseif (event.phase == "ended" or event.phase == "cancelled") then
			    	if event.target.x > 955-50 and event.target.x < 955+50 and 
			    		event.target.y > 475-50 and event.target.y < 475+50 then
			    		event.target.x = 955
			    		event.target.y = 475
			    		count = count + 1
			    		event.target:removeEventListener( "touch", movepiece )
			    	else
			    		event.target.x = 270
			    		event.target.y = 430
			    	end
			    	display.getCurrentStage():setFocus( nil )
		            event.target.isFocus = false
			    end
		    end

		elseif event.target.name == "2" then
			if (event.phase == "began") then
				display.getCurrentStage():setFocus( event.target )
		        event.target.isFocus = true
		    elseif(event.target.isFocus) then
		    	if (event.phase == "moved") then
		    		event.target.x = event.x
					event.target.y = event.y
				elseif (event.phase == "ended" or event.phase == "cancelled") then
			    	if event.target.x > 1260-50 and event.target.x < 1260+50 and 
			    		event.target.y > 560-50 and event.target.y < 560+50 then
			    		event.target.x = 1260
			    		event.target.y = 560
			    		count = count + 1
			    		event.target:removeEventListener( "touch", movepiece )
			    	else
			    		event.target.x = 800
			    		event.target.y = 240
			    	end
			    	display.getCurrentStage():setFocus( nil )
		            event.target.isFocus = false
			    end
		    end

		elseif event.target.name == "3" then
			if (event.phase == "began") then
				display.getCurrentStage():setFocus( event.target )
		        event.target.isFocus = true
		    elseif(event.target.isFocus) then
		    	if (event.phase == "moved") then
		    		event.target.x = event.x
					event.target.y = event.y
				elseif (event.phase == "ended" or event.phase == "cancelled") then
			    	if event.target.x > 990-50 and event.target.x < 990+50 and 
			    		event.target.y > 570-50 and event.target.y < 570+50 then
			    		event.target.x = 990
			    		event.target.y = 570
			    		count = count + 1
			    		event.target:removeEventListener( "touch", movepiece )
			    	else
			    		event.target.x = 1220
			    		event.target.y = 210
			    	end
			    	display.getCurrentStage():setFocus( nil )
		            event.target.isFocus = false
			    end
		    end

		elseif event.target.name == "4" then
			if (event.phase == "began") then
				display.getCurrentStage():setFocus( event.target )
		        event.target.isFocus = true
		    elseif(event.target.isFocus) then
		    	if (event.phase == "moved") then
		    		event.target.x = event.x
					event.target.y = event.y
				elseif (event.phase == "ended" or event.phase == "cancelled") then
			    	if event.target.x > 1220-50 and event.target.x < 1220+50 and 
			    		event.target.y > 505-50 and event.target.y < 505+50 then
			    		event.target.x = 1220
			    		event.target.y = 505
			    		count = count + 1
			    		event.target:removeEventListener( "touch", movepiece )
			    	else
			    		event.target.x = 1600
			    		event.target.y = 450
			    	end
			    	display.getCurrentStage():setFocus( nil )
		            event.target.isFocus = false
			    end
		    end

		elseif event.target.name == "5" then
			if (event.phase == "began") then
				display.getCurrentStage():setFocus( event.target )
		        event.target.isFocus = true
		    elseif(event.target.isFocus) then
		    	if (event.phase == "moved") then
		    		event.target.x = event.x
					event.target.y = event.y
				elseif (event.phase == "ended" or event.phase == "cancelled") then
			    	if event.target.x > 770-50 and event.target.x < 770+50 and 
			    		event.target.y > 665-50 and event.target.y < 665+50 then
			    		event.target.x = 770
			    		event.target.y = 655
			    		count = count + 1
			    		event.target:removeEventListener( "touch", movepiece )
			    	else
			    		event.target.x = 1220
			    		event.target.y = 910
			    	end
			    	display.getCurrentStage():setFocus( nil )
		            event.target.isFocus = false
			    end
		    end

		elseif event.target.name == "6" then
			if (event.phase == "began") then
				display.getCurrentStage():setFocus( event.target )
		        event.target.isFocus = true
		    elseif(event.target.isFocus) then
		    	if (event.phase == "moved") then
		    		event.target.x = event.x
					event.target.y = event.y
				elseif (event.phase == "ended" or event.phase == "cancelled") then
			    	if event.target.x > 685-50 and event.target.x < 685+50 and 
			    		event.target.y > 485-50 and event.target.y < 485+50 then
			    		event.target.x = 685
			    		event.target.y = 485
			    		count = count + 1
			    		event.target:removeEventListener( "touch", movepiece )
			    	else
			    		event.target.x = 895
			    		event.target.y = 840
			    	end
			    	display.getCurrentStage():setFocus( nil )
		            event.target.isFocus = false
			    end
		    end

		elseif event.target.name == "7" then
			if (event.phase == "began") then
				display.getCurrentStage():setFocus( event.target )
		        event.target.isFocus = true
		    elseif(event.target.isFocus) then
		    	if (event.phase == "moved") then
		    		event.target.x = event.x
					event.target.y = event.y
				elseif (event.phase == "ended" or event.phase == "cancelled") then
			    	if event.target.x > 800-50 and event.target.x < 800+50 and 
			    		event.target.y > 565-50 and event.target.y < 565+50 then
			    		event.target.x = 800
			    		event.target.y = 565
			    		count = count + 1
			    		event.target:removeEventListener( "touch", movepiece )
			    	else
			    		event.target.x = 470
			    		event.target.y = 870
			    	end
			    	display.getCurrentStage():setFocus( nil )
		            event.target.isFocus = false
			    end
		    end

		elseif event.target.name == "8" then
			if (event.phase == "began") then
				display.getCurrentStage():setFocus( event.target )
		        event.target.isFocus = true
		    elseif(event.target.isFocus) then
		    	if (event.phase == "moved") then
		    		event.target.x = event.x
					event.target.y = event.y
				elseif (event.phase == "ended" or event.phase == "cancelled") then
			    	if event.target.x > 1080-50 and event.target.x < 1080+50 and 
			    		event.target.y > 655-50 and event.target.y < 655+50 then
			    		event.target.x = 1080
			    		event.target.y = 655
			    		count = count + 1
			    		event.target:removeEventListener( "touch", movepiece )
			    	else
			    		event.target.x = 380
			    		event.target.y = 600
			    	end
			    	display.getCurrentStage():setFocus( nil )
		            event.target.isFocus = false
			    end
		    end
		end

		if count == 8 then
			frame.alpha = 0
			back_wrong.alpha = 0
			finish.alpha = 1

			local right = display.newImageRect("image/right.png", 100, 100)
			right.x, right.y = display.contentWidth-150, display.contentHeight-120
			right:addEventListener("tap", nextPage)	
		end
	end

	piece[1] = display.newImageRect("image/ship/piece1.png", 280, 112)
	piece[1].x, piece[1].y = 270, 430
	piece[1]:addEventListener("touch", movepiece)
	piece[1].name = "1"

	piece[2] = display.newImageRect("image/ship/piece2.png", 160, 185)
	piece[2].x, piece[2].y = 800, 240
	piece[2]:addEventListener("touch", movepiece)
	piece[2].name = "2"

	piece[3] = display.newImageRect("image/ship/piece3.png", 225, 190)
	piece[3].x, piece[3].y = 1220, 210
	piece[3]:addEventListener("touch", movepiece)
	piece[3].name = "3"

	piece[4] = display.newImageRect("image/ship/piece4.png", 320, 180)
	piece[4].x, piece[4].y = 1600, 450
	piece[4]:addEventListener("touch", movepiece)
	piece[4].name = "4"

	piece[5] = display.newImageRect("image/ship/piece5.png", 240, 150)
	piece[5].x, piece[5].y = 1220, 910
	piece[5]:addEventListener("touch", movepiece)
	piece[5].name = "5"

	piece[6] = display.newImageRect("image/ship/piece6.png", 280, 110)
	piece[6].x, piece[6].y = 895, 840
	piece[6]:addEventListener("touch", movepiece)
	piece[6].name = "6"

	piece[7] = display.newImageRect("image/ship/piece7.png", 405, 150)
	piece[7].x, piece[7].y = 470, 870
	piece[7]:addEventListener("touch", movepiece)
	piece[7].name = "7"

	piece[8] = display.newImageRect("image/ship/piece8.png", 400, 150)
	piece[8].x, piece[8].y = 380, 600
	piece[8]:addEventListener("touch", movepiece)
	piece[8].name = "8"

	sceneGroup:insert(back_wrong)
	sceneGroup:insert(frame)
	sceneGroup:insert(finish)
	for i = 1, #piece, 1 do sceneGroup:insert(piece[i]) end	
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
		composer.removeScene("game3")
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
