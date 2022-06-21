-----------------------------------------------------------------------------------------
--
-- view13.lua
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
	gameUI[1].x, gameUI[1].y = display.contentWidth/2, display.contentHeight/2

	gameUI[2] = display.newImageRect("image/bag.png", 581, 668)----------------햄스터
	gameUI[2].x, gameUI[2].y = display.contentWidth/2, display.contentHeight/2

	for i = 1, #gameUI, 1 do
		gameUI[i].alpha = 0
	end
	---------------------------------------------------------

	characterUI[1] = display.newImageRect("image/npc_bear.png", 300, 300)
	characterUI[2] = display.newImageRect("image/npc_pig.png", 300, 300)
	characterUI[3] = display.newImageRect("image/npc_durumi.png", 300, 300)
	characterUI[4] = display.newImageRect("image/npc_cat.png", 300, 300)
	characterUI[5] = display.newImageRect("image/npc_rabbit.png", 300, 300)
	characterUI[6] = display.newImageRect("image/npc_bird.png", 300, 300)
	characterUI[7] = display.newImageRect("image/npc_deer.png", 300, 300)

	for i = 1, #characterUI, 1 do
		characterUI[i].x, characterUI[i].y = 250, white.y
		characterUI[i].alpha = 0
	end
    ---------------------------------------------------
    backUI[1] = display.newImageRect("background/back4_1.png", display.contentWidth, display.contentHeight)
	backUI[2] = display.newImageRect("background/back4_2.png", display.contentWidth, display.contentHeight)
	backUI[3] = display.newImageRect("background/back4_3.png", display.contentWidth, display.contentHeight)
	backUI[4] = display.newImageRect("background/back4_4.png", display.contentWidth, display.contentHeight)
	backUI[5] = display.newImageRect("background/back4_5.png", display.contentWidth, display.contentHeight)
	backUI[6] = display.newImageRect("background/back4_6.png", display.contentWidth, display.contentHeight)
	backUI[7] = display.newImageRect("background/back4_7.png", display.contentWidth, display.contentHeight)
	backUI[8] = display.newImageRect("background/back4_8.png", display.contentWidth, display.contentHeight)
	backUI[9] = display.newImageRect("background/back4_9.png", display.contentWidth, display.contentHeight)
	backUI[10] = display.newImageRect("background/back4_10.png", display.contentWidth, display.contentHeight)
	backUI[11] = display.newImageRect("background/back4_11.png", display.contentWidth, display.contentHeight)
	backUI[12] = display.newImageRect("background/back4_12.png", display.contentWidth, display.contentHeight)

	for i = 1, #backUI, 1 do
		backUI[i].x = display.contentWidth/2
		backUI[i].y = display.contentHeight/2
		backUI[i].alpha = 0
	end
	------------------------------------------------
	local text = {" ",
					"호랑이가 떨어뜨린 상자는 땅을 향해\n빠른 속도로 다가가고 있었어요.",
					"동시에, 땅에서는 동물의 대표들의 싸움이 벌어지고 있었죠.",
					"햄스터를 쫓아내고, 며칠이 지났는데도 나라에 아무런\n변화가 나타나지 않아, 급해진 마음이\n결국 싸움으로 번진 것이었어요.",
					"\"신은 틀렸다니까! 언제까지고 기다릴 수는 없어\"",
					" ",
					"\"그러니까 더더욱 진정할 필요가 있다니까!\n그리고 이것 또한 신의 뜻이야... 거스르면 안돼!\"",
					"동물들의 싸움은 멈출 기미가 보이지 않았어요.\n오히려 더욱 거칠고 강렬하게 변해버렸죠.",
					" ",
					"그 싸움의 끝은, 결국 상대에게 칼을 겨누는 것이었어요.",
					"\"아까부터 바보같은 소리만 해대는군!\"",
					"\"이제 어쩔 수 없어... 머릿수가 많아봤자 결론은 나지 않는다고!\"",
					"칼을 꺼내 든 동물들은 싸울 생각이 없는 동물들에게\n천천히 다가가기 시작했죠.",
					"동물들은 두려움에 떨었어요.",
					"그저 이 모든 것을 지켜보고 계실 신께서\n도와주기를 바랄 뿐이었죠.",
					"쿵!!",
					"그 순간, 요란한 소리와 함께,\n먼지바람이 불어와 동물들의 눈 앞을 가렸어요.",
					"먼지가 걷히고 나자, 무언가에 깔려\n기절한 동물들의 모습이 보였어요.",
					" ",
					" ",
					"그들의 위로 떨어진 것은...\n바로 상자였어요.",
					"동물들은 온갖 의문을 품으며 상자를 열었어요.",
					" ",
					"그리고 그 안에는, 그들이 기다리고 있던\n햄스터가 들어있었어요.",
					"\"뭐야, 너... 돌아온 거야?\"",
					"\"아니! 그보다 어떻게 하늘에서 떨어진거지?!\"",
					"동물들의 말에도 신경쓰지 않고, 햄스터는 보따리를 뒤적였어요.",
					"그들은 신이 보내주셨다는 증거를 원할 거라고 생각했거든요.",
					"사실 햄스터에게는 증명할 수 있는 방법이 없었어요.\n뭔가를 찾기도 전에 나라로 돌아와 버렸거든요.",
					"...하지만, 햄스터는 이미 나라에 필요한 \n모든 것을 가지고 있었어요.",
					" ",
					"그것은 용기와",
					" ",
					"믿음,",
					"그리고...",
					" ",
					"평화.",
					" ",
					"그것이 어떠한 증거가 될 수는 없지만, 적어도 동물들에게\n필요한, 동물들이 원하는 모습과는 닮아있었죠.",
					"받아들이는 것은, 이제 동물들의 몫이었어요.",
					"동물들은 무엇인가 깨달았어요.",
					"신이 지켜주길 간절히 바랐을 때 나타난 햄스터.\n처음 발견했을 때와 같이, 상자안에 들어있던 모습.\n그리고 그들이 기대했던 것과 다르게, 엉뚱한 모습을 보이는 것까지.",
					"동물들은 이것이 신께서 주신\n두 번째 기회란 것을 깨달은 것이었어요.",
					" ",
					"\"그래, 이제 알겠어,\n우리가 감히 너를 의심했던 거야...\"",
					"\"우리를 용서하고 이 나라를 이끌어주겠니?\"",
					" ",
					"하지만 햄스터는 그 자리에서 도망쳤어요.\n당황한 동물들이 황급히 쫓아갔지만, 잡을 수 없었죠.",
					"햄스터가 떠나가 자리에는 낡은 지도와\n작은 해바라기씨만 남아있었어요.",
					" ",
					" ",
					"햄스터는 자신의 \'모험\'을 남기고 떠났어요.",
					"그것이 무엇을 뜻하는지,\n동물들은 이제 알 수 있겠죠.",
					"누구도 햄스터를 다시 보지 못했지만,\n햄스터는 모험을 멈추지 않을 거예요",
					"그리고 햄스터가 남기고 간 \'모험\'을...\n누군가 이어받을지도 모르죠.",
					"모험의 끝은, 곧 새로운 모험의 시작이니까요.",
					"ending"
					}
			
	------------------------------------------------------------
	local showText = {}
	for i = 1, #text, 1 do
		if i == 12 or i == 42 then
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
		if index == 2 or index == 7 or index == 10 or index == 21 then
			white.alpha = 1
			transition.to(black, {time = 500, alpha = 0.5})

		elseif index == 6 then
			backUI[1].alpha = 0
			backUI[2].alpha = 1
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 0})

		elseif index == 9 then
			backUI[2].alpha = 0
			backUI[3].alpha = 1
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 0})

		elseif index == 19 then
			transition.to(black, {time = 500, alpha = 1.0})	
			white.alpha = 0

		elseif index == 20 then
			backUI[3].alpha = 0
			backUI[4].alpha = 1
			transition.to(black, {time = 500, alpha = 0})

		elseif index == 23 then
			backUI[4].alpha = 0
			backUI[5].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0			

		elseif index == 24 then
			white.alpha = 1
			transition.to(black, {time = 500, alpha = 0.5})

		elseif index == 31 then
			backUI[5].alpha = 0
			backUI[6].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0	

		elseif index == 32 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1			

		elseif index == 33 then
			backUI[6].alpha = 0
			backUI[7].alpha = 1	
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0			

		elseif index == 34 or index == 45 or index == 48 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1

		elseif index == 36 then
			backUI[7].alpha = 0
			backUI[8].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0

		elseif index == 37 or index == 42 then
			white.alpha = 1
		
		elseif index == 38 then
			backUI[8].alpha = 0
			backUI[9].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
		
		elseif index == 39 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1				
		
		elseif index == 44 then
			backUI[9].alpha = 0
			backUI[10].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
		
		elseif index == 47 then
			backUI[10].alpha = 0
			backUI[11].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0	
		
		elseif index == 49 then
			transition.to(black, {time = 500, alpha = 0.5})
			white.alpha = 1	
		
		elseif index == 50 then
			backUI[11].alpha = 0
			backUI[12].alpha = 1
			transition.to(black, {time = 1000, alpha = 0})
			white.alpha = 0	
		
		elseif index == 51 then
			transition.to(black, {time = 1000, alpha = 1.0})
		
		elseif index == 52 then
			white.alpha = 1
		end
	end

	function showCharater ()
		if index == 5 then
			characterUI[7].alpha = 1
		elseif index == 6 then
			characterUI[7].alpha = 0
		elseif index == 7 then
			characterUI[6].alpha = 1
		elseif index == 8 then
			characterUI[6].alpha = 0
		elseif index == 11 or index == 45 then
			characterUI[4].alpha = 1
		elseif index == 13 or index == 47 then
			characterUI[4].alpha = 0
		elseif index == 25 then
			characterUI[3].alpha = 1
		elseif index == 26 then
			characterUI[3].alpha = 0
			characterUI[1].alpha = 1
		elseif index == 27 then
			characterUI[1].alpha = 0
		end

	end

	function nextText (event)
		showText[index].alpha = 0
		index = index + 1
		showText[index].alpha = 1

		occurEvents()
		showCharater()

		if index == 57 then
			composer.gotoScene("ending")		
		end
	end

	local next = widget.newButton(
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
		composer.removeScene("view13")
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