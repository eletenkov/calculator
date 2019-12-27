all: build

build:
	@./mvnw spring-boot:build

run:
	@./mvnw spring-boot:run

test:
	@curl http://localhost:8080/sum?a=1\&b=2