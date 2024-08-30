Ball = {}

function Ball.Init(x,y)

	local self = self or table
	-- self vars
	self.x = x
	self.y = y
	self.w = 16
	self.h = 16
	-- self physics 
	self.body = love.physics.newBody(World,x,y,'dynamic')
	self.shape = love.physics.newRectangleShape(self.w,self.h)
	self.fixture = love.physics.newFixture(self.body,self.shape,1.0)
	-- self movement
	self.movement = {x = 0, y = 0}
  
	function self.update(dt)
  		self.body:setLinearVelocity(self.movement.x,self.movement.y)
	end

	function self.draw()
		love.graphics.rectangle('fill',self.body:getX(),
		self.body:getY(),self.w,self.h)
	end

	function self.keypressed(k)
		if (k == "space" and self.movement.y == 0 )then self.movement.y = 120 end
			
	end

  return self
 
end
