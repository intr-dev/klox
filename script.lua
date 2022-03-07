local CallBacks = {}

CallBacks.fail = function(reason)
    game.Players.LocalPlayer:Kick(reason)
end

shared.__urlcache = shared.__urlcache or {}
CallBacks.urlLoad = function(url)
    local success, result

    if shared.__urlcache[url] then
        success, result = true, shared.__urlcache[url]
    else
        success, result = pcall(game.HttpGet, game, url)
    end

    if (not success) then
        return CallBacks.fail(string.format('Failed to GET url %q for reason: %q', url, tostring(result)))
    end

    local fn, err = loadstring(result)
    if (type(fn) ~= 'function') then
        return CallBacks.fail(string.format('Failed to loadstring url %q for reason: %q', url, tostring(err)))
    end

    local results = { pcall(fn) }
    if (not results[1]) then
        return CallBacks.fail(string.format('Failed to initialize url %q for reason: %q', url, tostring(results[2])))
    end

    shared.__urlcache[url] = result
    return unpack(results, 2)
end

local HttpService = game:GetService("HttpService")
local GameListJSON = HttpService:JSONDecode(CallBacks.urlLoad("https://raw.githubusercontent.com/intr-dev/klox/main/gamelist.json"))

CallBacks.GetPlaceID = function()
    return game.PlaceId
end

CallBacks.Load = function()
    print([[

        88         88
        88         88
        88         88
        88   ,d8   88   ,adPPYba,  8b,     ,d8
        88 ,a8"    88  a8"     "8a  `Y8, ,8P'
        8888[      88  8b       d8    )888( 
        88`"Yba,   88  "8a,   ,a8"  ,d8" "8b,
        88   `Y8a  88   `"YbbdP"'  8P'     `Y8

        Welcome to klox Exploit!

    ]])
    wait(1)
    print("Looking for gamelist...")
    wait(3)
    local PlaceID = CallBacks.GetPlaceID()
    if PlaceID == GameListJSON.game1.PlaceID and true == GameListJSON.game1.Enabled then
        print("Game: "..GameListJSON.game1.Name)
        CallBacks.urlLoad(GameListJSON.game1.ScriptURL)
    elseif true == GameListJSON.universal.Enabled then
        print(GameListJSON.universal.Name)
        CallBacks.urlLoad(GameListJSON.universal.ScriptURL)
    end
end

CallBacks.Load()