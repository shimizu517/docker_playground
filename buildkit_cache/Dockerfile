# syntax = docker/dockerfile:1.3
FROM python:3.9-slim-buster
COPY requirements.txt .
RUN --mount=type=cache,target=/root/.cache \
    pip install -r requirements.txt

