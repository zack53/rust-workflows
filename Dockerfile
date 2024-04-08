FROM rust:1.77-alpine as builder

ARG PAT

WORKDIR /usr/src/image-place-holder
COPY . .

RUN set -x && \
    apk add --no-cache musl-dev openssl-dev openssl-libs-static git

# statically link against openssl
ENV OPENSSL_STATIC=1

RUN rustup target add x86_64-unknown-linux-musl

RUN /usr/bin/git config --global --add url."https://${PAT}:x-oauth-basic@github".insteadOf ssh://git@github
RUN /usr/bin/git config --global --add url."https://${PAT}:x-oauth-basic@github".insteadOf https://github
RUN /usr/bin/git config --global --add url."https://${PAT}:x-oauth-basic@github".insteadOf git@github

RUN cargo build --release --target x86_64-unknown-linux-musl

# Command to keep build alive to inspect contents, good for debugging build before copying files
#CMD ["tail", "-f", "/dev/null"]

FROM alpine:3.19
COPY --from=builder /usr/src/image-place-holder/target/x86_64-unknown-linux-musl/release/image-place-holder /usr/local/bin/image-place-holder

CMD ["image-place-holder"]