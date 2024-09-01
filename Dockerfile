FROM ubuntu:latest

# Update package list and install necessary packages
RUN apt update && apt install -y python3-pip python3-venv

# Set up a working directory
WORKDIR /app

# Create and activate a virtual environment
RUN python3 -m venv venv
RUN . /app/venv/bin/activate

# Install Flask in the virtual environment
RUN /app/venv/bin/pip install Flask

# Copy the application code into the container
COPY . .

# Specify the command to run your Flask application
CMD ["venv/bin/python", "-m", "flask", "run", "--host=0.0.0.0"]