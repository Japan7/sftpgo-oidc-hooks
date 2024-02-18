FROM denoland/deno:latest@sha256:72cdadad6ef1a4211e396d4ef7dcb4820eb29f18b897259545dad9692be170f4

WORKDIR /app

COPY main.ts .
RUN deno cache main.ts

CMD ["run", "--allow-net", "main.ts"]
EXPOSE 8000
