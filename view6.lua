-----------------------------------------------------------------------------------------
--
-- view6.lua
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
	black.alpha = 0

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
	gameUI[9] = display.newImageRect("image/tiger_normal.png", 681, 768)----------------호랑이
	gameUI[9].x, gameUI[9].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[10] = display.newImageRect("image/tiger_happy.png", 681, 768)----------------
	gameUI[10].x, gameUI[10].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[11] = display.newImageRect("image/tiger_laugh.png", 681, 768)----------------
	gameUI[11].x, gameUI[11].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[12] = display.newImageRect("image/tiger_normal2.png", 681, 768)----------------
	gameUI[12].x, gameUI[12].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[13] = display.newImageRect("image/tiger_sweat.png", 681, 768)----------------
	gameUI[13].x, gameUI[13].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[14] = display.newImageRect("image/tiger_think.png", 681, 768)----------------
	gameUI[14].x, gameUI[14].y = display.contentWidth-600, display.contentHeight/2-100
	gameUI[15] = display.newImageRect("image/monster.png", 681, 768)----------------
	gameUI[15].x, gameUI[15].y = display.contentWidth-600, display.contentHeight/2-100

	for i = 1, #gameUI, 1 do
		gameUI[i].alpha = 0
    end
	---------------------------------------------------------
	characterUI[1] = display.newImageRect("image/hamster_normal.png", 300, 300)
	characterUI[1].x, characterUI[1].y = 250, white.y
	characterUI[2] = display.newImageRect("image/starfish_normal.png", 300, 300)
	characterUI[2].x, characterUI[2].y = 250, white.y
	characterUI[3] = display.newImageRect("image/tiger_normal.png", 270, 300)
	characterUI[3].x, characterUI[3].y = 250, white.y-5
	characterUI[4] = display.newImageRect("image/monster.png", 250, 280)
	characterUI[4].x, characterUI[4].y = 250, white.y+5
	
	for i = 1, #characterUI, 1 do
		characterUI[i].alpha = 0
	end
    ---------------------------------------------------
    backUI[1] = display.newImageRect("background/back2_3.png", display.contentWidth, display.contentHeight)
    backUI[2] = display.newImageRect("background/back2_4.png", display.contentWidth, display.contentHeight)
	backUI[3] = display.newImageRect("background/back2_5.png", display.contentWidth, display.contentHeight)
	backUI[4] = display.newImageRect("background/back2_6.png", display.contentWidth, display.contentHeight)
	backUI[5] = display.newImageRect("background/back2_7.png", display.contentWidth, display.contentHeight)
	backUI[6] = display.newImageRect("background/back2_8.png", display.contentWidth, display.contentHeight)
	backUI[7] = display.newImageRect("background/back2_9.png", display.contentWidth, display.contentHeight)
	
	for i = 1, #backUI, 1 do
		backUI[i].x = display.contentWidth/2
		backUI[i].y = display.contentHeight/2
		backUI[i].alpha = 0
	end
	------------------------------------------------
	local text = {"이런... 너같은 어린 아이가 \n도대체 어떻게 알고있는거지?",
					"그래... 약속은 약속이니...", 
					"좋다, 얘야, 너 하고싶은 대로 하려무나.",
					"결국 불가사리 영감은 햄스터를 보내주었어요.", 
					"얘야, 마지막으로 할 말이 있다.",
					"하고싶은 일을 하는 건 좋다.",
					"그렇지만...결과가 어떻든 후회하지 말거라.\n전부 너의 선택이었으니까!",
					"불가사리 영감과 헤어진 햄스터는 \n파도와 바람을 타고 계속해서 나아갔어요.",
					" ",
					"그런데 앞으로 가면 갈수록, 하늘이 점점 \n어두워지고 조금씩 비가 내리기 시작했어요.",
					"(바다신의 영역에 가까워졌다고 생각하고 있다.)",
					"육지의 동물들이 또 이곳에 들어왔군\n아주 질리지도 않게 말이야!", 
					" ",
					"거대한 몸집과 무시무시한 목소리, 붉은 눈...\n바다신이 분명했어요.", 
					"자! 뭐라도 해봐라! 나를 무찌르고 \n그 섬에 들어가기 위해 온 것이 아니냐?",
					"이 이상 시간을 끌면 아무것도 하지 못하고 나에게 먹혀버릴거다.",
					"나는 지금 배가 엄청 고프거든!", 
					"(주섬주섬 해바라기씨를 꺼낸다)",
					"(해바리기씨를 바다신의 커다란 입속으로 던진다)",
					"...",
					"햄스터의 행동에 당황한 바다신은 햄스터를 바라보았습니다.\n그 순간 바다신과 햄스터의 눈이 마주쳤어요.",
					"그러자 바다신은 바닷속으로 사라졌어요.\n바다신이 햄스터를 용서해 준 것일까요?",
					" ",
					"하지만 바다신의 행동과는 다르게, \n거대한 파도가 햄스터를 향해 다가오기 시작했어요.",
					"\"행운을 빈다!\"",
					"누군가의 목소리가 들리는 찰나, \n파도는 결국 햄스터를 덮쳐버렸습니다.",
					" ",
					"(...)",
					"(...!)\n(눈을 떴다)",
					" ",
					"(주위를 둘러보는 중)",
					"햄스터는 이곳이 오목눈이가 말한 그 섬임을 직감했어요.",
					"부스럭...!",
					"숲속에서 들려오는 이상한 소리...\n다른 누군가가 있는 걸까요?",
					"(이 섬에서 혼자가 아님에 기뻐하며 다가간다)",
					" ",
					"누구냐, 넌?",
					"설마 이런 곳에 다른 동물이 들어올 줄이야...", 
					"됐다, 네가 누구인지는 상관없어.\n그러니까...",
					" ",
					"그러니까 저것 좀 어떻게 해줘!",
					"이빨 달린 놈이 나를 물고는 놓지를 않는다고!",
					"햄스터는 망설임 없이 어두운 나무들 사이로 들어갔어요\n그리고 호랑이의 꼬리를 확인했습니다.",
					"이빨 달린 놈의 정체는 덫이었어요.\n호랑이를 덫에서 풀어줍시다.",
					"게임시작"
					}
			
	------------------------------------------------------------
	local showText = {}
	for i = 1, #text, 1 do
		if i == 16 then
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
	black.alpha = 0.5
	white.alpha = 1
	gameUI[2].alpha = 1
	gameUI[8].alpha = 1
	characterUI[2].alpha = 1

	function occurEvents ()
		if index == 2 then
			gameUI[8].alpha = 0
			gameUI[6].alpha = 1
		
		elseif index == 5 then
			gameUI[2].alpha = 0
			gameUI[1].alpha = 1
		
		elseif index == 8 then
			transition.to(gameUI[1], {time = 500, alpha = 0})
			transition.to(gameUI[6], {time = 500, alpha = 0})
		
		elseif index == 9 then--back change
			backUI[1].alpha = 0
			backUI[2].alpha = 1
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 0})
		
		elseif index == 10 then
			transition.to(black, {time = 500, alpha = 0.5})
			transition.to(white, {time = 500, alpha = 1.0})
		
		elseif index == 11 then
			gameUI[1].x, gameUI[1].y = display.contentWidth/2, display.contentHeight/2
			gameUI[1].alpha = 1
		
		elseif index == 12 then
			gameUI[1].alpha = 0
		
		elseif index == 13 then--back change
			backUI[2].alpha = 0
			backUI[3].alpha = 1
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 0})
		
		elseif index == 14 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1
			transition.to(gameUI[4], {time = 500, alpha = 1.0})
			transition.to(gameUI[15], {time = 500, alpha = 1.0})
		
		elseif index == 18 then
			gameUI[4].alpha = 0
			gameUI[5].alpha = 1
		
		elseif index == 20 then
			gameUI[5].alpha = 0
			gameUI[1].x, gameUI[1].y = display.contentWidth/2-500, display.contentHeight/2
			gameUI[1].alpha = 1
		
		elseif index == 21 then
			transition.to(gameUI[1], {time = 500, alpha = 0})
			transition.to(gameUI[15], {time = 500, alpha = 0})
		
		elseif index == 23 then--back change
			backUI[3].alpha = 0
			backUI[4].alpha = 1
			transition.to(white, {time = 500, alpha = 0})
			transition.to(black, {time = 500, alpha = 0})
		
		elseif index == 24 then
			transition.to(white, {time = 500, alpha = 1.0})
			transition.to(black, {time = 500, alpha = 0.5})
		
		elseif index == 27 then
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 1.0})
		
		elseif index == 28 then
			backUI[4].alpha = 0
			white.alpha = 1
		
		elseif index == 30 then--back change
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
			backUI[5].alpha = 1
		
		elseif index == 31 then
			transition.to(black, {time = 500, alpha = 0.5})
			transition.to(white, {time = 500, alpha = 1.0})
			transition.to(gameUI[1], {time = 500, alpha = 1.0})			
		
		elseif index == 35 then
			gameUI[1].alpha = 0
			gameUI[2].x, gameUI[2].y = display.contentWidth/2, display.contentHeight/2
			gameUI[2].alpha = 1
		
		elseif index == 36 then--back change
			gameUI[2].alpha = 0
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
			backUI[5].alpha = 0
			backUI[6].alpha = 1
		
		elseif index == 37 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1
			gameUI[4].x, gameUI[4].y = display.contentWidth/2-500, display.contentHeight/2
			transition.to(gameUI[4], {time = 500, alpha = 1.0})
			transition.to(gameUI[9], {time = 500, alpha = 1.0})
		
		elseif index == 40 then--back change
			backUI[6].alpha = 0
			backUI[7].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
			gameUI[4].alpha = 0
			gameUI[9].alpha = 0
		
		elseif index == 41 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1
			gameUI[1].x, gameUI[1].y = display.contentWidth/2-500, display.contentHeight/2
			gameUI[1].alpha = 1
			gameUI[13].alpha = 1	
		
		elseif index == 44 then
			gotoGame.alpha = 1
		end
	end

	function showCharater ()
		if index == 4 or index == 8 then
			characterUI[2].alpha = 0
		
		elseif index == 5 then
			characterUI[2].alpha = 1
		
		elseif index == 11 or index == 28 or index == 31 or index == 35 then
			characterUI[1].alpha = 1
		
		elseif index == 12 or index == 20 or index == 30 or index == 32 or index == 36 then
			characterUI[1].alpha = 0
		
		elseif index == 37 or index == 41 then
			characterUI[3].alpha = 1
		
		elseif index == 40 or index == 43 then
			characterUI[3].alpha = 0
		
		elseif index == 15 then
			characterUI[4].alpha = 1
		
		elseif index == 18 then
			characterUI[4].alpha = 0
			characterUI[1].alpha = 1
		end
	end

	function nextText (event)
		showText[index].alpha = 0
		index = index + 1
		showText[index].alpha = 1

		occurEvents()
		showCharater()

		if index == 45 then
			composer.gotoScene("game5")			
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
		composer.removeScene("view6")
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