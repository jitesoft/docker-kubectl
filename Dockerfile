FROM registry.gitlab.com/jitesoft/dockerfiles/alpine:latest
ARG KUBECTL_VERSION
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft" \
      maintainer.org.uri="https://jitesoft.com" \
      com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/kubectl" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/kubectl/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/kubectl" \
      com.jitesoft.app.kubectl.version="${KUBECTL_VERSION}"

RUN apk add --no-cache ca-certificates curl \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

ENTRYPOINT ["kubectl"]
