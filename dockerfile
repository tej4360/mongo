# Use an official MongoDB image as a base
FROM mongo:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the MongoDB initialization script to the working directory
COPY init-mongo.sh .

# Grant execution permission to the script
RUN chmod +x init-mongo.sh

# Copy the MongoDB schema initialization script
COPY schema/catalogue.js /usr/src/app/schema/

# Run the MongoDB initialization script during the build
RUN ./init-mongo.sh

# Expose the default MongoDB port (27017)
EXPOSE 27017

# Command to start MongoDB
CMD ["mongod", "--bind_ip_all"]
