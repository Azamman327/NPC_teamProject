-----------------------------------------------------------------------------------------
--
-- view9.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local widget = require("widget")
	local index = 1
	local gameUI = {}
	local characterUI = {}
	local backUI = {}

	local white = display.newImageRect("image/text.png", display.contentWidth - 120, 350)
	white.x, white.y = display.contentWidth/2, display.contentHeight - 200
	white.alpha = 0

	local black = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
	black:setFillColor(0)
	black.alpha = 0.5

	local gotoGame = display.newImageRect("image/gotogame.png", 250, 50)
	gotoGame.x, gotoGame.y = display.contentWidth-320, display.contentHeight-120
	gotoGame.alpha = 0
	---------------------------------------------------------
	gameUI[1] = display.newImageRect("image/hamster_normal.png", 581, 668)----------------햄스터
	gameUI[1].x, gameUI[1].y = display.contentWidth/2-500, display.contentHeight/2
	gameUI[2] = display.newImageRect("image/hamster_happy.png", 581, 668)----------------
	gameUI[2].x, gameUI[2].y = display.contentWidth/2-500, display.contentHeight/2
	gameUI[3] = display.newImageRect("image/hamster_angry.png", 581, 668)----------------
	gameUI[3].x, gameUI[3].y = display.contentWidth/2-500, display.contentHeight/2
	gameUI[4] = display.newImageRect("image/hamster_sweat.png", 581, 668)----------------
	gameUI[4].x, gameUI[4].y = display.contentWidth/2-500, display.contentHeight/2
	gameUI[5] = display.newImageRect("image/hamster_seed.png", 581, 668)----------------
	gameUI[5].x, gameUI[5].y = display.contentWidth/2-500, display.contentHeight/2
	gameUI[6] = display.newImageRect("image/tiger_normal.png", 651, 768)----------------호랑이
	gameUI[6].x, gameUI[6].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[7] = display.newImageRect("image/tiger_happy.png", 651, 768)----------------
	gameUI[7].x, gameUI[7].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[8] = display.newImageRect("image/tiger_laugh.png", 651, 768)----------------
	gameUI[8].x, gameUI[8].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[9] = display.newImageRect("image/tiger_normal2.png", 651, 768)----------------
	gameUI[9].x, gameUI[9].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[10] = display.newImageRect("image/tiger_sweat.png", 651, 768)----------------
	gameUI[10].x, gameUI[10].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[11] = display.newImageRect("image/tiger_think.png", 651, 768)----------------
	gameUI[11].x, gameUI[11].y = display.contentWidth-600, display.contentHeight/2-100

	for i = 1, #gameUI, 1 do
		gameUI[i].alpha = 0
    end
    ---------------------------------------------
    characterUI[1] = display.newImageRect("image/hamster_normal.png", 300, 300)
	characterUI[1].x, characterUI[1].y = 250, white.y
	characterUI[2] = display.newImageRect("image/tiger_normal.png", 280, 300)
	characterUI[2].x, characterUI[2].y = 250, white.y-5
	for i = 1, #characterUI, 1 do
		characterUI[i].alpha = 0
    end
    -------------------------------------------------
    backUI[1] = display.newImageRect("background/back2_12.png", display.contentWidth, display.contentHeight)
    backUI[2] = display.newImageRect("background/back2_13.png", display.contentWidth, display.contentHeight)

	for i = 1, #backUI, 1 do
		backUI[i].x = display.contentWidth/2
		backUI[i].y = display.contentHeight/2
		backUI[i].alpha = 0
	end
	------------------------------------------------
	local text = {" ",
					"뭐, 뭐하는거야?\n그걸 가져가야 동물들이...", 
					"(빈 상자를 들고 뿌듯해한다)",
					"빈 상자를 가지고 뭘 하려고?\n그런거 가지고 가봤자 아무도...",
					"(!!!)", 
					"그걸 타고 다시 나라로 돌아가자는 거야?\n너는 정말 상자를 좋아하는구나.",
					"그런데...정말로 보물은 안 가져갈거야?\n금화 한 개도?",
					"(끄덕)",
					"응, 알겠어. 네 생각이 맞는 것 같아...",
					"호랑이와 햄스터는 보물을 두고 바다로 돌아갔습니다.",
					" ",
					"호랑이와 햄스터가 바다로 돌아왔을 때는 \n이미 밤이 되어있었어요.",
					"둘은 할 수 없이 이 섬에서 밤을 보내기로 했답니다.",
					"호랑이와 햄스터는 아침이 되면 다시 동물나라로 돌아가기로 했어요.\n잘 도착할 수 있을지 걱정하기도 전에 잠들었죠.", 
					"호랑이는 햄스터가 있어 무섭지 않았고,\n햄스터는 호랑이가 있어서 외롭지 않았어요.",
					"다음챕터"
					}
			
	------------------------------------------------------------
	local showText = {}
	for i = 1, #text, 1 do
		if i == 14 then
			showText[i] = display.newText(text[i], white.x+50, white.y)
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
			transition.to(gameUI[2], {time = 500, alpha = 1.0})
			transition.to(gameUI[11], {time = 500, alpha = 1.0})
		
		elseif index == 4 then
			gameUI[11].alpha = 0
			gameUI[10].alpha = 1
		
		elseif index == 6 then
			gameUI[10].alpha = 0
			gameUI[9].alpha = 1
		
		elseif index == 7 then
			gameUI[9].alpha = 0
			gameUI[6].alpha = 1
		
		elseif index == 9 then
			gameUI[6].alpha = 0
			gameUI[9].alpha = 1
		
		elseif index == 11 then--back change
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
			gameUI[2].alpha = 0
			gameUI[9].alpha = 0
			backUI[1].alpha = 0
			backUI[2].alpha = 1
		
		elseif index == 12 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1
			transition.to(gameUI[1], {time = 500, alpha = 1.0})
			transition.to(gameUI[6], {time = 500, alpha = 1.0})
		end
	end

	function showCharater ()
		if index == 2 then
			characterUI[2].alpha = 1
		
		elseif index == 3 or index == 5 or index == 8 then
			characterUI[2].alpha = 0
			characterUI[1].alpha = 1
		
		elseif index == 4 or index == 6 or index == 9 then
			characterUI[1].alpha = 0
			characterUI[2].alpha = 1
		
		elseif index == 10 then
			characterUI[2].alpha = 0
		end
	end

	function nextText (event)
		showText[index].alpha = 0
		index = index + 1
		showText[index].alpha = 1

		occurEvents()
		showCharater()

		if index == 16 then
			composer.gotoScene("view10")			
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
		composer.removeScene("view9")
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