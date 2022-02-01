-----------------------------------------------------------------------------------------
--
-- maze_dark.lua
--
-- developer : Knock
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	physics.start()
	--physics.setDrawMode( "hybrid" )
	physics.setGravity( 0, 0 )

	local background = display.newImageRect("background.png", 1920, 1080)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	local player = display.newImageRect("ham.png", 100*0.65, 85*0.65)
	player.y = display.contentHeight - player.height/2 - 100
	player.x = 50 + player.width/200
	player.name = "player"

	local maze_name = "maze1.png"
	local maze_outline = graphics.newOutline(2, maze_name)
	local maze = display.newImageRect(maze_name, 1051, 729)
	maze.x, maze.y = background.x, background.y + 70
	player.x = player.x + (display.contentWidth-maze.width)/2
	maze.name = "maze"
	maze.alpha = 0

	local maze_name2 = "maze2.png"
	local maze_outline2 = graphics.newOutline(2, maze_name2)
	local maze2 = display.newImageRect(maze_name2, maze.width, maze.height)
	maze2.x, maze2.y = maze.x, maze.y
	maze2.name = "maze2"
	maze2.alpha = 0

	local maze_name3 = "maze3.png"
	local maze_outline3 = graphics.newOutline(2, maze_name3)
	local maze3 = display.newImageRect(maze_name3, maze.width, maze.height)
	maze3.x, maze3.y = maze.x, maze.y
	maze3.name = "maze3"
	maze3.alpha = 0

	local mazeImage = display.newImageRect("maze_image.png", 1388, 844)
	mazeImage.x, mazeImage.y = maze.x-15, maze.y+5

	local maze_wall_left = display.newRect((display.contentWidth-maze.width)/4+15, background.y, (display.contentWidth-maze.width)/2, background.height)
	maze_wall_left:setFillColor( 0 )
	maze_wall_left.alpha = 0
	maze_wall_left.name = "left"
	local maze_wall_right = display.newRect(maze.width+maze_wall_left.width*1.5-10, background.y, maze_wall_left.width, maze_wall_left.height)
	maze_wall_right:setFillColor( 0 )
	maze_wall_right.name = "right"
	maze_wall_right.alpha = 0

	local maze_ceil = display.newRect(background.x, 90, background.width, 340)
	maze_ceil:setFillColor(0)
	maze_ceil.name = "ceil"
	maze_ceil.alpha = 0
	local maze_floor = display.newRect(background.x, background.height, background.width, 240)
	maze_floor:setFillColor(0)
	maze_floor.name = "floor"
	maze_floor.alpha = 0

	local outside = display.newImageRect("image/quiz/button.png", 150, 150)
	outside.x, outside.y = maze_wall_right.x-260, 250

	local temp = display.newRect(0,0,0,0)
	temp.x, temp.y = player.x, player.y
	player.x, player.y = outside.x, outside.y
	outside.x, outside.y = temp.x, temp.y

	physics.addBody(player, "dynamic", {bounce=0.5, friction=0.1})
	physics.addBody(maze, "static", {outline=maze_outline, bounce=0.5, friction=0.1})
	physics.addBody(maze2, "static", {outline=maze_outline2, bounce=0.5, friction=0.1})
	physics.addBody(maze3, "static", {outline=maze_outline3, bounce=0.5, friction=0.1})
	physics.addBody(maze_wall_left, "static", {bounce=0.5, friction=0.1})
	physics.addBody(maze_wall_right, "static", {bounce=0.5, friction=0.1})
	physics.addBody(maze_ceil, "static", {bounce=0.5, friction=0.1})
	physics.addBody(maze_floor, "static", {bounce=0.5, friction=0.1})

	local function move( event )
		local key = event.keyName
		local phase = event.phase
		local move = 20

		if (phase == "down") then
			local px = player.x
			local py = player.y
			if (key == "up") then
				py = py-move
				transition.to( player, {time=10, y=py} )
			elseif (key == "down") then
				py = py+move
				transition.to( player, {time=10, y=py} )
			elseif (key == "left") then
				px = px-move
				transition.to( player, {time=10, x=px} )
			elseif (key == "right") then
				px = px+move
				transition.to( player, {time=10, x=px} )
			elseif (key == "enter") then
				if(player.x > outside.x-75 and player.x < outside.x+75 and player.y > outside.y-75 and player.y+75) then
					composer.gotoScene("view8")	
				end
			end
		end

	    return false
	end
	
	player.collision = move
	maze.collision = move

	player:addEventListener( "collision" )
	maze:addEventListener( "collision" )

	Runtime:addEventListener( "key", move )
	Runtime:addEventListener( "collision", move )
	
	sceneGroup:insert( background )
	
	sceneGroup:insert( maze )
	sceneGroup:insert( maze2 )
	sceneGroup:insert( maze3 )
	sceneGroup:insert( maze_wall_left )
	sceneGroup:insert( maze_wall_right )
	sceneGroup:insert( maze_ceil )
	sceneGroup:insert( maze_floor )
	sceneGroup:insert( mazeImage )

	sceneGroup:insert( player )
	sceneGroup:insert( outside )
	
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
	elseif phase == "did" then
	end	
	physics.start()
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
	elseif phase == "did" then
	end
	physics.pause()
end

function scene:destroy( event )
	local sceneGroup = self.view
	physics.stop()
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene