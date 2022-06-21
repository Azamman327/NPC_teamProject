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
	gameUI[12].x, gameUI[12].y = display.contentWidth-800, display.contentHeight/2-100
	gameUI[13] = display.newImageRect("image/hawk_reverse.png", 651, 768)----------------
	gameUI[13].x, gameUI[13].y = display.contentWidth/2-500, display.contentHeight/2-100
	gameUI[14] = display.newImageRect("image/hawk_reverse_shock.png", 651, 768)----------------
	gameUI[14].x, gameUI[14].y = display.contentWidth/2-500, display.contentHeight/2-100

	for i = 1, #gameUI, 1 do
		gameUI[i].alpha = 0
	end
	---------------------------------------------------------

	characterUI[1] = display.newImageRect("image/hamster_normal.png", 300, 300)
	characterUI[1].x, characterUI[1].y = 250, white.y
	characterUI[2] = display.newImageRect("image/tiger_normal.png", 280, 300)
	characterUI[2].x, characterUI[2].y = 250, white.y-5
	characterUI[3] = display.newImageRect("image/hawk_normal.png", 260, 300)
	characterUI[3].x, characterUI[3].y = 250, white.y-5

	for i = 1, #characterUI, 1 do
		characterUI[i].alpha = 0
    end
    ---------------------------------------------------
    backUI[1] = display.newImageRect("background/back3_1.png", display.contentWidth, display.contentHeight)
	backUI[2] = display.newImageRect("background/back3_2.png", display.contentWidth, display.contentHeight)
	backUI[3] = display.newImageRect("background/back3_3.png", display.contentWidth, display.contentHeight)

	for i = 1, #backUI, 1 do
		backUI[i].x = display.contentWidth/2
		backUI[i].y = display.contentHeight/2
		backUI[i].alpha = 0
	end
	------------------------------------------------
	local text = {" ",
					"섬에서의 하룻밤이 지나고,\n바다 너머로 해가 뜨기 시작했어요.",
					"호랑이와 햄스터는 상자를 타고\n동물나라로 돌아갈 수 있게 되었답니다.",
					"보물을 두고 이대로 떠나도 정말 괜찮겠니?",
					"저 섬은 평생 다시 못 올지도 모르는데.",
					"호랑이의 말에 햄스터는...",
					" ",
					"...그래? 네 마음은 충분히 이해해.\n세상에 완벽한 선택은 없지. 아쉬움이 남을 수도 있고...",
					"그래도 세상은 넓으니까 분명 다른 기회가 있을 거라고 생각해.",
					"그런데 돌아가서는 어떻게 할 거니?\n결국 아무런 증거도 찾지 못했잖아.",
					"호랑이의 말대로 아무것도 찾지 못했지만, \n햄스터는 상관 없었어요.",
					"무언가 반드시 찾아야 한다면, \n다시 모험을 떠나면 되는 것이었으니까요.",
					"그렇구나, 너는 용감하니까 분명히\n못할 건 없을거야.",
					" ",
					"???",
					"그 순간, 호랑이와 햄스터가 타고 있던 상자로\n무언가 곤두박질쳤어요!",
					" ",
					"야, 너!! 살아있었구나!",
					"어떻게 살아있는지는 모르겠지만, 아무튼 운이 좋았다.",
					"너! 그런 일은 너 같은 어린애가\n할 만한 게 아니라고!",
					"어제 널 바다에서 보긴 했는데...\n가까이 가려던 순간 파도가 널 덮쳐버렸다고.",
					"그래서 완전히 끝난 줄 알았지.\n그 이상은 '바다신'의 영역이라 우리 새들도 못 들어가니까.",
					"그래도 살아있으니 됐다.\n그걸 보고 마음이 어찌나 불편했는지...",
					"사지가 멀쩡한 걸 보면 신의 보물에도 \n손울 안 댄 것 같고 말이야...",
					"(스윽...)",
					"어엉? 넌 또 뭐야.",
					"나, 나도 원래 여기 있었는데...",
					"나도 햄스터처럼 섬에 갔다가...\n함께 동물나라로 돌아가는 길이야.",
					"너도 섬에 갔다 왔다고?",
					"...너는 바다에서 한 번도 본 적 없는데.",
					"아 잠깐!! 너네 지금 나라로 돌아간다고 했냐!?",
					"왜 그렇게 놀라는거야?\n무슨 일이라도 난 것처럼.",
					"뭔 일이 났으니까 이러지!\n지금 완전히 난장판을 벌렸다고...",
					"다음장면"
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

	function playQuiz (event)
		if index == 6 then
			showText[6].alpha = 0
			index = index + 1
			event.target.text = ""
			nextText()
		end
	end

	function occurEvents ()
		if index == 2 then
			transition.to(white, {time = 500, alpha = 1.0})		
			transition.to(black, {time = 500, alpha = 0.5})		
		
		elseif index == 4 then
			transition.to(gameUI[1], {time = 500, alpha = 1.0})
			transition.to(gameUI[10], {time = 500, alpha = 1.0})
		
		elseif index == 6 then--userInput
			quiz = display.newText("1.모험을 한 것만으로 만족했어요.\n\n2.떠나는 것이 아쉽지만 계속 나아가기로 했어요.\n\n3.섬을 좀 더 둘러보지 않은 것을 후회했어요.", display.contentWidth/2, display.contentHeight/2-90)
			quiz.size = 80
			quiz:setFillColor(1)
			quiz:addEventListener("tap", playQuiz)

			hide.alpha = 1

			transition.to(gameUI[1], {time = 500, alpha = 0})
			transition.to(gameUI[10], {time = 500, alpha = 0})
		
		elseif index == 8 then
			hide.alpha = 0
			transition.to(gameUI[2], {time = 500, alpha = 1.0})
			transition.to(gameUI[6], {time = 500, alpha = 1.0})
		
		elseif index == 13 then
			gameUI[6].alpha = 0
			gameUI[7].alpha = 1
		
		elseif index == 14 then---back change
			gameUI[2].alpha = 0
			gameUI[7].alpha = 0
			backUI[1].alpha = 0
			backUI[2].alpha = 1
			white.alpha = 0		
			transition.to(black, {time = 500, alpha = 0})	
		
		elseif index == 15 then
			transition.to(white, {time = 500, alpha = 1.0})	
			transition.to(black, {time = 500, alpha = 0.5})	
		
		elseif index == 17 then
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 0})	
			backUI[2].alpha = 0
			backUI[3].alpha = 1
		
		elseif index == 18 then
			transition.to(black, {time = 500, alpha = 0.5})	
			white.alpha = 1
			gameUI[4].alpha = 1
			gameUI[12].alpha = 1
		
		elseif index== 25 then
			transition.to(gameUI[6], {time = 1000, alpha = 1.0})
		
		elseif index == 26 then
			gameUI[4].alpha = 0
			gameUI[12].alpha = 0
			transition.to(gameUI[14], {time = 500, alpha = 1.0})
		
		elseif index == 27 then
			gameUI[6].alpha = 0
			gameUI[10].alpha = 1
		
		elseif index == 30 then
			gameUI[14].alpha = 0
			gameUI[13].alpha = 1
		
		elseif index == 31 then
			gameUI[13].alpha = 0
			gameUI[14].alpha = 1
		
		elseif index == 32 then
			gameUI[10].alpha = 0
			gameUI[6].alpha = 1
		end
	end

	function showCharater ()
		if index == 4 or index == 8 or index == 13 or index == 15 then
			characterUI[2].alpha = 1
	
		elseif index == 6 or index == 11 or index == 14 or index == 16 then
			characterUI[2].alpha = 0
		
		elseif index == 18 then
			characterUI[3].alpha = 1
		
		elseif index == 25 or index == 27 or index == 32 then
			characterUI[3].alpha = 0
			characterUI[2].alpha = 1
		
		elseif index == 26 or index == 29 or index == 33 then
			characterUI[2].alpha = 0
			characterUI[3].alpha = 1
		end
	end

	function nextText (event)
		if index ~= 6 then
			showText[index].alpha = 0
			index = index + 1
			showText[index].alpha = 1

			occurEvents()
			showCharater()
		end

		if index == 34 then
			composer.gotoScene("view11")			
		end
	end

	next = widget.newButton(
    { 
        defaultFile = "image/right.png", overFile = "image/right.png",
        width = 70, height = 70, onPress = nextText 
    })
    next.x, next.y = display.contentWidth-150, display.contentHeight-120

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
		composer.removeScene("view10")
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