-- Add modules.
require('ball')
require('timer')

-- Define local module variables.
local ball_1 = nil
local ball_2 = nil
local ball_3 = nil

local balls = nil

local timer = nil

-- Define local module functions.

-- Create the new balls.
local function create_balls()
    -- Create instances of balls.
    ball_1 = Ball.new( 'fill', 30, {1, 0, 0, 1}, Timer.new( 2, {1, 1, 1, 1}, 20 ) )
    ball_2 = Ball.new( 'fill', 30, { 0, 1, 0, 1 }, Timer.new( 4, {1, 1, 1, 1}, 20 ) )
    ball_3 = Ball.new( 'fill', 30, { 0, 0, 1, 1 }, Timer.new( 90, {1, 1, 1, 1}, 20 ) )       -- This ball will never disappear ( only if you click )

    -- Add all balls to the array.
    balls = { ball_1, ball_2, ball_3 }
end

function love.load()
    create_balls()

    -- Create instance of timer.
    timer = Timer.new( 60, {1, 1, 1, 1}, 20 )
end

function love.update(dt)
    timer:set_seconds( timer:get_seconds() - dt )
    if timer:get_seconds() < 0 then
        timer:set_seconds( 0 )                      -- End countdown.
    end

    ::continue::
    for i = 1, #balls, 1 do
        balls[ i ].timer:set_seconds( balls[ i ].timer:get_seconds() - dt )
        if balls[ i ].timer:get_seconds() < 0 then
            balls[ i ].timer:set_seconds( 0 )
            table.remove( balls, i )                -- Erase the ball after time reach 0.
            goto continue                           -- Iterate through all balls again.
        end
    end

    if #balls == 0 then
        -- Create the new balls.
        create_balls()
    end
end

function love.draw()
    -- Draw balls on the screen.
    for i = 1, #balls, 1 do
        balls[ i ]:draw()
    end

    -- Draw the timer on the screen.
    timer:draw()
end
