# Use an official Python runtime as a parent image
FROM python:3.7-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Define environment variable
ENV NAME World
ENV http_proxy 192.168.99.1:3128
ENV https_proxy 192.168.99.1:3128

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

#IN CASE YOU WANT TO GET RID OF WINDOWS CHARACTERS
#ADD entrypoint.sh /entrypoint-dos.sh
#RUN sed -e 's/\r$//' /entrypoint-dos.sh > /entrypoint.sh && chmod +x /entrypoint.sh
#ADD /app.jar /app.jar


# Run app.py when the container launches
CMD ["python", "app.py"]

