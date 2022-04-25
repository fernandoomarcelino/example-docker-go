FROM golang as build
WORKDIR /
COPY hello.go ./
RUN go build -o /hello hello.go

FROM scratch
WORKDIR /
COPY --from=build /hello /hello
ENTRYPOINT ["/hello"]