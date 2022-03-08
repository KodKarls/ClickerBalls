-- Add modules.
require('ball')

-- Define local module variables.
local ball_1 = nil
local ball_2 = nil
local ball_3 = nil
local ball_4 = nil

function love.load()
    -- Create instances of balls.
    ball_1 = Ball.new( 'fill', 50, 50, 30, {1, 0, 0, 1} )
    ball_2 = Ball.new( 'fill', 100, 100, 30, { 0, 1, 0, 1 } )
    ball_3 = Ball.new( 'fill', 150, 150, 30, { 0, 0, 1, 1 } )
    ball_4 = Ball.new( 'fill', 200, 200, 30, { 0, 0.65, 0.75, 1 } )
end

function love.update(dt)

end

function love.draw()
    -- Draw balls on the screen.
    ball_1:draw()
    ball_2:draw()
    ball_3:draw()
    ball_4:draw()
end
