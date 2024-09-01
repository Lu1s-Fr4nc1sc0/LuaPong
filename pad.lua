Pad = {}

function Pad.new(x,y,w,h,name,type) 
  
  local self = self or {}

  self.x = x
  self.y = y
  self.w = w
  self.h = h
  self.movement = {x = 0, y = 0}
  
  -- self physics
  self.body = love.physics.newBody(World,x,y,type)
	self.shape = love.physics.newRectangleShape(self.w,self.h)
	self.fixture = love.physics.newFixture(self.body,self.shape,nil)
  self.fixture:setUserData(name)

  function self.update(dt)
    self.body:setLinearVelocity(self.movement.x,self.movement.y)
  end

  function self.draw()
    love.graphics.rectangle('fill',self.body:getX() - self.w/2,
		self.body:getY() - self.h/2,self.w,self.h)
  end

  return self
end
