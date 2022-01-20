-- Copy the original function
local oldCalcBirth = Community.CalcBirth

function GBCP_CountChildren()
    local allColonist = UIColony:GetCityLabels("Colonist")
    local children = 0

    for _, allColonist in ipairs(allColonist) do
        if allColonist.age_trait == "Child" then
            children = children + 1
        end
    end

    return children
end

-- Override the original function
function Community:CalcBirth(...)

    -- Only proceed if mod is enabled else skip all these to original function
    if CurrentModOptions.GBCP_Toggle == true then

        -- If exceed set limit, end function
        if GBCP_CountChildren() >= CurrentModOptions.GBCP_MaxChildren then
            return
        end
    end

    -- Call the original function
    -- Original function still include its own local dome policy check
    oldCalcBirth(self, ...)
end