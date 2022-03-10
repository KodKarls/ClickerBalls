-- Add modules.
require( 'ball' )
require( 'timer' )
require( 'scoring' )
require( 'notification' )
require( 'music' )

-- Define local module variables.
local ball_1 = nil
local ball_2 = nil
local ball_3 = nil

local balls = {}

local timer = nil

local scoring = nil

local game_active = false

local notification = nil

local music = nil

-- Define local module functions.

-- Create the new balls.
local function create_balls()
    -- Create instances of balls.
    ball_1 = Ball.new( 'fill', 30, {1, 0, 0, 1}, Timer.new( 1, {1, 1, 1, 1}, 20 ), 10 )
    ball_2 = Ball.new( 'fill', 30, { 0, 1, 0, 1 }, Timer.new( 3, {1, 1, 1, 1}, 20 ), 5 )
    ball_3 = Ball.new( 'fill', 30, { 0, 0, 1, 1 }, Timer.new( 90, {1, 1, 1, 1}, 20 ), 1 )  -- This ball will never disappear ( only if you click )

    -- Add all balls to the array.
    balls = { ball_1, ball_2, ball_3 }
end

-- Get distance between click position and the ball position.
local function get_distance( x1, y1, x2, y2 )
    return math.sqrt( ( x2 - x1 ) ^ 2 + ( y2 - y1 ) ^ 2 )
end

-- Reset the game content.
local function rest_game()
    game_active = true
    create_balls()
    timer:set_seconds( 60 )
    scoring:set_score( 0 )
    scoring:load_best_score()
    notification:set_text( "" )
    music:play()
end

-- Finish the game.
local function end_game()
    game_active = false
    balls = {}
    scoring:save_best_score( scoring:get_score() )
    notification:set_text( "End of time!\nPress spacebar to start ..." )
    music:stop()
end

function love.load()
    -- Create timer instance.
    timer = Timer.new( 60, {1, 1, 1, 1}, 20 )

    -- Create scoring instance.
    scoring = Scoring.new( 0, {1, 1, 1, 1}, 20 )
    scoring:load_best_score()

    -- Create notification instance.
    notification = Notification.new( "Press spacebar to start ...", { 1, 1, 1, 1 }, 20 )

    -- Create music instance.
    music = Music.new( "penguinmusic-modern-chillout" )
end

function love.update(dt)
    ::start::                       -- If countdown reach the end break all instructions.
    if game_active then
        timer:set_seconds( timer:get_seconds() - dt )
        if timer:get_seconds() < 0 then
            end_game()
            goto start
        end

        ::continue::                -- If any ball is removed then iterate through all balls again.
        for i = 1, #balls, 1 do
            balls[ i ].timer:set_seconds( balls[ i ].timer:get_seconds() - dt )
            if balls[ i ].timer:get_seconds() < 0 then
                balls[ i ].timer:set_seconds( 0 )
                table.remove( balls, i )
                goto continue
            end
        end

        if #balls == 0 then
            create_balls()
        end
    end
end

function love.draw()
    -- Draw balls on the screen.
    for i = 1, #balls, 1 do
        balls[ i ]:draw()
    end

    -- Draw the timer on the screen.
    timer:draw()

    -- Draw the score on the screen.
    scoring:draw_score()

    -- Draw the best score on the screen.
    scoring:draw_best_score()

    -- Draw notification on the screen.
    notification:draw()
end

-- React for mouse pressed.
function love.mousepressed( x, y, button, istouch, presses )
    if button == 1 then
        ::continue::                -- If any ball is removed then iterate through all balls again.
        for i = 1, #balls, 1 do
            local position = balls[ i ]:get_position()
            local mouse_to_target = get_distance( x, y, position[ 1 ], position[ 2 ] )
            if mouse_to_target < balls[ i ]:get_radius() then
                scoring:set_score( scoring:get_score() + balls[ i ]:get_points() )
                table.remove( balls, i )
                goto continue
            end
        end
    end
end

-- React for key pressed.
function love.keypressed( key )
    if key == "space" then
       rest_game()
    end
 end
