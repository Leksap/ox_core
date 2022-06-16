AddEventHandler('playerEnteredScope', function(data)
	local player = player(tonumber(data['for']))
	local target = tonumber(data.player)
	local inScope = player.get('inScope')
	inScope[target] = true
end)

AddEventHandler('playerLeftScope', function(data)
	local player = player(tonumber(data['for']))
	local target = tonumber(data.player)
	local inScope = player.get('inScope')
	inScope[target] = nil
end)

AddEventHandler('playerConnecting', function(_, _, deferrals)
	deferrals.defer()
	local identifier = Ox.GetIdentifiers(source)?[server.PRIMARY_IDENTIFIER]

	if not identifier then
		return deferrals.done(('Unable to register an account, unable to determine "%s" identifier.'):format(server.PRIMARY_IDENTIFIER))
	end

	deferrals.done()
end)
