-- Ball class.
Ball = {}
Ball.__index = Ball

-- Constructor.
function Ball.new( mod, radius, color, timer, points )
    local instance = setmetatable( {}, Ball )

    instance.mod = mod
    instance.x_pos = math.random( 0, love.graphics.getWidth() )
    instance.y_pos = math.random( 0, love.graphics.getHeight() )
    instance.radius = radius
    instance.color = color
    instance.timer = timer
    instance.points = points

    return instance
end

-- Draw the ball.
function Ball:draw()
    love.graphics.setColor( self.color[ 1 ], self.color[ 2 ], self.color[ 3 ], self.color[ 4 ] )
    love.graphics.circle( self.mod, self.x_pos, self.y_pos, self.radius )
end

-- Get the ball position.
function Ball:get_position()
    return { self.x_pos, self.y_pos }
end

-- Get the ball radius.
function Ball:get_radius()
    return self.radius
end

-- Get the ball points.
function Ball:get_points()
    return self.points
end
