# Python Code Obfuscation POC

This repository demonstrates how to use PyArmor to obfuscate a FastAPI application. It includes both local and Docker-based deployment options for both regular and obfuscated versions of the application.

## Prerequisites

- Python 3.11+
- Docker and Docker Compose
- Make

## Project Structure

```
/app
├── main.py          # Main FastAPI application
├── api/             # API endpoints
└── models/          # Pydantic models
```

## Available Commands

### Local Development

```bash
# Run the regular (non-obfuscated) application locally
make run-local-app

# Run the obfuscated version locally
make run-local-obfuscated-app
```

### Docker Development

```bash
# Run the regular application in Docker
make run-docker-app

# Run the obfuscated version in Docker
make run-docker-obfuscated-app
```

### Utility Commands

```bash
# Check what's using port 8000
make check-port

# Kill any process using port 8000
make kill-port

# Clean up Docker resources and build artifacts
make clean
```

## How It Works

1. **Regular Version**
   - Direct execution of the FastAPI application
   - Hot-reload enabled for development
   - Code is readable and accessible

2. **Obfuscated Version**
   - Uses PyArmor to obfuscate the Python code
   - Protects source code from reverse engineering
   - Same functionality as the regular version

3. **Docker Support**
   - Multi-stage builds for both versions
   - Proper handling of obfuscated binaries
   - Consistent runtime environment

## API Endpoints

- `GET /`: Root endpoint, returns welcome message
- `GET /health`: Health check endpoint
- Swagger UI available at `/docs`

## Development vs Production

- For development, use `run-local-app` or `run-docker-app`
- For production-like testing with obfuscation:
  - Local: `run-local-obfuscated-app`
  - Docker: `run-docker-obfuscated-app`

## Notes

- The obfuscated version generates OS-specific binaries
- For cross-platform deployment, use the Docker-based obfuscated version
- Local obfuscation is mainly for testing purposes