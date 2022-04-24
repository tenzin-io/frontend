FROM arm64v8/debian:bullseye

RUN apt-get update && apt-get install -y html2text curl jq
COPY update.sh /update.sh

ENTRYPOINT [ "/update.sh" ]
