TARANTOOL_STORAGE_PATH=/home/user/docker-tarantool-mqtt/data
MY_TARANTOOL_STORAGE_PATH=/home/obrol/mqtt_tarantool/src/tarantool

console:
	docker run -it --rm tarantool/tarantool:latest -v ${MY_TARANTOOL_STORAGE_PATH}:/home/tarantool/data -p 3301:3301 tarantool
sh:
	docker run -it --rm --env-file mqtt.env -v ${TARANTOOL_STORAGE_PATH}:/home/tarantool/data -p 3301:3301 mqtt_tarantool/connector sh

connector_build:
	docker build -t mqtt_tarantool/connector ./connector
connector_run:
	docker run -it --name mqtt_connector --rm --env-file mqtt.env -v ${TARANTOOL_STORAGE_PATH}:/home/tarantool/data -p 3301:3301 mqtt_tarantool/connector
connector_stop:
	docker stop mqtt_connector

dbcreator_build:
	docker build -t mqtt_tarantool/create_db ./create_db
dbcreator_run:
	docker run -it --name mqtt_dbcreator --rm --env-file mqtt.env -v ${TARANTOOL_STORAGE_PATH}:/home/tarantool/data -p 3301:3301 mqtt_tarantool/create_db
dbcreator_sh:
	docker run -it --name mqtt_dbcreator --rm --env-file mqtt.env -v ${TARANTOOL_STORAGE_PATH}:/home/tarantool/data -p 3301:3301 mqtt_tarantool/create_db sh
dbcreator_console:
	docker run -it --name mqtt_dbcreator --rm --env-file mqtt.env -v ${TARANTOOL_STORAGE_PATH}:/home/tarantool/data -p 3301:3301 mqtt_tarantool/create_db tarantool
dbcreator_stop:
	docker stop mqtt_dbcreator

build_print_db:
	docker build -t mqtt_tarantool/print_db ./print_db
print_db:
	docker run -it --name mqtt_print_db --rm --env-file mqtt.env -v ${MY_TARANTOOL_STORAGE_PATH}:/home/tarantool/data  mqtt_tarantool/print_db
create_db:
	docker build -t mqtt_tarantool/create_db ./create_db
	docker run -it --name mqtt_create_db --rm --env-file mqtt.env -v ${MY_TARANTOOL_STORAGE_PATH}:/home/tarantool/data  mqtt_tarantool/create_db
fillup:
	docker build -t mqtt_tarantool/fillup ./fillup
	docker run -it --name mqtt_fillup --rm --env-file mqtt.env -v ${MY_TARANTOOL_STORAGE_PATH}:/home/tarantool/data -p 3301:3301 mqtt_tarantool/fillup
build_analiticalc:
	docker build -t mqtt_tarantool/analiticalc ./analiticalc
delete_analiticalc:
	docker rmi -f mqtt_tarantool/analiticalc:latest
analiticalc:
	docker run -it --name mqtt_analiticalc --rm --env-file mqtt.env -v ${MY_TARANTOOL_STORAGE_PATH}:/home/tarantool/data  mqtt_tarantool/analiticalc
.PHONY: build_print_db print_db fillup create_db analiticalc build_analiticalc
