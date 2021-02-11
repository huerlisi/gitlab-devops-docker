FROM alpine:latest

RUN apk add -U openssl curl bash ca-certificates git

ENV KUBERNETES_VERSION 1.18.2
RUN curl --silent -L -o /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl" ;\
    chmod +x /usr/bin/kubectl ;\
    kubectl version --client

ENV HELM_VERSION 3.5.2
RUN curl --silent "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" | tar zx ;\
    mv linux-amd64/helm /usr/bin/ ;\
    helm version
