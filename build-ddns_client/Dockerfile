FROM arm64v8/debian:bullseye

RUN apt-get update && apt-get install -y curl jq
COPY update.sh /update.sh

ENTRYPOINT [ "/update.sh" ]
