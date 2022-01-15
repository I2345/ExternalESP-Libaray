local StarterPack = game:GetService("StarterPack")
local a = math.random(0,1000)
local activeESP = {
    ["players"] = {

    };

    ["objects"] = {

    };

    ["perm-"..tostring(a)] = {

    }
    
}

local Set = {
    ["ESP"] = {
        ["TeamCheck"] = false;
    }
}

local meta = {}

function meta.Disable(ESPType)

    if activeESP[ESPType] then
        for i,v in pairs(activeESP[ESPType]) do
            v:Destroy()
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
    newBox.Transparency = 0.5
    newBox.ZIndex = 4
    table.insert(activeESP[Type], newBox)
    print("Made ESP")
end

function meta.APIEnabled(ESPType, obj)
    print("Kasma#7351 was here")

    --[[
        Types:
        - players
        - objects
        - perm
    ]]

    if activeESP[string.lower(ESPType)] then

        makeNewBoxHandler(string.lower(ESPType), obj)

    elseif "perm" == string.lower(ESPType) then
    
        makeNewBoxHandler("perm-"..tostring(a), obj)

    end

end

return meta
