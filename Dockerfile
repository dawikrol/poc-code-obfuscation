FROM python:3.11-slim as base

WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Stage for obfuscation
FROM base as obfuscator
RUN pyarmor gen --recursive app && \
    cp requirements.txt dist/ && \
    ls -la dist/app  # Debug: List contents of dist/app

# Final stage for regular app
FROM base as regular
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

# Final stage for obfuscated app
FROM python:3.11-slim as obfuscated
WORKDIR /app

# Install only runtime dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the obfuscated application from the obfuscator stage
COPY --from=obfuscator /app/dist/. /app/

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"] 