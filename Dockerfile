FROM registry.gitlab.com/jitesoft/dockerfiles/alpine:latest
ARG KUBECTL_VERSION="v1.14.0"
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft - https://jitesoft.com" \
      maintainer.repo="https://gitlab.com/jitesoft/dockerfiles/kubectl" \
      maintainer.issues="https://gitlab.com/jitesoft/dockerfiles/kubectl/issues"

RUN apk add --no-cache ca-certificates curl \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

ENTRYPOINT ["kubectl"]
