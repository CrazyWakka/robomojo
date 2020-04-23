PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.robot = Robot()
end

function PlayState:update(dt)

    self.robot:update(dt)
end

function PlayState:render()
    self.robot:render()
end
