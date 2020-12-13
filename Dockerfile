FROM python:3.9-alpine

COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt

ENTRYPOINT ["python3", "src/start.py"]
