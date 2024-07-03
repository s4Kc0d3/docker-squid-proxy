FROM alpine:3.16

RUN apk update && \
    apk add --no-cache squid && \
    rm -rf /var/cache/apk/*

COPY squid.conf /etc/squid/squid.conf

EXPOSE 3128

HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
    CMD wget -q --proxy=off --spider http://localhost:3128 || exit 1

CMD ["squid", "-NYCd", "1"]

 

