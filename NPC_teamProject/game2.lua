-----------------------------------------------------------------------------------------
--
-- Calm_down.lua
--
-----------------------------------------------------------------------------------------
local widget = require("widget")
local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	

---------------[ 이미지 ]---------------
	local bg1 = display.newImageRect("image/calm/calm_bg1.png", display.contentWidth, display.contentHeight)
	bg1.x, bg1.y = display.contentWidth / 2, display.contentHeight / 2

	local bg2 = display.newImageRect("image/calm/calm_bg2.png", display.contentWidth, display.contentHeight)
	bg2.x, bg2.y = display.contentWidth / 2, display.contentHeight / 2
	bg2.alpha = 0
	
	local bird_calm = display.newImageRect("image/calm/bird.png", 840, 534)
	bird_calm.x, bird_calm.y = display.contentWidth / 2, display.contentHeight / 2
	bird_calm.alpha = 0

	local bird_base = display.newImageRect("image/calm/bird1.png", 752, 580)
	bird_base.x, bird_base.y = display.contentWidth / 2, display.contentHeight / 2
	bird_base.alpha = 1

	local bird = {}
	bird[1] = display.newImageRect("image/calm/bird1.png", 752, 580) --두려움 
	bird[2] = display.newImageRect("image/calm/bird2.png", 752, 580) -- 놀람
	bird[3] = display.newImageRect("image/calm/bird3.png", 752, 580) -- 화남
	for i = 1, #bird, 1 do
		bird[i].x, bird[i].y = display.contentWidth/2, display.contentHeight/2
		bird[i].alpha = 0
	end

	local bird_smile = display.newImageRect("image/calm/bird4.png", 752, 580)
	bird_smile.x, bird_smile.y = display.contentWidth / 2, display.contentHeight / 2
	bird_smile.alpha = 0

	local gauge = {}	
	gauge[1] = display.newImageRect("image/calm/calm_gauge1.png", 1083, 609)
	gauge[2] = display.newImageRect("image/calm/calm_gauge2.png", 1083, 609)
	gauge[3] = display.newImageRect("image/calm/calm_gauge3.png", 1083, 609)
	gauge[4] = display.newImageRect("image/calm/calm_gauge4.png", 1083, 609)
	gauge[5] = display.newImageRect("image/calm/calm_gauge5.png", 1083, 609)
	gauge[6] = display.newImageRect("image/calm/calm_gauge6.png", 1083, 609)
	for i = 1, #gauge, 1 do
		gauge[i].x, gauge[i].y = display.contentWidth/2, display.contentHeight/2 - 650
		gauge[i].alpha = 0
	end

	local start = display.newImage("image/calm/emo_start.png")
	start.x, start.y = display.contentWidth/2, display.contentHeight/2+400

	local emoImages = {"image/calm/emo_smile.png", "image/calm/emo_embarrass.png", "image/calm/emo_sorry.png"}
	local emoClickImages = {"image/calm/emo_smile_click.png", "image/calm/emo_embarrass_click.png", "image/calm/emo_sorry_click.png"}

-----------[ 게임 ]---------------------

	local bird_emo = 1
	local eButton = {}
	local g = 1 --게이지 단계

	function click ( event )
		if (event.target.name == bird_emo) then
			gauge[g].alpha = 0
			g = g + 1
			gauge[g].alpha = 1

			for i = 1, 3, 1 do
				bird[i].alpha = 0
				eButton[i].alpha = 0
			end
			bird_smile.alpha = 1
			timer.performWithDelay(2000, reaction)
		else
			for i = 1, 3, 1 do
				eButton[i].alpha = 0
			end
			timer.performWithDelay(1000, reaction)
		end
	end
	
	start:addEventListener("touch", start)


	for i = 1, 3, 1 do
		eButton[i] = widget.newButton({defaultFile = emoImages[i], overFile = emoClickImages[i], onPress = click})
		eButton[i].x, eButton[i].y = display.contentWidth/2-500+250*i, display.contentHeight/2+400
		eButton[i].name = i
		eButton[i].alpha = 0
	end

	function start:touch (event)
		for i = 1, 3, 1 do
			eButton[i].alpha = 1
		end
		start.alpha = 0
		bird_smile.alpha = 0
		bird_base.alpha = 0
		gauge[1].alpha = 1

		reaction()
	end

	function reaction()
		for i = 1, 3, 1 do
			eButton[i].alpha = 1
		end
		bird[bird_emo].alpha = 0
		bird_emo = math.random(1, 3)
		bird[bird_emo].alpha = 1

		if g == 6 then
			ending()
		end
	end

	function nextPage(event)
		event.target:removeEventListener("tap", nextPage)
		event.target.alpha = 0
		composer.gotoScene("view3")--다음장으로
	end

	function ending()
		local right = display.newImageRect("image/right.png", 100, 100)
		right.x, right.y = display.contentWidth-150, display.contentHeight-120
		right:addEventListener("tap", nextPage)

		for i = 1, 3, 1 do
			eButton[i].alpha = 0
			bird[i].alpha = 0
		end
		bird_smile.alpha = 0
		bird_calm.alpha = 1
		bg1.alpha = 0
		bg2.alpha = 1
	end
	

-----------[ sceneGroup ]---------------
	sceneGroup:insert( bg1 )
	sceneGroup:insert( bg2 )
	sceneGroup:insert( bird_base )
	sceneGroup:insert( bird_calm )
	sceneGroup:insert( bird_smile )
	sceneGroup:insert( start )
	for i = 1, 3, 1 do
		--sceneGroup:insert(gauge[i])
		sceneGroup:insert(bird[i])
		sceneGroup:insert(eButton[i])
	end
	for i = 1, 6, 1 do
		sceneGroup:insert(gauge[i])
	end
	
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then

	elseif phase == "did" then

	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then

	elseif phase == "did" then

	end
end

function scene:destroy( event )
	local sceneGroup = self.view

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene