FROM arm64v8/debian:bullseye

ENV CAROOT=/certs.d
ENV CERT_HOSTNAME=frontend
ENV CERT_DOMAIN=local.arpa

RUN apt-get update && apt-get install -y libnss3-tools
ADD https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-arm64 /usr/sbin/mkcert
RUN chmod 0755 /usr/sbin/mkcert

COPY mkcert.sh /mkcert.sh
ENTRYPOINT [ "/mkcert.sh" ]
