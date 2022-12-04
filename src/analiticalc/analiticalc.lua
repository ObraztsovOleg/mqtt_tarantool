#!/usr/bin/env tarantool

box.cfg{listen = 3301,  log_level = 5, read_only = false, force_recovery = true }

s = box.space.user_tick

local function analiticalc()
    local max = s.index.speed:max()[4]
    local min = s.index.speed:min()[4]

    local median = 0
    for _, v in csv.iterate(payload, {delimiter = ',  '}) do
            local day  = tonumber(v[1])
            local tick = tonumber(v[2])
            local speed = tonumber(v[3])   
            s:insert{nil, day, tick, speed}
    end
    
    local len = s:len()
    local sorted = s:sort(4)
end


analiticalc()

os.exit(true, true)
