PORT := 8000

check-port:
	@lsof -i :$(PORT) || echo "Port $(PORT) is free"

kill-port:
	@lsof -ti :$(PORT) | xargs kill -9 || echo "No process running on port $(PORT)"

run-local-app:
	pip install --upgrade pip
	pip install -r requirements.txt
	uvicorn app.main:app --reload --host 0.0.0.0 --port $(PORT)

run-local-obfuscated-app:
	pyarmor gen --recursive app
	cp requirements.txt dist/
	cd dist && (\
		pip install --upgrade pip && \
		pip install -r requirements.txt && \
		uvicorn app.main:app --host 0.0.0.0 --port $(PORT) \
	)

docker-build:
	docker-compose build

run-docker-app: docker-build
	docker-compose up app

run-docker-obfuscated-app: docker-build
	docker-compose up app-obfuscated

clean:
	docker-compose down -v
	rm -rf dist
