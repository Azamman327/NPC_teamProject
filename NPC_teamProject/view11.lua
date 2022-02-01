-----------------------------------------------------------------------------------------
--
-- view8.lua
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
	local buttonUI = {}

	local white = display.newImageRect("image/text.png", display.contentWidth - 120, 350)
	white.x, white.y = display.contentWidth/2, display.contentHeight - 200
	white.alpha = 0

	local black = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
	black:setFillColor(0)
	black.alpha = 0.5

	local quiz

	local hide = display.newImageRect("image/hide.png", 70, 70)
	hide.x, hide.y = display.contentWidth-150, display.contentHeight - 120
	hide.alpha = 0

	local gotoGame = display.newImageRect("image/gotogame.png", 250, 50)
	gotoGame.x, gotoGame.y = display.contentWidth-320, display.contentHeight-120
	gotoGame.alpha = 0
	-----------------------------------------------------
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
	gameUI[12] = display.newImageRect("image/hawk_normal.png", 651, 768)----------------
	gameUI[12].x, gameUI[12].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[13] = display.newImageRect("image/hawk_reverse.png", 651, 768)----------------
	gameUI[13].x, gameUI[13].y = display.contentWidth/2-500, display.contentHeight/2
	gameUI[14] = display.newImageRect("image/hawk_reverse_shock.png", 651, 768)----------------
	gameUI[14].x, gameUI[14].y = display.contentWidth/2-500, display.contentHeight/2-100
	gameUI[15] = display.newImageRect("image/hawk_normal2.png", 651, 768)----------------
	gameUI[15].x, gameUI[15].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[16] = display.newImageRect("image/hawk_shock.png", 651, 768)----------------
	gameUI[16].x, gameUI[16].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[17] = display.newImageRect("image/hawk_sweat.png", 651, 768)----------------
	gameUI[17].x, gameUI[17].y = display.contentWidth-600, display.contentHeight/2-100

	for i = 1, #gameUI, 1 do
		gameUI[i].alpha = 0
	end
	---------------------------------------------------------

	characterUI[1] = display.newImageRect("image/hamster_normal.png", 300, 300)
	characterUI[1].x, characterUI[1].y = 250, white.y
	characterUI[2] = display.newImageRect("image/tiger_normal.png", 280, 300)
	characterUI[2].x, characterUI[2].y = 250, white.y-5
	characterUI[3] = display.newImageRect("image/hawk_normal.png", 280, 300)
	characterUI[3].x, characterUI[3].y = 250, white.y-5

	for i = 1, #characterUI, 1 do
		characterUI[i].alpha = 0
    end
    ---------------------------------------------------
    backUI[1] = display.newImageRect("background/back3_4.png", display.contentWidth, display.contentHeight)
	backUI[2] = display.newImageRect("background/back3_5.png", display.contentWidth, display.contentHeight)
	backUI[3] = display.newImageRect("background/back3_6.png", display.contentWidth, display.contentHeight)
	backUI[4] = display.newImageRect("background/back3_7.png", display.contentWidth, display.contentHeight)

	for i = 1, #backUI, 1 do
		backUI[i].x = display.contentWidth/2
		backUI[i].y = display.contentHeight/2
		backUI[i].alpha = 0
	end
	------------------------------------------------
	local text = {" ",
					"우리 애가 신이 보내주신 아이였어요!",
					"신의 말이 틀린거야! 아이는 없어!",
					"아냐, 조금만 더 기다리자구...",
					"우린 당장 굶어죽고 있는데\n그게 다 무슨 소용이야!",
					" ",
					"동물신의 예언이었나 뭔가가 아마도 틀린 모양인지,\n그걸 믿고 살아왔던 동물들이 점점 이상해지기 시작했어.",
					"특히 대표놈들끼리는 의견충돌이 났는지...\n아주 불도 지르고 싸우고 난리가 났던데!",
					"무슨 전쟁이라도 난 줄 알았다니까.",
					"그러니까 일이 잠잠해질 때까지 \n돌아가지 않는 편이 좋을거야...",
					"이에 햄스터는...",
					" ",
					"매 청년의 말에 햄스터는 씩씩댔어요.",
					"그리고 어서 나라로 돌아가자며 손가락으로 바다 너머를 가리켰죠.\n매 청년은 기가 막혔어요.",
					"뭐야!? 너 지금까지 말을 어디로 들었어?",
					"지금 가도 딱히 좋은 건 못 본다고.\n휘말리지나 않으면 다행이지...",
					"(여전히 씩씩대고 있다)",
					"아무리 말해도 소용 없을걸...\n저 친구는 아주 고집이 세니까 말이야.",
					"이건 고집으로 해결 될 문제가아닌데...",
					"여기가 더 안전할지도 모른다니까...\n그리고 너희 이런 상자를 타도 가다간 오늘 안에 도착 못할걸?",
					"그래도 가겠단 말이야?",
					"(...!)",
					"(좋은 생각이 난 듯 하다.)",
					" ",
					"이, 이것들이...!!",
					"내가 운전기사나 하려고 온 줄 알아!!",
					"매 청년은 투덜거리면서도 상자를 짊어지고 \n나라까지 빠른 속도로 날아갔어요.",
					"덕분에 호랑이와 햄스터는 얼마 지나지 않아\n동물나라로 들어오게 되었죠.",
					"다음장"
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

	function playQuiz (event)
		if index == 11 then
			showText[11].alpha = 0
			index = index + 1
			event.target.text = ""
			nextText()
		end
	end

	function occurEvents ()
		if index == 2 then
			transition.to(black, {time = 500, alpha = 0.5})
			transition.to(white, {time = 500, alpha = 1.0})
		
		elseif index == 6 then--back change
			backUI[1].alpha = 0
			backUI[2].alpha = 1
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 0})
		
		elseif index == 7 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1
			transition.to(gameUI[1], {time = 500, alpha = 1.0})
			transition.to(gameUI[15], {time = 500, alpha = 1.0})
		
		elseif index == 11 then--userInput
			quiz = display.newText("1.어서 돌아가 동물들을 말리기로 했어요.\n\n2.혼자 빠져나온 매 청년을 나무랐어요.\n\n3.할 일도 없는 참에 나라나 구하러 가기로 했어요.", display.contentWidth/2, display.contentHeight/2-100)
			quiz.size = 80
			quiz:setFillColor(1)
			quiz:addEventListener("tap", playQuiz)

			hide.alpha = 1

			transition.to(gameUI[1], {time = 500, alpha = 0})
			transition.to(gameUI[15], {time = 500, alpha = 0})
		
		elseif index == 13 then
			hide.alpha = 0
			transition.to(gameUI[3], {time = 500, alpha = 1.0})
			transition.to(gameUI[12], {time = 500, alpha = 1.0})
		
		elseif index == 15 then
			gameUI[12].alpha = 0
			gameUI[16].alpha = 1
		
		elseif index == 16 then
			gameUI[16].alpha = 0
			gameUI[17].alpha = 1
		
		elseif index == 22 then
			gameUI[3].alpha = 0
			gameUI[1].alpha = 1
		
		elseif index == 23 then
			gameUI[1].alpha = 0
			gameUI[2].alpha = 1
		
		elseif index == 24 then--back change
			backUI[2].alpha = 0
			backUI[3].alpha = 1
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 0})
			gameUI[2].alpha = 0
			gameUI[17].alpha = 0
		
		elseif index == 25 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1
		
		elseif index == 27 then
			transition.to(gameUI[16], {time = 500, alpha = 0})
		end
	end

	function showCharater ()
		if index == 7 or index == 15 or index == 25 then
			characterUI[3].alpha = 1
		
		elseif index == 11 or index == 27 then
			characterUI[3].alpha = 0
		
		elseif index == 17 or index == 22 then
			characterUI[3].alpha = 0
			characterUI[1].alpha = 1
		
		elseif index == 18 then
			characterUI[1].alpha = 0
			characterUI[2].alpha = 1
		
		elseif index == 19 then
			characterUI[2].alpha = 0
			characterUI[3].alpha = 1
		
		elseif index == 24 then
			characterUI[1].alpha = 0
		end
	end

	function nextText (event)
		showText[index].alpha = 0
		index = index + 1
		showText[index].alpha = 1

		occurEvents()
		showCharater()

		if index == 29 then
			composer.gotoScene("view12")			
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
		composer.removeScene("view8")
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