FROM alpine:latest

RUN apk add -U openssl curl bash ca-certificates git

ENV KUBERNETES_VERSION 1.15.1
RUN curl --silent -L -o /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl" ;\
    chmod +x /usr/bin/kubectl ;\
    kubectl version --client

ENV HELM_VERSION 3.0.3
RUN curl --silent "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" | tar zx ;\
    mv linux-amd64/helm /usr/bin/ ;\
    helm version

ENV HELM_2TO3_VERSION 0.2.2
RUN helm plugin install https://github.com/helm/helm-2to3 --version ${HELM_2TO3_VERSION} ;\
    helm plugin list

ENV HELM2_VERSION 2.14.3
RUN curl --silent "https://get.helm.sh/helm-v${HELM2_VERSION}-linux-amd64.tar.gz" | tar zx ;\
    mv linux-amd64/helm /usr/bin/helm2 ;\
    helm2 version --client
