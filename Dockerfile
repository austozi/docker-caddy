FROM caddy:2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/duckdns \
    --with github.com/porech/caddy-maxmind-geolocation

FROM caddy:2
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
