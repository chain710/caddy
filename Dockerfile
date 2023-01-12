FROM caddy:2.6.2-builder AS builder

COPY . /src
RUN cd /src && CGO_ENABLED=0 GOPROXY="https://goproxy.cn,direct" go build .

FROM caddy:2.6.2

COPY --from=builder /src/caddy /usr/bin/caddy