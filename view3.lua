-----------------------------------------------------------------------------------------
--
-- view3.lua
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

	local a = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
	a:setFillColor(1)
	a.alpha = 0

	local gotoGame = display.newImageRect("image/gotogame.png", 250, 50)
	gotoGame.x, gotoGame.y = display.contentWidth-320, display.contentHeight-120
	gotoGame.alpha = 0
	-----------------------------------------------------	
	gameUI[1] = display.newImageRect("image/bird_sweat.png", 581, 668)
	gameUI[1].x, gameUI[1].y = display.contentWidth-400, display.contentHeight/2+10

	gameUI[2] = display.newImageRect("image/bird_sad.png", 581, 668)
	gameUI[2].x, gameUI[2].y = display.contentWidth-400, display.contentHeight/2+10

	gameUI[3] = display.newImageRect("image/hamster_happy.png", 600, 700)
	gameUI[3].x, gameUI[3].y = display.contentWidth/2-500, display.contentHeight/2

	gameUI[4] = display.newImageRect("image/bird_normal.png", 581, 668)
	gameUI[4].x, gameUI[4].y = display.contentWidth-400, display.contentHeight/2+10

	gameUI[5] = display.newImageRect("image/elephant_happy.png", 581, 668)
	gameUI[5].x, gameUI[5].y = display.contentWidth-600, display.contentHeight/2-100

	gameUI[6] = display.newImageRect("image/bird_happy.png", 581, 668)
	gameUI[6].x, gameUI[6].y = display.contentWidth-600, display.contentHeight/2+10

	gameUI[7] = display.newImageRect("image/hamster_normal.png", 600, 700)
	gameUI[7].x, gameUI[7].y = display.contentWidth/2-500, display.contentHeight/2

	gameUI[8] = display.newImageRect("image/hamster_bread.png", 600, 700)
	gameUI[8].x, gameUI[8].y = display.contentWidth/2-500, display.contentHeight/2

	gameUI[9] = display.newImageRect("image/bag.png", 500, 500)
	gameUI[9].x, gameUI[9].y = display.contentWidth/2, display.contentHeight/2-50

	for i = 1, #gameUI, 1 do
		gameUI[i].alpha = 0
	end
	---------------------------------------------------------

	characterUI[1] = display.newImageRect("image/hamster_normal.png", 300, 300)----------------햄스터평범
	characterUI[1].x, characterUI[1].y = 250, white.y
	characterUI[2] = display.newImageRect("image/hamster_sweat.png", 300, 300)----------------햄스터당황
	characterUI[2].x, characterUI[2].y = 250, white.y
	characterUI[3] = display.newImageRect("image/hamster_angry.png", 300, 300)----------------햄스터화남
	characterUI[3].x, characterUI[3].y = 250, white.y
	characterUI[4] = display.newImageRect("image/hamster_happy.png", 300, 300)----------------햄스터행복
	characterUI[4].x, characterUI[4].y = 250, white.y

	characterUI[5] = display.newImageRect("image/bird_normal.png", 300, 300)----------------코끼리평범
	characterUI[5].x, characterUI[5].y = 250, white.y+20
	characterUI[6] = display.newImageRect("image/bird_sweat.png", 300, 300)----------------코끼리걱정
	characterUI[6].x, characterUI[6].y = 250, white.y+20
	characterUI[7] = display.newImageRect("image/bird_angry.png", 300, 300)----------------코끼리반지
	characterUI[7].x, characterUI[7].y = 250, white.y+20
	characterUI[8] = display.newImageRect("image/bird_happy.png", 300, 300)----------------코끼리행복
	characterUI[8].x, characterUI[8].y = 250, white.y+20
	characterUI[9] = display.newImageRect("image/bird_sad.png", 300, 300)----------------
	characterUI[9].x, characterUI[9].y = 250, white.y+20

	characterUI[10] = display.newImageRect("image/elephant_normal.png", 270, 300)----------------ÄÚ³¢¸®Æò¹ü
	characterUI[10].x, characterUI[10].y = 250, white.y-10
	characterUI[11] = display.newImageRect("image/elephant_worry.png", 270, 300)----------------ÄÚ³¢¸®°ÆÁ¤
	characterUI[11].x, characterUI[11].y = 250, white.y-10
	characterUI[12] = display.newImageRect("image/elephant_ring.png", 270, 300)----------------ÄÚ³¢¸®¹ÝÁö
	characterUI[12].x, characterUI[12].y = 250, white.y-10
	characterUI[13] = display.newImageRect("image/elephant_happy.png", 270, 300)----------------ÄÚ³¢¸®Çàº¹
	characterUI[13].x, characterUI[13].y = 250, white.y-10
	for i = 1, #characterUI, 1 do
		characterUI[i].alpha = 0
    end
    -------------------------------------------------
    backUI[1] = display.newImageRect("background/back_5.png", display.contentWidth, display.contentHeight)
	backUI[2] = display.newImageRect("background/back_6.png", display.contentWidth, display.contentHeight)
	backUI[3] = display.newImageRect("background/back_7.png", display.contentWidth, display.contentHeight)
	backUI[4] = display.newImageRect("background/back_8.png", display.contentWidth, display.contentHeight)
	backUI[5] = display.newImageRect("background/back_9.png", display.contentWidth, display.contentHeight)
	backUI[6] = display.newImageRect("background/back_10.png", display.contentWidth, display.contentHeight)

	for i = 1, #backUI, 1 do
		backUI[i].x = display.contentWidth/2
		backUI[i].y = display.contentHeight/2
		backUI[i].alpha = 0
	end
	------------------------------------------------
	local text = {" ",
					"(보따리를 풀어 오목눈이에게 보여준다)",
					"칫...진작에 그럴 것이지.", 
					"사실 나도 이러고 싶지 않았다고...",
					"응? 이게 뭐야...", 
					"햄스터의 보따리 속에는 작은 해바라기씨 3개와 낡은 지도 뿐이었어요.",
					"겨우 이런거 가지고 다닐 거면 보따리는 왜 싸들고 온 거야...",
					"이정도로는 오늘 저녁 값도 못 번다고",
					"남의 물건 주워다 팔면서 사는 건 이젠 질렸어...",
					"나도 나쁜 일은 하기 싫단 말이야.",
					"그런데 대표라고 뽑아놓은 동물들은 \n맨날 싸우기만 하고...",
					"나같이 가난한 동물들한테는 관심도 없어.",
					"(......)", 
					"(좋은 생각이 났다!)", 
					"(오목눈이에게 자신의 생각을 얘기하고 있다.)",
					"그게 뭔지는 모르겠지만... 일단 알겠어...",
					"반지 줄게, 받아",
					" ", 
					"햄스터는 반지를 가지고 밖으로 나와\n위풍당당하게 코끼리 부인을 바라보았습니다",
					"너, 해냈구나! 정말 고마워.",
					"나도 너에게 보답하고 싶어\n뭐든지 부탁하렴.",
					"(코끼리 부인에게 이야기를 하고 있다...)",
					"정말 그거면 되겠니?", 
					"(끄덕)",
					"반지는 저 부인의 것이어었구나...\n저녀석이 말한 좋은 생각이란게 저 빵이었나?",
					"햄스터는 빵을 가지고 오목눈이의 집에 가기로 했어요.\n도둑 오목눈이는 햄스터와 빵을 태우고 밤하늘을 힘껏 날았어요.",
					" ",
					"이정도는 별로 안 무겁거든...?",
					"뭐 이렇게 되면 도둑질도 안하고\n밥도 먹을 수 있어서 좋긴 하네.",
					" ",
					"집에 도착한 햄스터와 오목눈이는 같이 빵을 먹기 시작했어요.",
					"이렇게 음식을 쌓아놓고 먹기는 처음이야.",
					"집 지을 돈도 부족해서 지붕도 못 세우는 상황이었는데...",
					"그러고보니, 네 보따리 안에 지도가\n들어있었는데... 혹시 여행 중인 거야?",
					"(끄덕)",
					"그래? 그럼 다음에는 어디로 갈 생각이야?",
					"계속 이 나라를 돌아다닐 거야?\n아니면 바다로 나갈 거야?",
					"(고개를 갸웃거린다)",
					"뭐야, 너... 설마 아무 계획도 없는거야?",
					"뭐... 확실히 없어보이긴 한다.",
					"그래도 그렇게 무작정 달려들면 안 되는 거라구.\n지도 꺼내봐 내가 알려줄게.",
					" ",
					"우리는 지금 이 땅 끝자락에 있어.",
					"조금만 더 가면 바다가 나오는데...\n거기서 배를 타고 나가면 저기 보이는 섬에 갈 수 있어.",
					"저 섬에는 엄청난 보물과 신비한 생물들이 있다고 해...\n근데 지금까지 저 섬에 도착한 동물은 아무도 없어...!",
					"왜냐하면 저 섬으로 가는 바다는 아주 거칠고 위험하거든.",
					"그래서 저 섬으로 가겠다던 동물들 중 돌아온 녀석은 없었지...\n하지만 그만큼 모험가 녀석들에게는 꿈의 섬이야.",
					"너도 가겠다면 말리지는 않겠지만...\n목숨을 걸 각오는 해야할걸!",
					"...너 듣고 있어?",
					"햄스터는 꿈의 섬 이야기에 눈이 반짝였어요.\n햄스터는 아침이 되면 바다로 나갈 생각을 하며 잠에 들었습니다.",
					" ",
					" ",
					"<다음날 아침>",
					"잘가! 조심하고...\n혹시 돌아올 수 있으면 꼭 돌아오는거다!", 
					"아, 그리고... 어제는 고, 고마웠다!",
					"멀어져가는 햄스터의 뒷모습을 보며, \n도둑 오목눈이는 생각했어요.",
					"저런 녀석이 이 나라의 왕이 되면 좋을텐데...",
					"순간 오목눈이의 머릿속에 어떤 기억이 스쳐지나갔어요.",
					"동물들의 세상을 이끌어갈 아이가 나타난다!",
					"아냐, 말도 안돼...\n설마 저런 녀석이... 하지만",
					"오목눈이는 부정했지만\n햄스터가 떠나간 그 자리에서 움직일 수 없었어요.",
					" "
					}
			
	------------------------------------------------------------
	local showText = {}
	for i = 1, #text, 1 do
		if i == 6 or i == 7 then
			showText[i] = display.newText(text[i], white.x+70, white.y)
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
			transition.to(white, {time = 500, alpha = 1.0})
			transition.to(black, {time = 500, alpha = 0.5})
			transition.to(gameUI[4], {time = 500, alpha = 1.0})
			transition.to(gameUI[7], {time = 500, alpha = 1.0})
			transition.to(gameUI[9], {time = 500, alpha = 1.0})
		
		elseif index == 5 then
			gameUI[4].alpha = 0
			gameUI[1].alpha = 1
		
		elseif index == 9 then
			gameUI[1].alpha = 0
			gameUI[2].alpha = 1
		
		elseif index == 15 then
			gameUI[7].alpha = 0
			gameUI[3].alpha = 1
		
		elseif index == 16 then
			gameUI[2].alpha = 0
			gameUI[4].alpha = 1
		
		elseif index == 18 then--back change
			backUI[1].alpha = 0
			backUI[2].alpha = 1
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 0})
			gameUI[3].alpha = 0
			gameUI[4].alpha = 0
			gameUI[7].alpha = 0
			gameUI[9].alpha = 0
		
		elseif index == 19 then
			transition.to(black, {time = 500, alpha = 0.5})
			transition.to(white, {time = 500, alpha = 1.0})
		
		elseif index == 20 then
			transition.to(gameUI[3], {time = 500, alpha = 1.0})
			transition.to(gameUI[5], {time = 500, alpha = 1.0})
		
		elseif index == 23 then
			gameUI[3].alpha = 0
			transition.to(gameUI[8], {time = 500, alpha = 1.0})
		
		elseif index == 27 then--back change
			backUI[2].alpha = 0
			backUI[3].alpha = 1
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 0})
			gameUI[5].alpha = 0
			gameUI[8].alpha = 0
		
		elseif index == 28 then
			--transition.to(black, {time = 500, alpha = 0.5})
			transition.to(white, {time = 500, alpha = 1.0})
		
		elseif index == 30 then--back change
			backUI[3].alpha = 0
			backUI[4].alpha = 1
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 0})
		
		elseif index == 31 then
			--transition.to(black, {time = 500, alpha = 0.5})
			transition.to(white, {time = 500, alpha = 1.0})
		
		elseif index == 42 then--back change
			backUI[4].alpha = 0
			backUI[5].alpha = 1
			gameUI[4].alpha = 0
			gameUI[7].alpha = 0
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 0})
		
		elseif index == 43 then
			transition.to(black, {time = 500, alpha = 0.5})
			transition.to(white, {time = 500, alpha = 1.0})
			transition.to(gameUI[4], {time = 1000, alpha = 1.0})
			transition.to(gameUI[7], {time = 1000, alpha = 1.0})
		
		elseif index == 50 then
			transition.to(gameUI[4], {time = 500, alpha = 0})
			transition.to(gameUI[7], {time = 500, alpha = 0})
		
		elseif index == 51 then
			white.alpha = 0
			transition.to(black, {time = 1000, alpha = 1.0})
		
		elseif index == 52 then
			backUI[6].alpha = 1
			transition.to(black, {time = 500, alpha = 0})
		
		elseif index == 53 then
			--transition.to(black, {time = 500, alpha = 0.5})
			transition.to(white, {time = 500, alpha = 1.0})
		
		elseif index == 59 then
			a.alpha = 1
			transition.to(a, {time = 700, alpha = 0})
		end
	end

	function showCharater ()
		if index == 2 then
			characterUI[1].alpha = 1
	
		elseif index == 3 or index == 16 or index == 25 or index == 36 or index == 39 then
			characterUI[1].alpha = 0
			characterUI[5].alpha = 1
		
		elseif index == 6 or index == 18 or index == 26 or index == 30 or index == 42 or index == 50 or index == 56 or index == 59 or index == 61 then
			characterUI[5].alpha = 0
		
		elseif index == 7 or index == 28 or index == 43 or index == 54 or index == 57 or index == 60 then
			characterUI[5].alpha = 1
		
		elseif index == 9 then
			characterUI[5].alpha = 0
			characterUI[9].alpha = 1
		
		elseif index == 13 then
			characterUI[9].alpha = 0
			characterUI[1].alpha = 1
		
		elseif index == 20 then 
			characterUI[10].alpha = 1
		
		elseif index == 22 or index == 24 then
			characterUI[10].alpha = 0
			characterUI[1].alpha = 1
		
		elseif index == 23 then
			characterUI[1].alpha = 0
			characterUI[10].alpha = 1
		
		elseif index == 32 then
			characterUI[8].alpha = 1
		
		elseif index == 35 then
			characterUI[8].alpha = 0
			characterUI[1].alpha = 1
		
		elseif index == 38 then
			characterUI[5].alpha = 0
			characterUI[1].alpha = 1
		end
	end

	function nextText (event)
		showText[index].alpha = 0
		index = index + 1
		showText[index].alpha = 1

		occurEvents()
		showCharater()

		if index == 62 then
			composer.gotoScene("view4")			
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
	sceneGroup:insert(a)
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
		composer.removeScene("view3")
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