FROM denoland/deno:latest@sha256:73978274197aee18baaa38eb230e30de48deb2b925e12ddfb1ddd6959e63cf98

WORKDIR /app

COPY main.ts .
RUN deno cache main.ts

CMD ["run", "--allow-net", "main.ts"]
EXPOSE 8000
