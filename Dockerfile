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

ARG TARGETARCH
COPY ./entrypoint /usr/local/bin/entrypoint
RUN apk add --no-cache ca-certificates curl \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/${TARGETARCH}/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/* \
    && addgroup -g 1000 -S kube \
    && adduser -u 1000 -D -S -G kube kube

USER kube
ENTRYPOINT ["entrypoint"]
CMD ["kubectl"]
