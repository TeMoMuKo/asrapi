#/usr/bin/env bash
docker run -p 5432:5432 -e POSTGRES_USER=asrapi -e POSTGRES_PASSWORD=asrapi -d postgres:9.6-alpine
