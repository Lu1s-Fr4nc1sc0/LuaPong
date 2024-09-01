require("ball")
require("pad")
PixelFont = love.graphics.newFont('pixelFont.ttf',64)
---------------------------------------------------------

function love.load()

	-- screen definitions 
	ScreenW = love.graphics.getWidth()
 	ScreenH = love.graphics.getHeight()

	-- game physic world
	World = love.physics.newWorld(0,0,true)
	World:setCallbacks(onEnter,onExit)

	-- objects
  	Ball = Ball.new(ScreenW/2,ScreenH/2,'ball')
	topPad = Pad.new(0,0,ScreenH,1,'topPad','static')
	leftPad = Pad.new(0,2,1,ScreenH * 2,'leftPad','static')
	rightPad = Pad.new(ScreenW,2,1,ScreenH * 2,'rightPad','static')
  	Player = Pad.new(ScreenW/2,500,128,16,'player','kinematic')
	--score
	Score = 0
end

function love.update(dt)

	World:update(dt)
	Ball.update(dt)
	Player.update(dt)

	---player movement
	if love.keyboard.isDown('a','left') then Player.movement.x = -128
	elseif love.keyboard.isDown('d','right') then Player.movement.x = 128
	else Player.movement.x = 0
	end
	---Game Over
	if Ball.movement.y >= ScreenH then
		love.event.quit('restart')
	end

end

function love.draw()
	love.graphics.setFont(PixelFont)
	love.graphics.print(tostring(Score))
	Ball.draw()
  	Player.draw()

end

function love.keypressed(k)

	if k == 'escape' then love.event.quit() end
	if k == 'r' then love.event.quit('restart') end
  	Ball.keypressed(k)

end

function onEnter(a,b,collision)
	local aName = a:getUserData()
	local bName = b:getUserData()
	if (aName == 'player' or bName == 'player') or (aName == 'topPad' or bName == 'topPad') then
		Ball.movement.y = Ball.movement.y * -1.05
		if (aName == 'topPad' or bName == 'topPad') then
			Score = Score + 1
		end
		if Player.movement.x < 0 then Ball.movement.x = Player.movement.x end
		if Player.movement.x > 0 then Ball.movement.x = Player.movement.x end
		if Player.movement.x == 0 then  Ball.movement.x = love.math.random(-128,128) end
	end
	if (aName == 'rightPad' or bName == 'rightPad') or (aName == 'leftPad' or bName == 'leftPad') then
		Ball.movement.x = Ball.movement.x * -1 
	end
end