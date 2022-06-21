-----------------------------------------------------------------------------------------
--
-- view5.lua
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
	gameUI[6].x, gameUI[6].y = display.contentWidth-500, display.contentHeight/2-50
	gameUI[7] = display.newImageRect("image/starfish_angry.png", 581, 668)----------------
	gameUI[7].x, gameUI[7].y = display.contentWidth-500, display.contentHeight/2-50
	gameUI[8] = display.newImageRect("image/starfish_sweat.png", 581, 668)----------------
	gameUI[8].x, gameUI[8].y = display.contentWidth-500, display.contentHeight/2-50

	for i = 1, #gameUI, 1 do
		gameUI[i].alpha = 0
    end
	---------------------------------------------------------
	characterUI[1] = display.newImageRect("image/hamster_normal.png", 300, 300)
	characterUI[1].x, characterUI[1].y = 250, white.y
	characterUI[2] = display.newImageRect("image/starfish_normal.png", 300, 300)
	characterUI[2].x, characterUI[2].y = 250, white.y
	characterUI[3] = display.newImageRect("image/tiger_normal.png", 300, 300)
	characterUI[3].x, characterUI[3].y = 250, white.y-10
	
	for i = 1, #characterUI, 1 do
		characterUI[i].alpha = 0
	end
    ---------------------------------------------------
    backUI[1] = display.newImageRect("background/back2_2.png", display.contentWidth, display.contentHeight)
	backUI[2] = display.newImageRect("background/back2_3.png", display.contentWidth, display.contentHeight)
	
	for i = 1, #backUI, 1 do
		backUI[i].x = display.contentWidth/2
		backUI[i].y = display.contentHeight/2
		backUI[i].alpha = 0
	end
	------
	------------------------------------------------
	local text = {" ",
					"(뿌듯)",
					"비록 엉성하지만 배가 완성되었어요.\n햄스터는 배를 타고 바다로 나아갔어요.",
					"(멍하니 배에 앉아있다)", 
					"크흠...얘야",
					"(???)", 
					"여기다! 여기야!",
					" ",
					"얘야, 너, 너도 설마 그 섬에 가려는 거냐? \n이 바다를 건너서 말이야!",
					"(끄덕!)",
					"흥! 분명 또 보물 이야기만 듣고 왔을 게 분명하지.",
					"그래, 보물까지는 좋다.",
					"그런데 너, 이 바다를 넘을 수 있을 것 같니?",
					"나는 여기에 몇십년 넘게 살면서 \n수많은 동물들이 바닷속으로 사라지는 걸 봤어.", 
					"왜 그런 줄 아냐?\n그 섬의 앞바다는 '바다신'의 영역이야.", 
					"그런데 동물들이 자신의 영역을 함부로 침범해서 \n'바다신'이 결국 화가 난거지.",
					"수많은 동물들이 '바다신'을 무찌르려고 했지만 전부 실패했어.",
					"그런데 너가 가능할 것 같니?", 
					"(이해를 못한 듯 하다)",
					"이해를 못 하는구나...\n한마디로 내가 널 쉽게 보내주지 않는다는 말이다.",
					"내가 내는 문제를 모두 맞히면 보내주마!",
					"게임시작"
					}
			
	------------------------------------------------------------
	local showText = {}
	for i = 1, #text, 1 do
		showText[i] = display.newText(text[i], white.x, white.y)
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
		
		elseif index == 8 then--back change
			backUI[1].alpha = 0
			backUI[2].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
		
		elseif index == 9 then
			gameUI[1].x, gameUI[1].y = display.contentWidth/2-500, display.contentHeight/2
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1
			transition.to(gameUI[1], {time = 500, alpha = 1.0})
			transition.to(gameUI[6], {time = 500, alpha = 1.0})
		
		elseif index == 11 then
			gameUI[6].alpha = 0
			gameUI[7].alpha = 1
		
		elseif index == 19 then
			gameUI[1].alpha = 0
			gameUI[4].alpha = 1
		
		elseif index == 21 then
			gotoGame.alpha = 1
		end
	end

	function showCharater ()
		if index == 2 or index == 4 or index == 6 then
			characterUI[1].alpha = 1
		
		elseif index == 3 or index == 5 or index == 7 then
			characterUI[1].alpha = 0
		
		elseif index == 9 then
			characterUI[2].alpha = 1
		
		elseif index == 10 or index == 19 then
			characterUI[2].alpha = 0
			characterUI[1].alpha = 1
		
		elseif index == 11 or index == 20 then
			characterUI[1].alpha = 0
			characterUI[2].alpha = 1
		end
	end

	function nextText (event)
		showText[index].alpha = 0
		index = index + 1
		showText[index].alpha = 1

		occurEvents()
		showCharater()

		if index == 22 then
			composer.gotoScene("game4")			
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
		composer.removeScene("view5")
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