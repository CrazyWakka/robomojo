StartState = Class{__includes = BaseState}

local highlighted = 1

function StartState:update(dt)

end

function StartState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf("Robo Mojo", 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')
end
