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

	local a = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
	a:setFillColor(1)
	a.alpha = 0
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
	gameUI[13].x, gameUI[13].y = display.contentWidth/2-500, display.contentHeight/2-100
	gameUI[14] = display.newImageRect("image/hawk_reverse_shock.png", 651, 768)----------------
	gameUI[14].x, gameUI[14].y = display.contentWidth/2-500, display.contentHeight/2-100
	gameUI[15] = display.newImageRect("image/hawk_normal2.png", 651, 768)----------------
	gameUI[15].x, gameUI[15].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[16] = display.newImageRect("image/hawk_shock.png", 651, 768)----------------
	gameUI[16].x, gameUI[16].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[17] = display.newImageRect("image/hawk_sweat.png", 651, 768)----------------
	gameUI[17].x, gameUI[17].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[18] = display.newImageRect("image/hawk_reverse_normal2.png", 651, 768)----------------
	gameUI[18].x, gameUI[18].y = display.contentWidth/2-500, display.contentHeight/2-100

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
    backUI[1] = display.newImageRect("background/back3_7.png", display.contentWidth, display.contentHeight)
	backUI[2] = display.newImageRect("background/back3_8.png", display.contentWidth, display.contentHeight)
	backUI[3] = display.newImageRect("background/back3_9.png", display.contentWidth, display.contentHeight)
	backUI[4] = display.newImageRect("background/back3_10.png", display.contentWidth, display.contentHeight)
	backUI[5] = display.newImageRect("background/back3_11.png", display.contentWidth, display.contentHeight)
	backUI[6] = display.newImageRect("background/back3_12.png", display.contentWidth, display.contentHeight)
	backUI[7] = display.newImageRect("background/back3_13.png", display.contentWidth, display.contentHeight)
	backUI[8] = display.newImageRect("background/back3_14.png", display.contentWidth, display.contentHeight)

	for i = 1, #backUI, 1 do
		backUI[i].x = display.contentWidth/2
		backUI[i].y = display.contentHeight/2
		backUI[i].alpha = 0
	end
	------------------------------------------------
	local text = {" ",
					"나라로 들어온지 얼마 지나지 않아,\n땅에서부터 검은 연기가 자욱하게 올라왔어요.",
					"이럴 줄 알았어!\n이러면 땅에 내려주지도 못하겠는데.",
					"지금 어떤 상황인지 보이지?\n이제 어떻게 할거야?",
					"설마 이대로 땅으로 내려갈거야?",
					"(호랑이에게 무언가 부탁을 하고 있다)",
					"너 진심이니? 그런 짓을 했다가는...",
					"호랑이는 주저했어요. 하지만 햄스터는\n자리에서 콩콩 뛰며 호랑이를 재촉했죠.",
					"이에 호랑이는...",
					" ",
					"아, 알겠어... 네 부탁이니까 괜찮겠지.",
					"그러니까, 너희들 어쩔 거냐니까?\n이대로 바다까지 돌아갈까?",
					" ",
					"호랑이는 햄스터가 든 상자를 번쩍 들어올렸어요.",
					"야! 지금 뭐하는 거야? 미쳤어?!",
					"햄스터가 부탁한 일이야!",
					"대표들이 싸우는 게 보이면 거기로 떨어뜨려달래.",
					"그거 죽겠다는 소리 아니야!?",
					"고민할 시간도 없이, 매 청년과 호랑이는\n대표들이 모여있는 곳에 다다랐어요.",
					"아이씨... 이제 나도 모르겠다.",
					"다왔으니까 준비해!",
					" ",
					"작게 보였던 대표들의 싸우는 모습이 조금씩 가까워졌어요.",
					" ",
					"\"하나!\"",
					"\"둘!\"",
					"\"셋!\"",
					"상자는 빠른 속도로 떨어졌고,\n매 청년과 호랑이의 귀에 쿵! 하는 소리가 들렸어요.",
					"매 청년은 불편한 마음에 아래를 힐끗 내려다보았지만,\n검은 연기에 가려 잘 보이지 않았어요.",
					" ",
					"살아있겠지...?",
					"그럼, 당연하지. 신이 곁에 있으니.",
					"하긴... 신한테도 양심이 있으면\n저런 어린 애는 살려주겠지.",
					"하여간... 정말 이상한 녀석이었어.\n저런 녀석이 대체 어디서 나타난 건지...",
					"저런 아이야말로, 이 나라에 꼭 필요한 것 같지 않니?",
					"뭐... 그렇긴 하지.\n최소한 나랏일 버리고 맨날 싸우지는 않을 테니까.",
					"꼭 누군가에게 칼을 겨눠야만 강인한 건 아니지.",
					"응? 무슨 소리야 갑자기?",
					"꼭 글을 잘 읽어야만 지혜로운 것도 아니고...\n우아하고 기품이 있어야만 모범이 되는 것도 아니야.",
					" ",
					"두려움 앞에서 도망치지 않고,\n그 두려움을 칼과 피로써 견뎌내지 않으며.",
					" ",
					"깨끗한 마음을 가지고,\n어떤 존재라도 버리는 일 없이 믿어주는.",
					" ",
					"그리고, 친구의 아픔과 어려움을 외면하지 않고\n거침없이 불의에 맞서는!",
					" ",
					"그런 동물이야말로... 왕이 될 자질이 있는 것 아니겠니?",
					"그동안 무슨 일이 있었는지는 모르겠는데...\n뭐, 틀린말은 아니지.",
					"그러니까 네 말은, 그녀셕이 그렇단 뜻이야?",
					"뭐... 그럴지도 모르지.",
					"어리석은 동물들도 언젠간 깨닫게 될 거야.",
					"그건 잘 모르겠는데...\n아까부터 계속 이상한 소리를 하네.",
					"한참을 날던 매 청년은 뒤를 돌아보며 말했어요.",
					"그래서... 넌 이제 어쩔거야?\n너도 땅으로 내려줄까? 아니면...",
					" ",
					"...어?",
					"매 청년의 등에는 아무도 없었어요.",
					"분명 방금까지 호랑이와 대화를 나누었는데도요.",
					"매 청년은 당황하며 땅을 내려다 보았어요.",
					"하지만 호랑이의 모습은 보이지 않았고,\n검은 연기에 가려 그조차도 찾을 수 없게 되었어요.",
					"다음"
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
		if index == 9 then
			showText[9].alpha = 0
			index = index + 1
			event.target.text = ""
			nextText()
		end
	end

	function occurEvents ()
		if index == 2 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1
		
		elseif index == 6 then
			transition.to(gameUI[1], {time = 500, alpha = 1.0})
			transition.to(gameUI[6], {time = 500, alpha = 1.0})
		
		elseif index == 7 then
			gameUI[6].alpha = 0
			gameUI[11].alpha = 1
		
		elseif index == 8 then
			gameUI[11].alpha = 0
			gameUI[10].alpha = 1
		
		elseif index == 9 then--userInput
			quiz = display.newText("             1.햄스터를 믿고 부탁을 들어주기로 했어요.\n\n         2.일단 저지른 후 뒷일은 신에게 맡기기로 했어요.\n\n3.걱정이 되었지만, 다른 방법이 없으니 부탁을 들어주기로 했어요.", display.contentWidth/2, display.contentHeight/2-150)
			quiz.size = 60
			quiz:setFillColor(1)
			quiz:addEventListener("tap", playQuiz)

			hide.alpha = 1

			transition.to(gameUI[1], {time = 500, alpha = 0})
			transition.to(gameUI[10], {time = 500, alpha = 0})
	
		elseif index == 11 then
			hide.alpha = 0
			transition.to(gameUI[1], {time = 500, alpha = 1.0})
			transition.to(gameUI[10], {time = 500, alpha = 1.0})
		
		elseif index == 13 then--backchange
			backUI[1].alpha = 0
			backUI[2].alpha = 1
			gameUI[1].alpha = 0
			gameUI[10].alpha = 0
			black.alpha = 0
			white.alpha = 0
			a.alpha = 1
			transition.to(a, {time = 700, alpha = 0})
		
		elseif index == 14 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1
		
		elseif index == 15 then
			transition.to(gameUI[6], {time = 500, alpha = 1.0})
			transition.to(gameUI[14], {time = 500, alpha = 1.0})
		
		elseif index == 20 then
			gameUI[14].alpha = 0
			gameUI[13].alpha = 1
		
		elseif index == 22 then--backchange
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 0})
			gameUI[6].alpha = 0
			gameUI[13].alpha = 0
		
		elseif index == 23 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1
		
		elseif index == 24 then
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 1.0})
		
		elseif index == 25 then
			white.alpha = 1
		
		elseif index == 30 then--backchange
			backUI[2].alpha = 0
			backUI[3].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
		
		elseif index == 31 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1
			transition.to(gameUI[6], {time = 500, alpha = 1.0})
			transition.to(gameUI[18], {time = 500, alpha = 1.0})
		
		elseif index == 36 then-------------------
			gameUI[18].alpha = 0
			gameUI[13].alpha = 1
		
		elseif index == 40 then--backchange
			backUI[3].alpha = 0
			backUI[4].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
			gameUI[6].alpha = 0
			gameUI[13].alpha = 0
		
		elseif index == 41 then
			transition.to(white, {time = 500, alpha = 1.0})
			transition.to(black, {time = 500, alpha = 0.5})
		
		elseif index == 42 then--backchange
			backUI[4].alpha = 0
			backUI[5].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
		
		elseif index == 43 then
			transition.to(white, {time = 500, alpha = 1.0})
			transition.to(black, {time = 500, alpha = 0.5})
		
		elseif index == 44 then--backchange
			backUI[5].alpha = 0
			backUI[6].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
		
		elseif index == 45 then
			transition.to(white, {time = 500, alpha = 1.0})
			transition.to(black, {time = 500, alpha = 0.5})
		
		elseif index == 46 then--backchange
			backUI[6].alpha = 0
			backUI[7].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
		
		elseif index == 47 then
			white.alpha = 1
			transition.to(black, {time = 500, alpha = 0.5})
			transition.to(gameUI[6], {time = 500, alpha = 1.0})
			transition.to(gameUI[13], {time = 500, alpha = 1.0})
		
		elseif index == 53 then
			transition.to(gameUI[6], {time = 500, alpha = 0})
			transition.to(gameUI[13], {time = 500, alpha = 0})
		
		elseif index == 55 then
			backUI[7].alpha = 0
			backUI[8].alpha = 1
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 0})
		
		elseif index == 56 then
			transition.to(white, {time = 500, alpha = 1.0})
			transition.to(black, {time = 500, alpha = 0.5})
		end
	end

	function showCharater ()
		if index == 3 or index == 15 or index == 20 or index == 31 or index == 54 or index == 56 then
			characterUI[3].alpha = 1
		
		elseif index == 6 then
			characterUI[3].alpha = 0
			characterUI[1].alpha = 1
		
		elseif index == 7 then
			characterUI[1].alpha = 0
			characterUI[2].alpha = 1
		
		elseif index == 8 or index == 40 or index == 55 then
			characterUI[2].alpha = 0
		
		elseif index == 11 or index == 47 then
			characterUI[2].alpha = 1
		
		elseif index == 12 or index == 18 or index == 33 or index == 36 or index == 38 or index == 48 or index == 52 then  
			characterUI[2].alpha = 0
			characterUI[3].alpha = 1
		
		elseif index == 13 or index == 19 or index == 22 or index == 53 or index == 55 or index == 57 then
			characterUI[3].alpha = 0
		
		elseif index == 16 or index == 32 or index == 35 or index == 37 or index == 39 or index == 50 then
			characterUI[3].alpha = 0
			characterUI[2].alpha = 1
		end
	end

	function nextText (event)
		if index ~= 9 then
			showText[index].alpha = 0
			index = index + 1
			showText[index].alpha = 1

			occurEvents()
			showCharater()
		end

		if index == 61 then
			composer.gotoScene("view13")			
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
		composer.removeScene("view12")
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