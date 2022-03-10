-- Scoring class.
Scoring = {}
Scoring.__index = Scoring

-- Constructor.
function Scoring.new( score, color, font_size )
    local instance = setmetatable( {}, Scoring )

    instance.score = score
    instance.color = color
    instance.font = love.graphics.newFont( font_size )
    instance.best_score = 0

    return instance
end

-- Load the best score from file.
function Scoring:load_best_score()
    local file = io.open( "data/best_score.txt", "r" )
    local data = file:read()
    file:close()
    self.best_score = data
end

-- Save the best score into the file.
function Scoring:save_best_score( best_score )
    self.best_score = tonumber( self.best_score )
    if self.best_score < best_score then
        local file = io.open( "data/best_score.txt", "w" )
        io.output( file )
        io.write( best_score )
        file:close()
    end
end

-- Draw the score.
function Scoring:draw_score()
    love.graphics.setColor( self.color[ 1 ], self.color[ 2 ], self.color[ 3 ], self.color[ 4 ] )
    love.graphics.setFont( self.font )
    love.graphics.print( self.score, 10, 10 )
end

-- Draw the best score.
function Scoring:draw_best_score()
    love.graphics.setColor( self.color[ 1 ], self.color[ 2 ], self.color[ 3 ], self.color[ 4 ] )
    love.graphics.setFont( self.font )
    love.graphics.print( self.best_score, love.graphics.getWidth() - 50, 10 )
end

-- Get the score.
function Scoring:get_score()
    return self.score
end

-- Set the score.
function Scoring:set_score( score )
    self.score = score
end
