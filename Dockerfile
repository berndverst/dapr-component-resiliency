FROM golang:latest
RUN apt-get update && apt-get install dsniff iproute2 curl --yes
ADD startup.sh /
WORKDIR /go
RUN git clone https://github.com/dapr/components-contrib.git && cd components-contrib
WORKDIR /go/components-contrib
RUN go test -v ./tests/conformance
ENV remote=dapr
ENV repo=components-contrib
ENV branch=master
ENTRYPOINT /bin/bash /startup.sh
