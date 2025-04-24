FROM gcr.io/distroless/static-debian12 AS builder

WORKDIR /app

RUN apk update && apk add --no-cache python3 git

COPY setup.sh setup.sh

RUN ["../setup.sh"]

FROM gcr.io/distroless/static-debian12

WORKDIR /app

RUN apk update && apk add --no-cache ruby python3 ffmpeg

COPY --from=builder /app /app

COPY getImage.sh /app/getImage.sh

COPY upload.rb /app/upload.rb

CMD ["getImage.sh"]
