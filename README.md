# Python Code Obfuscation POC

This repository demonstrates how to use PyArmor to obfuscate a FastAPI application. It includes both local and Docker-based deployment options for both regular and obfuscated versions of the application.

Obfuscation is a technique that transforms source code into a less human-readable form while maintaining its functionality, primarily to protect intellectual property and sensitive logic. PyArmor achieves this by encrypting Python scripts, wrapping them in a runtime that validates the execution environment. 

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

## My Notes

After purchasing a license, more advanced security options become available. However, these options might not always work seamlessly with your environment. Consider the following:  
- Some Python libraries may encounter issues functioning after obfuscation.  
- Certain environments might face compatibility problems.  

Therefore, it is crucial to test your application first to ensure it operates correctly under these advanced security measures.

The obfuscated version generates OS-specific binaries. For cross-platform deployment, use the Docker-based obfuscated version.

Make sure that your pyarmor runtime is in the correct place. ;)

## Useful links
- [PyArmor Docs](https://pyarmor.readthedocs.io/en/latest/)
- [PyArmor Repo](https://github.com/dashingsoft/pyarmor)
- [PyArmo Website](https://pyarmor.dashingsoft.com/)

## Author
[Dawid Krol](https://www.linkedin.com/in/krol-dawid/)
