FROM tarantool/tarantool:latest

COPY print_db.lua /home/tarantool/print_db.lua
RUN chmod a+x /home/tarantool/print_db.lua

WORKDIR /home/tarantool/data
CMD [ "/home/tarantool/print_db.lua" ] 

