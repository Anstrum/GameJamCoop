tiles = {}


function tiles.load()
end


function tiles.unload(asset)
	if not asset == nil then
		
	end
end


function tiles.get(asset, tileNumber)

	if asset == "forest" then
		if tileNumber > 0 and tileNumber <= #tiles.forest then
			return tiles.forest[tileNumber]
		end
	end

end