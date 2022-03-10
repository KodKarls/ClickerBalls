-- Scoring class.
Scoring = {}
Scoring.__index = Scoring

-- Constructor.
function Scoring.new( score, color, font_size )
    local instance = setmetatable( {}, Scoring )

    instance.score = score
    instance.color = color
    instance.font = love.graphics.newFont( font_size )

    return instance
end

-- Draw the score.
function Scoring:draw()
    love.graphics.setColor( self.color[ 1 ], self.color[ 2 ], self.color[ 3 ], self.color[ 4 ] )
    love.graphics.setFont( self.font )
    love.graphics.print( self.score, 10, 10 )
end

-- Get the score.
function Scoring:get_score()
    return self.score
end

-- Set the score.
function Scoring:set_score( score )
    self.score = score
end
