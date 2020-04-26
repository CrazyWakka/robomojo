
LevelMaker = Class{}

function LevelMaker.generate(width, height)
    local tiles = {}
    local entities = {}
    local objects = {}

    local tileID = TILE_ID_GROUND
    
    -- whether we should draw our tiles with toppers
    local topper = true
    local tileset = math.random(20)
    local topperset = math.random(20)

    -- insert blank tables into tiles for later access
    for x = 1, height do
        table.insert(tiles, {})
    end

    -- column by column generation instead of row; sometimes better for platformers
    for x = 1, width do
        local tileID = TILE_ID_EMPTY
        
        -- lay out the empty space
        for y = 1, 6 do
            table.insert(tiles[y],
                Tile(x, y, tileID, nil, tileset, topperset))
        end

        -- chance to just be emptiness
        if math.random(7) == 1 then
            for y = 7, height do
                table.insert(tiles[y],
                    Tile(x, y, tileID, nil, tileset, topperset))
            end
        else
            tileID = TILE_ID_GROUND

            -- height at which we would spawn a potential jump block
            local blockHeight = 4

            for y = 7, height do
                table.insert(tiles[y],
                    Tile(x, y, tileID, y == 7 and topper or nil, tileset, topperset))
            end

            -- -- chance to generate a pillar
            -- if math.random(8) == 1 then
            --     blockHeight = 2
                
            -- -- pillar tiles
            -- tiles[5][x] = Tile(x, 5, tileID, topper, tileset, topperset)
            -- tiles[6][x] = Tile(x, 6, tileID, nil, tileset, topperset)
            -- tiles[7][x].topper = nil
            
            -- -- chance to generate bushes
            -- elseif math.random(8) == 1 then
            --     table.insert(objects,
            --         GameObject {
            --             texture = 'bushes',
            --             x = (x - 1) * TILE_SIZE,
            --             y = (6 - 1) * TILE_SIZE,
            --             width = 16,
            --             height = 16,
            --             frame = BUSH_IDS[math.random(#BUSH_IDS)] + (math.random(4) - 1) * 7,
            --             collidable = false
            --         }
            --     )
            -- end

        end
    end

    local map = TileMap(width, height)
    map.tiles = tiles
    
    return GameLevel(entities, objects, map)
end