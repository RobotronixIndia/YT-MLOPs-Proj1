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

WORKDIR /app

FROM python:3.10-slim

# Set working directory
WORKDIR /app

# 1. Install External Dependencies
# Copy only requirements.txt to leverage Docker cache
COPY requirements.txt .

# Install all packages, including 'python-dotenv'
RUN pip install --no-cache-dir -r requirements.txt

# 2. Install Local Project Package
# Copy the entire project code (including the 'src' directory)
COPY . .

# Install the project from the current directory ('.') as an editable package.
# This makes your 'src' package importable throughout the container environment.
RUN pip install --no-cache-dir -e .

# 3. Expose Port and Run Application
EXPOSE 5000

# Run the FastAPI app using uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5000"]
