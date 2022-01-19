-- Copy the original function
local oldCalcBirth = Community.CalcBirth

-- Override the original function
function Community:CalcBirth(...)

    -- Only proceed if mod is enabled else skip all these to original function
    if CurrentModOptions.GBCP_Toggle == true then
        print(CurrentModOptions.GBCP_MaxChildren)
        -- Get overview data, in this case we need the children population
        local resource_overview = GetCityResourceOverview(UICity)
        local data = resource_overview.data

        -- If exceed set limit, end function
        if data.children >= CurrentModOptions.GBCP_MaxChildren then
            return
        end
    end

    -- Call the original function
    -- Original function still include its own local dome policy check
    oldCalcBirth(self, ...)
end
