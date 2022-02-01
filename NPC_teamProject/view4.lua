-----------------------------------------------------------------------------------------
--
-- view4.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local widget = require("widget")
	local index = 1
	local characterUI = {}
	local gameUI = {}
	local backUI = {}
	local darkBackUI = {}

	local black = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
	black:setFillColor(0)
	black.alpha = 0.5

	local white = display.newImageRect("image/text.png", display.contentWidth - 120, 350)
	white.x, white.y = display.contentWidth/2, display.contentHeight - 200
	white.alpha = 0

	local gotoGame = display.newImageRect("image/gotogame.png", 250, 50)
	gotoGame.x, gotoGame.y = display.contentWidth-320, display.contentHeight-120
	gotoGame.alpha = 0
	-----------------------------------------------------
	gameUI[1] = display.newImageRect("image/hamster_normal.png", 581, 668)----------------햄스터
	gameUI[1].x, gameUI[1].y = display.contentWidth/2-500, display.contentHeight/2
	gameUI[2] = display.newImageRect("image/hamster_happy.png", 581, 668)----------------불
	gameUI[2].x, gameUI[2].y = display.contentWidth/2-500, display.contentHeight/2
	gameUI[3] = display.newImageRect("image/hamster_angry.png", 581, 668)----------------
	gameUI[3].x, gameUI[3].y = display.contentWidth/2-500, display.contentHeight/2
	gameUI[4] = display.newImageRect("image/hamster_sweat.png", 581, 668)----------------
	gameUI[4].x, gameUI[4].y = display.contentWidth/2-500, display.contentHeight/2
	gameUI[5] = display.newImageRect("image/hamster_seed.png", 581, 668)----------------
	gameUI[5].x, gameUI[5].y = display.contentWidth/2-500, display.contentHeight/2
	gameUI[6] = display.newImageRect("image/starfish_normal.png", 581, 668)----------------불가사리
	gameUI[6].x, gameUI[6].y = display.contentWidth-600, display.contentHeight/2+30
	gameUI[7] = display.newImageRect("image/starfish_angry.png", 581, 668)----------------
	gameUI[7].x, gameUI[7].y = display.contentWidth-600, display.contentHeight/2+30
	gameUI[8] = display.newImageRect("image/starfish_sweat.png", 581, 668)----------------
	gameUI[8].x, gameUI[8].y = display.contentWidth-600, display.contentHeight/2+30
	gameUI[9] = display.newImageRect("image/tiger_normal.png", 581, 668)----------------호랑이
	gameUI[9].x, gameUI[9].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[10] = display.newImageRect("image/tiger_happy.png", 581, 668)----------------
	gameUI[10].x, gameUI[10].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[11] = display.newImageRect("image/tiger_laugh.png", 581, 668)----------------
	gameUI[11].x, gameUI[11].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[12] = display.newImageRect("image/tiger_normal2.png", 581, 668)----------------
	gameUI[12].x, gameUI[12].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[13] = display.newImageRect("image/tiger_sweat.png", 581, 668)----------------
	gameUI[13].x, gameUI[13].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[14] = display.newImageRect("image/tiger_think.png", 581, 668)----------------
	gameUI[14].x, gameUI[14].y = display.contentWidth-600, display.contentHeight/2-100

	for i = 1, #gameUI, 1 do
		gameUI[i].alpha = 0
    end

	---------------------------------------------------------

	characterUI[1] = display.newImageRect("image/hamster_normal.png", 300, 300)
	characterUI[1].x, characterUI[1].y = 250, white.y
	characterUI[2] = display.newImageRect("image/starfish_normal.png", 300, 300)
	characterUI[2].x, characterUI[2].y = 200, white.y
	characterUI[3] = display.newImageRect("image/tiger_normal.png", 300, 300)
	characterUI[3].x, characterUI[3].y = 200, white.y
	
	for i = 1, #characterUI, 1 do
		characterUI[i].alpha = 0
	end
    ---------------------------------------------------
    backUI[1] = display.newImageRect("background/back2_1.png", display.contentWidth, display.contentHeight)
	
	for i = 1, #backUI, 1 do
		backUI[i].x = display.contentWidth/2
		backUI[i].y = display.contentHeight/2
		backUI[i].alpha = 0
	end
	------------------------------------------------
	local text = {" ",
					"끊임없이 걷고 또 걸은 햄스터는 마침내 바다에 도착했어요.",
					"섬으로 가기 위해 배가 필요했지만, 햄스터는 배가 없었어요.", 
					"\"얘 꼬마야.\"",
					"(???)", 
					"\"설마 너도 그 섬에 가려고? 아무것도 없이 말이냐?\"",
					"\"너 정도면 섬에 도착하기도 전에 죽을거다.\n왜냐하면 바다신은 항상 화가 나있거든..!\"",
					"(꼭 섬에 가고싶다고 생각하고 있다)",
					"햄스터는 갈매기의 말에 아랑곳하지 않고 바다를 건너기로 했어요.",
					"(바다를 건너기 위해서는 배가 필요해...)",
					"게임시작"
					}
			
	------------------------------------------------------------
	local showText = {}
	for i = 1, #text, 1 do
		if i == 9 then
			showText[i] = display.newText(text[i], white.x+30, white.y)
		else
			showText[i] = display.newText(text[i], white.x, white.y)
		end
	end
	-------------------------------------------------------

	showText[1].size = 50
	showText[1]:setFillColor(0)

	for i = 2, #showText, 1 do
		showText[i].size = 50
		showText[i]:setFillColor(0)
		showText[i].alpha = 0
	end----------------------------------------------여기까지 요소 생성 + 투명화

	backUI[1].alpha = 1
	transition.to(black, {time = 500, alpha = 0})
	
	function occurEvents ()
		if index == 2 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1
			gameUI[1].x, gameUI[1].y = display.contentWidth/2, display.contentHeight/2
			transition.to(gameUI[1], {time = 500, alpha = 1.0})
		
		elseif index == 4 then
			gameUI[1].alpha = 0
		
		elseif index == 8 then
			gameUI[1].alpha = 1
		
		elseif index == 10 then
			gotoGame.alpha = 1
		end
	end

	function showCharater ()
		if index == 5 or index == 8 or index == 10 then
			characterUI[1].alpha = 1
		
		elseif index == 6 or index == 9 then
			characterUI[1].alpha = 0
		end
	end

	function nextText (event)
		showText[index].alpha = 0
		index = index + 1
		showText[index].alpha = 1

		occurEvents()
		showCharater()

		if index == 11 then
			composer.gotoScene("game3")			
		end
	end

	local next = widget.newButton(----------------´ÙÀ½³»¿ë ³Ñ¾î°¡±â
		{defaultFile = "image/right.png", overFile = "image/right.png",
		width = 70, height = 70, onPress = nextText}
	)
	next.x, next.y = display.contentWidth-150, display.contentHeight-120
	next.name = "nextT"

	for i = 1, #backUI, 1 do sceneGroup:insert(backUI[i]) end
	sceneGroup:insert(black)
	for i = 1, #gameUI, 1 do sceneGroup:insert(gameUI[i]) end
	sceneGroup:insert(white)
	for i = 1, #showText, 1 do sceneGroup:insert(showText[i]) end
	for i = 1, #characterUI, 1 do sceneGroup:insert(characterUI[i]) end
	sceneGroup:insert(next)
	sceneGroup:insert(gotoGame)
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
		composer.removeScene("view4")
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