#!/bin/bash
set -e #stop the script if error ever happens.

echo "Starting application in the background.."

python3 app.py & APP_PID=$! #Start the app in background and save its PID

sleep 5 #Time for app to run correctly

echo "PID: $APP_PID, Checking health.."
RESPONSE=$(curl -s http://localhost:5000/health) #Using curl to check health

if [[ "$RESPONSE" == "OK" ]]; then
    echo "Health check passed"
else 
    echo "Health check failed. Response: $RESPONSE"
    kill $APP_PID
    exit 1
fi 

echo "Shutting down the app.."
kill $APP_PID
echo "Testing script finished successfully!"
