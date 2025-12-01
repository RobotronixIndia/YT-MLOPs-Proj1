# # Use an official Python 3.10 image from Docker Hub
# FROM python:3.10-slim-buster

# # Set the working directory
# WORKDIR /app

# # Copy your application code
# COPY . /app

# # Install the dependencies
# RUN pip install -r requirements.txt

# # Expose the port FastAPI will run on
# EXPOSE 5000

# # Command to run the FastAPI app
# # CMD ["python3", "app.py"]
# CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5000"]

FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy only requirements first (best practice)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application
COPY . .

# Expose FastAPI port
EXPOSE 5000

# Run the FastAPI application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5000"]
