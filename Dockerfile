FROM alpine:3.8
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>"
ARG KUBECTL_VERSION='v1.11.2'

RUN apk add --no-cache ca-certificates curl \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

WORKDIR /tmp
ENTRYPOINT "kubectl"
CMD "help"