FROM ghcr.io/actions/actions-runner:2.321.0

ARG GITHUB_URL

RUN curl -fsSL https://dl.k8s.io/release/v1.31.3/bin/linux/amd64/kubectl -o kubectl && \
    sudo mv kubectl /usr/local/bin/kubectl && \
    sudo chmod +x /usr/local/bin/kubectl

RUN curl -fsSL https://releases.hashicorp.com/terraform/1.10.0/terraform_1.10.0_linux_amd64.zip -o terraform.zip && \
    unzip terraform.zip && \
    sudo mv terraform /usr/local/bin/terraform && \
    sudo chmod +x /usr/local/bin/terraform && \
    rm terraform.zip

RUN --mount=type=secret,id=gh_token,env=GITHUB_TOKEN \
    ./config.sh --unattended --url $GITHUB_URL --token $GITHUB_TOKEN

ENTRYPOINT [ "./run.sh" ]