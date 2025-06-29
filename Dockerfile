#  1. Start from a tiny Python imageAdd commentMore actions
FROM python:3.11-slim

# 2. Keep logs unbuffered and pick a working folder
ENV PYTHONUNBUFFERED=1
WORKDIR /app

# 3. Install Python dependencies first 
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copy the rest of your source code
COPY src/ ./src/

# 5. Expose the port FastAPI will listen on
EXPOSE 8000

# 6. Launch the API
CMD ["sh", "-c", "uvicorn src.main:app --host 0.0.0.0 --port ${PORT:-8000}"]