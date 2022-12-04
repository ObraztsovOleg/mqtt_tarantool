FROM tarantool/tarantool:latest
LABEL Author="noby.Ardor"
COPY connector.lua /home/tarantool/connector.lua
RUN chmod a+x /home/tarantool/connector.lua
WORKDIR /home/tarantool/data
CMD [ "/home/tarantool/connector.lua" ] 
