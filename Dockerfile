# Use the latest Python slim image as the base image
FROM python:3.12-slim-bookworm AS base

# Install Poetry and git
RUN apt-get update && apt-get install -y git && \
    pip install poetry --no-cache-dir

# Stage : Development
FROM base AS development

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install development dependencies
# RUN poetry config virtualenvs.create false && poetry install --only main --no-root

# Run app.py when the container launches
CMD ["python", "app.py"]
