---------------------------------------------------------------------------------------
--
-- prolog.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local widget = require("widget")
	local index = 1
	local showText = {}
	local characterUI = {}
	local backUI = {}

	local white = display.newImageRect("image/text.png", display.contentWidth - 120, 350)
	white.x, white.y = display.contentWidth/2, display.contentHeight - 200
	white.alpha = 0

	local black = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
	black:setFillColor(0)
	black.alpha = 0.5

	local temp = display.newRect(display.contentWidth/2, display.contentHeight/2+300, display.contentWidth-250, display.contentHeight/4)
	temp:setFillColor(0)
	temp.alpha = 0

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
	-------------------------------------------------
    backUI[1] = display.newImageRect("background/back_p1.png", display.contentWidth, display.contentHeight)
	backUI[2] = display.newImageRect("background/back_p2.png", display.contentWidth, display.contentHeight)
	backUI[3] = display.newImageRect("background/back_p3.png", display.contentWidth, display.contentHeight)
	backUI[4] = display.newImageRect("background/back_p4.png", display.contentWidth, display.contentHeight)
	backUI[5] = display.newImageRect("background/back_p5.png", display.contentWidth, display.contentHeight)
	backUI[6] = display.newImageRect("background/back_p6.png", display.contentWidth, display.contentHeight)
	backUI[7] = display.newImageRect("background/back_p7.png", display.contentWidth, display.contentHeight)
	backUI[8] = display.newImageRect("background/back_p8.png", display.contentWidth, display.contentHeight)
	backUI[9] = display.newImageRect("background/back_p9.png", display.contentWidth, display.contentHeight)

	for i = 1, #backUI, 1 do
		backUI[i].x = display.contentWidth/2
		backUI[i].y = display.contentHeight/2
		backUI[i].alpha = 0
	end
	-------------------------------------------------------------
	local text = {" ",	
		"태초에 동물들의 세상을 창조한 동물신 \'아니마르스\'가 있었습니다.",
		"이로부터 세상에는 셀 수 없이 다양한 동물들이 살아가게 되었으며,\n이 동물들은 그들의 나라인 \'동물나라\'를 세웠습니다.",
		"그런데 이 동물신은 세상의 동물들에게 말했습니다.",
		" ",
		"\"XX년 X월 X일, 동물들의 세상을 이끌어갈 크고 강한 아이가 나타난다!\"",
		"동물신을 섬기는 동물들은 이 말을 믿고, 아이가 나타난 그 날에\n아이를 동물나라의 지도자로 세우겠다고 생각했습니다.",
		" ",
		"이 날이 다가오기 시작하자, 각 동물의 대표들은\n한 자리에 모여 이야기를 나누었습니다.",
		"\'신이 말한 그 아이를, 세상을 위해 어떻게\n성장시켜야 하는가?\'라는 주제로 말이죠.",
		"\"크고 강인한 아이라 하였으니,\n이 나라를 지킬 강인한 전사로 키워야 합니다.\"",
		"\"아닙니다. 이 나라를 현명히 다스릴 수 있는,\n지혜로운 아이로 키워야 합니다.\"",
		"\"본디 지도자란 모범이 되어야 하니,\n기품있는 아이로 키워야 합니다\"",
		"동물들은 각자 자신의 의견을 내놓았지만,\n서로 다른 방향성으로 인해 의견은 좁혀지지 않았습니다.",
		" ",
		"XX년 X월 X일",
		"동물나라에 동이 트고, 동물의 대표들은\n신이 말한 아이를 찾기 위해 길을 나섰습니다.",
		"동물들은 아이를 찾아 하루종일 이곳저곳을 돌아다녔지만,\n아이는 그림자조차 보이지 않았습니다.",
		"그렇게 모두가 지쳐갈 때 쯤,",
		" ",
		"한 동물이 강 위에 떠있는 상자 하나를 발견했습니다.",
		"\"아이다! 분명 저 안에 아이가 들어있을 거야!\"",
		"상자를 가지고 돌아온 동물들은\n상자를 바라보며 긴장했습니다.",
		"긴 침묵 끝에 동물들은 상자를 천천히 열었고,\n마음 속으로 외쳤습니다",
		"\"틀림없어! 저 상자 안에는...\"",
		"\"크고 강한...응?\"",
		" ",
		"상자 안에 들어있던 것은 작고 어린 햄스터였습니다.",
		"\"말도 안돼!\n이게 신이 말한 아이란 말인가?\"",
		"동물들은 절대로 이 아이가 아닐 것이라며 부정했습니다.",
		"분명 다른 곳에 아이가 나타났는데,\n발견하지 못했을 뿐이라고 말입니다.",
		"하지만...하루종일 찾아도 다른 아이는 없었던\n것으로 보아 그럴 가능성은 없는 것 같았습니다.",
		"\"아니야, 겉모습과는 다르게\n아주 훌륭하고 뛰어난 아이일지도 몰라.",
		"동물들은 그렇게 생각했고, 아이의 능력을 알아보기 위해\n이런저런 시험을 해보았습니다.",
		" ",
		"...그러나, 아이에게는 동물들이 원했던\n강인함도, 기품도, 지혜도 없었습니다.",
		"아이에게는 지도자가 되어 나라를 이끌 자질이\n전혀 없어보였습니다.",
		"그 모습에 낙담하고 절망한 동물들은,\n분노에 차서 외쳤습니다.",
		"\"저건 저주다! 이 나라를 멸망시킬 저주야!\"",
		" ",
		"\"당장 추방해야해!\" \"아니, 없애버려야해!\"",
		"하지만 몇몇 동물들의 생각은 달랐습니다.",
		"\"아이의 모습이 예상과 다른 것은 사실이지만,\n신이 보내주신 아이를 함부로 대하면 안돼.\"",
		"\"그러다간 천벌을 받을 거라구.\"",
		"\"네가 정말로 신이 보내주신 아이라면,\n분명 뛰어난 자질이 있을 거야\"",
		"\"그걸 증명할 수 있는 방법을 찾은 후에 이곳으로 돌아와.\"",
		" ",
		"그렇게 햄스터는 혼자 남겨졌습니다.",
		"혼자 남은 햄스터에게는 머물 곳도,\n도움을 요청할 동물도 없었습니다.",
		"어쩔 수 없이 햄스터는 길을 떠나게 되었습니다.",
		" ",
		"혹시 어딘가에 있을지 모를,\n동물들이 말한 자신의 \'자질\'을 찾기 위해,\n햄스터는 모험을 시작하였습니다.",
		"view1으로"
					}
					
	------------------------------------------------------------
	for i = 1, #text, 1 do
		showText[i] = display.newText(text[i], white.x, white.y)
	end
	-------------------------------------------------------
	for i = 1, #showText, 1 do
		showText[i].size = 50
		showText[i]:setFillColor(0)
		showText[i].alpha = 0
	end
	for i = 1, 7, 1 do
		showText[i].x, showText[i].y = temp.x, temp.y
		showText[i]:setFillColor(1)
	end
	----------------------------------------------
	backUI[1].alpha = 1
	transition.to(black, {time = 500, alpha = 0})
	
	function occurEvents ()
		if index == 2 then
			--transition.to(black, {time = 500, alpha = 0.5})
			--transition.to(white, {time = 500, alpha = 1.0})
			temp.alpha = 0.5
		
		elseif index == 5 then
			backUI[1].alpha = 0
			backUI[2].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			temp.alpha = 0
		elseif index == 6 then
			temp.alpha = 0.5

		elseif index == 9 or index == 16 or index == 21 or index == 28 or index == 36 or index == 41 or index == 48 then
			white.alpha = 1
			transition.to(black, {time = 500, alpha = 0.5})
		
		elseif index == 8 then
			temp.alpha = 0
			backUI[2].alpha = 0
			backUI[3].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
		
		elseif index == 15 then
			backUI[3].alpha = 0
			backUI[4].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0
		
		elseif index == 20 then
			backUI[4].alpha = 0
			backUI[5].alpha = 1
			transition.to(black, {time = 500, alpha = 0})	
			white.alpha = 0		
		
		elseif index == 27 then
			backUI[5].alpha = 0
			backUI[6].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
			white.alpha = 0		
			characterUI[1].alpha = 0			
		
		elseif index == 35 then
			backUI[6].alpha = 0
			backUI[7].alpha = 1
			transition.to(black, {time = 500, alpha = 0})	
			white.alpha = 0				
		
		elseif index == 40 then
			backUI[7].alpha = 0
			backUI[8].alpha = 1
			transition.to(black, {time = 500, alpha = 0})	
			white.alpha = 0				
		
		elseif index == 47 then
			backUI[8].alpha = 0
			backUI[9].alpha = 1
			transition.to(black, {time = 500, alpha = 0})	
			white.alpha = 0
		
		elseif index == 51 then
			transition.to(black, {time = 500, alpha = 1.0})	
			white.alpha = 0		
		
		elseif index == 52 then
			white.alpha = 1
		end
	end

	function showCharater ()
		if index == 11 or index == 25 then
			characterUI[1].alpha = 1

		elseif index == 12 then
			characterUI[1].alpha = 0
			characterUI[2].alpha = 1

		elseif index == 13 then
			characterUI[2].alpha = 0
			characterUI[3].alpha = 1

		elseif index == 14 or index == 34 then
			characterUI[3].alpha = 0

		elseif index == 22 or index == 41 then
			characterUI[4].alpha = 1

		elseif index == 23 or index == 42 then
			characterUI[4].alpha = 0

		elseif index == 29 then
			characterUI[5].alpha = 1

		elseif index == 30 then
			characterUI[5].alpha = 0

		elseif index == 33 then
			characterUI[3].alpha = 1

		elseif index == 39 then
			characterUI[7].alpha = 1

		elseif index == 40 then
			characterUI[7].alpha = 0

		elseif index == 43 then
			characterUI[3].alpha = 1

		elseif index == 45 then
			characterUI[3].alpha = 0
			characterUI[6].alpha = 1
			
		elseif index == 47 then
			characterUI[6].alpha = 0
		end
	end

	function nextText (event)
		showText[index].alpha = 0
		index = index + 1
		showText[index].alpha = 1

		occurEvents()
		showCharater()

		if index == 9 then
			event.target.x, event.target.y = display.contentWidth-150, display.contentHeight-120

		elseif index == 53 then
			composer.gotoScene("view1")			
		end
	end

	local next = widget.newButton(-----------
		{defaultFile = "image/right.png", overFile = "image/right.png",
		width = 70, height = 70, onPress = nextText}
	)
	next.x, next.y = display.contentWidth-170, display.contentHeight-150
	next.name = "nextT"

-------------------------------------------------------------------
	backUI[1].alpha = 1

	for i = 1, #backUI, 1 do sceneGroup:insert(backUI[i]) end
	sceneGroup:insert(black)
	sceneGroup:insert(temp)
	sceneGroup:insert(white)
	for i = 1, #showText, 1 do sceneGroup:insert(showText[i]) end
	for i = 1, #characterUI, 1 do sceneGroup:insert(characterUI[i]) end
	sceneGroup:insert(next)
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
