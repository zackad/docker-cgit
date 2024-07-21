FROM debian AS builder

RUN apt update
RUN apt install -y git gcc make libssl-dev libz-dev
RUN git clone https://git.zx2c4.com/cgit
RUN cd cgit && git submodule init && git submodule update
RUN cd cgit && make

FROM debian AS runtime

COPY --from=builder /cgit/cgit /app/cgit
