FROM debian:bullseye-slim AS builder
RUN apt-get update && apt-get install -y gcc g++ gcc-multilib curl tar make
WORKDIR /usr/local/smlnj
RUN curl -fsSL http://smlnj.cs.uchicago.edu/dist/working/110.85/config.tgz | tar xzf -
RUN ./config/install.sh


FROM debian:bullseye-slim AS final
LABEL maintainer="aaarsalmon"

COPY --from=builder /usr/local/smlnj/bin /usr/local/smlnj/bin
COPY --from=builder /usr/local/smlnj/lib /usr/local/smlnj/lib
ENV SMLNJ_HOME=/usr/local/smlnj
# install i386 glibc
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y libc6:i386
ENTRYPOINT ["/usr/local/smlnj/bin/sml"]
