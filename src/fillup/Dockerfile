FROM tarantool/tarantool:latest

COPY fillup.lua /home/tarantool/fillup.lua

RUN chmod a+x /home/tarantool/fillup.lua
WORKDIR /home/tarantool/data

CMD [ "/home/tarantool/fillup.lua" ] 

