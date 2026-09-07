# Minimal image providing the official VS Code CLI (code tunnel), for conversion to Apptainer.
FROM ubuntu:22.04

ARG VSCODE_CLI_ARCH=x64
# x64 or arm64 - must match the Slurm host's architecture (uname -m)

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -Lk "https://code.visualstudio.com/sha/download?build=stable&os=cli-linux-${VSCODE_CLI_ARCH}" \
      -o /tmp/vscode_cli.tar.gz && \
    tar -xzf /tmp/vscode_cli.tar.gz -C /usr/local/bin && \
    rm /tmp/vscode_cli.tar.gz && \
    chmod +x /usr/local/bin/code

ENTRYPOINT ["/usr/local/bin/code"]
