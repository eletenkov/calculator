all: build

build:
	@./mvnw spring-boot:build

run:
	@./mvnw spring-boot:run

test:
	@curl http://localhost:8080/sum?a=1\&b=2

docker_build:
	@docker build -t calculator .

docker_run:
	@docker run --rm -p 8765:8080 --name calculator calculator

docker_test:
	@curl http://localhost:8765/sum?a=1\&b=2