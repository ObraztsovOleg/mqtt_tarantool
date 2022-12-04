#!/usr/bin/env tarantool

box.cfg{listen = 3301,  log_level = 5, read_only = false, force_recovery = true }

s = box.space.user_tick

local function print_db()
    for _, v in s:pairs(nil, {iterator = box.index.ALL}) do
        print (v)
    end

    print('Length: ', s:len())
end


print_db()

os.exit(true, true)
