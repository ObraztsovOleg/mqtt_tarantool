#!/usr/bin/env tarantool

box.cfg{listen = 3301,  log_level = 5, read_only = false, force_recovery = true }

s = box.space.user_tick

local function analiticalc()
    local max = s.index.speed:max()[4]
    local min = s.index.speed:min()[4]

    local median = 0
    local len = s:len()
    if len % 2 == 0 then
        median = tonumber(s:select{len / 2}[1][4])
    elseif len % 2 == 1 then
        median = tonumber((s:select{len / 2 - 1}[1][4]) + tonumber(s:select{len / 2 + 1}[1][4]) / 2)
    end

    local quntile_pos = (len + 1) * 3.0/4
    local quantile_int = math.floor(quntile_pos)
    local cooficient = quntile_pos - quantile_int

    quantile_75 = (tonumber(s:select{quantile_int}[1][4]) + tonumber(s:select{quantile_int + 1}[1][4])) * cooficient
    
    print("min: ", min)
    print("max: ", max)
    print("Quantile 3:", quantile_75)
    print("median:", median)
end


analiticalc()

os.exit(true, true)
