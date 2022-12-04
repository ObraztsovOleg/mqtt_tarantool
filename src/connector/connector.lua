#!/usr/bin/env tarantool

csv = require('csv')

local host = os.getenv('MQTT_HOST')
print('Host = ', host)
local port = os.getenv('MQTT_PORT')
print('Port = ', port)
local clear_session = os.getenv('MQTT_CLEARSESSION')
print('Clear session = ', clear_session)
local qos = os.getenv('MQTT_QOS')
print('Qos = ',qos)

local client_id = os.getenv('MQTT_CLIENT_ID')
print('Client id = ', client_id)

local login = os.getenv('MQTT_LOGIN')
print('Login =', login)

local password = os.getenv('MQTT_PASSWORD')
print('Password = ', password)

local topic = os.getenv('MQTT_TOPIC')
print('Topic = ', topic)


local mqtt = require('mqtt')
local connection = mqtt.new(client_id, clear_session)

local ok, err = connection:login_set(login,password)
if not ok then
    print('Cannot set login \nError = ', err)
    return
end

ok, err = connection:connect({host=host, port=port})
if not ok then
    print('Cannot connect \nError = ', err)
    return
end

ok, err = connection:on_message(function (message_id, topic, payload, gos, retain)
    if not retain then  
        print('New message', message_id, topic, payload, gos, retain)
        for _, v in csv.iterate(payload, {delimiter = ',  '}) do
            local day  = tonumber(v[1])
            local tick = tonumber(v[2])
            local speed = tonumber(v[3])
            print('Parsed ->', day, tick, speed)
        end
    end
end)

if not ok then
    print('Cannot set on_message \nError = ', err)
    return
end

ok, err = connection:subscribe(topic, qos)
if not ok then
    print('Cannot set subscribe \nError = ', err)
    return
end
