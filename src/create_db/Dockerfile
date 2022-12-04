FROM tarantool/tarantool:latest
LABEL Author="noby.Ardor"
COPY create_db.lua /home/tarantool/create_db.lua
RUN chmod a+x /home/tarantool/create_db.lua
WORKDIR /home/tarantool/data
CMD [ "/home/tarantool/create_db.lua" ] 
