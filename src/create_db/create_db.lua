#!/usr/bin/env tarantool

-- master settings
-- listen - master can accept connections from replica
-- read_only = false parameter setting enables data-change operations on the instance and makes the instance act as a master, not as a replica
box.cfg{listen = 3301,  log_level = 5, read_only = false, force_recovery = true }

-- the box.once() function contains database initialization logic that should be executed only once during the replica set lifetime
box.once("bootstrap", function()
 box.schema.space.create('user_tick', {
    if_not_exists = true,
    format = {
        {'id', type = 'unsigned'},
        {'day', type = 'unsigned'},
        {'tick_time', type = 'unsigned'},
        {'speed', type = 'double'}
    }
})

box.schema.sequence.create('row_id',{})  -- create a sequence generator
box.space.user_tick:create_index('primary', { 
    sequence = 'row_id'
})

box.space.user_tick:create_index('speed', { 
    if_not_exists = true,
    unique = false,
    type = 'tree',
    parts = {
        'speed',
    }
})
end)

s = box.space.user_tick -- create space

--[[
local function print_state()
    print('full len', s:len())
    print('--->')
    for _, v in s:pairs(nil, {iterator = box.index.ALL}) do
        print (v)
    end
    print('<---')

    print('++++>')
    for _, v in s.index.speed:pairs(nil, {iterator = box.index.ALL}) do
        print (v)
    end
    print('<++++')
end

 s:insert{nil, 1, 6814, 15038256.8705186}

 print_state()
s:insert{nil, 1, 6953, 14924076.1263006}
print_state()
s:truncate()
--print_state()
box.snapshot()
]]--
os.exit(true, true)
