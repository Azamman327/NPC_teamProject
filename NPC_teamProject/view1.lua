-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local widget = require("widget")
	local index = 1
	local showText = {}
	local gameUI = {}
	local characterUI = {}
	local backUI = {}

	local white = display.newImageRect("image/text.png", display.contentWidth - 120, 350)
	white.x, white.y = display.contentWidth/2, display.contentHeight - 200
	white.alpha = 0

	local black = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
	black:setFillColor(0)
	black.alpha = 1.0

	local gotoGame = display.newImageRect("image/gotogame.png", 250, 50)
	gotoGame.x, gotoGame.y = display.contentWidth-320, display.contentHeight-120
	gotoGame.alpha = 0
	-----------------------------------------------------
	gameUI[1] = display.newImageRect("image/elephant_worry.png", 581, 668)
	gameUI[1].x, gameUI[1].y = display.contentWidth-600, display.contentHeight/2-100
	--¼ø¼­´ë·Î
	gameUI[2] = display.newImageRect("image/hamster_normal.png", 600, 700)
	gameUI[2].x, gameUI[2].y = display.contentWidth/2-500, gameUI[1].y+100

	gameUI[3] = display.newImageRect("image/elephant_ring.png", 581, 668)
	gameUI[3].x, gameUI[3].y = display.contentWidth-600, display.contentHeight/2-100
	
	gameUI[4] = display.newImageRect("image/hamster_happy.png", 600, 700)
	gameUI[4].x, gameUI[4].y = display.contentWidth/2-500, gameUI[1].y+100

	gameUI[5] = display.newImageRect("image/elephant_happy.png", 581, 668)
	gameUI[5].x, gameUI[5].y = display.contentWidth-600, display.contentHeight/2-100

	for i = 1, #gameUI, 1 do
		gameUI[i].alpha = 0
	end
	---------------------------------------------------------

	characterUI[1] = display.newImageRect("image/hamster_normal.png", 300, 300)----------------ÇÜ½ºÅÍÆò¹ü
	characterUI[1].x, characterUI[1].y = 250, white.y
	characterUI[2] = display.newImageRect("image/hamster_sweat.png", 300, 300)----------------ÇÜ½ºÅÍ´çÈ²
	characterUI[2].x, characterUI[2].y = 250, white.y
	characterUI[3] = display.newImageRect("image/hamster_angry.png", 300, 300)----------------ÇÜ½ºÅÍÈ­³²
	characterUI[3].x, characterUI[3].y = 250, white.y
	characterUI[4] = display.newImageRect("image/hamster_happy.png", 300, 300)----------------ÇÜ½ºÅÍÇàº¹
	characterUI[4].x, characterUI[4].y = 250, white.y

	characterUI[5] = display.newImageRect("image/elephant_normal.png", 270, 300)----------------ÄÚ³¢¸®Æò¹ü
	characterUI[5].x, characterUI[5].y = 250, white.y-10
	characterUI[6] = display.newImageRect("image/elephant_worry.png", 270, 300)----------------ÄÚ³¢¸®°ÆÁ¤
	characterUI[6].x, characterUI[6].y = 250, white.y-10
	characterUI[7] = display.newImageRect("image/elephant_ring.png", 270, 300)----------------ÄÚ³¢¸®¹ÝÁö
	characterUI[7].x, characterUI[7].y = 250, white.y-10
	characterUI[8] = display.newImageRect("image/elephant_happy.png", 270, 300)----------------ÄÚ³¢¸®Çàº¹
	characterUI[8].x, characterUI[8].y = 250, white.y-10
	--characterUI[1] = display.newImageRect("image/hamster_normal.png", 300, 300)----------------
	--characterUI[1].x = 200, characterUI[1] white.y
	for i = 1, #characterUI, 1 do
		characterUI[i].alpha = 0
	end
	-------------------------------------------------
	backUI[1] = display.newImageRect("background/back_1.png", display.contentWidth, display.contentHeight)
	backUI[2] = display.newImageRect("background/back_2.png", display.contentWidth, display.contentHeight)

	for i = 1, #backUI, 1 do
		backUI[i].x = display.contentWidth/2
		backUI[i].y = display.contentHeight/2
		backUI[i].alpha = 0
	end
	------------------------------------------------------
	local text = {	" ",
					"모험을 떠난 햄스터는 무작정 걷기 시작했어요.", 
					"목적지도, 쉬어갈 곳도 없이 앞만 보고 나아갔죠.",
					"동물들이 내딛는 발을 피하고,\n거대한 나무 줄기를 넘어...", 
					"햄스터는 해가 지고 그림자가 길게 드리운 \n길을 혼자서 걸어나갔어요. ",
					"그런데 길 끝에 누군가 서있었어요.",
					"이런...어쩐다...",
					"(코끼리 부인을 지그시 바라본다)",
					"내 반지가 두더지들이 파놓은 구멍에 빠져버렸지 뭐니.",
					" ",
					"안에 아무도 없는 걸 보니 파놓은지 아주 오래된 구멍같은데,\n내가 저 안에 들어갈 수 있어야 말이지...",
					"(자신과 굴을 번갈아서 가리킨다)", 
					"어머... 네가 가겠다고?", 
					"하지만 안은 아주 좁고 어두울 텐데...\n괜찮겠니?",
					"(고개를 끄덕인다)",
					"그래? 그럼 부탁할게.", 
					"반지를 찾아 나에게 가져다주면\n나도 네 부탁을 들어줄 수 있어.",
					"햄스터가 반지를 찾을 수 있게 도와주세요.\n(도착 후 enter키로 반지 획득)",
					"게임시작"
					}
					
	------------------------------------------------------------
	for i = 1, #text, 1 do
		showText[i] = display.newText(text[i], white.x, white.y)
	end
	-------------------------------------------------------
	--[[for i = 2, 5, 1 do
		showText[i].size = 50
		showText[i]:setFillColor(1)
		showText[i].alpha = 0
	end]]
	for i = 1, #showText, 1 do
		showText[i].size = 50
		showText[i]:setFillColor(0)
		showText[i].alpha = 0
	end
	transition.to(black, {time = 1000, alpha = 0})
	
	function occurEvents ()
		if index == 2 then--background change
			backUI[1].alpha = 1
			transition.to(black, {time = 500, alpha = 0.5})
			transition.to(white, {time = 500, alpha = 1.0})
		
		elseif index == 7 then
			transition.to(gameUI[1], {time = 500, alpha = 1.0})
			transition.to(gameUI[2], {time = 500, alpha = 1.0})
		
		elseif index == 9 then
			gameUI[1].alpha = 0
			gameUI[3].alpha = 1
		
		elseif index == 10 then ---background change
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
			gameUI[3].alpha = 0
			gameUI[2].alpha = 0
			
			backUI[2].alpha = 1
		
		elseif index == 11 then
			transition.to(black, {time = 500, alpha = 0.5})
			transition.to(white, {time = 500, alpha = 1.0})
			transition.to(gameUI[1], {time = 500, alpha = 1.0})
			transition.to(gameUI[2], {time = 500, alpha = 1.0})
		
		elseif index == 12 then
			gameUI[2].alpha = 0
			gameUI[4].alpha = 1
		
		elseif index == 16 then
			gameUI[1].alpha = 0
			gameUI[5].alpha = 1
		
		elseif index == 18 then
			gotoGame.alpha = 1
		end
	end

	function showCharater ()
		if index == 7 then
			characterUI[6].alpha = 1
		
		elseif index == 8 then
			characterUI[6].alpha = 0
			characterUI[1].alpha = 1
		
		elseif index == 9 then
			characterUI[1].alpha = 0
			characterUI[7].alpha = 1
		
		elseif index == 10 then
			characterUI[7].alpha = 0
		
		elseif index == 11 then
			characterUI[7].alpha = 1
		
		elseif index == 12 then
			characterUI[7].alpha = 0
			characterUI[1].alpha = 1
		
		elseif index == 13 or index == 16 then
			characterUI[1].alpha = 0
			characterUI[5].alpha = 1
		
		elseif index == 15 then
			characterUI[5].alpha = 0
			characterUI[1].alpha = 1
		
		elseif index == 18 then
			characterUI[5].alpha = 0
		end
	end

	function nextText (event)
		showText[index].alpha = 0
		index = index + 1
		showText[index].alpha = 1

		occurEvents()
		showCharater()

		if index == 19 then
			composer.gotoScene("maze_dark")			
		end
	end

	local next = widget.newButton(----------------´ÙÀ½³»¿ë ³Ñ¾î°¡±â
		{defaultFile = "image/right.png", overFile = "image/right.png",
		width = 70, height = 70, onPress = nextText}
	)
	next.x, next.y = display.contentWidth-150, display.contentHeight-120
	next.name = "nextT"

-------------------------------------------------------------------
	backUI[1].alpha = 1

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
