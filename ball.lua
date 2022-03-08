-- Ball class.
Ball = {}
Ball.__index = Ball

-- Constructor.
function Ball.new( m, x_pos, y_pos, r, color )
    local instance = setmetatable( {}, Ball )

    instance.m = m
    instance.x_pos = x_pos
    instance.y_pos = y_pos
    instance.r = r
    instance.color = color

    return instance
end

-- Draw the ball on the screen.
function Ball:draw()
    love.graphics.setColor( self.color[ 1 ], self.color[ 2 ], self.color[ 3 ], self.color[ 4 ] )
    love.graphics.circle( self.m, self.x_pos, self.y_pos, self.r )
end
