FROM ubuntu:20.04

RUN apt-get update && apt-get install -y python3 python3-pip

# Install required Python packages
RUN pip3 install flask flask-mysql

# Copy app into container
COPY app.py /opt/
COPY templates/ /opt/templates/


# Set working directory
WORKDIR /opt

# Expose the port the app runs on
EXPOSE 8080

# Run the app
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]

