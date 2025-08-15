#Using official python image
FROM python:3.9-slim 

#Setting current directory as main work directory
WORKDIR /app

#copying file with requirements & install them
# (this is empty requirements.txt, but I read its a good practice)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#Copy rest of the app
COPY . .

#Setting default environment variable, it can be overwritten as container is launched.
ENV GREETING_MESSAGE="HELLO FROM INSIDE OF DOCKER"

#Start the app
CMD ["python3", "app.py"]
