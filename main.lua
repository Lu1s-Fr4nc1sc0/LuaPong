function love.load()

  ScreenW = love.graphics.getWidth()
  ScreenH = love.graphics.getHeight()

end

function love.update(dt)
  
end

function love.draw()

end

function love.keypressed(k)

  if k == 'escape' then love.event.quit() end
  if k == 'r' then love.event.quit('restart') end
  
end

