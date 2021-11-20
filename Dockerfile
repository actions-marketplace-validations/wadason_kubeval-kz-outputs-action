FROM golang:1.17

COPY . /

ENTRYPOINT ["/entrypoint.sh"]
