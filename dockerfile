FROM          mongo:latest

# Set the working directory in the container
WORKDIR       /usr/src/app
# Install MongoDB client tools
RUN           apt-get update && \
              apt-get install -y mongodb-org-tools
RUN           ln -s /usr/bin/mongosh /usr/bin/mongo

# Copy the MongoDB initialization script to the working directory
COPY          init-mongo.sh .

# Grant execution permission to the script
RUN           chmod +x init-mongo.sh

# Copy initialization script into the container
COPY          init-mongo.sh /docker-entrypoint-initdb.d/

# Run the MongoDB initialization script during the build
RUN           ./init-mongo.sh

# Expose the default MongoDB port (27017)
EXPOSE        27017

# Command to start MongoDB
CMD           ["mongod", "--bind_ip_all"]
