FROM denoland/deno:latest@sha256:d8eba2c54f66527345662c2fad580defa9b3467244798f37a2192405b433f94c

WORKDIR /app

COPY main.ts .
RUN deno cache main.ts

CMD ["run", "--allow-net", "main.ts"]
EXPOSE 8000
