
require('ball')
---------------------------------------------------------

function love.load()
  
	ScreenW = love.graphics.getWidth()
 	ScreenH = love.graphics.getHeight()

	World = love.physics.newWorld(0,0,true)
  	
  	Ball = Ball.Init(ScreenW/2,ScreenH/2)

end

function love.update(dt)

	World:update(dt)

	Ball.update(dt)
end

function love.draw()
	love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 10)
	Ball.draw()
end

function love.keypressed(k)

	if k == 'escape' then love.event.quit() end
	if k == 'r' then love.event.quit('restart') end
  
end

