-- Timer class.
Timer = {}
Timer.__index = Timer

-- Constructor.
function Timer.new( s, color, font_size )
    local instance = setmetatable( {}, Timer )

    instance.seconds = s
    instance.color = color
    instance.font = love.graphics.newFont( font_size )

    return instance
end

-- Draw the timer on the screen.
function Timer:draw()
    love.graphics.setColor( self.color[ 1 ], self.color[ 2 ], self.color[ 3 ], self.color[ 4 ] )
    love.graphics.setFont( self.font )
    love.graphics.print( string.format( "%02d", self.seconds ), love.graphics.getWidth() * 0.5, 10 )
end

-- Get seconds from the timer.
function Timer:get_seconds()
    return self.seconds
end

-- Set seconds for the timer.
function Timer:set_seconds( s )
    self.seconds = s
end
