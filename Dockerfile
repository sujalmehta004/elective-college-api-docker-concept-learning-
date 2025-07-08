# Use official Python base image
FROM python:3.12-slim

# Set working directory inside container
WORKDIR /app

# Copy requirements.txt first (for caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app code
COPY ./app ./app

# Expose port
EXPOSE 8000

# Default command to run the app (overridden by docker-compose command if needed)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--reload"]
