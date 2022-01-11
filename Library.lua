local activeESP = {
    ["players"] = {

    };

    ["objects"] = {

    };

    
}

local Set = {
    ["ESP"] = {
        ["TeamCheck"] = false;
    }
}

local meta = {}

function meta.Disable(ESPType)

    for i,v in pairs(activeESP) do
        if i == string.lower(ESPType) then
            for a,e in pairs(v) do
                e:Destroy()
            end
            v = {}
        end
    end
    print("Disabled")
    return

end

function makeNewBoxHandler(Type, obj)
    local newBox = Instance.new("BoxHandleAdornment", obj)
    newBox.Adornee = obj
    newBox.AlwaysOnTop = true
    newBox.Size = obj.Size
    newBox.Visible = true
    newBox.Transparency = 0
    newBox.ZIndex = 100000
    table.insert(activeESP[Type], newBox)
    print("Made ESP")
end

function meta.APIEnabled(ESPType, obj)
    print("Kasma was here")

    --[[
        Types:
        - players
        - objects
    ]]

    if activeESP[string.lower(ESPType)] then

        makeNewBoxHandler(string.lower(ESPType), obj)

    end

end

return meta
