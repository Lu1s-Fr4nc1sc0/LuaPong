Ball = {}

function Ball.new(x,y)

	local self = self or {}
	-- self vars
	self.x = x
	self.y = y
	self.w = 16
	self.h = 16
	-- self physics 
	self.body = love.physics.newBody(World,x,y,'dynamic')
	self.shape = love.physics.newRectangleShape(self.w,self.h)
	self.fixture = love.physics.newFixture(self.body,self.shape,nil)
	-- self movement
	self.movement = {x = 0, y = 0}
  
	function self.update(dt)
  		self.body:setLinearVelocity(self.movement.x,self.movement.y)
	end

	-----------collision
	function self.onEnter(a,b,collision)
		self.movement.y = self.movement.y * -1.05
		if Player.body:getLinearVelocity() < 0 then self.movement.x = -64 end
		if Player.body:getLinearVelocity() > 0 then self.movement.x = 64 end
	end

	function self.onExit(a,b,collision)
		
	end

	function self.draw()
		love.graphics.rectangle('fill',self.body:getX() - self.w/2,
		self.body:getY() - self.h/2,self.w,self.h)
	end

	function self.keypressed(k)
		if (k == "space" and self.movement.y == 0 )then self.movement.y = 120 end
			
	end

  return self
 
end
