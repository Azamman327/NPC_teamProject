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

	local a = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
	a:setFillColor(1)
	a.alpha = 0
	-----------------------------------------------------
	gameUI[1] = display.newImageRect("image/hamster_sweat.png", 600, 700)
	gameUI[1].x, gameUI[1].y = display.contentWidth/2, display.contentHeight/2-100

	gameUI[2] = display.newImageRect("image/bird_angry.png", 581, 668)
	gameUI[2].x, gameUI[2].y = display.contentWidth-600, display.contentHeight/2+10

	gameUI[3] = display.newImageRect("image/hamster_normal.png", 581, 668)
	gameUI[3].x, gameUI[3].y = display.contentWidth/2-500, display.contentHeight/2
	
	gameUI[4] = display.newImageRect("image/hamster_happy.png", 600, 700)
	gameUI[4].x, gameUI[4].y = display.contentWidth/2, display.contentHeight/2-100

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
	for i = 1, #characterUI, 1 do
		characterUI[i].alpha = 0
    end
	------------------------------------------------
	backUI[1] = display.newImageRect("background/back_3.png", display.contentWidth, display.contentHeight)
	backUI[2] = display.newImageRect("background/back_4.png", display.contentWidth, display.contentHeight)

	for i = 1, #backUI, 1 do
		backUI[i].x = display.contentWidth/2
		backUI[i].y = display.contentHeight/2
		backUI[i].alpha = 0
	end
	----------------------------------------------
	local text = {" ",
					"(반지를 찾았다!!)",
					"?!?!?", 
					"(누군가 반지를 뺏어갔다!)",
					"넌 누구야?\n여긴 내 구역이야!", 
					" ",
					"그러니까 이 안으로 떨어진 건 전부 내거야...",
					"손 댈 생각 하지마!!",
					"(......)",
					"왜 가만히 있는거야!",
					"너한테 줄 건 없다니까?",
					"그러니까 빨리 여기서 나가!",
					"(......)", 
					"말을 전혀 못 알아듣는군!", 
					"그렇다면 네 물건도 다 가져가주겠어...",
					"가지고 있는 것 다 내놔!",
					"(우선 오목눈이를 진정시켜보자)", 
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
			gameUI[4].alpha = 1
		
		elseif index == 3 then
			gameUI[4].alpha = 0
			gameUI[1].alpha = 1
			a.alpha = 1
			transition.to(a, {time = 700, alpha = 0})
		
		elseif index == 5 then
			gameUI[1].x, gameUI[1].y = display.contentWidth/2-500, display.contentHeight/2
			transition.to(gameUI[2], {time = 500, alpha = 1.0})
		
		elseif index == 6 then
			backUI[1].alpha = 0
			backUI[2].alpha = 1
			white.alpha = 0
			transition.to(black, {time = 500, alpha = 0})
			gameUI[1].alpha = 0
			gameUI[2].alpha = 0
		
		elseif index == 7 then
			white.alpha = 1
			transition.to(black, {time = 500, alpha = 0.5})
			gameUI[1].alpha = 1
			gameUI[2].alpha = 1		
		
		elseif index == 9 then
			gameUI[1].alpha = 0
			gameUI[3].alpha = 1
		
		elseif index == 12 or index == 16 then
			showText[index].size = 80
		
		elseif index == 17 then
			gotoGame.alpha = 1
		end
	end

	function showCharater ()
		if index == 2 then
			characterUI[1].alpha = 1
		
		elseif index == 5 or index == 7 or index == 10 or index == 14 then
			characterUI[1].alpha = 0
			characterUI[5].alpha = 1
		
		elseif index == 6 or index == 17 then
			characterUI[5].alpha = 0
		
		elseif index == 9 or index == 13 then
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

		if index == 18 then
			composer.gotoScene("game2")			
		end
	end

	local next = widget.newButton(----------------다음내용 넘어가기
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
		composer.removeScene("view1")
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