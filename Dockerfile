FROM alpine:3.16

RUN apk update && \
    apk add --no-cache squid && \
    rm -rf /var/cache/apk/*

COPY squid.conf /etc/squid/squid.conf

EXPOSE 3128

HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=3 \
	CMD curl -s --proxy http://localhost:3128 http://www.example.com > /dev/null || exit 1

CMD ["squid", "-NYCd", "1"]

 

