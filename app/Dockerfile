FROM alpine:3.17

RUN apk add --no-cache python3 py3-pip mysql-client curl && \
    pip install flask mysql-connector-python


COPY src/ /app/
WORKDIR /app
CMD ["python3", "main.py"]