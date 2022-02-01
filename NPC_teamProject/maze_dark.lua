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

	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
	background:setFillColor( 0 )

	local player = display.newImageRect("ham.png", 100, 85)
	player.x = 20 + player.width/2
	player.y = display.contentHeight - player.height/2 - 10
	player.name = "player"

	local maze_name = "maze_1.png"
	local maze_outline = graphics.newOutline(5, maze_name)

	local maze = display.newImageRect(maze_name, 1623, 1174)
	maze.x, maze.y = background.x, background.y
	player.x = player.x + (display.contentWidth-maze.width)/2
	maze.name = "maze"

	local maze_name2 = "maze_2.png"
	local maze_outline2 = graphics.newOutline(5, maze_name2)

	local maze2 = display.newImageRect(maze_name2, maze.width, maze.height)
	maze2.x, maze2.y = background.x, background.y
	maze2.name = "maze2"

	local maze_wall_left = display.newRect((display.contentWidth-maze.width)/4, background.y, (display.contentWidth-maze.width)/2, background.height)
	maze_wall_left:setFillColor( 0 )
	maze_wall_left.name = "left"
	local maze_wall_right = display.newRect(maze.width+maze_wall_left.width*1.5, background.y, maze_wall_left.width, maze_wall_left.height)
	maze_wall_right:setFillColor( 0 )
	maze_wall_right.name = "right"

	local maze_ceil = display.newRect(background.x, -5, background.width, 30)
	maze_ceil:setFillColor(0)
	maze_ceil.name = "ceil"
	local maze_floor = display.newRect(background.x, background.height+5, background.width, 30)
	maze_floor:setFillColor(0)
	maze_floor.name = "floor"

	local outside = display.newImageRect("ring.png", 150, 150)
	outside.x, outside.y = maze_wall_right.x-125, 50

	local temp = display.newRect(0,0,0,0)
	temp.x, temp.y = player.x, player.y
	player.x, player.y = outside.x, outside.y
	outside.x, outside.y = temp.x, temp.y

	physics.addBody(player, "dynamic", {bounce=0.5, friction=0.1})
	physics.addBody(maze, "static", {outline=maze_outline, bounce=0.5, friction=0.1})
	physics.addBody(maze2, "static", {outline=maze_outline2, bounce=0.5, friction=0.1})
	physics.addBody(maze_wall_left, "static", {bounce=0.5, friction=0.1})
	physics.addBody(maze_wall_right, "static", {bounce=0.5, friction=0.1})
	physics.addBody(maze_ceil, "static", {bounce=0.5, friction=0.1})
	physics.addBody(maze_floor, "static", {bounce=0.5, friction=0.1})

	local function move( event )
		local key = event.keyName
		local phase = event.phase
		local move = 50

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
					composer.gotoScene("view2")		
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
	sceneGroup:insert( maze_wall_left )
	sceneGroup:insert( maze_wall_right )
	sceneGroup:insert( maze_ceil )
	sceneGroup:insert( maze_floor )

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