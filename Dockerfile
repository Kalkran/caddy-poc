FROM caddy:2.10-builder AS builder
RUN xcaddy build \
  --with github.com/caddy-dns/hetzner=github.com/Kugelschieber/caddy-dns-hetzner@master \
  --replace github.com/libdns/hetzner=github.com/Kugelschieber/libdns-hetzner@libdns-v1

FROM caddy:2.10
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

