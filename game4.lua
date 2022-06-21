-----------------------------------------------------------------------------------------
--
-- game4.lua(불가사리퀴즈)
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local widget = require("widget")
	local index = 1

	local wrong_normal = display.newImageRect("image/quiz/wrong_normal.png", display.contentWidth, display.contentHeight)
	wrong_normal.x, wrong_normal.y = display.contentWidth/2, display.contentHeight/2

	local wrong_quiz1 = display.newImageRect("image/quiz/wrong_quiz1.png", display.contentWidth, display.contentHeight)
	wrong_quiz1.x, wrong_quiz1.y = display.contentWidth/2, display.contentHeight/2
	wrong_quiz1.alpha = 0

	local textBox = display.newImageRect("image/quiz/textBox.png", display.contentWidth-1000, display.contentHeight/2-200)
	textBox.x, textBox.y = display.contentWidth/2, display.contentHeight/2-300

	local quiz1 = display.newText("Q1.동물들은 끊임없이 그 섬에 가려고 한다. \n그 이유는 무엇인가?", display.contentWidth/2, display.contentHeight/2+70)
	quiz1.size = 50
	quiz1:setFillColor(0)
	quiz1.alpha = 0

	local wrongText1 = display.newText("틀렸다! 들어가지도 못하는 곳인데\n거기에 동물이 산다고 생각하니?", display.contentWidth/2+20, display.contentHeight/2+70)
	wrongText1.size = 50
	wrongText1:setFillColor(0)
	wrongText1.alpha = 0

	local wrongText2 = display.newText("틀렸다! \n...너는 여행을 목숨을 걸고 하니?", display.contentWidth/2+20, display.contentHeight/2+70)
	wrongText2.size = 50
	wrongText2:setFillColor(0)
	wrongText2.alpha = 0

	local answer1 = display.newText("1.보물과 신비한 생물 때문에", quiz1.x-260, quiz1.y + 150)
	answer1.size = 35
	answer1:setFillColor(0)
	answer1.alpha = 0

	local answer2 = display.newText("2.그 섬이 고향이라서", answer1.x+490, answer1.y)
	answer2.size = 35
	answer2:setFillColor(0)
	answer2.alpha = 0

	local answer3 = display.newText("3.유명 휴양지이기 때문에", answer1.x, answer1.y+160)
	answer3.size = 35
	answer3:setFillColor(0)
	answer3.alpha = 0
----------------------------------------------------------------------
	local correct_quiz1 = display.newImageRect("image/quiz/correct_quiz1.png", display.contentWidth, display.contentHeight)
	correct_quiz1.x, correct_quiz1.y = display.contentWidth/2, display.contentHeight/2
	correct_quiz1.alpha = 0

	local wrong_quiz2 = display.newImageRect("image/quiz/wrong_quiz2.png", display.contentWidth, display.contentHeight)
	wrong_quiz2.x, wrong_quiz2.y = display.contentWidth/2, display.contentHeight/2
	wrong_quiz2.alpha = 0

	local correct_quiz2 = display.newImageRect("image/quiz/correct_quiz2.png", display.contentWidth, display.contentHeight)
	correct_quiz2.x, correct_quiz2.y = display.contentWidth/2, display.contentHeight/2
	correct_quiz2.alpha = 0	

	local wrong_quiz3 = display.newImageRect("image/quiz/wrong_quiz3.png", display.contentWidth, display.contentHeight)
	wrong_quiz3.x, wrong_quiz3.y = display.contentWidth/2, display.contentHeight/2
	wrong_quiz3.alpha = 0

	local correct_quiz3 = display.newImageRect("image/quiz/correct_quiz3.png", display.contentWidth, display.contentHeight)
	correct_quiz3.x, correct_quiz3.y = display.contentWidth/2, display.contentHeight/2
	correct_quiz3.alpha = 0	

	local correct_normal = display.newImageRect("image/quiz/correct_normal.png", display.contentWidth, display.contentHeight)
	correct_normal.x, correct_normal.y = display.contentWidth/2, display.contentHeight/2
	correct_normal.alpha = 0	
-----------------------------------------------------------------------]]

	local quizBox = display.newImageRect("image/quiz/quizBox.png", display.contentWidth/2-40, display.contentHeight/2-250)
	quizBox.x, quizBox.y = display.contentWidth/2-10, display.contentHeight/2+300
	quizBox.alpha = 0

	local text = display.newText("자, 첫 번째 문제다!", textBox.x, textBox.y-10)
	text.size = 50
	text:setFillColor(0)

	local text2 = display.newText("그래! 그 섬에는 꼬리 여럿 달린 생물과\n온갖 보물이 가득하다고 하지.", display.contentWidth/2, display.contentHeight/2+200)
	text2.size = 50
	text2:setFillColor(0)
	text2.alpha = 0

	local text3 = display.newText("2번째 문제다!\n이 문제도 맞힐 수 있을까?", textBox.x, textBox.y-10)
	text3.size = 50
	text3:setFillColor(0)
	text3.alpha = 0

	local text4 = display.newText("맞아...! 보물을 노리고 \'바다신\'의 영역에\n겁없이 들어간 동물들은... \n모두 혼쭐이 나는 거야.", display.contentWidth/2, display.contentHeight/2+200)
	text4.size = 50
	text4:setFillColor(0)
	text4.alpha = 0

	local text5 = display.newText("자 다음 문제다!\n이 문제는 조금 어려울 게다.", textBox.x, textBox.y-10)
	text5.size = 50
	text5:setFillColor(0)
	text5.alpha = 0

	local text6 = display.newText("아직 아무도 다른 방법을 찾지 못했어...\n유일한 방법은 \'바다신\'에게 \n맞서는 것 뿐이야!", display.contentWidth/2, display.contentHeight/2+200)
	text6.size = 50
	text6:setFillColor(0)
	text6.alpha = 0

	local text7 = display.newText("다음 문제는...", textBox.x, textBox.y-10)
	text7.size = 50
	text7:setFillColor(0)
	text7.alpha = 0

	local text8 = display.newText("...?", textBox.x, textBox.y-10)
	text8.size = 50
	text8:setFillColor(0)
	text8.alpha = 0

	local text9 = display.newText("어...없다!", textBox.x, textBox.y-10)-------------
	text9.size = 50
	text9:setFillColor(0)
	text9.alpha = 0

	local text10 = display.newText("모든 문제를 맞혔구나!", textBox.x, textBox.y-10)-------------
	text10.size = 50
	text10:setFillColor(0)
	text10.alpha = 0
	---------------------------------------

	local quiz2 = display.newText("Q2.그럼에도 수많은 동물들이 그 섬에 \n도착하지 못한 이유는 무엇인가?", display.contentWidth/2, display.contentHeight/2+70)
	quiz2.size = 50
	quiz2:setFillColor(0)
	quiz2.alpha = 0

	local answer4 = display.newText("1.배를 만들지 못해서", quiz2.x-260, quiz2.y + 150)
	answer4.size = 40
	answer4:setFillColor(0)
	answer4.alpha = 0

	local answer5 = display.newText("2.\'바다신\'이 분노해서", answer1.x+490, answer1.y)
	answer5.size = 40
	answer5:setFillColor(0)
	answer5.alpha = 0

	local answer6 = display.newText("3.가는길을 잃어서", answer1.x, answer1.y+160)
	answer6.size = 40
	answer6:setFillColor(0)
	answer6.alpha = 0

	local wrongText2_1 = display.newText("틀렸다! 못 만들었다니...\n너도 배를 만들어서 여기까지 온것이 아니냐?", display.contentWidth/2+20, display.contentHeight/2+70)-------------
	wrongText2_1.size = 50
	wrongText2_1:setFillColor(0)
	wrongText2_1.alpha = 0

	local wrongText2_2 = display.newText("틀렸다! 동물들이 모두 길치는 아니란다...\n다시 생각해봐라!", display.contentWidth/2+20, display.contentHeight/2+70)-------------
	wrongText2_2.size = 50
	wrongText2_2:setFillColor(0)
	wrongText2_2.alpha = 0
	-----------------------------------
	local quiz3 = display.newText("Q3.\'바다신\'을 피해 섬에 갈 수 있는 방법은 무엇인가?", display.contentWidth/2, display.contentHeight/2+70)
	quiz3.size = 50
	quiz3:setFillColor(0)
	quiz3.alpha = 0

	local answer7 = display.newText("1.없다", quiz3.x-260, quiz3.y + 150)
	answer7.size = 40
	answer7:setFillColor(0)
	answer7.alpha = 0

	local answer8 = display.newText("2.\'바다신\'에게 빈다", answer7.x+490, answer7.y)
	answer8.size = 40
	answer8:setFillColor(0)
	answer8.alpha = 0

	local answer9 = display.newText("3.서핑해서 간다", answer7.x, answer7.y+160)
	answer9.size = 40
	answer9:setFillColor(0)
	answer9.alpha = 0

	local wrongText3_1 = display.newText("틀렸다!\n그 전에 \'바다신\'에게 잡아먹혀버리고 말 거다!", display.contentWidth/2+20, display.contentHeight/2+70)-------------
	wrongText3_1.size = 50
	wrongText3_1:setFillColor(0)
	wrongText3_1.alpha = 0

	local wrongText3_2 = display.newText("틀렸다!\n지금 나하고 장난하자는거니?", display.contentWidth/2+20, display.contentHeight/2+70)-------------
	wrongText3_2.size = 50
	wrongText3_2:setFillColor(0)
	wrongText3_2.alpha = 0
	----------------------------------

	function correct1 (event)
		if index == 2 then
			answer1.text = " "
			answer2.text = " "
			answer3.text = " "
			wrong_quiz1.alpha = 0
			wrongText1.alpha = 0
			wrongText2.alpha = 0
			quizBox.alpha = 0
			quiz1.alpha = 0
			index = index + 1

			correct_quiz1.alpha = 1
			text2.alpha = 1
			next2 = widget.newButton(
   			{ 
        		defaultFile = "image/quiz/next.png", overFile = "image/quiz/next.png",
        		width = 50, height = 50, onPress = nextText2 
   			})
   			next2.x, next2.y = text2.x+280, text2.y+30
		end
	end

	function wrong1_1 (event)
		if index == 2 then
			quiz1.alpha = 0
			wrongText2.alpha = 0
			wrongText1.alpha = 1
		end
	end

	function wrong1_2 (event)
		if index == 2 then
			quiz1.alpha = 0
			wrongText1.alpha = 0
			wrongText2.alpha = 1
		end
	end

	function correct2 (event)
		if index == 5 then
			answer4.text = " "
			answer5.text = " "
			answer6.text = " "
			wrong_quiz2.alpha = 0
			wrongText2_1.alpha = 0
			wrongText2_2.alpha = 0
			quizBox.alpha = 0
			quiz2.alpha = 0
			index = index + 1

			correct_quiz2.alpha = 1-----------------------
			text4.alpha = 1
			next3 = widget.newButton(
   			{ 
        		defaultFile = "image/quiz/next.png", overFile = "image/quiz/next.png",
        		width = 50, height = 50, onPress = nextText3 
   			})
   			next3.x, next3.y = text4.x+280, text4.y+50
		end
	end

	function wrong2_1 (event)
		if index == 5 then
			quiz2.alpha = 0
			wrongText2_2.alpha = 0
			wrongText2_1.alpha = 1
		end
	end

	function wrong2_2 (event)
		if index == 5 then
			quiz2.alpha = 0
			wrongText2_1.alpha = 0
			wrongText2_2.alpha = 1
		end
	end

	function correct3 (event)
		if index == 8 then
			answer7.text = " "
			answer8.text = " "
			answer9.text = " "
			wrong_quiz3.alpha = 0
			wrongText3_1.alpha = 0
			wrongText3_2.alpha = 0
			quizBox.alpha = 0
			quiz3.alpha = 0
			index = index + 1

			correct_quiz3.alpha = 1
			text6.alpha = 1
			next4 = widget.newButton(
   			{ 
        		defaultFile = "image/quiz/next.png", overFile = "image/quiz/next.png",
        		width = 50, height = 50, onPress = nextText4
   			})
   			next4.x, next4.y = text6.x+280, text6.y+50
		end
	end

	function wrong3_1 (event)
		if index == 8 then
			quiz3.alpha = 0
			wrongText3_2.alpha = 0
			wrongText3_1.alpha = 1
		end
	end

	function wrong3_2 (event)
		if index == 8 then
			quiz3.alpha = 0
			wrongText3_1.alpha = 0
			wrongText3_2.alpha = 1
		end
	end
--------------------------------------------------------
	function occurEvent ()
		if index == 2 then
			textBox.alpha = 0
			wrong_normal.alpha = 0
			wrong_quiz1.alpha = 1
			quizBox.alpha = 1

			quiz1.alpha = 1

			answer1.alpha = 1
			local button1 = display.newImageRect("image/quiz/button.png", 450, 130)
			button1.x, button1.y = quiz1.x-260, quiz1.y + 150
			button1:addEventListener("tap", correct1)

			answer2.alpha = 1
			local button2 = display.newImageRect("image/quiz/button.png", 450, 130)
			button2.x, button2.y = answer1.x+490, answer1.y
			button2:addEventListener("tap", wrong1_1)

			answer3.alpha = 1
			local button3 = display.newImageRect("image/quiz/button.png", 450, 130)
			button3.x, button3.y = answer1.x, answer1.y+160
			button3:addEventListener("tap", wrong1_2)
		end
		if index == 4 then
			correct_quiz1.alpha = 0
			wrong_normal.alpha = 1
			text2.alpha = 0
			textBox.alpha = 1
			text3.alpha = 1
		end
		if index == 5 then
			text3.alpha = 0
			textBox.alpha = 0
			wrong_normal.alpha = 0
			wrong_quiz2.alpha = 1
			quiz2.alpha = 1
			answer4.alpha = 1
			answer5.alpha = 1
			answer6.alpha = 1
			quizBox.alpha = 1

			local button4 = display.newImageRect("image/quiz/button.png", 450, 130)
			button4.x, button4.y = quiz2.x-260, quiz2.y + 150
			button4:addEventListener("tap", wrong2_1)

			local button5 = display.newImageRect("image/quiz/button.png", 450, 130)
			button5.x, button5.y = answer4.x+490, answer4.y
			button5:addEventListener("tap", correct2)

			local button6 = display.newImageRect("image/quiz/button.png", 450, 130)
			button6.x, button6.y = answer4.x, answer4.y+160
			button6:addEventListener("tap", wrong2_2)
		end
		if index == 7 then
			correct_quiz2.alpha = 0
			wrong_normal.alpha = 1
			text4.alpha = 0
			textBox.alpha = 1
			text5.alpha = 1
		end
		if index == 8 then
			text5.alpha = 0
			textBox.alpha = 0
			wrong_normal.alpha = 0
			wrong_quiz3.alpha = 1
			quiz3.alpha = 1
			answer7.alpha = 1
			answer8.alpha = 1
			answer9.alpha = 1
			quizBox.alpha = 1	

			local button7 = display.newImageRect("image/quiz/button.png", 450, 130)
			button7.x, button7.y = quiz3.x-260, quiz3.y + 150
			button7:addEventListener("tap", correct3)

			local button8 = display.newImageRect("image/quiz/button.png", 450, 130)
			button8.x, button8.y = answer7.x+490, answer7.y
			button8:addEventListener("tap", wrong3_1)

			local button9 = display.newImageRect("image/quiz/button.png", 450, 130)
			button9.x, button9.y = answer7.x, answer7.y+160
			button9:addEventListener("tap", wrong3_2)		
		end
		if index == 10 then
			correct_quiz3.alpha = 0
			wrong_normal.alpha = 1
			text6.alpha = 0
			textBox.alpha = 1
			text7.alpha = 1
		end
		if index == 11 then
			text7.alpha = 0
			text8.alpha = 1
		end
		if index == 12 then
			wrong_normal.alpha = 0
			correct_normal.alpha = 1
			text8.alpha = 0
			text9.alpha = 1
		end
		if index == 13 then
			text9.alpha = 0
			text10.alpha = 1
		end
	end
-----------------------------------
	function nextText (event)
		text.alpha = 0
		index = index + 1

		if index == 2 then
			event.target.alpha = 0
		end
		occurEvent()
	end

	function nextText2 (event)
		text.alpha = 0
		index = index + 1

		if index == 4 then
			event.target.x, event.target.y = textBox.x+350, textBox.y+80
		end
		if index == 5 then
			event.target.alpha = 0
		end
		occurEvent()
	end

	function nextText3 (event)
		text.alpha = 0
		index = index + 1

		if index == 7 then
			event.target.x, event.target.y = textBox.x+350, textBox.y+80
		end
		if index == 8 then
			event.target.alpha = 0
		end
		occurEvent()
	end

	function nextText4 (event)
		text.alpha = 0
		index = index + 1

		if index == 10 then
			event.target.x, event.target.y = textBox.x+350, textBox.y+80
		end
		if index == 14 then
			text10.alpha = 0
			event.target.alpha = 0
			composer.gotoScene("view6")
		end
		occurEvent()
	end
	--------------------------------

	next = widget.newButton(
    { 
        defaultFile = "image/quiz/next.png", overFile = "image/quiz/next.png",
        width = 50, height = 50, onPress = nextText 
    })
    next.x, next.y = textBox.x+350, textBox.y+80



  	sceneGroup:insert(wrong_normal)
  	sceneGroup:insert(wrong_quiz1)
  	sceneGroup:insert(wrong_quiz2)
  	sceneGroup:insert(wrong_quiz3)
  	sceneGroup:insert(correct_normal)
  	sceneGroup:insert(textBox)
  	sceneGroup:insert(quizBox)
  	sceneGroup:insert(quiz1)
  	sceneGroup:insert(wrongText1)
  	sceneGroup:insert(wrongText2)
  	sceneGroup:insert(next)
end
------------------------------------------------------------------------
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
		composer.removeScene("game4")
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