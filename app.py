import os
from flask import Flask

app = Flask(__name__)

greeting_message = os.environ.get("GREETING_MESSAGE", "Hello, user!")

try:
    with open('VERSION', 'r') as version_file:
        app_version = version_file.read().strip()
except FileNotFoundError:
    app_version = "unknown"

@app.route('/')
def create_greeting_message():
    return f"<h1>{greeting_message}</h1>"

@app.route('/version')
def return_version_number():
    return f"<h2>App version: {app_version}</h2>\n"
@app.route('/checkpwd')
def checkpwd():
    return f"<h2>This was written without rebuilding image</h2>\n"
def liczby():
    return f"1"

@app.route('/health')
def health_check():
    return "OK", 200

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)