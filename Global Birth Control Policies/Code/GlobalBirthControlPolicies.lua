-- Get Mod Options
local BirthControlToggle = CurrentModOptions.GBCP_Toggle
local MaximumChildren = CurrentModOptions.GBCP_MaxChildren

-- Update user settings
function OnMsg.ApplyModOptions(id)
    if id ~= CurrentModId then
        return
    end

    BirthControlToggle = CurrentModOptions.GBCP_Toggle
    MaximumChildren = CurrentModOptions.GBCP_MaxChildren
end

-- Copy the original function
local oldCalcBirth = Community.CalcBirth

-- Override the original function
function Community:CalcBirth(...)

    -- Only proceed if mod is enabled else skip all these to original function
    if BirthControlToggle == true then
        -- Get overview data, in this case we need the children population
        local resource_overview = GetCityResourceOverview(UICity)
        local data = resource_overview.data

        -- If exceed set limit, end function
        if data.children >= MaximumChildren then
            return
        end
    end

    -- Call the original function
    -- Original function still include its own local dome policy check
    oldCalcBirth(self, ...)
end