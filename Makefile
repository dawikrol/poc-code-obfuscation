PORT := 8000

check-port:
	@lsof -i :$(PORT) || echo "Port $(PORT) is free"

kill-port:
	@lsof -ti :$(PORT) | xargs kill -9 || echo "No process running on port $(PORT)"

run-local-app:
	pip install --upgrade pip
	pip install -r requirements.txt
	uvicorn app.main:app --reload --host 0.0.0.0 --port $(PORT) 