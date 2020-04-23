Robot = Class{}

--[[
    Our robot will be our main hero character
]]
function Robot:init()
    -- x is placed in the middle
    self.x = VIRTUAL_WIDTH / 2 - 32

    -- y is placed a little above the bottom edge of the screen
    self.y = VIRTUAL_HEIGHT - 32

    -- start us off with no velocity
    self.dx = 0

    -- starting dimensions
    self.width = 64
    self.height = 16
end

function Robot:update(dt) 

end

function Robot:render()
    love.graphics.draw(gTextures['robot'])
end
