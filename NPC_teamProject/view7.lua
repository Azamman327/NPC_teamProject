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
	gameUI[9] = display.newImageRect("image/tiger_normal.png", 651, 768)----------------호랑이
	gameUI[9].x, gameUI[9].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[10] = display.newImageRect("image/tiger_happy.png", 651, 768)----------------
	gameUI[10].x, gameUI[10].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[11] = display.newImageRect("image/tiger_laugh.png", 651, 768)----------------
	gameUI[11].x, gameUI[11].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[12] = display.newImageRect("image/tiger_normal2.png", 651, 768)----------------
	gameUI[12].x, gameUI[12].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[13] = display.newImageRect("image/tiger_sweat.png", 651, 768)----------------
	gameUI[13].x, gameUI[13].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[14] = display.newImageRect("image/tiger_think.png", 651, 768)----------------
	gameUI[14].x, gameUI[14].y = display.contentWidth-600, display.contentHeight/2-100
	
	for i = 1, #gameUI, 1 do
		gameUI[i].alpha = 0
	end
	---------------------------------------------------------

	characterUI[1] = display.newImageRect("image/hamster_normal.png", 300, 300)
	characterUI[1].x, characterUI[1].y = 250, white.y
	characterUI[2] = display.newImageRect("image/starfish_normal.png", 300, 300)
	characterUI[2].x, characterUI[2].y = 250, white.y
	characterUI[3] = display.newImageRect("image/tiger_normal.png", 280, 300)
	characterUI[3].x, characterUI[3].y = 250, white.y-5
	for i = 1, #characterUI, 1 do
		characterUI[i].alpha = 0
    end
    ---------------------------------------------------
    backUI[1] = display.newImageRect("background/back2_10.png", display.contentWidth, display.contentHeight)
	
	for i = 1, #backUI, 1 do
		backUI[i].x = display.contentWidth/2
		backUI[i].y = display.contentHeight/2
		backUI[i].alpha = 0
	end
	------------------------------------------------
	local text = {" ",
					"앗, 저 녀석이 드디어 떨어졌구나!",
					"...다른게 아니라 덫이었다고?",
					"말도 안돼,\n왜 이런 곳에 덫이 있는거야?",
					"(신비한 생물을 잡기 위해 깔았을 수도\n있다고 호랑이에게 말하고 있다)",
					"...그렇구나. 신비한 생물을 잡기 위해 누군가 \n덫을 깔았다는 거지? 나쁜 동물들",
					"나는 이곳에 모험을 하러 왔어...\n근데 덫에 겁을 먹고 지금껏 아무것도 못했지.",
					"너는 여기 무슨 일로 왔니?",
					"(자신이 여기 온 이유를 설명하고 있다)",
					"으응? 증거를 찾으러 왔다고?\n그게 무슨 소리야?",
					" ",
					"햄스터는 그간 있었던 일을 모두 말해주었어요.",
					"그러니까 네 말은... 원래 상자를 타고 여행중이었는데\n상자의 뚜껑이 닫히면서 나올 수 없게 됐고...",
					"누군가 뚜껑을 열어주나 싶었더니\n신의 증거를 가져오라 했다고?",
					"(끄덕)",
					"정말 별 일이 다 있구나...",
					"그런데 네가 신이 보내주신 아이인 건 확실한 거야?\n만약 아니라면 그냥 돌아가지 않고 계속 여행을 하면 되잖아.",
					"(절레절레)",
					"...그래?\n그들을 실망시키고 싶지 않은 거구나.",
					"너는 네가 신이 보내주셨다고 생각하니?",
					"(...!)",
					"...그래? 너는 그냥 '너'란 말이지?",
					"그래도 대단하다... 그 작은 몸으로 여기까지 오다니 말이야.",
					"나는 덩치도 크고 이빨도 날카로운데...\n겁이 너무 많아서 혼자서 아무것도 못해.",
					"나도 너처럼 됐으면 좋겠어.",
					"(보따리에서 해바라기씨를 꺼내어 호랑이에게 건넨다)",
					"응? 나 주는거야?",
					"알았어, 고마워.",
					"해바라기씨에서 호랑이는 무엇인지 모를 힘을 느꼈어요.",
					"그래... 이제 알겠어\n언제까지 겁먹고 있을 수는 없으니까...",
					"같이 가지 않을래?\n저 숲에 뭐가 있는지 확인하러 말이야.",
					"(매우 기뻐하고 있다)",
					"그렇게 햄스터와 호랑이는 숲 속으로 들어갔습니다.\n햄스터와 호랑이가 길을 잃지 않게 도와주세요.",
					"게임 시작"
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

	transition.to(black, {time = 500, alpha = 0})
	backUI[1].alpha = 1

	function occurEvents ()
		if index == 2 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1
			transition.to(gameUI[2], {time = 500, alpha = 1.0})
			transition.to(gameUI[9], {time = 500, alpha = 1.0})
		
		elseif index == 3 then
			gameUI[2].alpha = 0
			gameUI[1].alpha = 1
			gameUI[9].alpha = 0
			gameUI[14].alpha = 1
		
		elseif index == 4 then
			gameUI[14].alpha = 0
			gameUI[13].alpha = 1
		
		elseif index == 6 then 
			gameUI[13].alpha = 0
			gameUI[12].alpha = 1
		
		elseif index == 7 then
			gameUI[12].alpha = 0
			gameUI[9].alpha = 1
		
		elseif index == 11 then
			transition.to(black, {time = 500, alpha = 1.0})
			transition.to(white, {time = 500, alpha = 0})
			gameUI[1].alpha = 0
			gameUI[9].alpha = 0
		
		elseif index == 12 then
			black.alpha = 0.5
			white.alpha = 1
			transition.to(gameUI[1], {time = 500, alpha = 1.0})
			transition.to(gameUI[9], {time = 500, alpha = 1.0})
		
		elseif index == 16 then
			gameUI[9].alpha = 0
			gameUI[12].alpha = 1
		
		elseif index == 17 then
			gameUI[12].alpha = 0
			gameUI[9].alpha = 1
		
		elseif index == 21 then
			gameUI[1].alpha = 0
			gameUI[4].alpha = 1
		
		elseif index == 22 then
			gameUI[4].alpha = 0
			gameUI[2].alpha = 1
			gameUI[9].alpha = 0
			gameUI[14].alpha = 1
		
		elseif index == 24 then
			gameUI[14].alpha = 0
			gameUI[13].alpha = 1
		
		elseif index == 26 then
			gameUI[2].alpha = 0
			gameUI[5].alpha = 1
		
		elseif index == 27 then
			gameUI[5].alpha = 0
			gameUI[2].alpha = 1
			gameUI[13].alpha = 0
			gameUI[14].alpha = 1
		
		elseif index == 28 then
			gameUI[14].alpha = 0
			gameUI[11].alpha = 1
		
		elseif index == 30 then
			gameUI[11].alpha = 0
			gameUI[10].alpha = 1
		
		elseif index == 33 then
			gotoGame.alpha = 1
		end
	end

	function showCharater ()
		if index == 2 or index == 13 or index == 30 then
			characterUI[3].alpha = 1
		
		elseif index == 5 or index == 9 or index == 15 or index == 18 or index == 21 or index == 26 or index == 32 then
			characterUI[3].alpha = 0
			characterUI[1].alpha = 1
		
		elseif index == 6 or index == 10 or index == 16 or index == 19 or index == 22 or index == 27 then
			characterUI[1].alpha = 0
			characterUI[3].alpha = 1
		
		elseif index == 11 or index == 29 then
			characterUI[3].alpha = 0
		
		elseif index == 33 then
			characterUI[1].alpha = 0
		end
	end

	function nextText (event)
		showText[index].alpha = 0
		index = index + 1
		showText[index].alpha = 1

		occurEvents()
		showCharater()

		if index == 34 then
			composer.gotoScene("game6")			
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
		composer.removeScene("view7")
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