# Use Python
FROM python:3.10-slim

# Install system deps
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    && apt-get clean

# Set working directory
WORKDIR /app

# Copy requirements first (cache optimization)
COPY requirements.txt .

# Install python deps
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of project
COPY . .

# Expose port Render expects
EXPOSE 10000

# Start FastAPI backend
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]
