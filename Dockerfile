FROM python:3.6-alpine

WORKDIR /src/app/

COPY ./requirements.txt .

RUN ["pip", "install", "-r", "./requirements.txt"]

COPY . .

RUN addgroup -S projects && adduser -S -H projects -G projects
RUN chown -R projects:projects /src/app
USER projects

# unblock port 80 for the Flask app to run on
EXPOSE 5001

# execute the Flask app
CMD ["python", "jobs/app.py"]
