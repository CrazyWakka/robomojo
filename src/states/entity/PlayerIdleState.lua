
PlayerIdleState = Class{__includes = BaseState}

function PlayerIdleState:init(player)
    self.player = player

    self.animation = Animation {
        frames = {1, 2, 3},
        interval = 0.2
    }

    self.player.currentAnimation = self.animation
end

function PlayerIdleState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') then
        self.player:changeState('walking')
    end

    if love.keyboard.isDown('down') then
        self.player:changeState('crawling')
    end

    if love.keyboard.wasPressed('space') then
        self.player:changeState('jump')
    end

    -- check if we've collided with any entities and die if so
    for k, entity in pairs(self.player.level.entities) do
        if entity:collides(self.player) then
            gSounds['death']:play()
            gStateMachine:change('start')
        end
    end
end