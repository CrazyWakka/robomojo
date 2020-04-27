
PlayerCrouchingState = Class{__includes = BaseState}

function PlayerCrouchingState:init(player)
    self.player = player
    self.animation = Animation {
        frames = {19},
        interval = 1
    }
    self.player.currentAnimation = self.animation
end

function PlayerCrouchingState:update(dt)
    self.player.currentAnimation:update(dt)

    if not love.keyboard.isDown('down') and not love.keyboard.isDown('left') and not love.keyboard.isDown('right') then
        self.player:changeState('idle')
    elseif love.keyboard.isDown('down') and love.keyboard.isDown('left') or love.keyboard.isDown('right') then
        self.player:changeState('crawling')   

    else
        local tileBottomLeft = self.player.map:pointToTile(self.player.x + 1, self.player.y + self.player.height)
        local tileBottomRight = self.player.map:pointToTile(self.player.x + self.player.width - 1, self.player.y + self.player.height)

        -- temporarily shift player down a pixel to test for game objects beneath
        self.player.y = self.player.y + 1

        local collidedObjects = self.player:checkObjectCollisions()

        self.player.y = self.player.y - 1

        if #collidedObjects == 0 and (tileBottomLeft and tileBottomRight) and (not tileBottomLeft:collidable() and not tileBottomRight:collidable()) then
            self.player.dy = 0
            self.player:changeState('falling')
        end
    end

    -- check if we've collided with any entities and die if so
    for k, entity in pairs(self.player.level.entities) do
        if entity:collides(self.player) then
            gSounds['death']:play()
            gStateMachine:change('start')
        end
    end

    if love.keyboard.wasPressed('space') then
        self.player:changeState('jump')
    end
end
