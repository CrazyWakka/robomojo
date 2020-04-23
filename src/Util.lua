
--[[
    Given an "atlas" (a texture with multiple sprites), as well as a
    width and a height for the tiles therein, split the texture into
    all of the quads by simply dividing it evenly.
]]
function GenerateQuads(atlas, tilewidth, tileheight)
    local sheetWidth = atlas:getWidth() / tilewidth
    local sheetHeight = atlas:getHeight() / tileheight

    local sheetCounter = 1
    local spritesheet = {}

    for y = 0, sheetHeight - 1 do
        for x = 0, sheetWidth - 1 do
            spritesheet[sheetCounter] =
                love.graphics.newQuad(x * tilewidth, y * tileheight, tilewidth,
                tileheight, atlas:getDimensions())
            sheetCounter = sheetCounter + 1
        end
    end

    return spritesheet
end

--[[
    Utility function for slicing tables, a la Python.

    https://stackoverflow.com/questions/24821045/does-lua-have-something-like-pythons-slice
]]
function table.slice(tbl, first, last, step)
    local sliced = {}
  
    for i = first or 1, last or #tbl, step or 1 do
      sliced[#sliced+1] = tbl[i]
    end
  
    return sliced
end

--[[
    This function is specifically made to piece out the paddles from the
    sprite sheet. For this, we have to piece out the paddles a little more
    manually, since they are all different sizes.
]]
function GenerateQuadsRobot(atlas)
    local x = 0
    local y = 0

    local counter = 1
    local quads = {}

    for i = 0, 5 do
      
        quads[counter] = love.graphics.newQuad(x, y, 56, 56,
            atlas:getDimensions())
        counter = counter + 1
     
        quads[counter] = love.graphics.newQuad(x + 56, y, 56, 56,
            atlas:getDimensions())
        counter = counter + 1
    
        quads[counter] = love.graphics.newQuad(x + 56, y, 56, 56,
            atlas:getDimensions())
        counter = counter + 1

        quads[counter] = love.graphics.newQuad(x + 56, y, 56, 56,
        atlas:getDimensions())
        counter = counter + 1
    
        quads[counter] = love.graphics.newQuad(x + 56, y, 56, 56,
            atlas:getDimensions())
        counter = counter + 1

        quads[counter] = love.graphics.newQuad(x + 56, y, 56, 56,
            atlas:getDimensions())
        counter = counter + 1
    

        -- prepare X and Y for the next set of paddles
        x = 0
        y = y + 56
    end

    return quads
end