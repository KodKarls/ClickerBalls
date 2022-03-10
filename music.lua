-- Music class.
Music = {}
Music.__index = Music

-- Constructor.
function Music.new( file_name )
    local instance = setmetatable( {}, Music )

    instance.file_path = "res/music/" .. file_name .. ".mp3"
    instance.type = "stream"
    instance.source = love.audio.newSource( instance.file_path, instance.type )

    return instance
end

-- Play the music.
function Music:play()
    love.audio.play( self.source )
end

-- Stop the music.
function Music:stop()
    love.audio.stop( self.source )
end
