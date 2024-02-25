FROM denoland/deno:latest

WORKDIR /app

COPY main.ts .
RUN deno cache main.ts

CMD ["run", "--allow-net", "main.ts"]
EXPOSE 8000
