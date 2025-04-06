local BloxstrapRPC = {
    WasLastMessageReset = false;

    SynapseZ_IsPresent = typeof(syn) == "table" and typeof(syn.rpc) == "table" and typeof(syn.rpc.set) == "function" and typeof(syn.rpc.remove) == "function";
    StartTimestamp = os.time();

    OldData = nil;
}

type RichPresence = {
    details:     string?,
    state:       string?,
    timeStart:   number?,
    timeEnd:     number?,
    smallImage:  RichPresenceImage?,
    largeImage:  RichPresenceImage?
}

type RichPresenceImage = {
    assetId:    number?,
    hoverText:  string?,
    clear:      boolean?,
    reset:      boolean?
}

--// Setup Synapse Z \\--
function GetPlayerHeadshot()
    if not BloxstrapRPC.PlayerHeadshot then
        local success, headshot = pcall(shared.Players.GetUserThumbnailAsync(shared.Players, shared.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150))
        if not success then return nil end

        BloxstrapRPC.PlayerHeadshot = headshot
    end

    return BloxstrapRPC.PlayerHeadshot;
end

function GetImageDetails(imageType, image)
    if not (image or typeof(image) == "table" and image.clear ~= true) then return end

    if image.reset == true then
        if not BloxstrapRPC.OldData then return end
        return BloxstrapRPC.OldData[imageType .. "Key"], BloxstrapRPC.OldData[imageType .. "Text"]
    end

    if typeof(image.assetId) ~= "number" then return end
    return "https://assetdelivery.roblox.com/v1/asset/?id=" .. tostring(image.assetId), image.hoverText or "";
end

function ConvertBloxstrapToSynZ(data)
    local largeImageKey, largeImageText = GetImageDetails(data.largeImage)
    local smallImageKey, smallImageText = GetImageDetails(data.smallImage)

    smallImageKey = smallImageKey or GetPlayerHeadshot() or "";
    return {
        ApplicationId = "1300942082076053554",
        -- 1005469189907173486 = bloxstrap application id
        -- 1300942082076053554 = upio's app id

        State = data.state or "",
        Details = data.details or "",

        StartTimestamp = data.timeStart or BloxstrapRPC.StartTimestamp,
        EndTimestamp = data.timeEnd or 0,

        LargeImageKey = largeImageKey or "",
        LargeImageText = largeImageText or "",

        SmallImageKey = smallImageKey,
        SmallImageText = smallImageKey == "" and shared.LocalPlayer.Name or (smallImageText or "");
    }
end

function BloxstrapRPC.SendMessage(command: string, data: any)
    if BloxstrapRPC.SynapseZ_IsPresent then
        if data.details == "<reset>" then
            syn.rpc.remove()
            BloxstrapRPC.OldData = nil;
            return
        end

        local newData = ConvertBloxstrapToSynZ(data);
        syn.rpc.set(newData);
        BloxstrapRPC.OldData = newData;
        return
    end

    local json = shared.HttpService:JSONEncode({
        command = command,
        data = data
    })

    print("[BloxstrapRPC] " .. json)
    BloxstrapRPC.OldData = data;
end

function BloxstrapRPC.SetRichPresence(data: RichPresence)
    if data.timeStart ~= nil then
        data.timeStart = math.round(data.timeStart)
    end

    if data.timeEnd ~= nil then
        data.timeEnd = math.round(data.timeEnd)
    end

    BloxstrapRPC.SendMessage("SetRichPresence", data)
end

return BloxstrapRPC
