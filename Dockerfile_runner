FROM ghcr.io/actions/actions-runner:2.321.0

ARG GITHUB_URL

RUN curl -fsSL https://dl.k8s.io/release/v1.31.3/bin/linux/amd64/kubectl -o kubectl && \
    sudo mv kubectl /usr/local/bin/kubectl && \
    sudo chmod +x /usr/local/bin/kubectl

RUN --mount=type=secret,id=gh_token,env=GITHUB_TOKEN \
    ./config.sh --unattended --url $GITHUB_URL --token $GITHUB_TOKEN

ENTRYPOINT [ "./run.sh" ]