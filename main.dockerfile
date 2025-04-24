FROM python:3.10 AS builder

RUN apt update && apt install -y git ruby ffmpeg

WORKDIR /app

ENV GAS_URL="GoogleAppsScriptURL"

COPY setup.sh setup.sh
COPY getImage.sh getImage.sh
COPY upload.rb upload.rb
RUN ["chmod", "+x", "-R", "./"]

RUN ["bash", "-c", "./setup.sh"]

CMD ["bash", "-c", "./getImage.sh"]
