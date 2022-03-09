-- Add modules.
require('ball')
require('timer')

-- Define local module variables.
local ball_1 = nil
local ball_2 = nil
local ball_3 = nil
local ball_4 = nil

local timer = nil

function love.load()
    -- Create instances of balls.
    ball_1 = Ball.new( 'fill', 50, 50, 30, {1, 0, 0, 1} )
    ball_2 = Ball.new( 'fill', 100, 100, 30, { 0, 1, 0, 1 } )
    ball_3 = Ball.new( 'fill', 150, 150, 30, { 0, 0, 1, 1 } )
    ball_4 = Ball.new( 'fill', 200, 200, 30, { 0, 0.65, 0.75, 1 } )

    -- Create instance of timer.
    timer = Timer.new( 10, {1, 1, 1, 1}, 20 )
end

function love.update(dt)
    timer:set_seconds( timer:get_seconds() - dt )
    if timer:get_seconds() < 0 then
        timer:set_seconds( 0 )                      -- End countdown.
    end
end

function love.draw()
    -- Draw balls on the screen.
    ball_1:draw()
    ball_2:draw()
    ball_3:draw()
    ball_4:draw()

    -- Draw the timer on the screen.
    timer:draw()
end
