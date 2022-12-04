FROM tarantool/tarantool:latest

COPY analiticalc.lua /home/tarantool/analiticalc.lua

RUN chmod a+x /home/tarantool/analiticalc.lua
WORKDIR /home/tarantool/data

CMD ["/home/tarantool/analiticalc.lua"]
