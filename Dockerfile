FROM golang:1.19.1-buster as builder

ADD . /xq
WORKDIR /xq
RUN go build

FROM golang:1.19.1-buster
COPY --from=builder /xq/test/data/xml/*.xml /testsuite/
COPY --from=builder /xq/xq /

ENTRYPOINT []
CMD ["/xq", "@@"]
