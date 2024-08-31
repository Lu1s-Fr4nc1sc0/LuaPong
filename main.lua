
require("ball")
require("pad")
---------------------------------------------------------

function love.load()

	-- screen definitions 
	ScreenW = love.graphics.getWidth()
 	ScreenH = love.graphics.getHeight()
	
	-- game physic world
	World = love.physics.newWorld(0,0,true)
	World:setCallbacks(onEnter,onExit)

	-- objects
  	Ball = Ball.new(ScreenW/2,ScreenH/2)
	topPad = Pad.new(0,0,ScreenH,1) 
  	Player = Pad.new(ScreenW/2,500,128,16) 

end

function love.update(dt)
	
	World:update(dt)
	Ball.update(dt)
	Player.update(dt)
	---player movement
	if love.keyboard.isDown('a','left') then Player.movement.x = -64 
	elseif love.keyboard.isDown('d','right') then Player.movement.x = 64
	else Player.movement.x = 0
	end
	
end

function love.draw()
	love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 10)
	Ball.draw()
  	Player.draw()
end

function love.keypressed(k)

	if k == 'escape' then love.event.quit() end
	if k == 'r' then love.event.quit('restart') end
  	Ball.keypressed(k)

end

-------collisions
function onEnter(a,b,collision)
	print("collided")
	Ball.onEnter(a,b,collision)
end

function onExit(a,b,collision)
	print("get out")
	Ball.onExit(a,b,collision)
end