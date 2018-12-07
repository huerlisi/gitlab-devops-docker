FROM alpine:latest

RUN apk add -U openssl curl bash ca-certificates git

ENV KUBERNETES_VERSION 1.8.6
RUN curl -L -o /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl" ;\
    chmod +x /usr/bin/kubectl ;\
    kubectl version --client

ENV HELM_VERSION 2.9.1
RUN curl "https://kubernetes-helm.storage.googleapis.com/helm-v${HELM_VERSION}-linux-amd64.tar.gz" | tar zx ;\
    mv linux-amd64/helm /usr/bin/ ;\
    helm version --client
