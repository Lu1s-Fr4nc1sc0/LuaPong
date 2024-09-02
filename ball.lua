Ball = {}
function Ball.new(x,y,name)
	local self = self or {}
	-- self vars
	self.x = x
	self.y = y
	self.w = 16
	self.h = 16
	-- self physics 
	self.body = love.physics.newBody(World,x,y,'dynamic')
	self.body:isBullet(true)
	self.shape = love.physics.newRectangleShape(self.w,self.h)
	self.fixture = love.physics.newFixture(self.body,self.shape,nil)
	self.fixture:setUserData(name)
	-- self movement
	self.movement = {x = 0, y = 0}
	--self functions
	function self.update(dt)
  		self.body:setLinearVelocity(self.movement.x,self.movement.y)
		if self.movement.y >= 860 then self.movement.y = 860 end
	end
	function self.draw()
		love.graphics.rectangle('fill',self.body:getX() - self.w/2,self.body:getY() - self.h/2,self.w,self.h)
	end
	function self.keypressed(k)
		if (k == "space" and self.movement.y == 0 )then self.movement.y = 120 end	
	end
  return self
end