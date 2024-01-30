#!/bin/bash
# Wait for MongoDB to be ready
sleep 10
# Execute MongoDB commands
mongo --host localhost:27017 /usr/src/app/schema/catalogue.js
