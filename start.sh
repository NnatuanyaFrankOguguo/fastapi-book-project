#!/bin/bash
# Start Nginx in the background
service nginx start


# Start the FastAPI app using uvicorn.
# Adjust "main:app" if your entry point is different.
uvicorn main:app --host 127.0.0.1 --port 8000