-- Notification class.
Notification = {}
Notification.__index = Notification

-- Constructor.
function Notification.new( text, color, font_size )
    local instance = setmetatable( {}, Notification )

    instance.text = text
    instance.color = color
    instance.font = love.graphics.newFont( font_size )

    return instance
end

-- Draw the notification.
function Notification:draw()
    love.graphics.setColor( self.color[ 1 ], self.color[ 2 ], self.color[ 3 ], self.color[ 4 ] )
    love.graphics.setFont( self.font )
    love.graphics.print( self.text, love.graphics.getWidth() * 0.3, love.graphics.getHeight() * 0.5 )
end

-- Set new notification text.
function Notification:set_text( text )
    self.text = text
end
